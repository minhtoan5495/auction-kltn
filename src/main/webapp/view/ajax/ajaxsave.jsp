
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  CONTENT -->
<div class="main-content-register">
	<div class="container">
		<h3 class="form-heading">Nhập thông tin tìm kiếm</h3>
		      <h2>Find Contact By Name</h2>
            <div>
                <label for="firstInput">First Name</label>
                <input type="text" name="firstname" id="firstInput"/>
            </div>
            <div>
                <label for="lastInput">Last Name</label>
                <input type="text" name="lastname" id="lastInput"/>
            </div>
            <div id="theJson"></div>
            <button type="button" id="button">Find</button>

		<h2>Submit new Contact</h2>
		<form class="new-account-form primary-form" id="saveCustomer">
			<h3 class="form-heading">Nhập thông tin đăng ký</h3>
			<div class="form-content">
				<div class="form-group primary-form-group">
					<div class="row">
						<div class="col-sm-6">
							<label for="fistname">First Name</label> <input
								class="form-control input-field" type="text"
								placeholder="first name" name="firstname" id="firstInput">
							<p>(ex: Mai, Lê, Trần...)</p>
						</div>
						<div class="col-sm-6">
							<label for="lastname">Last Name</label> <input
								class="form-control input-field" type="text"
								placeholder="last name" name="lastname" id="lastInput">
							<p>(ex: Sơn, Messi...)</p>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<label for="email">Email</label> <input
								class="form-control input-field" type="email" name="email"
								id="emailInput">
						</div>
						<div class="col-sm-6">
							<label for="age">Address</label> <input
								class="form-control input-field" type="text" name="address"
								id="addressInput">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<label for="Phone">Phone</label> <input
								class="form-control input-field" type="text" name="phone"
								id="phoneInput">
						</div>
						<div class="col-sm-6">
							<label for="email">Age</label> <input
								class="form-control input-field" type="number" name="age"
								id="ageInput">
						</div>
					</div>
					<div class="submit-button" style="padding-top:20px">
						<button class="btn btn-success button-ajax" type="submit" style="border-radius:0px">
						Save
						</button>
					</div>
				</div>
			</div>
		</form>

		<br>
		<div class="row">
		<div class="container">
		<h2>Table Contact</h2>
		<table id="customerTableReponse" class="table tr">
			<thead>
				<tr>
					<th>ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Age</th>
					<th>Email</th>
					<th>Addres</th>
					<th>Phone</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${customers}" var="customer">
					<tr>
						<td>${customer.id}</td>
						<td>${customer.firstname}</td>
						<td>${customer.lastname}</td>
						<td>${customer.age}</td>
						<td>${customer.email}</td>
						<td>${customer.address}</td>
						<td>${customer.phone}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<th scope="row">Spring-Ajax</th>
					<td colspan="4">JQuery Ajax</td>
				</tr>
			</tfoot>
		</table>
		</div>
		</div>
	</div>
</div>
<!-- END CONTENT -->