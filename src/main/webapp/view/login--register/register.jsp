<style>
    .error {
        color: #ff1105;
        font-style: italic;
        font-weight: bold;
    }
</style>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<link href="${pageContext.request.contextPath }/resource/css/register.css" rel="stylesheet">
<!-- CONTENT -->
<div class="form-register">
    <div class="register-avatar">
        <img src="resource/images/avatar/icon-lg-register-blue1.png">
    </div>
    <section class="form_register">
        <form:form action="${pageContext.request.contextPath }/register" method="post"
                   commandName="userDto" id="register">
            <div class="form_input_register">
                <form:errors path="username" cssClass="error"/>
                <div class="form-group">
                    <div class='input-group'>
                        <form:input type="text" placeholder="Tên đăng nhập" id="username" name="username"
                                    path="username"></form:input>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span>
                        </span>
                    </div>
                </div>

            </div>
            <div class="form_input_register">
                <form:errors path="email" cssClass="error"/>
                <div class="form-group">
                    <div class='input-group'>
                        <form:input type="email" placeholder="Email" id="email" name="email" path="email"></form:input>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-envelope"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form_input_register">
                <form:errors path="password" cssClass="error"/>
                <div class="form-group">
                    <div class='input-group'>
                        <form:input type="password" placeholder="Mật khẩu" id="password" name="password"
                                    path="password"></form:input>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-lock"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form_input_register">
                <form:errors path="confirmPassword" cssClass="error"/>
                <div class="form-group">
                    <div class='input-group'>
                        <form:input type="password" placeholder="Xác nhận mật khẩu" id="confirmPassword" name="confirmPassword"
                                    path="confirmPassword" data-rule-password="true" data-rule-equalTo="#password"></form:input>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-lock"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form_input_register">
                <form:errors path="phone" cssClass="error"/>
                <div class="form-group">
                    <div class='input-group'>
                        <form:input type="text" placeholder="Số điện thoại" id="phone" name="phone"
                                    path="phone"></form:input>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-phone"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form_input_register">
                <form:errors path="address" cssClass="error"/>
                <div class="form-group">
                    <div class='input-group'>
                        <form:input type="text" placeholder="Địa chỉ" id="address" name="address"
                                 path="address"></form:input>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-home"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form_input_register">
                <form:errors path="birthday" cssClass="error"/>
                <div class="form-group">
                    <div class='input-group date' id='datetimepicker'>
                            <form:input type="text" placeholder="Chọn ngày sinh của bạn" id="birthday" name="birthday"
                                        path="birthday"></form:input>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form_submit_register">
                <input type="submit" value="Đăng ký" id="register">
            </div>
            <p></p>
            <a href="${pageContext.request.contextPath }/login"
               style="color: #fff; text-decoration: none; margin-left: 20px;" class="create_new"><label
                    style="color: #fff">Bạn
                đã có tài khoản?</label> Đăng nhập ngay</a>
            <p></p>
            <a href="${pageContext.request.contextPath }/home"
               style="color: #fff; text-decoration: none; margin-left: 98px;"><label style="color: #fff">Về lại trang
                chủ</label> </a>
        </form:form>
    </section>
</div>
<!-- END CONTENT -->
<script>
    $(document).ready(function() {
        $('#register').validate({
            framework: 'bootstrap',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                confirmPassword: {
                    validators: {
                        identical: {
                            field: 'password',
                            message: 'The password and its confirm are not the same'
                        }
                    }
                }
            }
        });
    });
</script>