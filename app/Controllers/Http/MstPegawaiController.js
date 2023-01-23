'use strict'

const moment = use('moment')
const Pegawai = use("App/Models/MasPegawai")
const HelpersPegawai = use("App/Helpers/H-MasPegawai")

class MstPegawaiController {
    async index ({auth, view, response}) {
        const user = await userValidate(auth)
        if(!user){
            // return view.render("login")
            return response.redirect("/login")
        }
        
        return view.render('master.pegawai.index')
    }

    async list ({auth, view, request, response}) {
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        const data = await HelpersPegawai.LIST(req)
        return view.render('master.pegawai.list', {list: data})
    }

    async create ( { auth, view, response } ) {
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        return view.render('master.pegawai.create')
    }

    async show ( { auth, params, view, response } ) {
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        const data = await HelpersPegawai.SHOW(params)
        console.log(data);
        return view.render('master.pegawai.show', {data: data})
    }

    async delete ( { auth, params, view, response } ) {
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        const data = await HelpersPegawai.SHOW(params)
        console.log(data);
        return view.render('master.pegawai.delete', {data: data})
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
        const photo = request.file('photo', validateFile)

        var init = moment(req.eff_date)
        var nows = moment()
        var totBln = nows.diff(init, 'month')
        var sisaBulanPromosi =  48 - (totBln % 48)
        var eff_date_promosi = moment().add(sisaBulanPromosi, 'M').format('YYYY-MM-DD')
        var notif_date = moment(eff_date_promosi).add(-3, 'month').format('YYYY-MM-DD')

        req.eff_date_promosi = eff_date_promosi
        req.notif_date = notif_date

        const data = await HelpersPegawai.POST(req, photo, user)
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

        const data = await HelpersPegawai.UPDATE(params, req, photo, user)
        return data
    }

    async destroy ( { auth, params, response } ){
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }
        const data = await HelpersPegawai.DELETE(params)
        return data
    }
    
}

module.exports = MstPegawaiController

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
