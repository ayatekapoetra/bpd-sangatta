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
Route.get('/:idpegawai/promosi', 'HomeDashboardController.promosi').as('dashboard').middleware(['guard'])
Route.post('/pegawai/promosi', 'HomeDashboardController.storePromosi').as('dashboard').middleware(['guard'])

// DASHBOARD
Route.group(() => {
    /** MASTER PEGAWAI **/
    Route.get('/pegawai', 'MstPegawaiController.index').as('pegawai')//.middleware(['guard'])
    Route.post('/pegawai', 'MstPegawaiController.store').as('pegawai-store')//.middleware(['guard'])
    Route.get('/pegawai/list', 'MstPegawaiController.list').as('pegawai-list')//.middleware(['guard'])
    Route.get('/pegawai/create', 'MstPegawaiController.create').as('pegawai-create')//.middleware(['guard'])
    Route.get('/pegawai/:id/show', 'MstPegawaiController.show').as('pegawai-show')//.middleware(['guard'])
    Route.post('/pegawai/:id/update', 'MstPegawaiController.update').as('pegawai-update')//.middleware(['guard'])
    Route.delete('/pegawai/:id/destroy', 'MstPegawaiController.destroy').as('pegawai-destroy')//.middleware(['guard'])

    Route.get('/gaji', 'MstGajiController.index').as('pegawai')//.middleware(['guard'])
    Route.post('/gaji', 'MstGajiController.store').as('pegawai-store')//.middleware(['guard'])
    Route.get('/gaji/list', 'MstGajiController.list').as('pegawai-list')//.middleware(['guard'])
    Route.get('/gaji/create', 'MstGajiController.create').as('pegawai-create')//.middleware(['guard'])
    Route.get('/gaji/:id/show', 'MstGajiController.show').as('pegawai-show')//.middleware(['guard'])
    Route.post('/gaji/:id/update', 'MstGajiController.update').as('pegawai-update')//.middleware(['guard'])
    Route.delete('/gaji/:id/destroy', 'MstGajiController.destroy').as('pegawai-destroy')//.middleware(['guard'])

    Route.get('/sk-pengangkatan', 'MstSkPegawaiController.index').as('sk-pengangkatan')//.middleware(['guard'])
    Route.post('/sk-pengangkatan', 'MstSkPegawaiController.store').as('sk-pengangkatan-store')//.middleware(['guard'])
    Route.get('/sk-pengangkatan/list', 'MstSkPegawaiController.list').as('sk-pengangkatan-list')//.middleware(['guard'])
    Route.get('/sk-pengangkatan/create', 'MstSkPegawaiController.create').as('sk-pengangkatan-create')//.middleware(['guard'])
    Route.get('/sk-pengangkatan/:id/show', 'MstSkPegawaiController.show').as('sk-pengangkatan-show')//.middleware(['guard'])
    Route.post('/sk-pengangkatan/:id/update', 'MstSkPegawaiController.update').as('sk-pengangkatan-update')//.middleware(['guard'])
    Route.delete('/sk-pengangkatan/:id/destroy', 'MstSkPegawaiController.destroy').as('sk-pengangkatan-destroy')//.middleware(['guard'])
    
}).prefix('master').middleware('auth')

Route.group(() => {

    Route.get('/laporan-urut-kepegawaian', 'RepUrutKepegawaianController.index').as('laporan-urut-kepegawaian')//.middleware(['guard'])
    Route.get('/laporan-urut-kepegawaian/list', 'RepUrutKepegawaianController.list').as('laporan-urut-kepegawaian-list')//.middleware(['guard'])
    
}).prefix('laporan').middleware('auth')

// AJAX
Route.group(() => {
    /** OPTIONS **/
    Route.get('/options', 'AjaxDashboardController.index').as('options')
    Route.get('/options/group', 'AjaxDashboardController.group').as('options-group')
    Route.get('/options/pegawai', 'AjaxDashboardController.pegawai').as('options-pegawai')
    Route.get('/options/pangkat', 'AjaxDashboardController.pangkat').as('options-pangkat')

    Route.get('/toast/naik-gaji', 'AjaxDashboardController.notifNaikGaji').as('toast-naik-gaji')
    Route.get('/toast/naik-pangkat', 'AjaxDashboardController.notifNaikPangkat').as('toast-naik-pangkat')
    
}).prefix('ajax')

// CHART
Route.group(() => {
    /** CHART EDUCATION **/
    Route.get('/pendidikan', 'ChartDashboardController.pendidikan').as('chart-pendidikan')
    Route.get('/golongan', 'ChartDashboardController.golongan').as('chart-golongan')
    
}).prefix('chart')

