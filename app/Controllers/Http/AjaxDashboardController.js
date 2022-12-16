'use strict'

const Options = use("App/Models/SysOption")
const MasPegawai = use("App/Models/MasPegawai")
const BpdPangkat = use("App/Models/BpdPangkat")


class AjaxDashboardController {
    async index ({ request }) {
        const options = (
            await Options.query()
            .where('status', 'Y')
            .orderBy([
                {column: 'group', order: 'asc'},
                {column: 'urut', order: 'asc'}
            ])
            .fetch()
        ).toJSON()
        return options
    }

    async group ({ request }) {
        const req = request.all()
        let options = (
            await Options.query()
            .where( w => {
                w.where('status', 'Y')
                w.where('group', req.group)
            })
            .orderBy([
                {column: 'urut', order: 'asc'},
                {column: 'teks', order: 'asc'}
            ])
            .fetch()
        ).toJSON()

        if(req.selected){
            options = options.map( v => v.nilai == req.selected ? {...v, selected: 'selected'}:{...v, selected: ''})
        }

        return options
    }

    /** OPTIONS PEGAWAI **/
    async pegawai ( { request } ) {
        const req = request.all()
        let data = (await MasPegawai.query().where('aktif', 'Y').fetch()).toJSON()
        if(req.selected){
            data = data.map( v => v.id == req.selected ? {...v, selected: 'selected'} : {...v, selected: ''})
        }else{
            data.unshift({id: '', nama_pegawai: 'Pilih...'})
        }

        return data
    }

    /** OPTIONS PANGKAT **/
    async pangkat ( { request } ) {
        const req = request.all()
        let data = (await BpdPangkat.query().where('aktif', 'Y').fetch()).toJSON()
        if(req.selected){
            data = data.map( v => v.pangkat == req.selected ? {...v, selected: 'selected'} : {...v, selected: ''})
        }else{
            data.unshift({id: '', pangkat: 'Pilih...'})
        }

        return data
    }
}

module.exports = AjaxDashboardController
