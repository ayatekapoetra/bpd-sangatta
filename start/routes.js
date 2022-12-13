'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URL's and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/docs/4.1/routing
|
*/

/** @type {typeof import('@adonisjs/framework/src/Route/Manager')} */
const Route = use('Route')

// Route.on('/').render('template.main')
// Route.on('/').render('login')
Route.get('/login', 'AuthDashboardController.index').as('login')
Route.post('/login', 'AuthDashboardController.signin').as('signin')
Route.get('/signout', 'AuthDashboardController.signout').as('signout')

Route.get('/', 'HomeDashboardController.index').as('dashboard').middleware(['guard'])

// DASHBOARD
Route.group(() => {
    /** MASTER PEGAWAI **/
    Route.get('/pegawai', 'MstPegawaiController.index').as('pegawai').middleware(['guard'])
    Route.post('/pegawai', 'MstPegawaiController.store').as('pegawai-store').middleware(['guard'])
    Route.get('/pegawai/list', 'MstPegawaiController.list').as('pegawai-list').middleware(['guard'])
    Route.get('/pegawai/create', 'MstPegawaiController.create').as('pegawai-create').middleware(['guard'])
    Route.get('/pegawai/:id/show', 'MstPegawaiController.show').as('pegawai-show').middleware(['guard'])
    Route.post('/pegawai/:id/update', 'MstPegawaiController.update').as('pegawai-update').middleware(['guard'])
    Route.delete('/pegawai/:id/destroy', 'MstPegawaiController.destroy').as('pegawai-destroy').middleware(['guard'])
    
}).prefix('master')

// AJAX
Route.group(() => {
    /** OPTIONS **/
    Route.get('/options', 'AjaxDashboardController.index').as('options')
    Route.get('/options/group', 'AjaxDashboardController.group').as('options-group')
    
}).prefix('ajax')

