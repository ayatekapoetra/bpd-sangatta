$(function(){
    console.log('script/mas-pegawai.js');

    var body = $('body')
    showItems()

    $('body').on('click', 'button#tambah-pegawai', function(){
        addItems()
    })

    $('body').on('click', 'button#download-pegawai', function(){
        setItems()
    })

    $('body').on('click', 'button.bt-remove-item', function(){
        var id = $(this).data('id')
        removeItems(id)
    })

    $('body').on('click', 'button#btn-back', function(e){
        e.preventDefault()
        window.location.assign('/usulan/pangkat')
    })

    $('body').on('change', 'select[name="pegawai_id"]', function(){
        var elm = $(this)
        var value = $(this).val()
        console.log($(this).parents('td.b-all').find('input[name="nip"]'));
        $.ajax({
            async: true,
            url: '/ajax/options/pegawai?id='+value,
            method: 'GET',
            dataType: 'json',
            contentType: false,
            success: function(res){
                elm.parents('td.b-all').find('input[name="nip"]').attr('readonly', 'readonly').val(res.nip)
                elm.parents('td.b-all').find('input[name="gol_lama"]').attr('readonly', 'readonly').val(res.golongan)
            },
            error: function(err){
                console.log(err)
            },
            complete: function() {
                setUrut()
            }
        })
    })

    $('body').on('submit', 'form#form-update', function(e){
        e.preventDefault()
        var id = $(this).data('id')
        var data = getDataForm()
        var formdata = new FormData()
        formdata.append('data', JSON.stringify(data))
        $.ajax({
            async: true,
            headers: {'x-csrf-token': $('[name=_csrf]').val()},
            url: '/usulan/pangkat/'+id+'/update',
            method: 'POST',
            data: formdata,
            dataType: 'json',
            processData: false,
            mimeType: "multipart/form-data",
            contentType: false,
            success: function(result){
                console.log(result);
                if(result.success){
                    swal('Okey', result.message, 'success')
                    window.location.reload()
                }else{
                    swal('Opps', result.message, 'warning')
                }
            },
            error: function(err){
                console.log(err)
            }
        })
    })

    function removeItems(id){
        body.find('tr[data-urut="'+id+'"]').remove()
        setUrut()
    }

    function addItems(){
        $.ajax({
            async: true,
            url: '/usulan/pangkat/add-items',
            method: 'GET',
            dataType: 'html',
            contentType: false,
            success: function(result){
                body.find('tbody#item-details').append(result)
            },
            error: function(err){
                console.log(err)
            },
            complete: function() {
                setUrut()
            }
        })
    }

    function showItems(){
        var id = body.find('form#form-update').data('id')
        $.ajax({
            async: true,
            url: '/usulan/pangkat/'+id+'/show-items',
            method: 'GET',
            dataType: 'json',
            contentType: false,
            success: function(result){
                body.find('tbody#item-details').html(result.map(v => v))
            },
            error: function(err){
                console.log(err)
            },
            complete: function() {
                setUrut()
                $('input[type="date"].setDate').each(function(){
                    var values = $(this).data('values')
                    $(this).val(moment(values).format('YYYY-MM-DD'))
                })
            }
        })
    }

    function setItems(){
        $.ajax({
            async: true,
            url: '/usulan/pangkat/set-items',
            method: 'GET',
            dataType: 'json',
            contentType: false,
            success: function(result){
                console.log("RES", result);
                body.find('tbody#item-details').html(result.map(v => v))
            },
            error: function(err){
                console.log(err)
            },
            complete: function() {
                setUrut()
            }
        })
    }

    function setUrut(){
        $('body').find('tr.item-rows').each(function(i, e){
            var urut = i + 1
            $(this).attr('data-urut', urut)
            $(this).find('td').first().find('h3.urut-rows').html(urut)
        })

        $('button.bt-remove-item').each(function(i, e){
            var urut = i + 1
            $(this).attr('data-id', urut)
        })
    }

    function getDataForm(){
        let keys = []
        let values = []
        $('select.item-data, input.item-data').each(function(){
            var property = $(this).attr('name')
            var val = $(this).val()
            keys.push(property)
            values.push(val)
        })
        
        // itemData()

        function itemData(){
            let items = []
            $('tr.item-rows').each(function(){
                var elm = $(this)

                var props = []
                var vals = []
                elm.find('select.items-details, input.items-details').each(function(){
                    props.push($(this).attr('name'))
                    vals.push($(this).val())
                })

                items.push(_.object(props, vals))
            })
            return items
        }

        var data = _.object(keys, values)

        return {
            ...data,
            items: itemData()
        }
    }
    
})