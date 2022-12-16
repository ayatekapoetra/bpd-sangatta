'use strict'

const DB = use('Database')
const Helpers = use('Helpers')
const moment = require('moment')
const Gapok = use("App/Models/BpdGapok")
const Pegawai = use("App/Models/MasPegawai")
const BpdSkPegawai = use("App/Models/BpdSkPegawai")
const BpdKenaikanPangkat = use("App/Models/BpdKenaikanPangkat")

class masterGaji {
    async LIST(req){
        let data = (
            await Gapok.query()
            .where( w => {
                w.where('aktif', 'Y')
            })
            .orderBy('mkg', 'asc').fetch()
        ).toJSON()


        return data
    }

    async SHOW(params){
        let data = (await Gapok.query()
        .where( w => {
            w.where('aktif', 'Y')
            w.where('id', params.id)
        }).orderBy('eff_date', 'desc').last()).toJSON()

        return data
    }

    async POST(req, dokumen, user){
        const trx = await DB.beginTransaction()
        

        await trx.commit()
        return {
            success: true,
            message: 'Data berhasil di simpan....'
        }
    }

    async UPDATE(params, req, photo, user){
        

        return {
            success: true,
            message: 'Data berhasil di simpan....'
        }
    }

    async DELETE(params){
        const gapok = await Gapok.query().where('id', params.id).last()
        gapok.merge({aktif: 'N'})

        try {
            await pegawai.save()
        } catch (error) {
            console.log(error);
            return {
                success: false,
                message: error
            }
        }

        return {
            success: true,
            message: 'Data berhasil di simpan....'
        }
    }
}

module.exports = new masterGaji()