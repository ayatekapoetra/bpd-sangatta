'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class BpdSkPegawai extends Model {
    static get table(){
        return 'bpd_sk_pegawai'
    }

    pegawai () {
        return this.belongsTo("App/Models/MasPegawai", "pegawai_id", "id")
    }
}

module.exports = BpdSkPegawai
