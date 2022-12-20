'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class BpdThnGaji extends Model {
    static get table(){
        return 'bpd_thn_gaji'
    }
}

module.exports = BpdThnGaji
