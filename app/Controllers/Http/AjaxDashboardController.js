'use strict'

const Options = use("App/Models/SysOption")


class AjaxDashboardController {
    async index ({ request }) {
        const options = (
            await Options.query()
            .where('status', 'Y')
            .orderBy([
                {column: 'group', order: 'asc'},
                {column: 'urut', order: 'asc'}
            ])
            .fetch()
        ).toJSON()
        return options
    }

    async group ({ request }) {
        const req = request.all()
        let options = (
            await Options.query()
            .where( w => {
                w.where('status', 'Y')
                w.where('group', req.group)
            })
            .orderBy([
                {column: 'urut', order: 'asc'},
                {column: 'teks', order: 'asc'}
            ])
            .fetch()
        ).toJSON()

        if(req.selected){
            options = options.map( v => v.nilai == req.selected ? {...v, selected: 'selected'}:{...v, selected: ''})
        }

        return options
    }
}

module.exports = AjaxDashboardController
