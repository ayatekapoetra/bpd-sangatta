$(function(){

    moment.locale('ID')

    $('.formatDateList').each(function(){
        var values = $(this).data('values')
        var format = $(this).data('format') || 'DD MMMM YYYY'
        var elm = $(this).data('element')
        if(values){
            if(elm){
                $(this).find(elm).html(moment(new Date(values)).format(format))
            }else{
                $(this).html(moment(new Date(values)).format(format))
            }
        }
    })

    $('input[type="date"].setDate').each(function(){
        var values = $(this).data('values')
        $(this).val(moment(new Date(values)).format('YYYY-MM-DD'))
    })
})