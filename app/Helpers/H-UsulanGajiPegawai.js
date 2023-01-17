'use strict'

const DB = use('Database')
const Helpers = use('Helpers')
const moment = require('moment')
moment.locale('ID')
const Pegawai = use("App/Models/MasPegawai")
const BpdUsulanGaji = use("App/Models/BpdUsulanGaji")
const BpdUsulanGajiItem = use("App/Models/BpdUsulanGajiItem")
const BpdMasaKerja = use("App/Models/BpdMasaKerja")
const BpdKenaikanPangkat = use("App/Models/BpdKenaikanPangkat")
const LogoImage = use("App/Helpers/H-ImageEncode")
const InitNotif = use("App/Models/InitNotif")
const V_MKG = use("App/Models/V_Mkg")
 

class promosiGajiPegawai {
    async LIST(req){
        let data = (await BpdUsulanGaji.query().with('items').where('aktif', 'Y').fetch()).toJSON()
        console.log("<LIST>", data);
        data = data.map(v => ({...v, jumlah: v.items.length}))
        return data
    }

    async SHOW(params){
        let data = (
            await BpdUsulanPangkat.query()
            .with('items', w => {w.where('aktif', 'Y')})
            .where('id', params.id)
            .last()
        ).toJSON()
        

        return data
    }

    async POST(req, user){
        const trx = await DB.beginTransaction()

        const usulanGaji = new BpdUsulanGaji()
        usulanGaji.fill({
            kode: req.nomor,
            tgl_usulan: req.tgl_usulan,
            createdby: user.id,
            keterangan: req.keterangan || ''
        })

        try {
            await usulanGaji.save(trx)
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

            const bpdUsulanGajiItem = new BpdUsulanGajiItem()
            bpdUsulanGajiItem.fill({
                nomor: nomor,
                usulan_gaji_id: usulanGaji.id,
                pegawai_id: obj.pegawai_id,
                gapok_lama: obj.gapok_lama,
                gapok_baru: obj.gapok_baru,
                usulan_oleh: obj.usulan_oleh,
                no_usulan: obj.no_usulan,
                tgl_usulan: obj.tgl_usulan,
                gaji_eff_date: obj.gaji_eff_date,
                masa_kerja_golongan: obj.masa_kerja_golongan,
                tot_masa_kerja: obj.tot_masa_kerja,
                gol_lama: obj.gol_lama,
                gol_baru: obj.gol_baru,
                terhitung_tgl: obj.terhitung_tgl,
                type: obj.type,
                kgb_next: obj.kgb_next,
                remark: obj.remark || ''
            })

            try {
                await bpdUsulanGajiItem.save(trx)
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
        // console.log(bpdUsulanPangkatItem);
        for (const obj of bpdUsulanPangkatItem) {
            const updDataItem = await BpdUsulanPangkatItem.query().where('id', obj.id).last()
            updDataItem.merge({aktif: 'N'})
            try {
                await updDataItem.save()
            } catch (error) {
                console.log(error);
                await trx.rollback()
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
            await trx.rollback()
            return {
                success: false,
                message: error.sqlMessage
            }
        }

        const initUrut = ((req.nomor).split('[')[1]).split(']')[0]

        for (let [i, obj] of req.items.entries()) {
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
                await trx.rollback()
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

    async PRINT(params){
        const data = (
            await BpdUsulanGajiItem.query()
            .with('pegawai')
            .where('usulan_gaji_id', params.id)
            .fetch()
        ).toJSON()

        const logo = await LogoImage.LOGO_IMAGES()
        var dataContent = []
        for (let [i, obj] of data.entries()) {
            let promosi = await BpdKenaikanPangkat.query().where('pegawai_id', obj.pegawai_id).last()
            let masaKerja = await BpdMasaKerja.query().where('pegawai_id', obj.pegawai_id).last()
            obj = {
                ...obj, 
                kgb_next: moment(obj.kgb_next).format('DD-MM-YYYY'),
                terhitung_tgl: moment(obj.terhitung_tgl).format('DD MMMM YYYY'),
                tgl_usulan: moment(obj.tgl_usulan).format('DD-MM-YYYY'),
                eff_date: moment(promosi.eff_date).format('DD MMMM YYYY'), 
                lamaKerja: `${masaKerja.tahun} tahun ${masaKerja.bulan} bulan`
            }
            dataContent.push(
                {
                    alignment: 'center',
                    columns: [
                        {
                            width: 70,
                            image: logo
                        },
                        {
                            text: [
                                {text: 'PEMERINTAH KABUPATEN KUTAI TIMUR\n', fontSize: 18, bold: true},
                                {text: 'BADAN PENDAPATAN DAERAH\n', fontSize: 15, bold: true},
                                {text: 'KAWASAN PEMERINTAHAN KABUPATEN KUTAI TIMUR\n', fontSize: 10},
                                {text: 'Telp. (0549) 25317 Fax. (0549) 23355\n', fontSize: 10},
                                {text: 'S AN G A TT A \n', fontSize: 16},
                            ]
                        },
                    ],
                    columnGap: 10
                },
                {text: '\n'},
                {canvas: [ { type: 'line', x1: 0, y1: 0, x2: 540, y2: 0, lineWidth: 3 } ]},
                {text: '', margin: [ 0, 2, 0, 2 ]},
                {canvas: [ { type: 'line', x1: 0, y1: 0, x2: 540, y2: 0, lineWidth: 1 } ]},
                {text: '\n'},
                {
                    style: 'tableExample',
                    table: {
                        widths: ['*', 'auto'],
                        body: [
                            [
                                {text: ''},
                                {text: `Sangatta, ${moment().format('DD MMMM YYYY')}`, bold: true},
                            ],
                        ],
                    },
                    layout: 'noBorders'
                },
                {text: '\n'},
                {
                    style: 'tableExample',
                    table: {
                        widths: ['*', 'auto'],
                        body: [
                            [
                                {
                                    style: 'tableExample',
                                    table: {
                                        widths: [80, 5, '*'],
                                        body: [
                                            [
                                                {text: 'Nomor'},
                                                {text: ':'},
                                                {text: `${obj.nomor}`, bold: true},
                                            ],
                                            [
                                                {text: 'Lampiran'},
                                                {text: ':'},
                                                {text: `-`, bold: true},
                                            ],
                                            [
                                                {text: 'Perihal'},
                                                {text: ':'},
                                                {text: [
                                                    {text: 'Kenaikan Pangkat atas\n'},
                                                    {text: `Nama : ${obj.pegawai.nama_pegawai}\n`, bold: true},
                                                    {text: `Nip      : ${obj.pegawai.nip}\n`, bold: true},
                                                ]}
                                            ],
                                        ],
                                    },
                                    layout: 'noBorders'
                                },

                                {text: `Kepada,\nYth. Kepala Badan Pengelola Keuangan\ndan Aset Daerah Kab. Kutai Timur\n\ndi-\nSANGATTA`, bold: true, alignment: 'center'},
                            ],
                        ],
                    },
                    layout: 'noBorders'
                },
                '\n',
                {text: 'Bersama ini diberitahukan bahwa sehubungan dengan telah dipenuhinya masa kerja', margin: [30, 0, 0, 0]},
                {text: 'dan syarat-syarat lainnya kepada :\n\n'},
                {
                    style: 'tableExample',
                    table: {
                        widths: [30, 'auto', 10, '*'],
                        body: [
                            [
                                {text: '1'},
                                {text: 'Nama'},
                                {text: ':'},
                                {text: `${obj.pegawai.nama_pegawai}`, bold: true},
                            ],
                            [
                                {text: '2'},
                                {text: 'Nomor Induk Pegawai'},
                                {text: ':'},
                                {text: `${obj.pegawai.nip}`, bold: true},
                            ],
                            [
                                {text: '3'},
                                {text: 'Pangkat / Golongan Ruang'},
                                {text: ':'},
                                {text: `${obj.pegawai.pangkat} / ${obj.pegawai.golongan}`, bold: true},
                            ],
                            [
                                {text: '4'},
                                {text: 'Pada kantor\nGaji Pokok lama (Atas SK Terakhir)'},
                                {text: ':'},
                                {text: `Badan Pendapatan Daerah Kab. Kutai Timur\n${(obj.gapok_lama)?.toLocaleString('ID')}`, bold: true},
                            ],
                            [
                                {text: '5'},
                                {text: 'a. Oleh Pejabat'},
                                {text: ':'},
                                {text: `${obj.usulan_oleh}`, bold: true},
                            ],
                            [
                                {text: ''},
                                {text: 'b. Tanggal dan Nomor'},
                                {text: ':'},
                                {text: `${obj.tgl_usulan}\n${obj.no_usulan}`, bold: true},
                            ],
                            [
                                {text: ''},
                                {text: 'c. Tanggal berlakunya golongan tsb'},
                                {text: ':'},
                                {text: `${obj.eff_date}`, bold: true},
                            ],
                            [
                                {text: ''},
                                {text: 'd. Masa kerja pegawai'},
                                {text: ':'},
                                {text: `${obj.masa_kerja_golongan}\n\n`, bold: true},
                            ],
                            [
                                {text: 'Diberikan Kenaikan Gaji Berkala hingga memperoleh ', colSpan: 4},
                                {},
                                {},
                                {},
                            ],
                            [
                                {text: '6'},
                                {text: 'Gaji Pokok Baru'},
                                {text: ':'},
                                {text: `${(obj.gapok_baru)?.toLocaleString('ID')}`},
                            ],
                            [
                                {text: '7'},
                                {text: 'Masa Kerja'},
                                {text: ':'},
                                {text: `${obj.tot_masa_kerja}`},
                            ],
                            [
                                {text: '8'},
                                {text: 'Pangkat/Golongan Ruang'},
                                {text: ':'},
                                {text: obj.gol_baru},
                            ],
                            [
                                {text: '9'},
                                {text: 'Terhitung Mulai Tanggal'},
                                {text: ':'},
                                {text: obj.terhitung_tgl},
                            ],
                            [
                                {text: '10'},
                                {text: 'Yang bersangkutan adalah'},
                                {text: ':'},
                                {text: 'PNS'},
                            ],
                            [
                                {text: '11'},
                                {text: 'KGB yang akan datang'},
                                {text: ':'},
                                {text: obj.kgb_next},
                            ],
                        ],
                    },
                    layout: 'noBorders'
                },
                {text: 'Demikian agar sesuai dengan Peraturan Pemerintah Nomor :  15 Tahun  2019 Kepada Pegawai tersebut dapat dibayarkan penghasilannya berdasarkan gaji pokoknya yang baru.'},
                '\n',
                {
                    style: 'tableExample',
                    table: {
                        widths: ['*', 'auto'],
                        body: [
                            [
                                {text: ''},
                                {text: [
                                    {text: 'Plt. Kepala Badan\n\n'},
                                    {text: 'Syahfur, S.Sos., M.Si\n', decoration: 'underline', bold: true},
                                    {text: 'Pembina  / IV.a\n', fontSize: 10},
                                    {text: 'NIP. 19730708 200112 1 003\n', fontSize: 10},
                                ], alignment: 'center'},
                            ],
                        ],
                    },
                    layout: 'noBorders'
                },
                {text: 'Tembusan Kepada Yth :', bold: true, decoration: 'underline'},
                {
                    type: 'none',
                    ul: [
                            {text: '1.	Kepala Kantor Tata Anggaran Negara Samarinda di Samarinda', fontSize: 8},
                            {text: '2.	Kepala Kantor Perbendaharaan Negara (KPN) Samarinda di Samarinda', fontSize: 8},
                            {text: '3.	PT.TASPEN ( Persero) Cab.Samarinda di Samarinda', fontSize: 8},
                            {text: '4.	Badan Kepegawaian Pendidikan dan Pelatihan Kab. Kutai Timur di Sangatta', fontSize: 8},
                            {text: '5.	Bendahara Gaji Badan Pendapatan Daerah Kab. Kutai Timur di Sangatta', fontSize: 8},
                            {text: `6.	Saudara : ${obj.pegawai.nama_pegawai}`, fontSize: 8},
                            {text: `7.	Arsip`, fontSize: 9, pageBreak: 'after'},
                    ]
                }
            )
        }

        var dd = {
            pageMargins: [30, 10],
            content: dataContent
        }

        return dd
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

module.exports = new promosiGajiPegawai()