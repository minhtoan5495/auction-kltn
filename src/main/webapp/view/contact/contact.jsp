
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--  CONTENT -->
<div class="main-content-register">
	<div class="container">
		<div class="row">
			<div class="content-register-title">
				<h2 class="content-paget-title-item"></h2>
			</div>
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<div class="create-account">
					<form method="POST" class="new-account-form primary-form"
						 action="sendMail${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
						<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
						<h3 class="form-heading">Contact</h3>
						<div class="form-content">
							<div class="form-group primary-form-group">
								<div class="form-group ${status.error ? 'has-error' : ''}">
									<label for="from">From</label>
									<input class="form-control input-field"
										name="from" ></input>
								</div>
								<div class="form-group ${status.error ? 'has-error' : ''}">
									<label for="text">To</label>
									<input class="form-control input-field"
										name="to" ></input>
								</div>

								<div class="form-group ${status.error ? 'has-error' : ''}">
									<label for="subject">Subject</label>
									<input class="form-control input-field"
										name="subject" ></input>
								</div>

								<div class="form-group ${status.error ? 'has-error' : ''}">
									<label for="body">Body</label>
									<textarea class="form-control input-field"
										name="body"></textarea>
								</div>
							<%-- 	<div class="form-group ${status.error ? 'has-error' : ''}">
									<label for="body">Upload File</label>
									<input class="form-control input-field" type="file"
										name="attachment"><input>
								</div> --%>
								<%-- <input type="hidden"
										name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
								<div class="submit-button">
									<button class="btn btn-success btn-account" type="submit">Xác nhận</button>
								</div>
							</div>
						</div>
						<input type="hidden"
										name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END CONTENT -->