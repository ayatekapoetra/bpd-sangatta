'use strict'

/*
|--------------------------------------------------------------------------
| Factory
|--------------------------------------------------------------------------
|
| Factories are used to define blueprints for database tables or Lucid
| models. Later you can use these blueprints to seed your database
| with dummy data.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use('Factory')

Factory.blueprint('App/Models/User', (faker) => {
    return {
        username: 'dev',
        email: 'ayat.ekapoetra@gmail.com',
        phone: '081355719747',
        password: 'bpd123',
        usertype: 'admin'
    }
})
