'use strict'

const DB = use('Database')
const Helpers = use('Helpers')
const moment = require('moment')
const Pegawai = use("App/Models/MasPegawai")
const BpdSkPegawai = use("App/Models/BpdSkPegawai")
const BpdKenaikanPangkat = use("App/Models/BpdKenaikanPangkat")

moment.locale('ID')

class masterSkPegawai {
    async LIST(req){
        let data = (
            await BpdSkPegawai.query()
            .with('pegawai', w => {
                if(req.fil_nip){
                    w.where('nip', 'like', `%${req.fil_nip}%`)
                }
                if(req.fil_nama){
                    w.where('nip', 'like', `%${req.fil_nama}%`)
                }
            })
            .where( w => {
                w.where('aktif', 'Y')
                if(req.fil_nomor){
                    w.where('nomor', 'like', `%${req.fil_nomor}%`)
                }
                if(req.fil_tmt_start && req.fil_tmt_end){
                    w.where('tmt_cpns', '>=', moment(req.fil_tmt_start).startOf('date').format('YYYY-MM-DD'))
                    w.where('tmt_cpns', '<=', moment(req.fil_tmt_end).startOf('date').format('YYYY-MM-DD'))
                }
            })
            .orderBy('eff_date', 'desc').fetch()
        ).toJSON()

        
        data = data.map( v => {
            return {
                ...v,
                thnPromosi: moment(v.next_promote).format('YYYY-MM-DD'),
                countDate: moment(v.next_promote).endOf('M').fromNow(),
                status: moment(v.next_promote).isAfter(moment())
            }
        })
        console.log(data);
        return data
    }

    async SHOW(params){
        let data = (await BpdSkPegawai.query()
        .with('pegawai')
        .where( w => {
            w.where('aktif', 'Y')
            w.where('id', params.id)
        }).orderBy('eff_date', 'desc').last()).toJSON()

        return data
    }

    async POST(req, dokumen, user){
        const trx = await DB.beginTransaction()
        let dokumenUri = null
        if(dokumen){
            const randURL = moment().format('YYYYMMDDHHmmss')
            const aliasName = `PHOTO-${randURL}.${dokumen.extname}`
            dokumenUri = 'berkas/'+aliasName
            await dokumen.move(Helpers.publicPath(`berkas`), {
                name: aliasName,
                overwrite: true,
            })

            if (!dokumen.moved()) {
                return {
                    success: false,
                    message: 'Failed upload photo image...'
                }
            }
        }

        // var init = moment(req.eff_date)
        // var nows = moment()
        // var totBln = nows.diff(init, 'month')
        // var sisaBulanPromosi =  48 - (totBln % 48)
        // var eff_date_promosi = moment().add(sisaBulanPromosi, 'M').format('YYYY-MM-DD')

        const skPegawai = new BpdSkPegawai()
        skPegawai.fill({
            nomor: req.nomor,
            pegawai_id: req.pegawai_id,
            eff_date: req.eff_date,
            pangkat: req.pangkat,
            golongan: req.golongan,
            next_promote: moment(req.eff_date).add(4, 'Y').format('YYYY-MM-DD'),
            file_uri: dokumenUri
        })

        try {
            await skPegawai.save(trx)
        } catch (error) {
            console.log(error);
            await trx.rollback()
            return {
                success: false,
                message: error.sqlMessage
            }
        }

        /** UPDATE KENAIKAN PANGKAT PEGAWAI STATUS AKTIF **/
        const arrNaikPangkat = (await BpdKenaikanPangkat.query().where('pegawai_id', req.pegawai_id).fetch()).toJSON()
        for (const val of arrNaikPangkat) {
            const updPegawaiStatus = await BpdKenaikanPangkat.query().where('id', val.id).last()
            updPegawaiStatus.merge({aktif: 'N'})
            try {
                await updPegawaiStatus.save(trx)
            } catch (error) {
                console.log(error);
                await trx.rollback()
                return {
                    success: false,
                    message: error.sqlMessage
                }
            }
        }

        const kenaikanPangkat = new BpdKenaikanPangkat()
        const pegawai = await Pegawai.query().where('id', req.pegawai_id).last()
        kenaikanPangkat.fill({
            pegawai_id: req.pegawai_id,
            nama: pegawai.nama_pegawai,
            pangkat: req.pangkat,
            notif_date: moment(req.eff_date).add(45, 'M').format('YYYY-MM-DD'),
            eff_date: moment(req.eff_date).add(48, 'M').format('YYYY-MM-DD'),
            createdby: user.id
        })

        try {
            await kenaikanPangkat.save(trx)
        } catch (error) {
            console.log(error);
            await trx.rollback()
            return {
                success: false,
                message: error.sqlMessage
            }
        }

        /** UPDATE DATA PEGAWAI **/
        pegawai.merge({
            golongan: req.golongan,
            pangkat: req.pangkat,
        })

        try {
            await pegawai.save(trx)
        } catch (error) {
            console.log(error);
            await trx.rollback()
            return {
                success: false,
                message: error.sqlMessage
            }
        }

        await trx.commit()
        return {
            success: true,
            message: 'Data berhasil di simpan....'
        }
    }

    async UPDATE(params, req, photo, user){
        let data = {
            nip: req.nip,
            nama_pegawai: req.nama_pegawai,
            jenkel: req.jenkel,
            pangkat: req.pangkat,
            golongan: req.golongan,
            essalon: req.essalon,
            jabatan: req.jabatan,
            pendidikan: req.pendidikan,
            jurusan: req.jurusan,
            tmt_cpns: req.tmt_cpns,
            keterangan: req.keterangan,
            createdby: user.id
        }

        let passphoto = null
        if(photo){
            const randURL = moment().format('YYYYMMDDHHmmss')
            const aliasName = `PHOTO-${randURL}.${photo.extname}`
            passphoto = 'photo/'+aliasName
            await photo.move(Helpers.publicPath(`photo`), {
                name: aliasName,
                overwrite: true,
            })

            data.photo = passphoto

            if (!photo.moved()) {
                return {
                    success: false,
                    message: 'Failed upload photo image...'+ profilePic.error()
                }
            }
        }

        const pegawai = await Pegawai.query().where('id', params.id).last()
        pegawai.merge(data)

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

    async DELETE(params){
        const pegawai = await Pegawai.query().where('id', params.id).last()
        pegawai.merge({aktif: 'N'})

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

module.exports = new masterSkPegawai()