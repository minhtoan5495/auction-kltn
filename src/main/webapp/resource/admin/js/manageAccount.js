var TableAccount = function () {

    return {

        //main function to initiate the module
        init: function () {
            function restoreRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);

                for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                    oTable.fnUpdate(aData[i], nRow, i, false);
                }
                oTable.fnDraw();
            }

            function editRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);
                jqTds[9].innerHTML = '<input type="text" class="form-control small" value="' + aData[9] + '">';
                jqTds[10].innerHTML = '<a class="edit" href="">Save</a>';
                jqTds[11].innerHTML = '<a class="cancel" href="">Cancel</a>';
            }

            function saveRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 9, false);
                oTable.fnUpdate('<a class="edit" href="">Edit</a>', nRow, 10, false);
                oTable.fnUpdate('<a class="delete" href="">Delete</a>', nRow, 11, false);
                oTable.fnDraw();
                function editAccount() {
                    $.ajax({
                        type: "GET",
                        url: "/admin/editAccount",
                        data: "username=" + oTable.fnGetData(nRow)[1] +
                        "&role=" + jqInputs[0].value
                    });
                }
                editAccount();
            }

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

            var nEditing = null;

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
                        $('#message').html(response.toString());
                        $('#message').show();
                        setTimeout(function() {
                            $("#message").hide('blind', {}, 500)
                        }, 1000);
                    }
                });
                console.log(username);
            }

            $('#manageAccountTable a.cancel').live('click', function (e) {
                e.preventDefault();
                if ($(this).attr("data-mode") == "new") {
                    var nRow = $(this).parents('tr')[0];
                    oTable.fnDeleteRow(nRow);
                } else {
                    restoreRow(oTable, nEditing);
                    nEditing = null;
                }
            });

            $('#manageAccountTable a.edit').live('click', function (e) {
                e.preventDefault();

                /* Get the row as a parent of the link that was clicked on */
                var nRow = $(this).parents('tr')[0];

                if (nEditing !== null && nEditing != nRow) {
                    /* Currently editing - but not this row - restore the old before continuing to edit mode */
                    restoreRow(oTable, nEditing);
                    editRow(oTable, nRow);
                    nEditing = nRow;
                } else if (nEditing == nRow && this.innerHTML == "Save") {
                    /* Editing this row and want to save it */
                    saveRow(oTable, nEditing);
                    nEditing = null;
                } else {
                    /* No edit in progress - let's start one */
                    editRow(oTable, nRow);
                    nEditing = nRow;
                }
            });
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
