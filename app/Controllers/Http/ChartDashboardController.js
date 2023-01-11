'use strict'

const _ = require('underscore')
const MasPegawai = use("App/Models/MasPegawai")


class ChartDashboardController {
    async pendidikan ({ request }) {
        const pegawai = (
            await MasPegawai.query()
            .where('aktif', 'Y')
            .fetch()
        ).toJSON()

        let data = _.groupBy(pegawai, 'pendidikan')
        data = Object.keys(data).map(key => ({name: key, value: data[key].length}))
        let result = []
        for (const obj of data) {
            result.push([obj.name, obj.value])
        }
        return result
    }

    async golongan ( {request} ) {
        let data = []
        const pegawai = (
            await MasPegawai
            .query()
            .where( w => {
                w.where('aktif', 'Y')
                w.where('type', 'PNS')
            }).orderBy('golongan', 'desc').fetch()
        ).toJSON()

        data = _.groupBy(pegawai.map( v => ({golongan: v.golongan, nama: v.nama_pegawai})), 'golongan')
        data = Object.keys(data).map(key => {
            return {
                gol: key,
                jumlah: data[key].length
            }
        })
        let xAxis = data.map( v => v.gol)
        data = data.map( v => [v.gol, v.jumlah])
        console.log(data);

        return {
            xAxis: xAxis,
            data: data
        }
    }
}

module.exports = ChartDashboardController
