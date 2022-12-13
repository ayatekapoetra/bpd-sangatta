$(function(){

    moment.locale('ID')

    $('.formatDateList').each(function(){
        var values = $(this).data('values') || new Date()
        var format = $(this).data('format') || 'DD MMMM YYYY'
        var elm = $(this).data('element')
        if(elm){
            $(this).find(elm).html(moment(values).format(format))
        }else{
            $(this).html(moment(values).format(format))
        }
    })

    $('input[type="date"].setDate').each(function(){
        var values = $(this).data('values')
        $(this).val(moment(values).format('YYYY-MM-DD'))
    })
})