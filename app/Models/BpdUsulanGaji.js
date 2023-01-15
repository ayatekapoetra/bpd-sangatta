'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class BpdUsulanGaji extends Model {
    static get table(){
        return 'usulan_gaji'
    }

    author () {
        return this.belongsTo("App/Models/User", "createdby", "id")
    }

    items () {
        return this.hasMany("App/Models/BpdUsulanGajiItem", 'id', 'usulan_gaji_id')
    }
}

module.exports = BpdUsulanGaji
