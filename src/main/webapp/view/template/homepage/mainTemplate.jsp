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
    <link rel="shortcut icon" href="resource/css/images/icon-title.png">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link
            href="${pageContext.request.contextPath }/resource/css/bootstrap.min.css"
            rel="stylesheet">
    <link
            href="${pageContext.request.contextPath }/resource/css/font-awesome.min.css"
            rel="stylesheet">
    <link
            href="${pageContext.request.contextPath }/resource/css/owl.carousel.css"
            rel="stylesheet">
    <link
            href="${pageContext.request.contextPath }/resource/css/responsive.css"
            rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/main12.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/detail.css"
          rel="stylesheet">
    <link
            href="${pageContext.request.contextPath }/resource/css/checkoutSuccess.css"
            rel="stylesheet">
    <link
            href="${pageContext.request.contextPath }/resource/css/profile.css"
            rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/cart.css"
          rel="stylesheet">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/resource/admin/assets/data-tables/DT_bootstrap.css"/>
    <link
            href="${pageContext.request.contextPath }/resource/css/checkout.css"
            rel="stylesheet">
    <link
            href="${pageContext.request.contextPath }/resource/css/submenu_v2.css"
            rel="stylesheet">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/resource/css/rating/style.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/resource/css/rating/rating.min.css">
    <link
            href="${pageContext.request.contextPath}/resource/admin/assets/advanced-datatable/media/css/demo_table.css"
            rel="stylesheet"/>
    <link
            href="${pageContext.request.contextPath }/resource/css/contact.css"
            rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/about.css"
          rel="stylesheet">
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/resource/css/simplegallery.demo1.min.css"
          rel="stylesheet">
</head>
<body style="font-family:Oxygen,Helvetica,sans-serif;">
<header>
    <tiles:insertAttribute name="header"></tiles:insertAttribute>
</header>
<%-- <tiles:insertAttribute name="slide"></tiles:insertAttribute> --%>
<tiles:insertAttribute name="body"></tiles:insertAttribute>
<div class="scoll-item pull-right">
    <a href="#" class="back-to-top">
        <img class="img-scroll-item" src="${pageContext.request.contextPath }/resource/images/logo/scroll.png">
    </a>
</div>
<footer style="margin-top: 20px;">
    <tiles:insertAttribute name="footer"></tiles:insertAttribute>
</footer>
</body>
<script
        src="${pageContext.request.contextPath}/resource/admin/js/jquery.js"></script>
<script
        src="${pageContext.request.contextPath }/resource/js/jquery-1.8.3.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resource/js/jquery.elevatezoom.js"></script>
<script
        src="${pageContext.request.contextPath }/resource/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/js/jquery.dcjqaccordion.2.7.js"></script>
<script
        src="${pageContext.request.contextPath}/resource/admin/js/jquery.scrollTo.min.js"></script>
<script
        src="${pageContext.request.contextPath}/resource/admin/js/jquery.nicescroll.js"
        type="text/javascript"></script>
<script
        src="${pageContext.request.contextPath}/resource/admin/js/respond.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/data-tables/DT_bootstrap.js"></script>
<script
        src="${pageContext.request.contextPath }/resource/js/angular.min.js"></script>
<script
        src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0rc1/angular-route.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resource/js/angular-base64.js"></script>
<script
        src="${pageContext.request.contextPath}/resource/admin/js/common-scripts.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/resource/js/main.js"></script>
<script
        src="${pageContext.request.contextPath }/resource/js/customer.js"></script>
<script
        src="${pageContext.request.contextPath }/resource/js/rating/rating.min.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/rating.js"></script>
<script
        src="${pageContext.request.contextPath }/resource/js/detailPage.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/cart.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/simplegallery.min.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/jquery.flexslider-min.js"></script>
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
<script type="text/javascript">
    $(document).ready(function () {
        $('#thumbs').find('.item').first().addClass('active');
    });
</script>
<script>
    jQuery(document).ready(function ($) {
        $('#example3').etalage({
            thumb_image_width: 250,
            thumb_image_height: 250,
            source_image_width: 900,
            source_image_height: 900,
            zoom_area_width: 500,
            zoom_area_height: 500,
            zoom_area_distance: 5,
            small_thumbs: 4,
            smallthumb_inactive_opacity: 0.3,
            smallthumbs_position: 'left',
            show_icon: false,
            autoplay: false,
            keyboard: false,
            zoom_easing: false
        });
    });
</script>
<script>$(window).on('load', function () {

    $('.carousel').each(function () {

        $(this).flexslider({
            animation: 'slide',
            customDirectionNav: $(this).find('.nav-carousel a'),
            controlNav: false,
            animationLoop: false,
            slideshow: false,
            itemWidth: 250,
            itemMargin: 25,
            minItems: 1,
            maxItems: 5
        });
    });
});
//# sourceURL=pen.js
</script>
</html>