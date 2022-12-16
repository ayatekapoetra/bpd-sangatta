'use strict'

const moment = use('moment')
const HelpersPegawai = use("App/Helpers/H-MasPegawai")
const PangkatNaik = use("App/Models/BpdKenaikanPangkat")
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
                w.where('eff_date', '>=', moment().startOf('Y').format('YYYY-MM-DD'))
                w.where('eff_date', '<=', moment().endOf('Y').format('YYYY-MM-DD'))
            }).fetch()
        ).toJSON()

        data = data.map( v => ({...v, countDate: moment(v.eff_date).endOf('M').fromNow()}))

        console.log(JSON.stringify(data, null, 2));

        return view.render("index", {list: data})
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