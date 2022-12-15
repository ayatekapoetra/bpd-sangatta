'use strict'

const _ = require('underscore')
const MasPegawai = use("App/Models/MasPegawai")


class ChartDashboardController {
    async index ({ request }) {
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
}

module.exports = ChartDashboardController
