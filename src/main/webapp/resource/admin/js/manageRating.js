/**
 * Created by toannguyen on 28/04/2017.
 */
var TableRating = function () {

    return {

        //main function to initiate the module
        init: function () {
            var oTable = $('#manageRatingTable').dataTable({
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

            $('#manageRatingTable a.delete').live('click', function (e) {
                e.preventDefault();
                var nRow = $(this).parents('tr')[0];
                var aData = oTable.fnGetData(nRow);
                var ratingId = aData[0];
                if (confirm("Are you sure to delete this row  with rating Id : " + ratingId) == false) {
                    return;
                }
                deleteRating(ratingId);
                oTable.fnDeleteRow(nRow);
            });

            function deleteRating(ratingId) {
                $.ajax({
                    type: "GET",
                    url: "/admin/deleteRating",
                    data: "ratingId=" + ratingId,
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
                console.log(ratingId);
            }
        }
    };
}();
