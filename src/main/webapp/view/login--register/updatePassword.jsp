<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html ng-app="cart">
<head>
    <title><tiles:getAsString name="title"/></title>
    <title><tiles:getAsString name="title"/></title>
    <link rel="shortcut icon" href="resource/css/images/icon-title.png">
    <meta charset="UTF-8">
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
    <link
            href="${pageContext.request.contextPath }/resource/css/profile.css"
            rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/cart.css"
          rel="stylesheet">
    <link
            href="${pageContext.request.contextPath }/resource/css/submenu_v2.css"
            rel="stylesheet">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
</head>
<style>
    body {
        padding: 0;
        margin: 0;
        background: url("../../resource/images/backgroundmenu/background.jpg") no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }
    .separator {
        border-right: 1px solid #dfdfe0 !important;
    }

    .icon-btn-save {
        padding-top: 0 !important;
        padding-bottom: 0 !important;
    }

    .input-group {
        margin-bottom: 10px !important;
        width: 100% !important;
    }

    .btn-save-label {
        position: relative !important;
        left: -12px !important;
        display: inline-block !important;
        padding: 6px 12px !important;
        background: rgba(0, 0, 0, 0.15) !important;
        border-radius: 3px 0 0 3px !important;
    }

    .error_check {
        padding: 10px;
        border: 1px solid transparent;
        color: #a94442;
        background-color: #f2dede;
        border-color: #ebccd1;
        border-radius: 3px;
        font-size: 12px;
    }
</style>
<body>
<div class="content-page"
     style="background: rgba(238, 238, 238, 0.48);">
    <div class="content-page-profile">
        <div class="col-sm-3"></div>
        <div class="col-sm-6" id="profile_scoll_item">
            <div class="panel panel-info" style="margin-top: 30px;">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="glyphicon glyphicon-th"></span>
                        Lấy lại mật khẩu
                    </h3>
                </div>
                <form:form commandName="profileDto"
                           action="${pageContext.request.contextPath }/updatePassword"
                           method="POST">
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                    <div class="panel-body">
                        <div class="col-xs-4 col-sm-4 col-md-4 separator social-login-box"><br>
                            <img alt="" class="img-thumbnail"
                                 src="http://bootdey.com/img/Content/avatar/avatar1.png">
                        </div>
                        <div class="col-xs-7 col-sm-7 col-md-7 login-box" style="margin-left:20px; margin-top: 30px; ">
                            <c:if test="${not empty error }">
                                <div class="error_check">
                                        ${error }
                                </div>
                            </c:if>
                            <div class="form-group" style="margin-top: 20px;">
                                <div class="input-group">
                                    <div class="input-group-addon"><span
                                            class="glyphicon glyphicon-log-in"></span>
                                    </div>
                                    <input data-validation="required length" data-validation-length="8-30"
                                           data-validation-error-msg="Mật khẩu phải phải lớn hơn 8 kí tự" class="form-control" name="password" type="password"
                                           placeholder="Nhập mật khẩu mới">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon"><span
                                            class="glyphicon glyphicon-log-in"></span>
                                    </div>
                                    <input class="form-control" name="confirmPassword" type="password"
                                           placeholder="Xác nhận lại mật khẩu mới">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6"></div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <button class="btn icon-btn-save btn-success" type="submit">
                                                <span class="btn-save-label"><i
                                                        class="glyphicon glyphicon-floppy-disk"></i></span>save
                                </button>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>