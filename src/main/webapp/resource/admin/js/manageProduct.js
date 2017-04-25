// /**
//  * Created by toannguyen on 25/04/2017.
//  */
// var TableProduct = function () {
//     return {
//         //main function to initiate the module
//         init: function () {
//
//             var oTable = $('#manageProductTable').dataTable({
//                 "aoColumnDefs": [
//                     { "bSortable": false, "aTargets": [ 0 ] }
//                 ],
//                 "aaSorting": [[1, 'asc']]
//             });
//
//             $('#manageProductTable a.delete').live('click', function (e) {
//                 e.preventDefault();
//                 var nRow = $(this).parents('tr')[0];
//                 var aData = oTable.fnGetData(nRow);
//                 var productId = aData[0];
//                 if (confirm("Are you sure to delete this row  with username : " + productId) == false) {
//                     return;
//                 }
//                 deleteUser(productId);
//                 oTable.fnDeleteRow(nRow);
//             });
//
//             function deleteUser(productId) {
//                 $.ajax({
//                     type: "GET",
//                     url: "/admin/deleteProduct",
//                     data: "productId=" + productId,
//                 });
//                 console.log(productId);
//             }
//         }
//     };
// }();