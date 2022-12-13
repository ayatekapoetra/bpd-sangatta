$(function(){
    console.log('ajax/option.js');
    $('select.selectOptions').each(function(){
        var elm = $(this)
        var selected = $(this).data('values')
        var group = $(this).data('group')
        $.ajax({
            async: true,
            url: '/ajax/options/group',
            method: 'GET',
            data:{
                selected, group
            },
            dataType: 'json',
            success: function(result){
                // console.log(result);
                elm.html(result.map( v => '<option value="'+v.nilai+'" '+v.selected+'>'+v.teks+'</option>'))
            },
            error: function(err){
                console.log(err)
            }
        })
    })
})