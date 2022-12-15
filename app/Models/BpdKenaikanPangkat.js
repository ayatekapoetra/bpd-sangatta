'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class BpdKenaikanPangkat extends Model {
    static get table(){
        return 'bpd_kenaikan_pangkat_reguler'
    }

    pegawai () {
        return this.belongsTo("App/Models/MasPegawai", "pegawai_id", "id")
    }
}

module.exports = BpdKenaikanPangkat
