$(function(){
    console.log('script/mas-pegawai.js');

    var body = $('body')
    initDefault()

    $('button#apply-filter').on('click', function(e){
        e.preventDefault()
        initDefault()
        $('#filterModal').modal('hide')
    })

    function initDefault(){
        var fil_nip = $('input[name="fil_nip"]').val() || null
        var fil_nama = $('input[name="fil_nama"]').val() || null
        var fil_nomor = $('input[name="fil_nomor"]').val() || null
        var fil_sk_start = $('input[name="fil_sk_start"]').val() || null
        var fil_sk_end = $('input[name="fil_sk_end"]').val() || null

        $.ajax({
            async: true,
            url: 'sk-pengangkatan/list',
            method: 'GET',
            data: {
                fil_nip,
                fil_nama,
                fil_nomor,
                fil_sk_start,
                fil_sk_end
            },
            dataType: 'html',
            contentType: false,
            success: function(result){
                body.find('div#content-list').html(result)
                body.find('h4#title').css('display', 'inline')
                body.find('button#btn-modal').css('display', 'inline')
            },
            error: function(err){
                // console.log(err)
                console.log('error data...')
            }
        })
    }
})