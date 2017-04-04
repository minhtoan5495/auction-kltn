

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  CONTENT -->
<div class="main-content-checkout">
	<div class="container">
		<div class="row">
			<div class="content-register-title">
				<h2 class="content-paget-title-item">Checkout</h2>
			</div>
			<form class="new-account-form primary-form" action="checkout" method="post">
							<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
				<div class="col-sm-6">
					<div class="account-information">
						<h3 class="form-heading">Nhập thông tin cá nhân</h3>
						<div class="form-content">
							<div class="form-group primary-form-group">
								<div class="row">
									<div class="col-sm-6">
										<label for="fistname">First Name</label> <input
											class="form-control input-field" type="text"
											placeholder="first name" name="firstname">
									</div>
									<div class="col-sm-6">
										<label for="lastname">Last Name</label> <input
											class="form-control input-field" type="text"
											placeholder="last name" name="lastname">
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<label for="address">Địa chỉ</label> <input
											class="form-control input-field" name="address">
									</div>
								</div>
								<label for="email">Email</label> <input
									class="form-control input-field" type="email" name="email">
								<label for="Phone">Phone</label> <input
									class="form-control input-field" type="tel" name="phone">
								<label for="email">Age</label> <input
									class="form-control input-field" type="number" name="age">
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="account-information">
						<h3 class="form-heading">Nhập địa chỉ nhận hàng</h3>
						<div class="form-content">
							<div class="form-group primary-form-group">
								<div class="row">
									<div class="col-sm-6">
										<label for="fistname">Tên đường</label> <input
											class="form-control input-field" type="text" placeholder=""
											name="streetname">
									</div>
									<div class="col-sm-6">
										<label for="lastname">Số nhà</label> <input
											class="form-control input-field" type="text" placeholder=""
											name="housenumber">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<label for="year">Quận</label> <input
											class="form-control input-field" name="district">
									</div>
									<div class="col-sm-6">
										<label for="year">Thành phố</label> <input
											class="form-control input-field" name="city">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
				<div class="table-responsive">
					<table class="table table-cart-item">
							<thead>
								<tr>
									<th class="cart-product-item">Hình ảnh</th>
									<th class="cart-product-item">Tên sản phẩm</th>
									<th class="cart-product-item">Mô tả</th>
									<th class="cart-product-item">Số lượng</th>
									<th class="cart-product-item">Giá</th>
									<th class="cart-product-item"></th>
								</tr>
							</thead>
							<c:forEach var="cart" items="${cart}">
								<c:set var="s" value="${s +cart.product.price*cart.quantity}"></c:set>
								<tbody>
									<tr>
										<td class="cart-product-infor"><a
											href="${pageContext.request.contextPath }/detail?idproduct=${cart.product.idproduct}"><img
												src="${pageContext.request.contextPath }/resource/images/banner/${cart.product.image}"
												style="width: 100px; height: 100px"></a></td>
										<td class="cart-product-infor">
											<label class="cart-product-name">${cart.product.name }</label>
										</td>
										<td class="cart-product-infor">
											<p class="cart-product-name">${cart.product.name }</p> <small>${cart.product.description }</small><br>
										<td class="cart-product-infor"><input
											class="form-control input-field" type="number"
											value="${cart.quantity}" name="quantity"> <input type="hidden"
											name="${_csrf.parameterName}" value="${_csrf.token}" /> <input
											class="btn btn-success" value="update" type="submit">
										</td>
										<td class="cart-product-infor">
											<p>
												<fmt:formatNumber
													value="${cart.product.price*cart.quantity}" type="number" />
												đ
											</p>
										</td>
										<td class="cart-product-infor"><a
											href="${pageContext.request.contextPath }/removeCart?idproduct=${cart.product.idproduct}"><i
												class="glyphicon glyphicon-trash"></i></a></td>
									</tr>
								</tbody>
							</c:forEach>
							<tfoot>
								<tr class="cart-total-price">
									<td class="cart-empty" colspan="2" rowspan="5"></td>
									<td class="cart-right-price" colspan="2"
										style="font-size: 18px;">Tổng tiền tạm tính</td>
									<td class="cart-right-price" colspan="1"><fmt:formatNumber
											value="${s}" type="number" />đ</td>
									<td class="cart-right-price" colspan="1"></td>
								</tr>

							</tfoot>
						</table>
				</div>
				</div>
				<div class="">
					<button class="btn btn-success" type="submit">Đặt hàng</button>
				</div>
				</form>
		</div>
	</div>
</div>
<!-- END CONTENT -->