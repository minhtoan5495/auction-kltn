 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--  CONTENT -->
	<div class="form-register">
		<div class="register-avatar">
			<img src="resource/images/avatar/icon-lg-register-blue1.png">
		</div>
		<section class="form_register">
			<form:form action="" id="saveRegister" commandName="user">
				<div class="form_input_register">
					<form:input type="text" placeholder="Tên đăng nhập" id="username" name="username" path="username"></form:input>
				</div>
				<i class="fa fa-user"></i>
			<div class="form_input_register">
					<form:input type="email" placeholder="Email" id="email" name="email" path="email"></form:input>
				</div>
				<i class="fa fa-envelope"></i>
				<div class="form_input_register">
					<form:input type="password" placeholder="Mật khẩu" id="password" name="password" path="password"></form:input>
				</div>
				<i class="fa fa-lock"></i>
				<div class="form_input_register">
					<form:input type="password" placeholder="Xác nhận mật khẩu" id="passwordConfirm" name="passwordConfirm" path="passwordConfirm"></form:input>
				</div>
				<i class="fa fa-lock"></i>
				<div class="form_submit_register">
					<input type="submit" value="Đăng ký" id="register">
				</div>
				<p></p>
			<a href="${pageContext.request.contextPath }/login" style="color: #282828; text-decoration: none; margin-left: 20px;" class="create_new"><label style="color: gray">Bạn
					đã có tài khoản?</label> Đăng nhập ngay</a>
					<p></p>
			<a href="${pageContext.request.contextPath }/home" style="color: #282828; text-decoration: none; margin-left: 98px;"><label style="color: gray">Về lại trang chủ</label> </a>
			</form:form>
		</section>
	</div>
<!-- END CONTENT -->