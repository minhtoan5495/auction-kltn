var TableDiscount = function () {
    return {
        //main function to initiate the module
        init: function () {
            var oTable = $('#manageDiscountTable').dataTable({
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


            $('#manageDiscountTable a.delete').live('click', function (e) {
                e.preventDefault();
                var nRow = $(this).parents('tr')[0];
                var aData = oTable.fnGetData(nRow);
                var discountId = aData[0];
                if (confirm("Are you sure to delete this row  with discountId : " + discountId) == false) {
                    return;
                }
                deleteDiscount(discountId);
                oTable.fnDeleteRow(nRow);
            });

            function deleteDiscount(discountId) {
                $.ajax({
                    type: "GET",
                    url: "/admin/deleteDiscount",
                    data: "discountId=" + discountId,
                    success : function (response) {
                        $('#message').html(response);
                        $('#message').show();
                        setTimeout(function() {
                            $("#message").hide('blind', {}, 500)
                        }, 1000);
                    }
                });
                console.log(discountId);
            }
        }
    };
}();