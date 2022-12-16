$(function(){
    console.log('ajax/pegawai.js');
    $('select[name="pegawai_id"]').each(function(){
        var elm = $(this)
        var selected = $(this).data('values')
        $.ajax({
            async: true,
            url: '/ajax/options/pegawai',
            method: 'GET',
            data:{
                selected, selected
            },
            dataType: 'json',
            success: function(result){
                elm.html(result.map( v => '<option value="'+v.id+'" '+v.selected+'>'+v.nama_pegawai+'</option>'))
            },
            error: function(err){
                console.log(err)
            }
        })
    })
})