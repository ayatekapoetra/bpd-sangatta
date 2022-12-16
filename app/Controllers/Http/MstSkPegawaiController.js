'use strict'

const moment = use('moment')
const HelpersSkPegawai = use("App/Helpers/H-MasSkPegawai")

class MstSkPegawaiController {
    async index ({auth, view, response}) {
        const user = await userValidate(auth)
        if(!user){
            // return view.render("login")
            return response.redirect("/login")
        }

        return view.render('master.sk-pengangkatan.index')
    }

    async list ({auth, view, request, response}) {
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        const data = await HelpersSkPegawai.LIST(req)
        return view.render('master.sk-pengangkatan.list', {list: data})
    }

    async create ( { auth, view, response } ) {
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        return view.render('master.sk-pengangkatan.create')
    }

    async show ( { auth, params, view, response } ) {
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        const data = await HelpersSkPegawai.SHOW(params)
        console.log(data);
        return view.render('master.sk-pengangkatan.show', {data: data})
    }

    async store ( { auth, request, response } ) {
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

    async update ( { auth, params, request, response } ) {
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
        const photo = request.file('photo', validateFile)

        const data = await HelpersSkPegawai.UPDATE(params, req, photo, user)
        return data
    }

    async destroy ( { auth, params, response } ){
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }
        const data = await HelpersSkPegawai.DELETE(params)
        return data
    }
    
}

module.exports = MstSkPegawaiController

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
