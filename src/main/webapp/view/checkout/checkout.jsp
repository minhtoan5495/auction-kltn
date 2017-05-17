<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- CONTENT -->
<div class="main-content-checkout">
	<div class="container">
		<c:choose>
			<c:when test="${empty carts }">
				<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
						<div class="content-cart-menu">
							<h4>Không có sản phẩm nào trong giỏ hàng</h4>
							<a href="${pageContext.request.contextPath }/home">
								<button>Tiếp tục mua hàng</button>
							</a>
						</div>
					</div>
					<div class="col-sm-4"></div>
				</div>
			</c:when>
			<c:otherwise>
				<form:form action="${pageContext.request.contextPath }/checkout"
					method="post" commandName="shipping">
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
													<i class="glyphicon glyphicon-plus"></i>Chọn thông tin địa
													chỉ giao hàng khác
												</div>
												<div class="panel-body"
													id="panel_checkout_order_toggle_body">
													<form>
														<div class="input address_select">
															<div class="address_input_title">
																<label class="address_input_label">Thành phố</label>
															</div>
															<div class="address_input_field">
																<form:select path="city.cityId"
																	class="address_field_select">
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
																<form:select path="district.districtId"
																	class="address_field_select">
																	<c:forEach var="district" items="${district }">
																		<form:option value="${district.districtId }">
																			<c:out value="${district.districtName}" />
																		</form:option>
																	</c:forEach>
																</form:select>
															</div>
														</div>
														<div class="input address_input">
															<div class="address_input_title">
																<label class="address_input_label">Địa chỉ cụ
																	thể</label>
															</div>
															<div class="address_input_field">
																<form:input type="text" class="address_field_input"
																	placeholder="Vui lòng điền địa chỉ cụ thể chính xác"
																	path="address"></form:input>
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
													<div class="about-page-introduce">
														<p>Tùy vào khu vực nhận hàng và tình trạng sản phẩm
															của cửa hàng mà chúng tôi có thể giao hàng theo các ngày
															khác nhau nhưng đảm bảo sẽ giao hàng một cách sớm nhất có
															thể.Mong nhận được tất cả sự thông cảm từ quý khách hàng.</p>
													</div>
													<div class="checkout-type-item-info">
														<label>Giao hàng bình thường</label>
														<p>Từ ngày đặt hàng đến 3 ngày sau</p>
													</div>
													<p style="margin: 0 0 -10px;">
														<br>
													</p>
													<div class="checkout-type-item-info">
														<label>Giao hàng đặc biệt</label>
														<p>Từ ngày đặt hàng đến 5 ngày sau</p>
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
											<c:forEach var="cart" items="${carts }">
												<c:set var="s"
													value="${s+cart.product.price*cart.quantity }"></c:set>
												<table class="tbl-info-order-checkout-detail">
													<tbody>
														<tr>
															<td class="infor_order_title_product"><img
																src="${pageContext.request.contextPath }/resource/images/product/${cart.product.images.get(i).getImageUrl()}"
																style="width: 100px; height: 100px">
																<p style="margin-left: 5px">${cart.product.name }</p></td>
															<td class="infor_order_title_quantity">${cart.quantity }
																cái</td>
															<td class="infor_order_title_price"><fmt:formatNumber
																	value="${cart.product.price}" type="number" /> đ</td>
														</tr>
														<br>
														<tr>
															<td colspan="3"></td>
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
													<tr class="tr-content-order-total"
														style="padding-bottom: 5px">
														<!-- 										<td><span class="ship_item_span">Phí ship</span></td>
                                                <td colspan="2"><span class="ship_item_span">15,000đ</span></td> -->
													</tr>
													<tr class="tr-content-order-total tr-total-payment">
														<td><label>Tổng tiền</label>
														<td><label style="font-size: 20px"><fmt:formatNumber
																	value="${s}" type="number" /> đ</label></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<button class="btn btn-danger review_item" id="review_item_toggle"
							data-toggle="modal" data-target="#myModal" style="margin-left: 15px">Xác nhận</button>
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content-review">
									<div class="modal-header">
										<div class="alert alert-success">
											<strong>Thông báo!</strong> Để đảm bảo chắc chắn việc quý
											khách hàng đặt mua sản phẩm tại hệ thống. Xin vui lòng xác
											nhận lại một lần nữa.Xin cảm ơn và mong nhận được tất cả sự
											thông cảm từ quý khách hàng.Chúc một ngày mua hàng thoải mái
											và tốt lành
										</div>
									</div>
									<div class="modal-body">
										<c:forEach var="cart" items="${carts }" varStatus="cartCount">
											<div class="col-sm-3">
												<div class="cart_modal_img">
													<img alt=""
														src="${pageContext.request.contextPath }/resource/images/product/${cart.product.images.get(i).imageUrl}">
												</div>
											</div>
											<div class="col-sm-9">
												<div class="row">
													<div class="col-sm-3">
														<label>Tên sản phẩm</label>
														<p>${cart.product.name}</p>
													</div>
													<div class="col-sm-3">
														<label>Số lượng</label>
														<p>${cart.quantity }cái</p>

													</div>
													<div class="col-sm-3">
														<label>Giá</label>
														<p>
															<fmt:formatNumber value="${cart.product.price}"
																type="number" />
															đ
														</p>
													</div>
													<div class="col-sm-3">
														<label>Thành tiền</label>
														<p>
															<fmt:formatNumber
																value="${cart.product.price * cart.quantity}"
																type="number" />
															đ
														</p>
													</div>
												</div>
											</div>
										</c:forEach>
										<button type="submit" class="btn btn-danger btn-modal-comment">Xác
											nhận tại đây</button>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											data-dismiss="modal" style="border-radius: 0">X</button>
									</div>
								</div>

							</div>
						</div>
					</div>
				</form:form>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<!-- END CONTENT -->