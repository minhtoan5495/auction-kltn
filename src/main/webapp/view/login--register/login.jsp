<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- START CONTENT -->
<div class="form-login">
	<div class="form-avatar">
		<img alt=""
			src="${pageContext.request.contextPath }/resource/images/avatar/icon-lg-register-blue1.png">
	</div>
	<c:if test="${not empty error }">
		<div class="error_check">
			${error }
		</div>
	</c:if>
	<section class="form_login">
		<form action="${pageContext.request.contextPath }/login" method="post"
			id="saveLogin">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="form_input">
				<input type="text" placeholder="Tên đăng nhập" id="username"
					name="username" required="required">
				<i class="fa fa-user"></i>
			</div>
			<div class="form_input">
				<input type="password" placeholder="Mật khẩu" name="password"
					id="password" required="required">
				<i class="fa fa-lock"></i>
			</div>
			<a href="#"
				style="color: gray; text-decoration: none; float: right; margin-bottom: 10px">Quên mật khẩu
				</a>
			<p class="error-msg"
				style="color: red; margin-top: 50px; display: none">Wrong
				credentials</p>
			<div class="form_check">
				<input type="checkbox">Ghi nhớ
			</div>
			<div class="form_submit">
				<input type="submit" value="Đăng nhập" name="login" id="login"
					required="required">
			</div>
			<p></p>
			<a href="${pageContext.request.contextPath }/register" style="color: #282828; text-decoration: none; margin-left: 20px;" class="create_new"><label style="color: gray">Bạn
					chưa có tài khoản?</label> Đăng ký ngay</a>
					<p></p>
			<a href="${pageContext.request.contextPath }/home" style="color: #282828; text-decoration: none; margin-left: 98px;"><label style="color: gray">Về lại trang chủ</label> </a>
		</form>
	</section>
</div>
<!-- END CONTENT -->