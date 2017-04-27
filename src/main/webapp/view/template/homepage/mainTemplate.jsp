<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html ng-app="cart">
<head>
    <title><tiles:getAsString name="title"/></title>
    <link rel="shortcut icon" href="resource/css/images/icon-title.png">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath }/resource/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/owl.carousel.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/responsive.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/main12.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/detail.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/checkoutSuccess.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/profile.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/cart.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resource/admin/assets/data-tables/DT_bootstrap.css" />
    <link href="${pageContext.request.contextPath }/resource/css/checkout.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/submenu_v2.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/rating/style.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resource/css/rating/rating.min.css">
    <link href="${pageContext.request.contextPath}/resource/admin/assets/advanced-datatable/media/css/demo_table.css" rel="stylesheet" />
</head>
<style>
        .modal-dialog {
            width: 600px !important;
            margin: 50px 515px !important;
        }
</style>
<body>
<header>
    <tiles:insertAttribute name="header"></tiles:insertAttribute>
</header>
<%-- <tiles:insertAttribute name="slide"></tiles:insertAttribute> --%>
<tiles:insertAttribute name="body"></tiles:insertAttribute>
<footer style="margin-top: 20px;">
    <tiles:insertAttribute name="footer"></tiles:insertAttribute>
</footer>
</body>
<script src="${pageContext.request.contextPath}/resource/admin/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/jquery-1.8.3.min.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/jquery.elevatezoom.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/respond.min.js" ></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/data-tables/DT_bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0rc1/angular-route.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/common-scripts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resource/js/main.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/customer.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/rating/rating.min.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/rating.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/detailPage.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/cart.js"></script>
<script>
//    jQuery(document).ready(function () {
//        TableCart.init();
//    });
    document.write('<base href="' + document.location + '" />');
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#slider-carousel').find('.item').first().addClass('active');
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#theCarousel').find('.item').first().addClass('active');
    });
</script>
<script>
    $('#imageContainer1').elevateZoom({
    zoomType: "inner",
cursor: "crosshair",
zoomWindowFadeIn: 500,
zoomWindowFadeOut: 750
   }); 
</script>
</html>