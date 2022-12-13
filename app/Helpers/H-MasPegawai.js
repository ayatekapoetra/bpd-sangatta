'use strict'

const DB = use('Database')
const Helpers = use('Helpers')
const moment = require('moment')
const Pegawai = use("App/Models/MasPegawai")

class masterPegawai {
    async LIST(req){
        let data = (
            await Pegawai.query()
            .where( w => {
                w.where('aktif', 'Y')
                if(req.fil_nip){
                    w.where('nip', 'like', `%${req.fil_nip}%`)
                }
                if(req.fil_nama){
                    w.where('nama_pegawai', 'like', `%${req.fil_nama}%`)
                }
                if(req.fil_jurusan){
                    w.where('jurusan', 'like', `%${req.fil_jurusan}%`)
                }
                if(req.fil_jenkel){
                    w.where('jenkel', req.fil_jenkel)
                }
                if(req.fil_golongan){
                    w.where('golongan', req.fil_golongan)
                }
                if(req.fil_essalon){
                    w.where('essalon', req.fil_essalon)
                }
                if(req.fil_pendidikan){
                    w.where('pendidikan', req.fil_pendidikan)
                }
                if(req.fil_tmt_start && req.fil_tmt_end){
                    w.where('tmt_cpns', '>=', moment(req.fil_tmt_start).startOf('date').format('YYYY-MM-DD'))
                    w.where('tmt_cpns', '<=', moment(req.fil_tmt_end).startOf('date').format('YYYY-MM-DD'))
                }
            })
            .orderBy([{column: 'golongan', order: 'desc'}]).fetch()
        ).toJSON()

        data = data.map( v => {
            var a = moment()
            var b = moment(v.tmt_cpns)
            var c = a.diff(b, 'month')
            return {
                ...v,
                tahun: Math.floor(c / 12),
                bulan: c % 12
            }
        })

        return data
    }

    async SHOW(params){
        const data = (await Pegawai.query().where('id', params.id).last()).toJSON()
        return data
    }

    async POST(req, photo, user){
        let passphoto = null
        if(photo){
            const randURL = moment().format('YYYYMMDDHHmmss')
            const aliasName = `PHOTO-${randURL}.${photo.extname}`
            passphoto = 'photo/'+aliasName
            await photo.move(Helpers.publicPath(`photo`), {
                name: aliasName,
                overwrite: true,
            })

            if (!photo.moved()) {
                return {
                    success: false,
                    message: 'Failed upload photo image...'+ profilePic.error()
                }
            }
        }

        const pegawai = new Pegawai()
        pegawai.fill({
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
            photo: passphoto,
            createdby: user.id
        })

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

module.exports = new masterPegawai()