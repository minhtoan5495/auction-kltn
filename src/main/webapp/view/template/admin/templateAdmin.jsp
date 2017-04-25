<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
    <title>Editable Table</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/resource/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/admin/css/bootstrap-reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/admin/assets/font-awesome/css/font-awesome.css"
          rel="stylesheet"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resource/admin/assets/data-tables/DT_bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-timepicker/compiled/timepicker.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-colorpicker/css/colorpicker.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-daterangepicker/daterangepicker-bs3.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datetimepicker/css/datetimepicker.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/admin/assets/jquery-multi-select/css/multi-select.css" />
    <link href="${pageContext.request.contextPath}/resource/admin/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/admin/css/style-responsive.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resource/admin/assets/advanced-datatable/media/css/demo_page.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resource/admin/assets/advanced-datatable/media/css/demo_table.css" rel="stylesheet" />

</head>

<body>
<section id="container" class="">
    <tiles:insertAttribute name="header"></tiles:insertAttribute>
    <tiles:insertAttribute name="menu"></tiles:insertAttribute>
    <tiles:insertAttribute name="body"></tiles:insertAttribute>
    <tiles:insertAttribute name="footer"></tiles:insertAttribute>
</section>
</body>

<script src="${pageContext.request.contextPath}/resource/admin/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/jquery-1.8.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/jquery.nicescroll.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/admin/js/jquery.validate.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/data-tables/DT_bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/respond.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/admin/assets/jquery-multi-select/js/jquery.multi-select.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/admin/assets/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/js/advanced-form-components.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/common-scripts.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/manageAccount.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/manageProduct.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/form-validation-script.js"></script>
<script>
    jQuery(document).ready(function () {
        TableAccount.init();
    });
</script>
<script type="text/javascript">
    function preview_image()
    {
        var total_file=document.getElementById("upload_file").files.length;
        for(var i=0;i<total_file;i++)
        {
            $('#image_preview').append("<img style='width:50px;height:50px; display: inline-block;' src='"+URL.createObjectURL(event.target.files[i])+"'><br>");
        }
    }
    /* Formating function for row details */
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
        nCloneTd.innerHTML = '<img src="${pageContext.request.contextPath}/resource/admin/assets/advanced-datatable/details_open.png">';
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
                this.src = "${pageContext.request.contextPath}/resource/admin/assets/advanced-datatable/details_open.png";
                oTable.fnClose( nTr );
            }
            else
            {
                /* Open this row */
                this.src = "${pageContext.request.contextPath}/resource/admin/assets/advanced-datatable/details_close.png";
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
</script>
</html>