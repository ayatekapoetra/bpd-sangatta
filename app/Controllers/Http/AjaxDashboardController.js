'use strict'

const moment = use('moment')
const V_MKG = use("App/Models/V_Mkg")
const Options = use("App/Models/SysOption")
const MasPegawai = use("App/Models/MasPegawai")
const BpdPangkat = use("App/Models/BpdPangkat")
const BpdThnGaji = use("App/Models/BpdThnGaji")
const PangkatNaik = use("App/Models/BpdKenaikanPangkat")
const InitNotif = use("App/Models/InitNotif")
const BpdSkPegawai = use("App/Models/BpdSkPegawai")
const BpdUsulanGaji = use("App/Models/BpdUsulanGaji")
const BpdUsulanGajiItem = use("App/Models/BpdUsulanGajiItem")


class AjaxDashboardController {
    async index ({ request }) {
        const options = (
            await Options.query()
            .where('status', 'Y')
            .orderBy([
                {column: 'group', order: 'asc'},
                {column: 'urut', order: 'asc'}
            ])
            .fetch()
        ).toJSON()
        return options
    }

    async group ({ request }) {
        const req = request.all()
        let options = (
            await Options.query()
            .where( w => {
                w.where('status', 'Y')
                w.where('group', req.group)
            })
            .orderBy([
                {column: 'urut', order: 'asc'},
                {column: 'teks', order: 'asc'}
            ])
            .fetch()
        ).toJSON()

        if(req.selected){
            options = options.map( v => v.nilai == req.selected ? {...v, selected: 'selected'}:{...v, selected: ''})
        }

        return options
    }

    /** OPTIONS PEGAWAI **/
    async pegawai ( { request } ) {
        const req = request.all()
        let data
        if(req.id){
            data = (await MasPegawai.query().where('id', req.id).last()).toJSON()

            const sk_ = await BpdSkPegawai.query().where('pegawai_id', req.id).last()

            const usulanGajiPegawai = await BpdUsulanGajiItem.query().where( w => {
                w.where('pegawai_id', req.id)
                w.where('aktif', 'Y')
            }).last()

            const v_mkg = await V_MKG.query().where('id', req.id).last()
            const thnGaji = await BpdThnGaji.query().where( w => {
                w.where('golongan', v_mkg.golongan)
                w.where('mkg', v_mkg.thn)
            }).last()
            console.log("<///>", v_mkg.thn);
            console.log("<///>", v_mkg.golongan);
            console.log("<///>", thnGaji);

            var masakerjagolongan_tahun = (moment()).diff((moment(sk_?.eff_date)), 'year') || 0
            var masakerjagolongan_bulan = ((moment()).diff((moment(sk_?.eff_date)), 'month'))%12 || 0
            data = {
                ...data, 
                tgl_sk_terakhir: sk_?.eff_date?moment(sk_.eff_date).format('YYYY-MM-DD'):null,
                masa_kerja_golongan: {
                    bulan: masakerjagolongan_bulan,
                    tahun: masakerjagolongan_tahun
                },
                total_masa_kerja: {
                    bulan: ((moment()).diff((moment(sk_?.tmt_cpns)), 'month'))%12 || 0,
                    tahun: (moment()).diff((moment(data?.tmt_cpns)), 'year'),
                },
                gapok_lama: usulanGajiPegawai?.gapok_baru || 0,
                gapok_baru: thnGaji?thnGaji.nilai:1
            }
        }else{
            data = (await MasPegawai.query().where('aktif', 'Y').fetch()).toJSON()
            if(req.selected){
                data = data.map( v => v.id == req.selected ? {...v, selected: 'selected'} : {...v, selected: ''})
            }else{
                data.unshift({id: '', nama_pegawai: 'Pilih...'})
            }
        }

        return data
    }

    /** OPTIONS PANGKAT **/
    async pangkat ( { request } ) {
        const req = request.all()
        let data = (await BpdPangkat.query().where('aktif', 'Y').fetch()).toJSON()
        if(req.selected){
            data = data.map( v => v.pangkat == req.selected ? {...v, selected: 'selected'} : {...v, selected: ''})
        }else{
            data.unshift({id: '', pangkat: 'Pilih...'})
        }

        return data
    }

    async notifNaikGaji () {
        let data = []
        const initialConfig = (await InitNotif.query().last()).toJSON()
        let v_mkg = (await V_MKG.query().where( w => {
            w.where('bln', initialConfig.notif_gaji)
            w.where('is_kgb', 'N')
        }).fetch()).toJSON()

        console.log("<gaji>", v_mkg);

        for (const val of v_mkg) {
            const res = (await BpdThnGaji.query().where( w => {
                w.where('mkg', (val.thn)+1)
                w.where('golongan', val.golongan)
                w.where('nilai', '>=', 0)
            }).last())?.toJSON()
            console.log(res);
            if(res){
                data.push({...res, nama: val.nama_pegawai})
            }
        }

        return data
    }

    async notifNaikPangkat () {
        let data = (
            await PangkatNaik.query()
            .with('pegawai', m => m.with('masaKerja'))
            .where( w => {
                w.where('aktif', 'Y')
                w.where('eff_date', '>=', moment().startOf('Y').format('YYYY-MM-DD'))
                w.where('eff_date', '<=', moment().endOf('Y').format('YYYY-MM-DD'))
            }).fetch()
        ).toJSON()

        data = data.map( v => ({...v, countDate: moment(v.eff_date).endOf('M').fromNow()}))

        return data
    }
}

module.exports = AjaxDashboardController
