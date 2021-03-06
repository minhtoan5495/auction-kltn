var TableAuction = function () {

    return {

        init: function () {
            function restoreRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);

                for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                    oTable.fnUpdate(aData[i], nRow, i, false);
                }

                oTable.fnDraw();
            }

            var oTable = $('#manageAuctionTable').dataTable({
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


            $('#manageAuctionTable a.cancel').live('click', function (e) {
                e.preventDefault();
                if ($(this).attr("data-mode") == "new") {
                    var nRow = $(this).parents('tr')[0];
                    oTable.fnDeleteRow(nRow);
                } else {
                    restoreRow(oTable, nEditing);
                    nEditing = null;
                }
            });
            $('#manageAuctionTable a.delete').live('click', function (e) {
                e.preventDefault();
                var nRow = $(this).parents('tr')[0];
                var aData = oTable.fnGetData(nRow);
                var auctionId = aData[0];
                if (confirm("Are you sure to delete this row  with auctionId : " + auctionId) == false) {
                    return;
                }
                deleteAuction(auctionId);
                oTable.fnDeleteRow(nRow);
            });

            function deleteAuction(auctionId) {
                $.ajax({
                    type: "GET",
                    url: "/admin/deleteAuction",
                    data: "auctionId=" + auctionId,
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
                console.log(auctionId);
            }
        }
    };
}();