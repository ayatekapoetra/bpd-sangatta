'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class BpdMutasiResign extends Model {
    static get table(){
        return 'bpd_mutasi_resign'
    }

    pegawai () {
        return this.belongsTo("App/Models/MasPegawai", "pegawai_id", "id")
    }
}

module.exports = BpdMutasiResign
