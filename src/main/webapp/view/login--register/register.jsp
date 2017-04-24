<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<link href="${pageContext.request.contextPath }/resource/css/register.css" rel="stylesheet">
<!-- CONTENT -->
<div class="container">
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6 form-register">
            <div class="register-avatar">
                <img src="resource/images/avatar/icon-lg-register-blue1.png">
            </div>
            <c:if test="${not empty error }">
                <div class="error_check">
                        ${error }
                </div>
            </c:if>
            <section class="form_register">
                <form:form action="${pageContext.request.contextPath }/register" method="post"
                           commandName="userDto" id="saveRegister">
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                    <div class="col-sm-6">
                        <div class="form_input_register">
                            <div class="form-group">
                                <div class='input-group'>
                                    <form:input data-validation="custom" data-validation-regexp="^[a-zA-Z .*]{3,}$"
                                                data-validation-error-msg="Họ tên phải có 3 tự"
                                                type="text" placeholder="Họ tên" class="input" id="name"
                                                name="name"
                                                path="name"></form:input>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-user"></span>
                                    </span>
                                </div>
                            </div>
                            <div class="error">
                                <form:errors path="name" cssClass="error"/>
                            </div>
                        </div>
                        <div class="form_input_register">
                            <div class="form-group">
                                <div class='input-group'>
                                    <form:input data-validation="custom" data-validation-regexp="^[a-zA-Z0-9._*]{6,}$"
                                                data-validation-error-msg="Tên tài khoản phải 6 kí tự trở lên"
                                                type="text" placeholder="Tên đăng nhập" class="input" id="username"
                                                name="username"
                                                path="username"></form:input>
                                    <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span>
                        </span>
                                </div>
                            </div>
                            <div class="error">
                                <form:errors path="username" cssClass="error"/>
                            </div>
                        </div>
                        <div class="form_input_register">
                            <div class="form-group">
                                <div class='input-group'>
                                    <form:input data-validation="required length" data-validation-length="6-20"
                                                data-validation-error-msg="Mật khẩu phải lớn hơn 6 kí tự"
                                                class="input" type="password" placeholder="Mật khẩu" id="password"
                                                name="password"
                                                path="password"></form:input>
                                    <span class="input-group-addon" id="passwordIcon">
                            <span class="glyphicon glyphicon-lock"></span>
                        </span>
                                </div>
                            </div>
                            <div class="error">
                                <form:errors path="password" cssClass="error"/>
                            </div>
                        </div>
                        <div class="form_input_register">
                            <div class="form-group">
                                <div class='input-group'>
                                    <form:input data-validation="required"
                                                data-validation-error-msg="Bạn chưa xác nhận mật khẩu"
                                                class="input" type="password" placeholder="Xác nhận mật khẩu"
                                                id="confirmPassword"
                                                name="confirmPassword"
                                                path="confirmPassword"></form:input>
                                    <span class="input-group-addon" id="confirmPasswordIcon">
                            <span class="glyphicon glyphicon-lock"></span>
                        </span>
                                </div>
                            </div>
                            <div class="error">
                                <form:errors path="confirmPassword" cssClass="error"/>
                            </div>
                        </div>
                        <div class="form_input_register">
                            <div class="form-group">
                                <div class='input-group'>
                                    <form:input data-validation="custom"
                                                data-validation-regexp="^[a-zA-Z0-9.*]{3,}.@[a-z*]{3,}\.[a-z]{3,}$"
                                                data-validation-error-msg="Vui lòng nhập đúng email"
                                                class="input" type="text" placeholder="Email" id="email" name="email"
                                                path="email"></form:input>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-envelope"></span>
                                    </span>
                                </div>
                            </div>
                            <div class="error">
                                <form:errors path="email" cssClass="error"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form_input_register">
                            <div class="form-group">
                                <div class='input-group'>
                                    <form:input data-validation="required length" data-validation-length="10-11"
                                                data-validation-error-msg="Bạn chưa nhập số điện thoại"
                                                class="input" onkeyup="validate()" type="text" placeholder="Số điện thoại" id="phone"
                                                name="phone"
                                                path="phone"></form:input>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-phone"></span>
                                    </span>
                                </div>
                            </div>
                            <div class="error">
                                <form:errors path="phone" cssClass="error"/>
                            </div>
                        </div>
                        <div class="form_input_register">
                            <div class="form-group">
                                <div class='input-group'>
                                    <form:input data-validation="required"
                                                data-validation-error-msg="Bạn chưa nhập địa chỉ "
                                                class="input" type="text" placeholder="Địa chỉ" id="address"
                                                name="address"
                                                path="address"></form:input>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-home"></span>
                                    </span>
                                </div>
                            </div>
                            <div class="error">
                                <form:errors path="address" cssClass="error"/>
                            </div>
                        </div>
                        <div class="form_input_register">
                            <div class="form-group">
                                <div class='input-group'>
                                    <form:input data-validation="required"
                                                data-validation-error-msg="Bạn chưa nhập địa chỉ "
                                                class="input" type="text" placeholder="Địa chỉ" id="address"
                                                name="address"
                                                path="address"></form:input>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-home"></span>
                                    </span>
                                </div>
                            </div>
                            <div class="error">
                                <form:errors path="address" cssClass="error"/>
                            </div>
                        </div>
                        <div class="form_input_register">
                            <div class="form-group">
                                <div class='input-group'>
                                    <form:select path="city" class="input" onchange="getDistrict();" id="city">
                                        <option>Select city</option>
                                        <c:forEach var="city" items="${cities}">
                                            <option value="${city.cityId}">${city.cityName}</option>
                                        </c:forEach>
                                    </form:select>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-home"></span>
                                    </span>
                                </div>
                            </div>
                            <div class="error">
                                <form:errors path="address" cssClass="error"/>
                            </div>
                        </div>
                        <div class="form_input_register">

                            <div class="form-group">
                                <div class='input-group date' id='datetimepicker'>
                                    <form:input data-validation="required"
                                                data-validation-error-msg="Bạn chưa chọn ngày sinh "
                                                class="input" type="text" placeholder="Chọn ngày sinh của bạn"
                                                id="birthday"
                                                name="birthday"
                                                path="birthday"></form:input>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                            <div class="error">
                                <form:errors path="birthday" cssClass="error"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-8">
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
                               style="color: #fff; text-decoration: none; margin-left: 98px;"><label
                                    style="color: #fff">Về
                                lại
                                trang
                                chủ</label> </a>
                        </div>
                    </div>
                </form:form>
            </section>
        </div>
    </div>
    <div class="col-sm-3"></div>
</div>

<!-- END CONTENT -->