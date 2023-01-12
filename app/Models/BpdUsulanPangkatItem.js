'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class UsulanPangkatItem extends Model {
    static get table(){
        return 'usulan_pangkat_item'
    }

    pegawai () {
        return this.belongsTo("App/Models/MasPegawai", "pegawai_id", "id")
    }
}

module.exports = UsulanPangkatItem
