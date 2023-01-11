'use strict'

const moment = use('moment')
const SysOption = use("App/Models/SysOption")
const HelpersUrutPegawai = use("App/Helpers/H-RepUrutPegawai")

class RepUrutKepegawaianController {
    async index ({auth, view, response}) {
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }


        return view.render('laporan.urut-kepegawaian.index', {data: JSON.stringify([{tes: 'xxx'}])})
    }

    async list ({auth, view, request, response}) {
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        let data = await HelpersUrutPegawai.LIST(req)
        let arrayGroup = (await SysOption.query().where('group', 'type-pegawai').select(["nilai"]).fetch()).toJSON()
        let arrayGolongan = (await SysOption.query().where('group', 'golongan').select(["nilai"]).fetch()).toJSON()

        let group = []
        for (const val of arrayGroup) {
            group.push({
                group: val.nilai,
                items: data.filter(v => v.type === val.nilai)
            })
        }

        let golongan = []
        for (const val of arrayGolongan) {
            if(val.nilai){
                golongan.push({
                    gol: val.nilai,
                    items: data.filter(v => v.golongan === val.nilai)
                })
            }
        }

        console.log("<log>", golongan);
        return view.render('laporan.urut-kepegawaian.list', {
            list: group,
            golongan: golongan,
            total: data.length
        })
    }
}

module.exports = RepUrutKepegawaianController


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