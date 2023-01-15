'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class BpdUsulanGajiItem extends Model {
    static get table(){
        return 'usulan_gaji_item'
    }

    pegawai () {
        return this.belongsTo("App/Models/MasPegawai", "pegawai_id", "id")
    }
}

module.exports = BpdUsulanGajiItem
