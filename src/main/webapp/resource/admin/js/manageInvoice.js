var TableInvoice = function () {

    return {

        //main function to initiate the module
        init: function () {
            var oTable = $('#manageInvoiceTable').dataTable({
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

            var nEditing = null;


            $('#manageInvoiceTable a.delete').live('click', function (e) {
                e.preventDefault();
                var nRow = $(this).parents('tr')[0];
                var aData = oTable.fnGetData(nRow);
                var invoiceId = aData[0];
                if (confirm("Are you sure to delete this row  with invoiceId : " + invoiceId) == false) {
                    return;
                }
                deleteInvoice(invoiceId);
                oTable.fnDeleteRow(nRow);
            });

            function deleteInvoice(invoiceId) {
                $.ajax({
                    type: "GET",
                    url: "/admin/deleteInvoice",
                    data: "invoiceId=" + invoiceId,
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
                console.log(invoiceId);
            }
        }
    };
}();