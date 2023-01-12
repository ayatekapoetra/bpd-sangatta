'use strict'

const moment = use('moment')
const _ = use('underscore')
const Pegawai = use("App/Models/MasPegawai")
const BpdPangkat = use("App/Models/BpdPangkat")
const PangkatNaik = use("App/Models/BpdKenaikanPangkat")
const HelpersUsulanPangkatPegawai = use("App/Helpers/H-UsulanPangkatPegawai")

class UsulanPangkatController {
    async index ({auth, view, response}) {
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        return view.render('usulan.pangkat.index')
    }

    async list ({auth, view, request, response}) {
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        const data = await HelpersUsulanPangkatPegawai.LIST(req)
        return view.render('usulan.pangkat.list', {list: data})
    }

    async create ({auth, view, request, response}) {
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        return view.render('usulan.pangkat.create')
    }

    async show ({auth, view, params, response}) {
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        const data = await HelpersUsulanPangkatPegawai.SHOW(params)
        console.log("<SOW>", data);

        return view.render('usulan.pangkat.show', {data: data})
    }

    async store ( { auth, request } ) {
        let req = request.all()
        req = JSON.parse(req.data)
        const user = await userValidate(auth)
        if(!user){
            return view.render('401')
        }

        const data = await HelpersUsulanPangkatPegawai.POST(req, user)
        return data
    }

    async update ( { auth, params, request } ) {
        let req = request.all()
        req = JSON.parse(req.data)
        const user = await userValidate(auth)
        if(!user){
            return view.render('401')
        }

        const data = await HelpersUsulanPangkatPegawai.UPDATE(params, req, user)
        return data
    }

    async setItems( { auth } ){
        let data = (
            await PangkatNaik.query()
            .with('pegawai', m => m.with('masaKerja'))
            .where( w => {
                w.where('aktif', 'Y')
                w.where('eff_date', '>=', moment().startOf('Y').format('YYYY-MM-DD'))
                w.where('eff_date', '<=', moment().endOf('Y').format('YYYY-MM-DD'))
            }).fetch()
        ).toJSON()

        let RESULT = []
        for (const obj of data) {
            let pegawai = (await Pegawai.query().where('aktif', 'Y').fetch())?.toJSON()
            // let selectPegawai = pegawai.map(v => v.id === obj.pegawai_id ? {...v, selected: 'selected'}:v)
            const { id, nip, nama_pegawai, golongan } = pegawai.find(v => v.id === obj.pegawai_id)
            const optGolongan = (await BpdPangkat.query().where('aktif', 'Y').orderBy('urut', 'desc').fetch()).toJSON()
            const HTML =
            '<tr class="item-rows">'+
            '    <td style="padding: 5px 5px;"><h3 class="urut-rows"></h3></td>'+
            '    <td  class="b-all" style="padding: 5px 5px;">'+
            '        <div class="row">'+
            '            <div class="col-md-4">'+
            '                <input type="hidden" class="form-control items-details" name="pegawai_id" placeholder="ID" value="'+id+'" readonly>'+
            '                <input type="text" class="form-control items-details" name="nama_pegawai" placeholder="Nama Pegawai" value="'+nama_pegawai+'" readonly>'+
            '            </div>'+
            '            <div class="col-md-2">'+
            '                <input type="text" class="form-control items-details" name="t4lahir" placeholder="Tempat Lahir" required>'+
            '            </div>'+
            '            <div class="col-md-2">'+
            '                <input type="date" class="form-control items-details" name="tgl_lahir" placeholder="Tanggal Lahir" required>'+
            '            </div>'+
            '            <div class="col-md-2">'+
            '                <input type="text" class="form-control items-details" name="gol_lama" placeholder="Gol.Lama" value="'+golongan+'" readonly>'+
            '            </div>'+
            '            <div class="col-md-2">'+
            '                <select class="form-control items-details" name="gol_baru" required>'+
            '                <option value="">Pilih Gol Baru</option>'+
                                optGolongan.map(v => '<option value="'+v.golongan+'">'+v.golongan+'</option>')+
            '                </select>'+
            '            </div>'+
            '            <div class="col-md-4 m-t-5">'+
            '                <input type="text" class="form-control items-details" name="nip" placeholder="NIP" value="'+nip+'" readonly>'+
            '            </div>'+
            '            <div class="col-md-4 m-t-5">'+
            '                <input type="text" class="form-control items-details" name="jenis" placeholder="Jenis Kenaikan Pangkat" required>'+
            '            </div>'+
            '            <div class="col-md-4 m-t-5">'+
            '                <input type="text" class="form-control items-details" name="unit_kerja" placeholder="Unit Kerja" required>'+
            '            </div>'+
            '            <div class="col-md-6 m-t-5">'+
            '                <input type="text" class="form-control items-details" name="jabatan" placeholder="Jabatan" required>'+
            '            </div>'+
            '            <div class="col-md-6 m-t-5">'+
            '                <input type="text" class="form-control items-details" name="remark" placeholder="Narasi" required>'+
            '            </div>'+
            '        </div>'+
            '    </td>'+
            '    <td class="text-right" style="padding: 5px 5px;">'+
            '        <button type="button" class="btn btn-danger btn-circle bt-remove-item">'+
            '            <i class="fa fa-trash"></i>'+
            '        </button>'+
            '    </td>'+
            '</tr>';
            RESULT.push(HTML)
        }

        return RESULT
    }

    async showItems( { auth, params } ){
        const data = await HelpersUsulanPangkatPegawai.SHOW(params)

        let RESULT = []
        for (const obj of data.items) {
            let pegawai = (await Pegawai.query().where('aktif', 'Y').fetch())?.toJSON()
            const { id, nip, nama_pegawai, golongan } = pegawai.find(v => v.id === obj.pegawai_id)
            let optGolongan = (await BpdPangkat.query().where('aktif', 'Y').orderBy('urut', 'desc').fetch()).toJSON()
            optGolongan = optGolongan.map(v => v.golongan == obj.gol_baru ? {...v, selected: 'selected'}:{...v, selected: ''})
            const HTML =
            '<tr class="item-rows">'+
            '    <td style="padding: 5px 5px;"><h3 class="urut-rows"></h3></td>'+
            '    <td  class="b-all" style="padding: 5px 5px;">'+
            '        <div class="row">'+
            '            <div class="col-md-4">'+
            '                <input type="hidden" class="form-control items-details" name="pegawai_id" placeholder="ID" value="'+id+'" readonly>'+
            '                <input type="text" class="form-control items-details" name="nama_pegawai" placeholder="Nama Pegawai" value="'+nama_pegawai+'" readonly>'+
            '            </div>'+
            '            <div class="col-md-2">'+
            '                <input type="text" class="form-control items-details" name="t4lahir" placeholder="Tempat Lahir" value="'+obj.t4lahir+'" required>'+
            '            </div>'+
            '            <div class="col-md-2">'+
            '                <input type="date" class="form-control setDate items-details" name="tgl_lahir" placeholder="Tanggal Lahir" data-values="'+obj.tgl_lahir+'" required>'+
            '            </div>'+
            '            <div class="col-md-2">'+
            '                <input type="text" class="form-control items-details" name="gol_lama" placeholder="Gol.Lama" value="'+golongan+'" readonly>'+
            '            </div>'+
            '            <div class="col-md-2">'+
            '                <select class="form-control items-details" name="gol_baru" required>'+
            '                <option value="">Pilih Gol Baru</option>'+
                                optGolongan.map(v => '<option value="'+v.golongan+'" '+v.selected+'>'+v.golongan+'</option>')+
            '                </select>'+
            '            </div>'+
            '            <div class="col-md-4 m-t-5">'+
            '                <input type="text" class="form-control items-details" name="nip" placeholder="NIP" value="'+nip+'" readonly>'+
            '            </div>'+
            '            <div class="col-md-4 m-t-5">'+
            '                <input type="text" class="form-control items-details" name="jenis" placeholder="Jenis Kenaikan Pangkat" value="'+obj.jenis+'" required>'+
            '            </div>'+
            '            <div class="col-md-4 m-t-5">'+
            '                <input type="text" class="form-control items-details" name="unit_kerja" placeholder="Unit Kerja" value="'+obj.unit_kerja+'" required>'+
            '            </div>'+
            '            <div class="col-md-6 m-t-5">'+
            '                <input type="text" class="form-control items-details" name="jabatan" placeholder="Jabatan" value="'+obj.jabatan+'" required>'+
            '            </div>'+
            '            <div class="col-md-6 m-t-5">'+
            '                <input type="text" class="form-control items-details" name="remark" placeholder="Narasi" value="'+obj.remark+'" required>'+
            '            </div>'+
            '        </div>'+
            '    </td>'+
            '    <td class="text-right" style="padding: 5px 5px;">'+
            '        <button type="button" class="btn btn-danger btn-circle bt-remove-item">'+
            '            <i class="fa fa-trash"></i>'+
            '        </button>'+
            '    </td>'+
            '</tr>';
            RESULT.push(HTML)
        }

        return RESULT
    }

    async addItems ( { auth } ) {
        
        let pegawai = (await Pegawai.query().where('aktif', 'Y').fetch())?.toJSON()
        const optGolongan = (await BpdPangkat.query().where('aktif', 'Y').orderBy('urut', 'desc').fetch()).toJSON()

        pegawai = _.groupBy(pegawai, 'type')
        pegawai = Object.keys(pegawai).map(key => ({type: key, items: pegawai[key]}))
        console.log("<PEGAWAI>", pegawai);

        const HTML =
        '<tr class="item-rows">'+
        '    <td style="padding: 5px 5px;"><h3 class="urut-rows"></h3></td>'+
        '    <td class="b-all" style="padding: 5px 5px;">'+
        '        <div class="row">'+
        '            <div class="col-md-4">'+
        '                <select class="form-control items-details" name="pegawai_id" placeholder="Nama Pegawai" required>'+
        '                   <option value="">Pilih Pegawai</option>'+
                            pegawai.map(v => '<optgroup label="'+v.type+'">'+v.items.map(x => '<option value="'+x.id+'">'+x.nama_pegawai+'</option>')+'</optgroup>')+
        '                </select>'+
        '            </div>'+
        '            <div class="col-md-2">'+
        '                <input type="text" class="form-control items-details" name="t4lahir" placeholder="Tempat Lahir" required>'+
        '            </div>'+
        '            <div class="col-md-2">'+
        '                <input type="date" class="form-control items-details" name="tgl_lahir" placeholder="Tanggal Lahir" required>'+
        '            </div>'+
        '            <div class="col-md-2">'+
        '                <input type="text" class="form-control items-details" name="gol_lama" placeholder="Gol.Lama" required>'+
        '            </div>'+
        '            <div class="col-md-2">'+
        '                <select class="form-control items-details" name="gol_baru" required>'+
        '                <option value="">Pilih Gol Baru</option>'+
                            optGolongan.map(v => '<option value="'+v.golongan+'">'+v.golongan+'</option>')+
        '                </select>'+
        '            </div>'+
        '            <div class="col-md-4 m-t-5">'+
        '                <input type="text" class="form-control items-details" name="nip" placeholder="NIP" required>'+
        '            </div>'+
        '            <div class="col-md-4 m-t-5">'+
        '                <input type="text" class="form-control items-details" name="jenis" placeholder="Jenis Kenaikan Pangkat" required>'+
        '            </div>'+
        '            <div class="col-md-4 m-t-5">'+
        '                <input type="text" class="form-control items-details" name="unit_kerja" placeholder="Unit Kerja" required>'+
        '            </div>'+
        '            <div class="col-md-6 m-t-5">'+
        '                <input type="text" class="form-control items-details" name="jabatan" placeholder="Jabatan" required>'+
        '            </div>'+
        '            <div class="col-md-6 m-t-5">'+
        '                <input type="text" class="form-control items-details" name="remark" placeholder="Narasi" required>'+
        '            </div>'+
        '        </div>'+
        '    </td>'+
        '    <td class="text-right" style="padding: 5px 5px;">'+
        '        <button type="button" class="btn btn-danger btn-circle bt-remove-item">'+
        '            <i class="fa fa-trash"></i>'+
        '        </button>'+
        '    </td>'+
        '</tr>';
        return HTML
    }
}

module.exports = UsulanPangkatController

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
