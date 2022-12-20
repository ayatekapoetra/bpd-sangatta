'use strict'

const moment = use('moment')
const V_MKG = use("App/Models/V_Mkg")
const Options = use("App/Models/SysOption")
const MasPegawai = use("App/Models/MasPegawai")
const BpdPangkat = use("App/Models/BpdPangkat")
const BpdThnGaji = use("App/Models/BpdThnGaji")
const PangkatNaik = use("App/Models/BpdKenaikanPangkat")


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
        let data = (await MasPegawai.query().where('aktif', 'Y').fetch()).toJSON()
        if(req.selected){
            data = data.map( v => v.id == req.selected ? {...v, selected: 'selected'} : {...v, selected: ''})
        }else{
            data.unshift({id: '', nama_pegawai: 'Pilih...'})
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
        let v_mkg = (await V_MKG.query().where( w => {
            w.where('bln', 11)
        }).fetch()).toJSON()

        for (const val of v_mkg) {
            const res = (await BpdThnGaji.query().where( w => {
                w.where('mkg', (val.thn)+1)
                w.where('golongan', val.golongan)
                w.where('nilai', '>=', 0)
            }).last())?.toJSON()
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
