'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class MasPegawai extends Model {
    static get table(){
        return 'mas_pegawai'
    }

    masaKerja () {
        return this.hasOne("App/Models/BpdMasaKerja", "id", "pegawai_id")
    }

    sk () {
        return this.hasMany("App/Models/BpdSkPegawai", "id", "pegawai_id")
    }
}

module.exports = MasPegawai
