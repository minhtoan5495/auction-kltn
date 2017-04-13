<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
    <title><tiles:getAsString name="title"/></title>
    <link rel="shortcut icon" href="resource/css/images/icon-title.png">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath }/resource/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/owl.carousel.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/responsive.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/main12.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/detail.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/checkoutsuccess.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/profile.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/cart.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/checkout.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/submenu_v2.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/modal.css" rel="stylesheet">

</head>
<body>

<header>
    <tiles:insertAttribute name="header"></tiles:insertAttribute>
</header>
<tiles:insertAttribute name="body"></tiles:insertAttribute>
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <input type="email" class="form-control" id="exampleInputEmaillog" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="exampleInputPasswordpas" placeholder="Password">
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> Remember me
                                </label>
                            </div>
                        </div>
                        <div class="col-md-4 col-md-offset-2">
                            <p class="frgt-pswd"   data-toggle="modal" data-dismiss="modal"  data-target="#at-reset-pswd">	Forgot Password ?</p>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-default btn-block">Login</button>
                </form>
            </div>
            <div class="modal-footer">
                <div class="row">
                    <div class="col-md-6">
                        <p class="ta-l">Don't have an account ? </p>
                    </div>
                    <div class="col-md-4 col-md-offset-2">
                        <button class="btn-gst"  data-toggle="modal"  data-dismiss="modal" data-target="#at-signup" >Sign Up </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer style="margin-top: 20px;">
    <tiles:insertAttribute name="footer"></tiles:insertAttribute>
</footer>
</body>
<script src="resource/js/jquery-1.8.3.min.js"></script>
<script src="resource/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resource/js/main.js"></script>
<script src="resource/js/photoZoom.min.js"></script>
<script src="resource/js/customer.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#imageContainer").photoZoom();
    });
</script>

</html>