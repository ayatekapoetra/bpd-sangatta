'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class V_Mkg extends Model {
    static get table(){
        return 'v_mkg'
    }
}

module.exports = V_Mkg
