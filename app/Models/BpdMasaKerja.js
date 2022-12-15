'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class BpdMasaKerja extends Model {
    static get table(){
        return 'bpd_masa_kerja'
    }
    
    pegawai () {
        return this.belongsTo("App/Models/MasPegawai", "pegawai_id", "id")
    }
}

module.exports = BpdMasaKerja
