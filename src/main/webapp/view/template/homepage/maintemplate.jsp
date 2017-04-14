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
<div ng-controller="RegisterController" ng-init='init()' ng-app="MyApp">
    <div id="registerModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content" style="width:90%; margin: auto;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">×</span></button>
                    <h4 class="modal-title" style="font-weight: 100">Đăng kí</h4>
                </div>
                <div class="modal-body">
                    <div class="input_form">
                        <form role="form" action="${pageContext.request.contextPath }/register" method="post">
                            <input type="hidden" name="${_csrf.parameterName}"
                                   value="${_csrf.token}"/>
                            <div class="form-group">
                                <input type="text" ng-model="credentials.fullName" class="form-control" name="fullName"
                                       id="fullName"
                                       placeholder="Tên đầy đủ">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" ng-model="credentials.username" name="username"
                                       id="username"
                                       placeholder="Tên tài khoản">
                            </div>
                            <div class="form-group">
                                <input type="password" ng-model="credentials.password" class="form-control"
                                       name="password"
                                       id="password"
                                       placeholder="Mật khẩu">
                            </div>
                            <div class="form-group">
                                <input type="password" ng-model="credentials.confirmPassword" class="form-control"
                                       name="confirmPassword" id="confirmPassword"
                                       placeholder="Nhập lại mật khẩu">
                            </div>
                            <div class="form-group">
                                <input type="email" ng-model="credentials.email" class="form-control" name="email"
                                       id="email"
                                       placeholder="Email">
                            </div>
                            <div class="form-group">
                                <div selector="form-control">
                                    <div class="form-group">
                                        <div class='input-group date'>
                                            <input ng-model="credentials.birthday" type="date" class="form-control"/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar">
                                                </span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" ng-model="credentials.address" class="form-control" name="address"
                                       id="address"
                                       placeholder="Địa chỉ">
                            </div>
                            <input class="register-button" type="submit" value="Đăng kí"/>
                        </form>
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
<script src="${pageContext.request.contextPath }/resource/js/jquery-1.8.3.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.8/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.8/angular-route.min.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/main.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/photoZoom.min.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/customer.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/ui-bootstrap-tpls-0.11.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resource/js/login.js"></script>
</html>