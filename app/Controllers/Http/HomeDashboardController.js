'use strict'

const moment = use('moment')
const V_MKG = use("App/Models/V_Mkg")
const BpdThnGaji = use("App/Models/BpdThnGaji")
const HelpersSkPegawai = use("App/Helpers/H-MasSkPegawai")
const PangkatNaik = use("App/Models/BpdKenaikanPangkat")
const BpdPangkat = use("App/Models/BpdPangkat")
const Pegawai = use("App/Models/MasPegawai")

moment.locale('ID')

class HomeDashboardController {
    async index ({auth, request, view}) {
        const user = await userValidate(auth)
        if(!user){
            return view.render('login')
        }

        // await UPDATE_PROMOTION(user)

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

        let gaji = []
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
                gaji.push({...res, nama: val.nama_pegawai})
            }
        }

        console.log(gaji);
        return view.render("index", {list: data, gaji: gaji})
    }

    async promosi ({auth, params, view}) {
        const user = await userValidate(auth)
        if(!user){
            return view.render('login')
        }

        const pegawai = await Pegawai.query().where('id', params.idpegawai).last()
        const pangkat = await BpdPangkat.query().where( w => w.where('golongan', pegawai.golongan)).last()
        const nextPangkat = await BpdPangkat.query().where('urut', pangkat.urut + 1).last()
        // console.log(nextPangkat);
        return view.render("promote", {
            pegawai: pegawai,
            pangkat: nextPangkat
        })
    }

    async storePromosi ( { auth, request, response } ) {
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        const validateFile = {
            types: ['image'],
            size: '10mb',
            extnames: ['png', 'gif', 'jpg', 'jpeg', 'pdf']
        }
        const dokumen = request.file('dokumen', validateFile)

        var init = moment(req.eff_date)
        var nows = moment()
        var totBln = nows.diff(init, 'month')
        var sisaBulanPromosi =  48 - (totBln % 48)
        var eff_date_promosi = moment().add(sisaBulanPromosi, 'M').format('YYYY-MM-DD')
        var notif_date = moment(eff_date_promosi).add(-3, 'month').format('YYYY-MM-DD')
        // console.log(notif_date);

        req.eff_date_promosi = eff_date_promosi
        req.notif_date = notif_date

        const data = await HelpersSkPegawai.POST(req, dokumen, user)
        return data
    }
}

module.exports = HomeDashboardController

async function userValidate(auth){
    let user
    try {
        user = await auth.getUser()
        return user
    } catch (error) {
        console.log(error);
        return null
    }
}

async function UPDATE_PROMOTION(user){
    const pegawai = (await Pegawai.query().where('aktif', 'Y').fetch()).toJSON()
    for (const val of pegawai) {
        var a = moment()
        var b = moment(val.tmt_cpns)
        var c = a.diff(b, 'month')
        var initCount = Math.floor(c / 48) + 1
        var initSet = 0
        for (let index = 0; index < initCount; index++) {
            initSet += 48
            let pangkatNaik = await PangkatNaik.query().where( w => {
                w.where('aktif', 'Y')
                w.where('pegawai_id', val.id)
                w.where('eff_date', moment(val.tmt_cpns).add(initSet, 'M').format('YYYY-MM-DD'))
            }).last()
            if(!pangkatNaik){
                var eff = moment(val.tmt_cpns).add(initSet, 'M').format('YYYY-MM-DD')
                try {
                    pangkatNaik = new PangkatNaik()
                    pangkatNaik.fill({
                        pegawai_id: val.id,
                        nama: val.nama_pegawai,
                        notif_date: moment(eff).add(-3, 'M').format('YYYY-MM-DD'),
                        eff_date: eff,
                        createdby: user.id
                    })
                    await pangkatNaik.save()
                } catch (error) {
                    console.log(error);
                }
            }
        }
    }
}