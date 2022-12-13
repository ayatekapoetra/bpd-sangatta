'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class MasPegawai extends Model {
    static get table(){
        return 'mas_pegawai'
    }
}

module.exports = MasPegawai
