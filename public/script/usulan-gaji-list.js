$(function(){
    console.log('script/usulan-gaji-list.js');

    var body = $('body')
    initDefault()

    $('button#apply-filter').on('click', function(e){
        e.preventDefault()
        initDefault()
        $('#filterModal').modal('hide')
    })

    $('body').on('click', 'button.btn-print', function(e){
        e.preventDefault()
        var id = $(this).data('id')
        $.ajax({
            async: true,
            url: '/usulan/gaji-berkala/'+id+'/print',
            method: 'GET',
            dataType: 'json',
            contentType: false,
            success: function(result){
                pdfMake.createPdf(result).print();
            },
            error: function(err){
                // console.log(err)
                console.log('error data...')
            }
        })
    })

    function initDefault(){

        $.ajax({
            async: true,
            url: '/usulan/gaji-berkala/list',
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