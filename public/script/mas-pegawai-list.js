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
        var fil_jenkel = $('select[name="fil_jenkel"]').val() || null
        var fil_golongan = $('select[name="fil_golongan"]').val() || null
        var fil_essalon = $('select[name="fil_essalon"]').val() || null
        var fil_pendidikan = $('select[name="fil_pendidikan"]').val() || null
        var fil_jurusan = $('input[name="fil_jurusan"]').val() || null
        var fil_tmt_start = $('input[name="fil_tmt_start"]').val() || null
        var fil_tmt_end = $('input[name="fil_tmt_end"]').val() || null

        $.ajax({
            async: true,
            url: 'pegawai/list',
            method: 'GET',
            data: {
                fil_nip,
                fil_nama,
                fil_jenkel,
                fil_golongan,
                fil_essalon,
                fil_pendidikan,
                fil_jurusan,
                fil_tmt_start,
                fil_tmt_end
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