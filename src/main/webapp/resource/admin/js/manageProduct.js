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
        "aoColumnDefs": [
            { "bSortable": false, "aTargets": [ 0 ] }
        ],
        "aaSorting": [[1, 'asc']]
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
        });
        console.log(productId);
    }
} );