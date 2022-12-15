'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class BpdPangkat extends Model {
    static get table(){
        return 'bpd_pangkat'
    }
}

module.exports = BpdPangkat
