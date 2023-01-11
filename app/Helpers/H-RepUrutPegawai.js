'use strict'

const DB = use('Database')
const Helpers = use('Helpers')
const moment = require('moment')
const Pegawai = use("App/Models/MasPegawai")
const BpdSkPegawai = use("App/Models/BpdSkPegawai")
const BpdKenaikanPangkat = use("App/Models/BpdKenaikanPangkat")

class repUrutPegawai {
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
}

module.exports = new repUrutPegawai()