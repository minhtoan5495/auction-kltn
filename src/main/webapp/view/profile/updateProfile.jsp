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
                        Update Profile
                    </h3>
                </div>
                <form:form commandName="profileDto"
                           action="${pageContext.request.contextPath }/updateProfile"
                           method="POST">
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                    <div class="panel-body">
                        <div class="col-xs-4 col-sm-4 col-md-4 separator social-login-box"><br>
                            <img style="margin-top: 50px;" alt="" class="img-thumbnail"
                                 src="http://bootdey.com/img/Content/avatar/avatar1.png">
                        </div>
                        <div class="col-xs-7 col-sm-7 col-md-7 login-box" style="margin-left:20px; ">
                            <c:if test="${not empty error }">
                                <div class="error_check">
                                        ${error }
                                </div>
                            </c:if>
                            <c:if test="${not empty message }">
                                <div class="message_check">
                                        ${message }
                                </div>
                            </c:if>
                            <div class="form-group" style="margin-top: 20px;">
                                <div class="input-group">
                                    <label for="name" class="control-label">Họ Tên</label>
                                    <form:input required="true" path="name" class="form-control" name="name"
                                                id="name"
                                                type="text"
                                                value="${user.name}" require="true"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <label for="phone" class="control-label">Số điện thoại</label>
                                    <form:input required="true" path="phone" onkeyup="validate()"
                                                class="form-control"
                                                name="phone"
                                                require="true"
                                                id="phone" type="number"
                                                value="${user.phone}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <label for="address" class="control-label">Địa chỉ cụ thể</label>
                                    <form:input required="true" path="address" class="form-control" name="address"
                                                id="address" require="true"
                                                type="text"
                                                value="${user.address}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class='input-group date' id='date'>
                                    <label class="control-label" for="date">Ngày sinh</label>
                                    <input required="true" class="form-control" name="date" value="<fmt:formatDate value="${user.birthday }"
                                                                                pattern="yyyy-MM-dd"/>"
                                           type="text"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <label for="cityId" class="control-label">Thành phố</label>
                                    <select required="true" class="form-control" onchange="loadDistrict();"
                                            name="cityId" id="cityId">
                                        <option value="">Select city</option>
                                        <c:forEach var="city" items="${cities}">
                                            <option value="${city.cityId}" required="true">${city.cityName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <label for="districtId" class="control-label">Quận</label>
                                    <select required="true" class="form-control" name="districtId"
                                            id="districtId">
                                        <option value="" required="true">Select district</option>
                                    </select>
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
<script type="text/javascript"
        src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resource/js/bootstrap.min.js"></script>
<script
        src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script
        src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"
        type="text/javascript"></script>
<!-- Include Date Range Picker -->
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<script>
    function loadDistrict() {
        var cityId = $('#cityId').val();
        $.ajax({
            type: 'GET',
            url: '/getDistrict',
            data: "cityId=" + cityId,
            success: function (response) {
                var select = $('#districtId');
                select.find('option').remove();
                $.each(response, function (index, value) {
                    $('<option>').val(value.districtId)
                        .text(value.districtName).appendTo(select);
                });
            }
        });
    }

    jQuery(function ($) {
        $(".date").mask("99/99/9999");
    });

    $(document).ready(
        function () {
            var date_input = $('input[name="date"]'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $(
                '.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'yyyy-mm-dd',
                container: container,
                todayHighlight: true,
                autoclose: true,
            })
        })

    function validate() {
        var element = document.getElementById('phone');
        element.value = element.value.replace(/[^0-9+()]+/, '');
    };
</script>
</html>