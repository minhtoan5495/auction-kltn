<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
    <title><tiles:getAsString name="title"/></title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resource/css/images/icon-title.png">
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/resource/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/admin/css/bootstrap-reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/admin/assets/font-awesome/css/font-awesome.css"
          rel="stylesheet"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-fileupload/bootstrap-fileupload.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resource/admin/assets/data-tables/DT_bootstrap.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datepicker/css/datepicker.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datetimepicker/css/datetimepicker.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resource/admin/assets/jquery-multi-select/css/multi-select.css"/>
    <link href="${pageContext.request.contextPath}/resource/admin/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/admin/css/style-responsive.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resource/admin/assets/advanced-datatable/media/css/demo_page.css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resource/admin/assets/advanced-datatable/media/css/demo_table.css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/resource/admin/css/mainAdmin.css" rel="stylesheet"/>
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
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/js/jquery.validate.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/data-tables/DT_bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0rc1/angular-route.min.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/angular-base64.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/2.4.1/lodash.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/respond.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-fileupload/bootstrap-fileupload.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/jquery-multi-select/js/jquery.multi-select.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/jquery-multi-select/js/jquery.quicksearch.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/js/advanced-form-components.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/common-scripts.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/addDiscount.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/addAuction.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/manageAccount.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/manageDiscount.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/manageProduct.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/manageSupplier.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/manageInvoice.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/manageCategory.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/manageAuction.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/manageParent.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/discountDetail.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/form-validation-script.js"></script>
<script>
    jQuery(document).ready(function () {
        TableDiscountDetail.init();
    });
    jQuery(document).ready(function () {
        TableAccount.init();
    });
    jQuery(document).ready(function () {
        TableCategory.init();
    });
    jQuery(document).ready(function () {
        TableInvoice.init();
    });
    jQuery(document).ready(function () {
        TableAuction.init();
    });
    jQuery(document).ready(function () {
        TableSupplier.init();
    });
    jQuery(document).ready(function () {
        TableParent.init();
    });
    jQuery(document).ready(function () {
        TableDiscount.init();
    });
</script>
</html>