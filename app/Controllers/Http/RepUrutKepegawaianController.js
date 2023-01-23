'use strict'

const _ = use('underscore')
const moment = use('moment')
const SysOption = use("App/Models/SysOption")
const HelpersUrutPegawai = use("App/Helpers/H-RepUrutPegawai")

class RepUrutKepegawaianController {
    async index ({auth, view, response}) {
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }


        return view.render('laporan.urut-kepegawaian.index', {data: JSON.stringify([{tes: 'xxx'}])})
    }

    async list ({auth, view, request, response}) {
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        let data = await HelpersUrutPegawai.LIST(req)
        let arrayGroup = (await SysOption.query().where('group', 'type-pegawai').select(["nilai"]).fetch()).toJSON()
        let arrayGolongan = (await SysOption.query().where('group', 'golongan').select(["nilai"]).fetch()).toJSON()

        let group = []
        for (const val of arrayGroup) {
            group.push({
                group: val.nilai,
                items: data.filter(v => v.type === val.nilai)
            })
        }

        let golongan = []
        for (const val of arrayGolongan) {
            if(val.nilai){
                golongan.push({
                    gol: val.nilai,
                    items: data.filter(v => v.golongan === val.nilai)
                })
            }
        }

        console.log("<log>", golongan);
        return view.render('laporan.urut-kepegawaian.list', {
            list: group,
            golongan: golongan,
            total: data.length
        })
    }

    async print ( { auth, request } ) {
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        let data = await HelpersUrutPegawai.LIST(req)

        data = _.groupBy(data, 'type')
        data = Object.keys(data).map(key => {
            return {
                type: key,
                items: data[key],
                jumlah: data[key].length
            }
        })

        console.log("<ORIGIN>",data);

        /**
         * SUMMARY TABLE START
         * **/

        let arrSummary = [
            [
                {text: 'No', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
                {text: 'Type Pegawai', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
                {text: 'Jumlah', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'}
            ]
        ]

        for (const [i, val] of data.entries()) {
            arrSummary.push([
                {text: (i+1), fontSize: 8, bold: true, alignment: 'center'},
                {text: val.type, fontSize: 8, bold: true, alignment: 'center'},
                {text: val.jumlah, fontSize: 8, bold: true, alignment: 'center'}
            ])
        }

        arrSummary.push([
            {text: 'Total', colSpan: 2, fontSize: 8, bold: true, alignment: 'right'},
            {},
            {text: data.reduce((a, b) => { return a + parseInt(b.jumlah) }, 0), fontSize: 8, bold: true, alignment: 'center'}
        ])

        /**
         * SUMMARY TABLE END
         * **/


        let contentPegawai = []
        
        for (const elm of data) {
            let arr = []
            var type = elm.type === 'PNS' ? 'NIP':'NR.TK2D'
            var tmt = elm.type === 'PNS' ? 'CPNS':'TK2D'
            let headContentPegawai = [
                {text: 'No', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
                {text: 'Nama Pegawai', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
                {text: 'Pangkat', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
                {text: type, fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
                {text: 'Gol', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
                {text: 'Ess', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
                {text: 'Jabatan', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
                {text: 'Pendidikan', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
                {text: 'TMT.'+tmt, fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
                {text: 'Masa Kerja', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'right'}
            ]

            arr.push(headContentPegawai)

            for (const [i, val] of (elm.items).entries()) {
                var tmt_pegawai = val.tmt_cpns ? moment(val.tmt_cpns).format("DD-MM-YYYY"):'-'
                var pendidikan = val.pendidikan || '-'
                var golongan = val.golongan || '-'
                var essalon = val.essalon || '-'
                arr.push([
                    {text: `${i + 1}`, fontSize: 8, alignment: 'center'},
                    {text: `${val.nama_pegawai}`, fontSize: 8, alignment: 'left'},
                    {text: `${val.pangkat || '-'}`, fontSize: 8, alignment: 'center'},
                    {text: `${val.nip}`, fontSize: 8, alignment: 'center'},
                    {text: `${golongan}`, fontSize: 8, alignment: 'center'},
                    {text: `${essalon}`, fontSize: 8, alignment: 'center'},
                    {text: `${val.jabatan}`, fontSize: 8, alignment: 'center'},
                    {text: `${pendidikan}`, fontSize: 8, alignment: 'center'},
                    {text: `${tmt_pegawai}`, fontSize: 8, alignment: 'center'},
                    {text: `${val.tahun || '-'} thn, ${val.bulan || '-'} bln`, fontSize: 8, alignment: 'right'}
                ])
            }

            contentPegawai.push(
                {text: elm.type, bold: true},
                {
                    style: 'tableExample',
                    table: {
                        headerRows: 1,
                        widths: [20, '*', 100, 120, 25, 25, '*', 'auto', 'auto', 80],
                        body: arr
                    }
                }, '\n',
            )
        }

        contentPegawai.push({
            alignment: 'justify',
            columns: [
                {
                    style: 'tableExample',
                    table: {
                        headerRows: 1,
                        widths: [20, '*', 100],
                        body: arrSummary
                    }
                },
                {
                    style: 'tableExample',
                    table: {
                        headerRows: 1,
                        widths: [20, '*', 100],
                        body: arrSummary
                    }
                },
            ],
            columnGap: 10
        })


        var dd = {
            pageOrientation: 'landscape',
            pageMargins: [ 10, 40],
            header: {text: [
                {text: 'DAFTAR URUT KEPEGAWAIAN BADAN PENDAPATAN DAERAH\n', fontSize: 14, alignment: 'center'},
                {text: 'TAHUN '+moment().format('YYYY'), alignment: 'center'},
            ]},
            content: contentPegawai
            
        }

        return dd
    }
}

module.exports = RepUrutKepegawaianController


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