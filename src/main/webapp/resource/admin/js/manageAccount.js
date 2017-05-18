var TableAccount = function () {

    return {

        //main function to initiate the module
        init: function () {
            var oTable = $('#manageAccountTable').dataTable({
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

            $('#manageAccountTable a.delete').live('click', function (e) {
                e.preventDefault();
                var nRow = $(this).parents('tr')[0];
                var aData = oTable.fnGetData(nRow);
                var username = aData[1];
                if (confirm("Are you sure to delete this row  with username : " + username) == false) {
                    return;
                }
                deleteUser(username);
                oTable.fnDeleteRow(nRow);
            });

            function deleteUser(username) {
                $.ajax({
                    type: "GET",
                    url: "/admin/deleteAccount",
                    data: "username=" + username,
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
                console.log(username);
            }
        }
    };
}();
// function getDistrict() {
//     var cityId = $('#city').val();
//     $.ajax({
//         type: 'GET',
//         url: '/admin/getDistrict',
//         data: "cityId=" + cityId,
//         success: function (response) {
//             var select = $('#district');
//             select.find('option').remove();
//             $.each(response, function (index, value) {
//                 $('<option>').val(value).text(value.districtName).appendTo(select);
//             });
//         }
//     });
// }
