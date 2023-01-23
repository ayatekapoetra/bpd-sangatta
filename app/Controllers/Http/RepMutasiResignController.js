'use strict'

const _ = use('underscore')
const moment = use('moment')
const Pegawai = use("App/Models/MasPegawai")
const BpdMutasiResign = use("App/Models/BpdMutasiResign")

class RepMutasiResignController {
    async index ({auth, view, response}) {
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }


        return view.render('laporan.mutasi-resign.index', {data: JSON.stringify([{tes: 'xxx'}])})
    }

    async list ({auth, view, request, response}) {
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }
        
        let data = (await BpdMutasiResign.query().with('pegawai').where( w => {
            if(req.start_date && req.end_date){
                w.where('eff_date', '>=', req.start_date)
                w.where('eff_date', '<=', req.end_date)
            }
        }).fetch()).toJSON()
        
        console.log("<log>", data);

        return view.render('laporan.mutasi-resign.list', {list: data})
    }

    async print ( { auth, request } ) {
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        let data = (await BpdMutasiResign.query().with('pegawai').where( w => {
            if(req.start_date && req.end_date){
                w.where('eff_date', '>=', req.start_date)
                w.where('eff_date', '<=', req.end_date)
            }
        }).fetch()).toJSON()

        let contentData = [
            [
                {text: 'No', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
                {text: 'NIP', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
                {text: 'Nama Pegawai', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
                {text: 'Status', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
                {text: 'Eff Date', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
                {text: 'Keterangan', fillColor: '#ddd', fontSize: 10, bold: true, alignment: 'center'},
            ]
        ]
        for (const [i, item] of data.entries()) {
            contentData.push([
                {text: (i+1), fontSize: 8, bold: true, alignment: 'center'},
                {text: `${item.pegawai.nip}`, fontSize: 8, bold: true, alignment: 'center'},
                {text: `${item.pegawai.nama_pegawai}`, fontSize: 8, bold: true, alignment: 'left'},
                {text: `${item.status}`, fontSize: 8, bold: true, alignment: 'center'},
                {text: `${moment(item.eff_date).format('dddd, DD MMM YYYY')}`, fontSize: 8, bold: true, alignment: 'center'},
                {text: 'Keterangan', fontSize: 8, bold: true, alignment: 'center'},
            ])
        }

        req.start_date = req.start_date || moment().startOf('year').format('DD-MM-YYYY')
        req.end_date = req.start_date || moment().endOf('year').format('DD-MM-YYYY')

        var dd = {
            pageOrientation: 'landscape',
            pageMargins: [ 10, 40],
            header: {text: [
                {text: 'REKAP MUTASI-RESIGN KEPEGAWAIAN BADAN PENDAPATAN DAERAH\n', fontSize: 14, alignment: 'center'},
                {text: 'Periode '+moment(new Date(req.start_date)).format('DD-MM-YYYY')+' s/d '+moment(new Date(req.end_date)).format('DD-MM-YYYY'), alignment: 'center', fontSize: 10},
            ]},
            content: [
                {
                    style: 'tableExample',
                    table: {
                        headerRows: 1,
                        widths: [20, 'auto', '*', 100, 100, '*'],
                        body: contentData
                    }
                }
            ]
            
        }

        return dd
    }
}

module.exports = RepMutasiResignController


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