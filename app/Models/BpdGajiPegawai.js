'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class BpdGajiPegawai extends Model {
    static get table(){
        return 'bpd_gaji_pegawai'
    }
}

module.exports = BpdGajiPegawai
