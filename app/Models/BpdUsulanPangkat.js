'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class UsulanPangkat extends Model {
    static get table(){
        return 'usulan_pangkat'
    }

    author () {
        return this.belongsTo("App/Models/User", "createdby", "id")
    }

    items () {
        return this.hasMany("App/Models/BpdUsulanPangkatItem", 'id', 'usulan_pangkat_id')
    }
}

module.exports = UsulanPangkat
