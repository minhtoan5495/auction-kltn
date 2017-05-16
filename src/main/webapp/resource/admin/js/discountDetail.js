/**
 * Created by toannguyen on 16/05/2017.
 */
var TableDiscountDetail = function () {
    return {
        //main function to initiate the module
        init: function () {
            var oTable = $('#discountDetailTable').dataTable({
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

            jQuery('#editable-sample_wrapper .dataTables_filter input').addClass("form-control medium"); // modify table search input
            jQuery('#editable-sample_wrapper .dataTables_length select').addClass("form-control xsmall"); // modify table per page dropdown


            $('#discountDetailTable a.delete').live('click', function (e) {
                e.preventDefault();
                var nRow = $(this).parents('tr')[0];
                var aData = oTable.fnGetData(nRow);
                var productId = aData[1];
                var discountId = aData[0];
                if (confirm("Are you sure to delete this row  with productId : " + productId) == false) {
                    return;
                }
                deleteProductInDiscount(productId, discountId);
                oTable.fnDeleteRow(nRow);
            });

            function deleteProductInDiscount(productId, discountId) {
                $.ajax({
                    type: "GET",
                    url: "/admin/deleteProductInDiscount",
                    data: "productId=" + productId +
                        "&discountId=" + discountId,
                });
            }
        }
    };
}();