function fnFormatDetails ( oTable, nTr )
{
    var aData = oTable.fnGetData( nTr );
    var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
    sOut += '<tr><td>Description :</td><td>'+aData[10]+'</td></tr>';
    sOut += '<tr><td>Stock Quantity :</td><td>'+aData[11]+'</td></tr>';
    sOut += '<tr><td>View number :</td><td>'+aData[12]+'</td></tr>';
    sOut += '<tr><td>Rating number :</td><td>'+aData[13]+'</td></tr>';
    sOut += '</table>';

    return sOut;
}

$(document).ready(function() {
    /*
     * Insert a 'details' column to the table
     */
    var nCloneTh = document.createElement( 'th' );
    var nCloneTd = document.createElement( 'td' );
    nCloneTd.innerHTML = '<img src="/resource/admin/assets/advanced-datatable/details_open.png">';
    nCloneTd.className = "center";

    $('#manageProductTable thead tr').each( function () {
        this.insertBefore( nCloneTh, this.childNodes[0] );
    } );

    $('#manageProductTable tbody tr').each( function () {
        this.insertBefore(  nCloneTd.cloneNode( true ), this.childNodes[0] );
    } );

    /*
     * Initialse DataTables, with no sorting on the 'details' column
     */
    var oTable = $('#manageProductTable').dataTable( {
        "aLengthMenu": [
            [10, 15, 20, -1],
            [10, 15, 20, "All"] // change per page values here
        ],
        // set the initial value
        "iDisplayLength": 10,
        "sDom": "<'row'<'col-lg-6'l><'col-lg-6'f>r>t<'row'<'col-lg-6'i><'col-lg-6'p>>",
        "sPaginationType": "bootstrap",
        "oLanguage": {
            "sLengthMenu": "_MENU_ records per page",
            "oPaginate": {
                "sPrevious": "Prev",
                "sNext": "Next"
            }
        },
        "aoColumnDefs": [{
            'bSortable': false,
            'aTargets': [0]
        }
        ]
    });

    /* Add event listener for opening and closing details
     * Note that the indicator for showing which row is open is not controlled by DataTables,
     * rather it is done here
     */
    $('#manageProductTable tbody td img').live('click', function () {
        var nTr = $(this).parents('tr')[0];
        if ( oTable.fnIsOpen(nTr) )
        {
            /* This row is already open - close it */
            this.src = "/resource/admin/assets/advanced-datatable/details_open.png";
            oTable.fnClose( nTr );
        }
        else
        {
            /* Open this row */
            this.src = "/resource/admin/assets/advanced-datatable/details_close.png";
            oTable.fnOpen( nTr, fnFormatDetails(oTable, nTr), 'details' );
        }
    } );
    $('#manageProductTable a.delete').live('click', function (e) {
        e.preventDefault();
        var nRow = $(this).parents('tr')[0];
        var aData = oTable.fnGetData(nRow);
        var productId = aData[1];
        if (confirm("Are you sure to delete this row  with productId : " + productId) == false) {
            return;
        }
        deleteUser(productId);
        oTable.fnDeleteRow(nRow);
    });
    function deleteUser(productId) {
        $.ajax({
            type: "GET",
            url: "/admin/deleteProduct",
            data: "productId=" + productId,
            success : function (response) {
                $('#messageDelete').html(response.toString());
                $('#messageDelete').addClass("alert alert-success");
                $('#messageDelete').show();
                setTimeout(function() {
                    $("#messageDelete").removeClass("alert alert-success"),
                        $("#messageDelete").empty()
                }, 3000);
            }
        });
        console.log(productId);
    }
} );

function getCategoryByParent() {
    var parentId = $('#parent').val();
    $.ajax({
        type: 'GET',
        url: '/admin/getCategoryByParent',
        data: "parentId=" + parentId,
        success: function (response) {
            var select = $('#category');
            select.find('option').remove();
            $.each(response, function (index, value) {
                $('<option>').val(value.categoryId).text(value.categoryName).appendTo(select);
            });
        }
    });
}