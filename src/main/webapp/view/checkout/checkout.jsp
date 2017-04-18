<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!--  CONTENT -->
<div class="main-content-checkout">
	<div class="container">
<form:form action="${pageContext.request.contextPath }/checkout" method="post" commandName="shipping">
	<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
	<div class="row">
			<div class="col-sm-7" style="margin-top: 10px">
				<div class="content-checkout-address">
					<div class="panel panel-default panel-checkout-order">
						<div class="panel-heading panel-checkout-order-heading">Địa
							chỉ giao hàng</div>
						<div class="panel-body">
							<c:if test="${not empty user }">
							<div class="panel-body-info-user">
								<label>${user.name }</label>
								<p>${user.address }</p>
								<p>Quận ${user.district.districtName }</p>
								<p>Thành phố ${user.city.cityName }</p>
								<p>Điện thoại:${user.phone }</p>
							</div>
						</c:if>
							<div class="content-checkout-address-other">
								<div class="panel panel-default panel-checkout-order">
									<div class="panel-heading" id="panel_checkout_order_toggle">
										<i class="glyphicon glyphicon-plus"></i>Chọn thông tin địa chỉ
										giao hàng khác
									</div>
									<div class="panel-body" id="panel_checkout_order_toggle_body">
										<form>
								<div class="input address_input">
									<div class="address_input_title">
										<label class="address_input_label">Họ và tên</label>
									</div>
									<div class="address_input_field">
										<input type="text" class="address_field_input"
											placeholder="Họ & tên">
									</div>
								</div>
								<div class="input address_select">
									<div class="address_input_title">
										<label class="address_input_label">Thành phố</label>
									</div>
									<div class="address_input_field">
										<form:select path="city.cityId" class="address_field_select">
										<c:forEach var="city" items="${city }">
											<form:option value="${city.cityId }">
												<c:out value="${city.cityName}"></c:out>
											</form:option>
										</c:forEach>
										</form:select>
									</div>
								</div>
								<div class="input address_select">
									<div class="address_input_title">
										<label class="address_input_label">Quận/Huyện</label>
									</div>
									<div class="address_input_field">
										<form:select path="district.districtId" class="address_field_select">
										<c:forEach var="district" items="${district }">
											<form:option value="${district.districtId }">
												<c:out value="${district.districtName}"></c:out>
											</form:option>
										</c:forEach>
										</form:select>
									</div>
								</div>
								<div class="input address_select">
									<div class="address_input_title">
										<label class="address_input_label">Phường xã</label>
									</div>
									<div class="address_input_field">
										<select class="address_field_select">
											<option>Hồ Chí Minh</option>
											<option>Đà Nẵng</option>
											<option>Hà Nội</option>
										</select>
									</div>
								</div>
								<div class="input address_input">
									<div class="address_input_title">
										<label class="address_input_label">Địa chỉ cụ thể</label>
									</div>
									<div class="address_input_field">
										<form:input type="text" class="address_field_input"
											placeholder="Vui lòng điền địa chỉ cụ thể chính xác" path="address"></form:input>
									</div>
								</div>
								<div class="input address_input">
									<div class="address_input_title">
										<label class="address_input_label">Số điện thoại</label>
									</div>
									<div class="address_input_field">
										<input class="address_field_input" type="text"
											placeholder="Sđt">
									</div>
								</div>
							</form>
									</div>
								</div>
								<div class="content-checkout-type-ship">
									<div class="checkout-type-item">
										<div class="checkout-type-item-title">
											<label>Thông tin giao hàng</label>
										</div>
										<div class="checkout-type-item-input">
											<input type="checkbox">
										</div>
										<div class="checkout-type-item-info">
											<p>Giao hàng bình thường</p>
											<p>Từ ngày 00 đến ngày 00 tháng 00 năm 0000</p>
										</div>
										<p style="margin: 0 0 -10px;">
											<br>
										</p>
										<div class="checkout-type-item-input">
											<input type="checkbox">
										</div>
										<div class="checkout-type-item-info">
											<p>Giao hàng bình thường</p>
											<p>Từ ngày 00 đến ngày 00 tháng 00 năm 0000</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-5" style="margin-top: 10px">
				<div class="content-checkout-info-order">
					<div class="panel panel-default">
						<div class="panel-heading">Thông tin đơn hàng</div>
						<div class="panel-body panel-order-checkout-info">
							<div class="checkout-info-order-product">
								<table class="tbl-info-order-checkout">
									<thead>
										<tr>
											<th class="infor_order_title_product">Sản phẩm</th>
											<th class="infor_order_title_quantity">Số lượng</th>
											<th class="infor_order_title_price">Đơn giá</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="panel-body panel-order-checkout-info-detail">
							<div class="checkout-info-order-product">
								<c:forEach var="cart" items="${cart }">
									<c:set var="s" value="${s+cart.product.price*cart.quantity }"></c:set>
									<table class="tbl-info-order-checkout-detail">
										<tbody>
											<tr>
												<td class="infor_order_title_product">
												<img src="${pageContext.request.contextPath }/resource/images/banner/${cart.product.images.get(i).getImageUrl()}" style="width: 100px;height: 100px">
												<p style="margin-left: 5px">${cart.product.name }</p>	
												</td>
												<td class="infor_order_title_quantity">${cart.quantity } cái</td>
												<td class="infor_order_title_price"><fmt:formatNumber value="${cart.product.price}"
													type="number" /> đ</td>
											</tr>
											<tr>
												<td colspan="3"><label
													style="margin-top: 5px; margin-left: 5px">Giao hàng
														bình thường</label>
													<p style="margin-left: 5px">Thứ 00 ngày 00 tháng 00 năm
														00</p></td>
											</tr>
										</tbody>
									</table>
								</c:forEach>
							</div>
						</div>
						<div class="panel-body panel-order-checkout-info">
							<div class="checkout-info-order-total">
								<table class="tbl-info-order-total">
									<tbody>
										<tr class="tr-content-order-total">
											<td>Tạm tính</td>
											<td colspan="2"><fmt:formatNumber value="${s}"
													type="number" /> đ</td>
										</tr>
										<tr class="tr-content-order-total" style="padding-bottom: 5px">
											<!-- 										<td><span class="ship_item_span">Phí ship</span></td>
										<td colspan="2"><span class="ship_item_span">15,000đ</span></td> -->
										</tr>
										<tr class="tr-content-order-total tr-total-payment">
											<td><label>Tổng tiền</label>
												<p>Thanh toán</p></td>
											<td><label style="font-size: 20px"><fmt:formatNumber value="${s}"
													type="number" /> đ</label></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button type="submit" class="btn-checkout-continue" style="margin-left: 20px">TIẾP THEO</button>
		</div>
		
		</form:form>
	</div>
</div>
<!-- END CONTENT -->