'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class BpdGapok extends Model {
    static get table(){
        return 'bpd_gaji_pokok'
    }
}

module.exports = BpdGapok
