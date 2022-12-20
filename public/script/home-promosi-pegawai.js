$(function(){
    console.log('script/home-promosi-pegawai.js');

    $('form#form-create').on('submit', function(e){
        e.preventDefault()
        var data = new FormData(this)
        $.ajax({
            async: true,
            headers: {'X-XSRF-TOKEN': $('[name=_csrf]').val()},
            url: '/pegawai/promosi',
            method: 'POST',
            data: data,
            dataType: 'json',
            processData: false,
            mimeType: "multipart/form-data",
            contentType: false,
            success: function(result){
                console.log(result);
                if(result.success){
                    swal('Okey', result.message, 'success')
                    window.location.assign('/')
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
        window.location.assign('/')
    })
})
