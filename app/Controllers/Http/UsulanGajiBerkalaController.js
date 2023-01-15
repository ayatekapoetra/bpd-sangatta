'use strict'

const moment = use('moment')
const _ = use('underscore')
const V_MKG = use("App/Models/V_Mkg")
const InitNotif = use("App/Models/InitNotif")
const Pegawai = use("App/Models/MasPegawai")
const BpdPangkat = use("App/Models/BpdPangkat")
const BpdThnGaji = use("App/Models/BpdThnGaji")
const BpdSkPegawai = use("App/Models/BpdSkPegawai")
const PangkatNaik = use("App/Models/BpdKenaikanPangkat")
const BpdUsulanGaji = use("App/Models/BpdUsulanGaji")
const BpdUsulanGajiItem = use("App/Models/BpdUsulanGajiItem")
const HelpersUsulanGajiPegawai = use("App/Helpers/H-UsulanGajiPegawai")

class UsulanGajiController {
    async index ({auth, view, response}) {
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        return view.render('usulan.gaji-berkala.index')
    }

    async list ({auth, view, request, response}) {
        const req = request.all()
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        const data = await HelpersUsulanGajiPegawai.LIST(req)
        return view.render('usulan.gaji-berkala.list', {list: data})
    }

    async create ({auth, view, request, response}) {
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        return view.render('usulan.gaji-berkala.create')
    }

    async show ({auth, view, params, response}) {
        const user = await userValidate(auth)
        if(!user){
            return response.redirect("/login")
        }

        const data = await HelpersUsulanGajiPegawai.SHOW(params)
        console.log("<SOW>", data);

        return view.render('usulan.gaji-berkala.show', {data: data})
    }

    async store ( { auth, request } ) {
        let req = request.all()
        req = JSON.parse(req.data)
        const user = await userValidate(auth)
        if(!user){
            return view.render('401')
        }

        const data = await HelpersUsulanGajiPegawai.POST(req, user)
        return data
    }

    async update ( { auth, params, request } ) {
        let req = request.all()
        req = JSON.parse(req.data)
        const user = await userValidate(auth)
        if(!user){
            return view.render('401')
        }

        const data = await HelpersUsulanGajiPegawai.UPDATE(params, req, user)
        return data
    }

    async print ( { auth, params } ) {
        const user = await userValidate(auth)
        if(!user){
            return view.render('401')
        }

        const data = await HelpersUsulanGajiPegawai.PRINT(params)
        return data
    }

    async setItems( { auth } ){
        console.log('<SET-ITEMS>');
        let gaji = []
        const initialConfig = (await InitNotif.query().last()).toJSON()
        let v_mkg = (await V_MKG.query().where( w => {
            w.where('bln', initialConfig.notif_gaji)
        }).fetch()).toJSON()
        
        for (const val of v_mkg) {
            const res = (await BpdThnGaji.query().where( w => {
                w.where('mkg', (val.thn)+1)
                w.where('golongan', val.golongan)
                w.whereNotNull('nilai')
            }).last())?.toJSON()

            let _pegawai = (await Pegawai.query().where('id', val.id).last())?.toJSON()
            // console.log("<KGB>", sk_);
            
            if(res){
                gaji.push({
                    ...res, 
                    mkg_tahun: val.thn,
                    mkg_bulan: val.bln,
                    tot_masa_kerja_thn: (moment()).diff((moment(_pegawai.tmt_cpns)), 'year'),
                    tot_masa_kerja_bln: ((moment()).diff((moment(_pegawai.tmt_cpns)), 'month'))%12,
                    pegawai_id: val.id,
                    pegawai: _pegawai,
                    nama: val.nama_pegawai
                })
            }
        }

        let pegawai = (await Pegawai.query().where('aktif', 'Y').fetch())?.toJSON()
        // pegawai = _.groupBy(pegawai, 'type')
        // pegawai = Object.keys(pegawai).map(key => ({type: key, items: pegawai[key]}))

        console.log('<OBJ>', gaji);

        let RESULT = []
        for (const obj of gaji) {
            const prev_gapok = await BpdUsulanGajiItem.query().where(w => {
                w.where('pegawai_id', obj.pegawai_id)
                w.where('aktif', 'Y')
            }).last()

            let optGolongan = (await BpdPangkat.query().where('aktif', 'Y').orderBy('urut', 'desc').fetch()).toJSON()

            const HTML =
            '<tr class="item-rows">'+
            '    <td style="padding: 5px 5px;"><h3 class="urut-rows"></h3></td>'+
            '    <td class="b-all" style="padding: 5px 5px;">'+
            '        <div class="row">'+
            '            <div class="col-md-4">'+
            '                <label>Pegawai<span class="text-danger">*</span></label>'+
            '                <select class="form-control items-details" name="pegawai_id" placeholder="Nama Pegawai" required>'+
            '                   <option value="">Pilih Pegawai</option>'+
                                pegawai.map(v => '<option value="'+v.id+'" '+(v.id == obj.pegawai_id ? `selected`:``)+'>'+v.nama_pegawai+'</option>')+
            '                </select>'+
            '            </div>'+
            '            <div class="col-md-4">'+
            '                <label>NIP<span class="text-danger">*</span></label>'+
            '                <input type="text" class="form-control items-details" name="nip" value="'+obj.pegawai.nip+'" required>'+
            '            </div>'+
            '            <div class="col-md-2">'+
            '                <label>Gapok Lama<span class="text-danger">*</span></label>'+
            '                <input type="text" class="form-control items-details" name="gapok_lama" value="'+(prev_gapok?.gapok_lama || 0)+'" required>'+
            '            </div>'+
            '            <div class="col-md-2">'+
            '                <label>Gapok Baru<span class="text-danger">*</span></label>'+
            '                <input type="text" class="form-control items-details" name="gapok_baru" value="'+obj.nilai+'" required>'+
            '            </div>'+
            '            <div class="col-md-4 m-t-10">'+
            '                <label>Diusul Oleh<span class="text-danger">*</span></label>'+
            '                <input type="text" class="form-control items-details" name="usulan_oleh" value="Bupati Kutai Timur" required>'+
            '            </div>'+
            '            <div class="col-md-4 m-t-10">'+
            '               <label>No.Usulan<span class="text-danger">*</span></label>'+
            '                <input type="text" class="form-control items-details" name="no_usulan" placeholder="Nomor Usulan" required>'+
            '            </div>'+
            '            <div class="col-md-2 m-t-10">'+
            '               <label>Tgl.Usulan<span class="text-danger">*</span></label>'+
            '                <input type="date" class="form-control items-details" name="no_usulan" placeholder="Tanggal Usulan" required>'+
            '            </div>'+
            '            <div class="col-md-2 m-t-10">'+
            '               <label>Tgl.Efektif Gaji<span class="text-danger">*</span></label>'+
            '                <input type="date" class="form-control items-details" name="no_usulan" placeholder="Nomor Usulan" required>'+
            '            </div>'+
            '            <div class="col-md-4 m-t-10">'+
            '               <label>Masa Kerja Golongan</label>'+
            '                <input type="text" class="form-control items-details" name="masa_kerja_golongan" value="'+`${obj.mkg_tahun} tahun, ${obj.mkg_bulan} bulan`+'">'+
            '            </div>'+
            '            <div class="col-md-4 m-t-10">'+
            '               <label>Total Masa Kerja</label>'+
            '                <input type="text" class="form-control items-details" name="tot_masa_kerja" value="'+`${obj.tot_masa_kerja_thn} tahun ${obj.tot_masa_kerja_bln} bulan`+'">'+
            '            </div>'+
            '            <div class="col-md-2 m-t-10">'+
            '                <label>Pangkat/Gol Lama<span class="text-danger">*</span></label>'+
            '                <select class="form-control items-details" name="gol_baru" required>'+
            '                <option value="">Pilih Gol Baru</option>'+
                                optGolongan.map(v => '<option value="'+v.golongan+'" '+`${v.golongan == obj.golongan ? 'selected': ''}`+'>'+v.golongan+'</option>')+
            '                </select>'+
            '            </div>'+
            '            <div class="col-md-2 m-t-10">'+
            '                <label>Pangkat/Gol Baru<span class="text-danger">*</span></label>'+
            '                <select class="form-control items-details" name="gol_baru" required>'+
            '                <option value="">Pilih Gol Baru</option>'+
                                optGolongan.map(v => '<option value="'+v.golongan+'" '+`${v.golongan == obj.golongan ? 'selected': ''}`+'>'+v.golongan+'</option>')+
            '                </select>'+
            '            </div>'+
            '            <div class="col-md-2 m-t-10">'+
            '                <label>Type</label>'+
            '                <input type="text" class="form-control items-details" name="type" placeholder="PNS">'+
            '            </div>'+
            '            <div class="col-md-2 m-t-10">'+
            '                <label>Terhitung Mulai<span class="text-danger">*</span></label>'+
            '                <input type="date" class="form-control items-details" name="terhitung_tgl" placeholder="Terhitung Mulai" required>'+
            '            </div>'+
            '            <div class="col-md-2 m-t-10">'+
            '                <label>KGB Berikut<span class="text-danger">*</span></label>'+
            '                <input type="date" class="form-control items-details" name="kgb_next" placeholder="NIP" required>'+
            '            </div>'+
            '            <div class="col-md-6 m-t-10">'+
            '                <label>Keterangan</label>'+
            '                <input type="text" class="form-control items-details" name="remark" placeholder="Remark">'+
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
        console.log('<SHOW-ITEMS>');
        const data = await HelpersUsulanGajiPegawai.SHOW(params)

        let RESULT = []
        for (const obj of data.items) {
            let pegawai = (await Pegawai.query().where('aktif', 'Y').fetch())?.toJSON()
            const { id, nip, nama_pegawai, golongan } = pegawai.find(v => v.id === obj.pegawai_id)
            let optGolongan = (await BpdPangkat.query().where('aktif', 'Y').orderBy('urut', 'desc').fetch()).toJSON()
            optGolongan = optGolongan.map(v => v.golongan == obj.gol_baru ? {...v, selected: 'selected'}:{...v, selected: ''})
            const HTML =
            '<tr class="item-rows">'+
            '    <td style="padding: 5px 5px;"><h3 class="urut-rows"></h3></td>'+
            '    <td class="b-all" style="padding: 5px 5px;">'+
            '        <div class="row">'+
            '            <div class="col-md-4">'+
            '                <label>Pegawai<span class="text-danger">*</span></label>'+
            '                <select class="form-control items-details" name="pegawai_id" placeholder="Nama Pegawai" required>'+
            '                   <option value="">Pilih Pegawai</option>'+
                                pegawai.map(v => '<optgroup label="'+v.type+'">'+v.items.map(x => '<option value="'+x.id+'">'+x.nama_pegawai+'</option>')+'</optgroup>')+
            '                </select>'+
            '            </div>'+
            '            <div class="col-md-4">'+
            '                <label>NIP<span class="text-danger">*</span></label>'+
            '                <input type="text" class="form-control items-details" name="nip" placeholder="NIP" required>'+
            '            </div>'+
            '            <div class="col-md-2">'+
            '                <label>Gapok Lama<span class="text-danger">*</span></label>'+
            '                <input type="text" class="form-control items-details" name="gapok_lama" placeholder="Gaji Pokok Lama" required>'+
            '            </div>'+
            '            <div class="col-md-2">'+
            '                <label>Gapok Baru<span class="text-danger">*</span></label>'+
            '                <input type="text" class="form-control items-details" name="gapok_baru" placeholder="Gaji Pokok Baru" required>'+
            '            </div>'+
            '            <div class="col-md-4 m-t-10">'+
            '                <label>Diusul Oleh<span class="text-danger">*</span></label>'+
            '                <input type="text" class="form-control items-details" name="usulan_oleh" value="Bupati Kutai Timur" required>'+
            '            </div>'+
            '            <div class="col-md-4 m-t-10">'+
            '               <label>No.Usulan<span class="text-danger">*</span></label>'+
            '                <input type="text" class="form-control items-details" name="no_usulan" placeholder="Nomor Usulan" required>'+
            '            </div>'+
            '            <div class="col-md-2 m-t-10">'+
            '               <label>Tgl.Usulan<span class="text-danger">*</span></label>'+
            '                <input type="date" class="form-control items-details" name="no_usulan" placeholder="Nomor Usulan" required>'+
            '            </div>'+
            '            <div class="col-md-2 m-t-10">'+
            '               <label>Tgl.Efektif Gaji<span class="text-danger">*</span></label>'+
            '                <input type="date" class="form-control items-details" name="no_usulan" placeholder="Nomor Usulan" required>'+
            '            </div>'+
            '            <div class="col-md-4 m-t-10">'+
            '               <label>Masa Kerja Golongan</label>'+
            '                <input type="text" class="form-control items-details" name="masa_kerja_golongan" placeholder="Masa Kerja Golongan">'+
            '            </div>'+
            '            <div class="col-md-4 m-t-10">'+
            '               <label>Total Masa Kerja</label>'+
            '                <input type="text" class="form-control items-details" name="tot_masa_kerja" value="xx tahun, xx bulan">'+
            '            </div>'+
            '            <div class="col-md-2 m-t-10">'+
            '                <label>Pangkat/Gol Lama<span class="text-danger">*</span></label>'+
            '                <select class="form-control items-details" name="gol_baru" required>'+
            '                <option value="">Pilih Gol Baru</option>'+
                                optGolongan.map(v => '<option value="'+v.golongan+'">'+v.golongan+'</option>')+
            '                </select>'+
            '            </div>'+
            '            <div class="col-md-2 m-t-10">'+
            '                <label>Pangkat/Gol Baru<span class="text-danger">*</span></label>'+
            '                <select class="form-control items-details" name="gol_baru" required>'+
            '                <option value="">Pilih Gol Baru</option>'+
                                optGolongan.map(v => '<option value="'+v.golongan+'">'+v.golongan+'</option>')+
            '                </select>'+
            '            </div>'+
            '            <div class="col-md-2 m-t-10">'+
            '                <label>Type</label>'+
            '                <input type="text" class="form-control items-details" name="type" placeholder="PNS">'+
            '            </div>'+
            '            <div class="col-md-2 m-t-10">'+
            '                <label>Terhitung Mulai<span class="text-danger">*</span></label>'+
            '                <input type="date" class="form-control items-details" name="terhitung_tgl" placeholder="Terhitung Mulai" required>'+
            '            </div>'+
            '            <div class="col-md-2 m-t-10">'+
            '                <label>KGB Berikut<span class="text-danger">*</span></label>'+
            '                <input type="date" class="form-control items-details" name="kgb_next" placeholder="NIP" required>'+
            '            </div>'+
            '            <div class="col-md-6 m-t-10">'+
            '                <label>Keterangan</label>'+
            '                <input type="text" class="form-control items-details" name="remark" placeholder="Remark">'+
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
        let gaji = []
        const initialConfig = (await InitNotif.query().last()).toJSON()
        let v_mkg = (await V_MKG.query().where( w => {
            w.where('bln', initialConfig.notif_gaji)
        }).fetch()).toJSON()
        
        for (const val of v_mkg) {
            const res = (await BpdThnGaji.query().where( w => {
                w.where('mkg', (val.thn)+1)
                w.where('golongan', val.golongan)
                w.whereNotNull('nilai')
            }).last())?.toJSON()

            // const sk_ = await BpdSkPegawai.query().where('pegawai_id', val.id).last()
            // console.log("<KGB>", sk_);
            
            if(res){
                gaji.push({
                    ...res, 
                    pegawai_id: val.id,
                    nama: val.nama_pegawai
                })
            }
        }

        let pegawai = (await Pegawai.query().where('aktif', 'Y').fetch())?.toJSON()
        
        const optGolongan = (await BpdPangkat.query().where('aktif', 'Y').orderBy('urut', 'desc').fetch()).toJSON()

        pegawai = _.groupBy(pegawai, 'type')
        pegawai = Object.keys(pegawai).map(key => ({type: key, items: pegawai[key]}))

        const HTML =
        '<tr class="item-rows">'+
        '    <td style="padding: 5px 5px;"><h3 class="urut-rows"></h3></td>'+
        '    <td class="b-all" style="padding: 5px 5px;">'+
        '        <div class="row">'+
        '            <div class="col-md-4">'+
        '                <label>Pegawai<span class="text-danger">*</span></label>'+
        '                <select class="form-control items-details" name="pegawai_id" placeholder="Nama Pegawai" required>'+
        '                   <option value="">Pilih Pegawai</option>'+
                            pegawai.map(v => '<optgroup label="'+v.type+'">'+v.items.map(x => '<option value="'+x.id+'">'+x.nama_pegawai+'</option>')+'</optgroup>')+
        '                </select>'+
        '            </div>'+
        '            <div class="col-md-4">'+
        '                <label>NIP<span class="text-danger">*</span></label>'+
        '                <input type="text" class="form-control items-details" name="nip" placeholder="NIP" required>'+
        '            </div>'+
        '            <div class="col-md-2">'+
        '                <label>Gapok Lama<span class="text-danger">*</span></label>'+
        '                <input type="text" class="form-control items-details" name="gapok_lama" placeholder="Gaji Pokok Lama" required>'+
        '            </div>'+
        '            <div class="col-md-2">'+
        '                <label>Gapok Baru<span class="text-danger">*</span></label>'+
        '                <input type="text" class="form-control items-details" name="gapok_baru" placeholder="Gaji Pokok Baru" required>'+
        '            </div>'+
        '            <div class="col-md-4 m-t-10">'+
        '                <label>Diusul Oleh<span class="text-danger">*</span></label>'+
        '                <input type="text" class="form-control items-details" name="usulan_oleh" value="Bupati Kutai Timur" required>'+
        '            </div>'+
        '            <div class="col-md-4 m-t-10">'+
        '               <label>No.Usulan<span class="text-danger">*</span></label>'+
        '                <input type="text" class="form-control items-details" name="no_usulan" placeholder="Nomor Usulan" required>'+
        '            </div>'+
        '            <div class="col-md-2 m-t-10">'+
        '               <label>Tgl.Usulan<span class="text-danger">*</span></label>'+
        '                <input type="date" class="form-control items-details" name="no_usulan" placeholder="Nomor Usulan" required>'+
        '            </div>'+
        '            <div class="col-md-2 m-t-10">'+
        '               <label>Tgl.Efektif Gaji<span class="text-danger">*</span></label>'+
        '                <input type="date" class="form-control items-details" name="no_usulan" placeholder="Nomor Usulan" required>'+
        '            </div>'+
        '            <div class="col-md-4 m-t-10">'+
        '               <label>Masa Kerja Golongan</label>'+
        '                <input type="text" class="form-control items-details" name="masa_kerja_golongan" placeholder="Masa Kerja Golongan">'+
        '            </div>'+
        '            <div class="col-md-4 m-t-10">'+
        '               <label>Total Masa Kerja</label>'+
        '                <input type="text" class="form-control items-details" name="tot_masa_kerja" value="xx tahun, xx bulan">'+
        '            </div>'+
        '            <div class="col-md-2 m-t-10">'+
        '                <label>Pangkat/Gol Lama<span class="text-danger">*</span></label>'+
        '                <select class="form-control items-details" name="gol_baru" required>'+
        '                <option value="">Pilih Gol Baru</option>'+
                            optGolongan.map(v => '<option value="'+v.golongan+'">'+v.golongan+'</option>')+
        '                </select>'+
        '            </div>'+
        '            <div class="col-md-2 m-t-10">'+
        '                <label>Pangkat/Gol Baru<span class="text-danger">*</span></label>'+
        '                <select class="form-control items-details" name="gol_baru" required>'+
        '                <option value="">Pilih Gol Baru</option>'+
                            optGolongan.map(v => '<option value="'+v.golongan+'">'+v.golongan+'</option>')+
        '                </select>'+
        '            </div>'+
        '            <div class="col-md-2 m-t-10">'+
        '                <label>Type</label>'+
        '                <input type="text" class="form-control items-details" name="type" placeholder="PNS">'+
        '            </div>'+
        '            <div class="col-md-2 m-t-10">'+
        '                <label>Terhitung Mulai<span class="text-danger">*</span></label>'+
        '                <input type="date" class="form-control items-details" name="terhitung_tgl" placeholder="Terhitung Mulai" required>'+
        '            </div>'+
        '            <div class="col-md-2 m-t-10">'+
        '                <label>KGB Berikut<span class="text-danger">*</span></label>'+
        '                <input type="date" class="form-control items-details" name="kgb_next" placeholder="NIP" required>'+
        '            </div>'+
        '            <div class="col-md-6 m-t-10">'+
        '                <label>Keterangan</label>'+
        '                <input type="text" class="form-control items-details" name="remark" placeholder="Remark">'+
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

module.exports = UsulanGajiController

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
