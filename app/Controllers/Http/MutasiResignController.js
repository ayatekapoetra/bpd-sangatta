'use strict'

const _ = use("underscore")
const Pegawai = use("App/Models/MasPegawai")
const BpdMutasiResign = use("App/Models/BpdMutasiResign")

class MutasiResignController {
    async index ( { auth, request, response, view } ){
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        let pegawai = (await Pegawai.query().fetch()).toJSON()
        pegawai = _.groupBy(pegawai, 'type')
        pegawai = Object.keys(pegawai).map(key => {
            return {
                type: key,
                items: pegawai[key]
            }
        })
        
        return view.render('mutasi-resign.index', {pegawai: pegawai})
    }

    async list ( { auth, request, response, view } ){
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        let data = (await BpdMutasiResign.query().with('pegawai').where( w => {
            if(req.pegawai_id){
                w.where('pegawai_id', req.pegawai_id)
            }
            if(req.status){
                w.where('status', req.status)
            }
            if(req.start_date && req.end_date){
                w.where('eff_date', '>=', req.start_date)
                w.where('eff_date', '<=', req.end_date)
            }
        }).fetch()).toJSON()
        
        return view.render('mutasi-resign.list', {list: data})
    }

    async create ( { auth, response, view } ){
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        let pegawai = (await Pegawai.query().where('aktif', 'Y').fetch()).toJSON()
        pegawai = _.groupBy(pegawai, 'type')
        pegawai = Object.keys(pegawai).map(key => {
            return {
                type: key,
                items: pegawai[key]
            }
        })
        
        return view.render('mutasi-resign.create', {pegawai: pegawai})
    }

    async show ( { auth, params, view } ){
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        const data = (await BpdMutasiResign.query().with('pegawai').where('id', params.id).last()).toJSON()

        let pegawai = (await Pegawai.query().where('aktif', 'Y').orWhere('keterangan', 'like', '%#%').fetch()).toJSON()

        pegawai = pegawai.map(v => v.id === data.pegawai_id ? {...v, selected: 'selected'}:{...v, selected: ''})

        pegawai = _.groupBy(pegawai, 'type')
        pegawai = Object.keys(pegawai).map(key => {
            return {
                type: key,
                items: pegawai[key]
            }
        })
        
        return view.render('mutasi-resign.show', {data: data, pegawai: pegawai})
    }

    async store ( { auth, request, response } ) {
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        const bpdMutasiResign = new BpdMutasiResign()
        bpdMutasiResign.fill({
            pegawai_id: req.pegawai_id,
            eff_date: req.eff_date,
            status: req.status,
            keterangan: req.keterangan || ''
        })

        try {
            await bpdMutasiResign.save()
        } catch (error) {
            console.log(error);
            return {
                success: false,
                message: 'error save data'
            }
        }

        const pegawai = await Pegawai.query().where('id', req.pegawai_id).last()
        pegawai.merge({aktif: 'N', keterangan: '#'+req.status})
        try {
            await pegawai.save()
        } catch (error) {
            console.log(error);
            return {
                success: false,
                message: 'error update data pegawai'
            }
        }

        return {
            success: true,
            message: 'success save data'
        }
    }

    async update ( { auth, params, request, response } ) {
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        const bpdMutasiResign = await BpdMutasiResign.query().where('id', params.id).last()
        bpdMutasiResign.merge({
            pegawai_id: req.pegawai_id,
            eff_date: req.eff_date,
            status: req.status,
            keterangan: req.keterangan || ''
        })

        try {
            await bpdMutasiResign.save()
        } catch (error) {
            console.log(error);
            return {
                success: false,
                message: 'error save data'
            }
        }

        const pegawai = await Pegawai.query().where('id', req.pegawai_id).last()
        pegawai.merge({aktif: 'N', keterangan: '#'+req.status})
        try {
            await pegawai.save()
        } catch (error) {
            console.log(error);
            return {
                success: false,
                message: 'error update data pegawai'
            }
        }

        return {
            success: true,
            message: 'success save data'
        }
    }
}

module.exports = MutasiResignController

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