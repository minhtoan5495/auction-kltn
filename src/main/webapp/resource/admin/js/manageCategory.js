var TableCategory = function () {

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

            var oTable = $('#manageCategoryTable').dataTable({
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


            $('#manageCategoryTable a.cancel').live('click', function (e) {
                e.preventDefault();
                if ($(this).attr("data-mode") == "new") {
                    var nRow = $(this).parents('tr')[0];
                    oTable.fnDeleteRow(nRow);
                } else {
                    restoreRow(oTable, nEditing);
                    nEditing = null;
                }
            });
            $('#manageCategoryTable a.delete').live('click', function (e) {
                e.preventDefault();
                var nRow = $(this).parents('tr')[0];
                var aData = oTable.fnGetData(nRow);
                var categoryId = aData[0];
                if (confirm("Are you sure to delete this row  with categoryId : " + categoryId) == false) {
                    return;
                }
                deleteCategory(categoryId);
                oTable.fnDeleteRow(nRow);
            });

            function deleteCategory(categoryId) {
                $.ajax({
                    type: "GET",
                    url: "/admin/deleteCategory",
                    data: "categoryId=" + categoryId,
                });
                console.log(categoryId);
            }

            // $('#manageCategoryTable a.edit').live('click', function (e) {
            //     e.preventDefault();
            //
            //     /* Get the row as a parent of the link that was clicked on */
            //     var nRow = $(this).parents('tr')[0];
            //
            //     if (nEditing !== null && nEditing != nRow) {
            //         /* Currently editing - but not this row - restore the old before continuing to edit mode */
            //         restoreRow(oTable, nEditing);
            //         editRow(oTable, nRow);
            //         nEditing = nRow;
            //     } else if (nEditing == nRow && this.innerHTML == "Save") {
            //         /* Editing this row and want to save it */
            //         saveRow(oTable, nEditing);
            //         nEditing = null;
            //     } else {
            //         /* No edit in progress - let's start one */
            //         editRow(oTable, nRow);
            //         nEditing = nRow;
            //     }
            // });
        }
    };
}();