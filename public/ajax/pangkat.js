$(function(){
    console.log('ajax/pegawai.js');
    $('select[id="pangkat_id"]').each(function(){
        var elm = $(this)
        var selected = $(this).data('values')
        $.ajax({
            async: true,
            url: '/ajax/options/pangkat',
            method: 'GET',
            data:{
                selected, selected
            },
            dataType: 'json',
            success: function(result){
                elm.html(result.map( v => '<option value="'+v.pangkat+'" '+v.selected+'>'+v.pangkat+'</option>'))
            },
            error: function(err){
                console.log(err)
            }
        })
    })
})