'use strict'

const HelpersPegawai = use("App/Helpers/H-MasPegawai")

class MstPegawaiController {
    async index ({auth, view, response}) {
        const user = await userValidate(auth)
        if(!user){
            return view.render("login")
        }

        return view.render('master.pegawai.index')
    }

    async list ({auth, view, request}) {
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return view.render("login")
        }

        const data = await HelpersPegawai.LIST(req)
        return view.render('master.pegawai.list', {list: data})
    }

    async create ( { auth, view } ) {
        const user = await userValidate(auth)
        if(!user){
            return view.render("login")
        }

        return view.render('master.pegawai.create')
    }

    async show ( { auth, params, view } ) {
        const user = await userValidate(auth)
        if(!user){
            return view.render("login")
        }

        const data = await HelpersPegawai.SHOW(params)
        return view.render('master.pegawai.show', {data: data})
    }

    async store ( { auth, request } ) {
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return view.render("login")
        }

        const validateFile = {
            types: ['image'],
            size: '10mb',
            extnames: ['png', 'gif', 'jpg', 'jpeg', 'pdf']
        }
        const photo = request.file('photo', validateFile)

        const data = await HelpersPegawai.POST(req, photo, user)
        return data
    }

    async update ( { auth, params, request } ) {
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return view.render("login")
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

    async destroy ( { auth, params } ){
        const user = await userValidate(auth)
        if(!user){
            return view.render("login")
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
