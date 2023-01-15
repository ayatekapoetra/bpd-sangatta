$(function(){
    console.log('script/usulan-pangkat-list.js');

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
            url: '/usulan/pangkat/'+id+'/print',
            method: 'GET',
            dataType: 'json',
            contentType: false,
            success: function(result){
                // pdfMake.fonts = {
                //     timesRoman: {
                //       normal: 'href="//db.onlinewebfonts.com/c/32441506567156636049eb850b53f02a?family=Times+New+Roman',
                //       bold: 'https://fonts.cdnfonts.com/css/roman-new-times'
                //     },
                // }
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
            url: '/usulan/pangkat/list',
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