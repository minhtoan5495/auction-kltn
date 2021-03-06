<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<link href="${pageContext.request.contextPath }/resource/css/login.css" rel="stylesheet">
<!-- START CONTENT -->
<div class="form-login">
    <div class="form-avatar">
        <img alt=""
             src="${pageContext.request.contextPath }/resource/images/avatar/icon-lg-register-blue1.png">
    </div>
    <c:if test="${not empty error }">
        <c:if test="${error ne 'expired'}">
            <div class="error_check" id="error">
                    ${error}
            </div>
        </c:if>
        <c:if test="${error eq 'expired'}">
            <div class="error_check" id="error">
                Quý khách đã kích hoạt tài khoản quá lâu. Xin vui lòng kích hoạt lại !
            </div>
            <a class="btn btn-primary" style="margin-top: 15px; margin-left: 75px;" role="button" href="${pageContext.request.contextPath }/activeAccount?username=${username}"
               >Kích hoạt ngay ..</a>
        </c:if>
    </c:if>
    <c:if test="${not empty message }">
        <div class="alert alert-success" id="message">
                ${message}
        </div>
    </c:if>
    <section class="form_login">
        <form action="${pageContext.request.contextPath }/login" method="post"
              id="saveLogin">
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>

            <div class="form_input">
                <div class="form-group">
                    <div class='input-group'>
                        <input data-validation="required"
                               data-validation-error-msg="Bạn chưa nhập tài khoản " type="text"
                               placeholder="Tên đăng nhập" id="username"
                               name="username">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form_input">
                <div class="form-group">
                    <div class='input-group'>
                        <input data-validation="required"
                               data-validation-error-msg="Bạn chưa nhập password" type="password" placeholder="Mật khẩu"
                               name="password"
                               id="password">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-lock"></span>
                        </span>
                    </div>
                </div>
            </div>
            <a href="${pageContext.request.contextPath }/resetPassword"
               style="color: #fff; text-decoration: none; float: right; margin-bottom: 10px">Quên mật khẩu
            </a>

            <p class="error-msg" style="color: red; margin-top: 50px; display: none">Wrongcredentials</p>

            <div class="form_check">
                <input type="checkbox"><span style="color: #fff">Ghi nhớ</span>
            </div>
            <div class="form_submit">
                <input type="submit" value="Đăng nhập" name="login" id="login">
            </div>
            <p></p>
            <a href="${pageContext.request.contextPath }/register"
               style="color: #fff; text-decoration: none; margin-left: 20px;" class="create_new"><label
                    style="color: #fff">Bạn
                chưa có tài khoản?</label> Đăng ký ngay</a>

            <p></p>
            <a href="${pageContext.request.contextPath }/home"
               style="color: #fff; text-decoration: none; margin-left: 98px;"><label style="color: #fff">Về lại trang
                chủ</label> </a>
        </form>
    </section>
</div>
<!-- END CONTENT -->