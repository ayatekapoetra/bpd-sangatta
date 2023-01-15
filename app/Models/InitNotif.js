'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class InitNotif extends Model {
    static get table(){
        return 'init_notifikasi'
    }
}

module.exports = InitNotif
