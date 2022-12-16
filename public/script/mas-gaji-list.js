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

        $.ajax({
            async: true,
            url: 'gaji/list',
            method: 'GET',
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