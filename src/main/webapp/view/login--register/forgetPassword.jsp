
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- START CONTENT -->
<section class="main-content-login">
	<div class="container">
		<div class="row">
			<div class="content-login-title">
				<h2 class="content-paget-title-item"></h2>
			</div>
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<div class="create-account">
					<form class="new-account-form primary-form"
						action="${pageContext.request.contextPath }/login" method="post">
						<h3 class="form-heading" style="text-align: center;">Khôi phục mật khẩu</h3>
						<div class="form-content">
							<p style="text-align: center;">Vui lòng nhập username chính xác</p>
							<div class="form-group primary-form-group">
								<div class="form-group ${error != null ? 'has-error' : ''}">
									<%-- <span style="color: red">${message}</span><br>  --%>
									<label for="email">Tên đăng nhập</label> <input
										class="form-control input-field" type="text" name="username"><br>
									<div class="submit-button">
										<button class="btn btn-success btn-account" type="submit"
											style="border-radius: 0px;">Xác nhận</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- END CONTENT -->