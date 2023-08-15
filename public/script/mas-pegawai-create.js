$(function(){
    console.log('script/mas-pegawai-create.js');

    $('form#form-create').on('submit', function(e){
        e.preventDefault()
        var data = new FormData(this)
        $.ajax({
            async: true,
            url: '/master/pegawai',
            method: 'POST',
            data: data,
            dataType: 'json',
            processData: false,
            mimeType: "multipart/form-data",
            contentType: false,
            success: function(result){
                console.log(result);
                if(result.success){
                    swal({title: "okey", text: result.message, type: "success"}, confirm => window.location.assign('/master/pegawai'))
                }else{
                    swal('Opps', result.message, 'warning')
                }
            },
            error: function(err){
                console.log(err)
            }
        })
    })

    $('body').on('click', 'button#btn-back', function(e){
        e.preventDefault()
        window.location.assign('/master/pegawai')
    })
})
