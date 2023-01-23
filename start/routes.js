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
    Route.get('/', 'MutasiResignController.index').as('mutasi-resign')//.middleware(['guard'])
    Route.post('/', 'MutasiResignController.store').as('mutasi-resign.store')//.middleware(['guard'])
    Route.get('/list', 'MutasiResignController.list').as('mutasi-resign.list')//.middleware(['guard'])
    Route.get('/create', 'MutasiResignController.create').as('mutasi-resign.create')//.middleware(['guard'])
    Route.get('/:id/show', 'MutasiResignController.show').as('mutasi-resign.show')//.middleware(['guard'])
    Route.post('/:id/update', 'MutasiResignController.update').as('mutasi-resign.update')//.middleware(['guard'])

}).prefix('mutasi-resign').middleware('auth')

Route.group(() => {
    /** MASTER PEGAWAI **/
    Route.get('/pegawai', 'MstPegawaiController.index').as('pegawai')//.middleware(['guard'])
    Route.post('/pegawai', 'MstPegawaiController.store').as('pegawai-store')//.middleware(['guard'])
    Route.get('/pegawai/list', 'MstPegawaiController.list').as('pegawai-list')//.middleware(['guard'])
    Route.get('/pegawai/create', 'MstPegawaiController.create').as('pegawai-create')//.middleware(['guard'])
    Route.get('/pegawai/:id/show', 'MstPegawaiController.show').as('pegawai-show')//.middleware(['guard'])
    Route.post('/pegawai/:id/update', 'MstPegawaiController.update').as('pegawai-update')//.middleware(['guard'])
    Route.get('/pegawai/:id/destroy', 'MstPegawaiController.delete').as('pegawai-delete')//.middleware(['guard'])
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

    Route.get('/pangkat', 'UsulanPangkatController.index').as('usulan-pangkat')//.middleware(['guard'])
    Route.post('/pangkat', 'UsulanPangkatController.store').as('usulan-pangkat-store')//.middleware(['guard'])
    Route.get('/pangkat/list', 'UsulanPangkatController.list').as('usulan-pangkat-list')//.middleware(['guard'])
    Route.get('/pangkat/create', 'UsulanPangkatController.create').as('usulan-pangkat-create')//.middleware(['guard'])
    Route.get('/pangkat/add-items', 'UsulanPangkatController.addItems').as('usulan-pangkat-add-items')//.middleware(['guard'])
    Route.get('/pangkat/set-items', 'UsulanPangkatController.setItems').as('usulan-pangkat-set-items')//.middleware(['guard'])
    Route.get('/pangkat/:id/print', 'UsulanPangkatController.print').as('usulan-pangkat-print')//.middleware(['guard'])
    Route.get('/pangkat/:id/show', 'UsulanPangkatController.show').as('usulan-pangkat-show')//.middleware(['guard'])
    Route.post('/pangkat/:id/update', 'UsulanPangkatController.update').as('usulan-pangkat-update')//.middleware(['guard'])
    Route.get('/pangkat/:id/show-items', 'UsulanPangkatController.showItems').as('usulan-pangkat-show-items')//.middleware(['guard'])

    Route.get('/gaji-berkala', 'UsulanGajiBerkalaController.index').as('usulan-gaji-berkala')//.middleware(['guard'])
    Route.post('/gaji-berkala', 'UsulanGajiBerkalaController.store').as('usulan-gaji-berkala-store')//.middleware(['guard'])
    Route.get('/gaji-berkala/list', 'UsulanGajiBerkalaController.list').as('usulan-gaji-berkala-list')//.middleware(['guard'])
    Route.get('/gaji-berkala/create', 'UsulanGajiBerkalaController.create').as('usulan-gaji-berkala-create')//.middleware(['guard'])
    Route.get('/gaji-berkala/add-items', 'UsulanGajiBerkalaController.addItems').as('usulan-gaji-berkala-add-items')//.middleware(['guard'])
    Route.get('/gaji-berkala/set-items', 'UsulanGajiBerkalaController.setItems').as('usulan-gaji-berkala-set-items')//.middleware(['guard'])
    Route.get('/gaji-berkala/:id/print', 'UsulanGajiBerkalaController.print').as('usulan-gaji-berkala-print')//.middleware(['guard'])
    Route.get('/gaji-berkala/:id/show', 'UsulanGajiBerkalaController.show').as('usulan-gaji-berkala-show')//.middleware(['guard'])
    Route.post('/gaji-berkala/:id/update', 'UsulanGajiBerkalaController.update').as('usulan-gaji-berkala-update')//.middleware(['guard'])
    Route.get('/gaji-berkala/:id/show-items', 'UsulanGajiBerkalaController.showItems').as('usulan-gaji-berkala-show-items')//.middleware(['guard'])
    
}).prefix('usulan').middleware('auth')

Route.group(() => {

    Route.get('/laporan-urut-kepegawaian', 'RepUrutKepegawaianController.index').as('laporan-urut-kepegawaian')//.middleware(['guard'])
    Route.get('/laporan-urut-kepegawaian/list', 'RepUrutKepegawaianController.list').as('laporan-urut-kepegawaian-list')//.middleware(['guard'])
    Route.get('/laporan-urut-kepegawaian/print', 'RepUrutKepegawaianController.print').as('laporan-urut-kepegawaian-print')//.middleware(['guard'])
    
    Route.get('/laporan-mutasi-resign', 'RepMutasiResignController.index').as('laporan-mutasi-resign')//.middleware(['guard'])
    Route.get('/laporan-mutasi-resign/list', 'RepMutasiResignController.list').as('laporan-mutasi-resign-list')//.middleware(['guard'])
    Route.get('/laporan-mutasi-resign/print', 'RepMutasiResignController.print').as('laporan-mutasi-resign-print')//.middleware(['guard'])
    
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

