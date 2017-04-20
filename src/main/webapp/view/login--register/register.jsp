<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link
	href="${pageContext.request.contextPath }/resource/css/register.css"
	rel="stylesheet">
<!-- CONTENT -->
<div class="container">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6 form-register">
			<div class="register-avatar">
				<img src="resource/images/avatar/icon-lg-register-blue1.png">
			</div>
			<c:if test="${not empty error }">
				<div class="error_check">${error }</div>
			</c:if>
			<section class="form_register">
				<form:form action="${pageContext.request.contextPath }/register"
					method="post" commandName="userDto" id="saveRegister">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="col-sm-6">
						<div class="form_input_register">
							<div class="error">
								<form:errors path="name" cssClass="error" />
							</div>
							<div class="form-group">
								<div class='input-group'>
									<form:input data-validation="required"
										data-validation-error-msg="Bạn chưa nhập tên " type="text"
										placeholder="Họ tên" class="input" id="name" name="name"
										path="name"></form:input>
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-user"></span>
									</span>
								</div>
							</div>
						</div>
						<div class="form_input_register">
							<div class="error">
								<form:errors path="username" cssClass="error" />
							</div>
							<div class="form-group">
								<div class='input-group'>
									<form:input data-validation="required"
										data-validation-error-msg="Bạn chưa nhập tài khoản "
										type="text" placeholder="Tên đăng nhập" class="input"
										id="username" name="username" path="username"></form:input>
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-user"></span>
									</span>
								</div>
							</div>
						</div>
						<div class="form_input_register">
							<div class="error">
								<form:errors path="password" cssClass="error" />
							</div>
							<div class="form-group">
								<div class='input-group'>
									<form:input data-validation="required"
										data-validation-error-msg="Bạn chưa nhập mật khẩu "
										class="input" type="password" placeholder="Mật khẩu"
										id="password" name="password" path="password"></form:input>
									<span class="input-group-addon" id="passwordIcon"> <span
										class="glyphicon glyphicon-lock"></span>
									</span>
								</div>
							</div>
						</div>
						<div class="form_input_register">
							<div class="error">
								<form:errors path="confirmPassword" cssClass="error" />
							</div>
							<div class="form-group">
								<div class='input-group'>
									<form:input data-validation="required"
										data-validation-error-msg="Bạn chưa xác nhận mật khẩu"
										class="input" type="password" placeholder="Xác nhận mật khẩu"
										id="confirmPassword" name="confirmPassword"
										path="confirmPassword"></form:input>
									<span class="input-group-addon" id="confirmPasswordIcon">
										<span class="glyphicon glyphicon-lock"></span>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form_input_register">
							<div class="error">
								<form:errors path="email" cssClass="error" />
							</div>
							<div class="form-group">
								<div class='input-group'>
									<form:input data-validation="required"
										data-validation-error-msg="Bạn chưa nhập email " class="input"
										type="email" placeholder="Email" id="email" name="email"
										path="email"></form:input>
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-envelope"></span>
									</span>
								</div>
							</div>
						</div>
						<div class="form_input_register">
							<div class="error">
								<form:errors path="phone" cssClass="error" />
							</div>
							<div class="form-group">
								<div class='input-group'>
									<form:input data-validation="required"
										data-validation-error-msg="Bạn chưa nhập số điện thoại"
										class="input" type="text" placeholder="Số điện thoại"
										id="phone" name="phone" path="phone"></form:input>
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-phone"></span>
									</span>
								</div>
							</div>
						</div>
						<div class="form_input_register">
							<div class="error">
								<form:errors path="address" cssClass="error" />
							</div>
							<div class="form-group">
								<div class='input-group'>
									<form:input data-validation="required"
										data-validation-error-msg="Bạn chưa nhập địa chỉ "
										class="input" type="text" placeholder="Địa chỉ" id="address"
										name="address" path="address"></form:input>
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-home"></span>
									</span>
								</div>
							</div>
						</div>
						<div class="form_input_register">
							<div class="error">
								<form:errors path="birthday" cssClass="error" />
							</div>
							<div class="form-group">
								<div class='input-group date' id='datetimepicker'>
									<form:input data-validation="required"
										data-validation-error-msg="Bạn chưa chọn ngày sinh "
										class="input" type="text" placeholder="Chọn ngày sinh của bạn"
										id="birthday" name="birthday" path="birthday"></form:input>
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<div class="form_submit_register">
							<input type="submit" value="Đăng ký" onclick="return Validate()"
								id="register">
						</div>
					</div>
					<div class="col-sm-2"></div>
					</div>
					<div class="col-sm-12" style="text-align: center;">
						<p></p>
						<a href="${pageContext.request.contextPath }/login"
							style="color: #fff; text-decoration: none;" class="create_new"><label
							style="color: #fff">Bạn đã có tài khoản?</label> Đăng nhập ngay</a>
						<p></p>
						<a href="${pageContext.request.contextPath }/home"
							style="color: #fff; text-decoration: none;"><label
							style="color: #fff">Về lại trang chủ</label> </a>
					</div>
				</form:form>
			</section>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>
<!-- END CONTENT -->