'use strict'

const DB = use('Database')
const Helpers = use('Helpers')
const moment = require('moment')
const Pegawai = use("App/Models/MasPegawai")
const BpdUsulanPangkat = use("App/Models/BpdUsulanPangkat")
const BpdUsulanPangkatItem = use("App/Models/BpdUsulanPangkatItem")
const BpdSkPegawai = use("App/Models/BpdSkPegawai")
const BpdKenaikanPangkat = use("App/Models/BpdKenaikanPangkat")

class promosiPegawai {
    async LIST(req){
        let data = (
            await BpdUsulanPangkat.query()
            .with('author')
            .where( w => {
                w.where('aktif', 'Y')
                if(req.fil_tgl_start && req.fil_tgl_end){
                    w.where('tgl_usulan', '>=', moment(req.fil_tmt_start).startOf('date').format('YYYY-MM-DD'))
                    w.where('tgl_usulan', '<=', moment(req.fil_tmt_end).startOf('date').format('YYYY-MM-DD'))
                }
            })
            .orderBy([{column: 'tgl_usulan', order: 'desc'}]).fetch()
        ).toJSON()
        return data
    }

    async SHOW(params){
        let data = (
            await BpdUsulanPangkat.query()
            .with('items')
            .where('id', params.id)
            .last()
        ).toJSON()
        

        return data
    }

    async POST(req, user){
        const trx = await DB.beginTransaction()

        const usulanPangkat = new BpdUsulanPangkat()
        usulanPangkat.fill({
            kode: req.nomor,
            tgl_usulan: req.tgl_usulan,
            createdby: user.id,
            keterangan: req.keterangan || ''
        })

        try {
            await usulanPangkat.save(trx)
        } catch (error) {
            console.log(error);
            return {
                success: false,
                message: error.sqlMessage
            }
        }

        const initUrut = ((req.nomor).split('[')[1]).split(']')[0]

        for (let [i, obj] of req.items.entries()) {
            var nomor = (req.nomor).replace(`[${initUrut}]`, `${parseInt(initUrut) + i}`)

            const bpdUsulanPangkatItem = new BpdUsulanPangkatItem()
            bpdUsulanPangkatItem.fill({
                nomor: nomor,
                usulan_pangkat_id: usulanPangkat.id,
                pegawai_id: obj.pegawai_id,
                t4lahir: obj.t4lahir,
                tgl_lahir: obj.tgl_lahir || new Date(),
                gol_lama: obj.gol_lama,
                gol_baru: obj.gol_baru,
                jenis: obj.jenis,
                unit_kerja: obj.unit_kerja,
                jabatan: obj.jabatan,
                remark: obj.remark || ''
            })

            try {
                await bpdUsulanPangkatItem.save(trx)
            } catch (error) {
                console.log(error);
                return {
                    success: false,
                    message: error.sqlMessage
                }
            }

            i = i++
        }

        await trx.commit()
        return {
            success: true,
            message: 'Data berhasil di simpan....'
        }
    }

    async UPDATE(params, req, user){
        const trx = await DB.beginTransaction()

        const bpdUsulanPangkatItem = (await BpdUsulanPangkatItem.query().where('usulan_pangkat_id', params.id).fetch()).toJSON()

        for (const obj of bpdUsulanPangkatItem) {
            const updDataItem = await BpdUsulanPangkatItem.query().where('id', obj.id).last()
            updDataItem.merge({aktif: 'N'})
            try {
                await updDataItem.save()
            } catch (error) {
                console.log(error);
                return {
                    success: false,
                    message: error.sqlMessage
                }
            }
        }

        const bpdUsulanPangkat = await BpdUsulanPangkat.query().where('id', params.id).last()
        bpdUsulanPangkat.merge({
            kode: req.nomor,
            tgl_usulan: req.tgl_usulan,
            createdby: user.id,
            keterangan: req.keterangan || ''
        })

        try {
            await bpdUsulanPangkat.save(trx)
        } catch (error) {
            console.log(error);
            return {
                success: false,
                message: error.sqlMessage
            }
        }

        const initUrut = ((req.nomor).split('[')[1]).split(']')[0]

        for (let [i, obj] of bpdUsulanPangkatItem.entries()) {
            var nomor = (req.nomor).replace(`[${initUrut}]`, `${parseInt(initUrut) + i}`)

            const reInsertItems = new BpdUsulanPangkatItem()
            reInsertItems.fill({
                nomor: nomor,
                usulan_pangkat_id: params.id,
                pegawai_id: obj.pegawai_id,
                t4lahir: obj.t4lahir,
                tgl_lahir: obj.tgl_lahir || new Date(),
                gol_lama: obj.gol_lama,
                gol_baru: obj.gol_baru,
                jenis: obj.jenis,
                unit_kerja: obj.unit_kerja,
                jabatan: obj.jabatan,
                remark: obj.remark || ''
            })

            try {
                await reInsertItems.save(trx)
            } catch (error) {
                console.log(error);
                return {
                    success: false,
                    message: error.sqlMessage
                }
            }

            i = i++
        }


        return {
            success: true,
            message: 'Data berhasil di simpan....'
        }
    }

    // async DELETE(params){
    //     const pegawai = await Pegawai.query().where('id', params.id).last()
    //     pegawai.merge({aktif: 'N'})

    //     try {
    //         await pegawai.save()
    //     } catch (error) {
    //         console.log(error);
    //         return {
    //             success: false,
    //             message: error
    //         }
    //     }

    //     return {
    //         success: true,
    //         message: 'Data berhasil di simpan....'
    //     }
    // }
}

module.exports = new promosiPegawai()