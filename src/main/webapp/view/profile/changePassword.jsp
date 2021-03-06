<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<style>
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
<div class="content-page"
     style="background: rgba(238, 238, 238, 0.48);">
    <div class="container">
        <div class="row">
            <div class="content-page-profile">
                <div class="row">
                    <aside class="col-sm-3">
                        <div class="profile-avarta">
                            <div class="profile-image">
                                <img alt=""
                                     src="http://bootdey.com/img/Content/avatar/avatar1.png">
                            </div>
                            <div class="profile-infor">
                                <label>Thông tin cá nhân</label>

                                <p>
                                    <strong>Họ và tên</strong>: ${user.name}
                                </p>

                                <p>
                                    <strong>Email</strong>: ${user.email }
                                </p>
                                <c:if test="${not empty user.address}">
                                    <p>
                                        <strong>Địa chỉ</strong>: ${user.address }
                                    </p>
                                </c:if>
                                <c:if test="${not empty user.district}">
                                    <p>
                                        <strong>Quận</strong>: ${user.district.districtName }
                                    </p>
                                </c:if>
                                <c:if test="${not empty user.city}">
                                    <p>
                                        <strong>Thành phố</strong>: ${user.city.cityName }
                                    </p>
                                </c:if>
                                <p>
                                    <strong>Số điện thoại</strong>: ${user.phone }
                                </p>

                                <p>
                                    <strong>Ngày sinh</strong>:
                                    <fmt:formatDate value="${user.birthday }" pattern="dd-MM-yyyy"/>
                                </p>
                            </div>
                        </div>
                    </aside>
                    <div class="col-sm-9" id="profile_scoll_item">
                        <div class="panel panel-info" style="margin-top: 30px;">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    <span class="glyphicon glyphicon-th"></span>
                                    Change password
                                </h3>
                            </div>
                            <form action="${pageContext.request.contextPath }/changePassword" method="POST">
                                <input type="hidden" name="${_csrf.parameterName}"
                                       value="${_csrf.token}"/>

                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-6 separator social-login-box"><br>
                                            <img alt="" class="img-thumbnail"
                                                 src="http://bootdey.com/img/Content/avatar/avatar1.png">
                                        </div>
                                        <div style="margin-top:30px;" class="col-xs-6 col-sm-6 col-md-6 login-box">
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
                                                    <div class="input-group-addon"><span
                                                            class="glyphicon glyphicon-lock"></span>
                                                    </div>
                                                    <input required class="form-control" name="oldPassword" type="password"
                                                           placeholder="Nhập mật khẩu hiện tại">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon"><span
                                                            class="glyphicon glyphicon-log-in"></span>
                                                    </div>
                                                    <input data-validation="required length" data-validation-length="8-30"
                                                           data-validation-error-msg="Mật khẩu phải phải lớn hơn 8 kí tự" class="form-control" name="newPassword" type="password"
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
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>