<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--HEADER-->
<div class="header_top_bg">
	<div class="container no-padding">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-3"></div>
			<div class="col-sm-7 col-xs-4 header_account_reponsive">
				<div class="header_top_account pull-right">
					<ul class="nav nav-pills">
						<c:if test="${pageContext.request.userPrincipal.name !=null }">
								<div class="header_top_account">
								<div class="header_login_top pull-right">
									<a href="#"
										class="header_login_link"><i class="fa fa-lock"></i>Chăm sóc khách hàng
										</a>
								</div>
								<div class="header_login_top pull-right">
									<a href="#"
										class="header_login_link"><i class="fa fa-lock"></i>Kiểm tra đơn hàng
										</a>
								</div>
									<div class="header_login_top pull-right">
									<a href="${pageContext.request.contextPath}/viewCart"
										class="header_login_link"><i class="fa fa-lock"></i>Xem giỏ hàng</a>
								</div>
							</div>
							<div class="header_login pull-right">
								<a href="${pageContext.request.contextPath }/profile"
									class="header_login_link">Chào
									${pageContext.request.userPrincipal.name}</a>

								<li class="dropdown"><a href="#"
									class="dropdown-toggle user_avat_toggle" data-toggle="dropdown">
										<img alt="" src="resource/images/avatar/google_avatar.png"
										height="27" width="27" data-ytimg="1" onload=";__ytRIL(this)"
										aria-hidden="true"
										style="margin-top: -46px; margin-left: -6px"> <!--  <b class="caret"></b> -->
								</a>
									<ul class="dropdown-menu item-settings">
										<security:authorize access="isAuthenticated()">
											<li
												class="${current=='profile' ? 'active' : ''} personal-setting"><a
												class="personal-profile"
												href="${pageContext.request.contextPath }/profile">Trang
													cá nhân</a></li>
										</security:authorize>
										<li class="personal-setting"><a class="personal-profile"
											href=""> Cài đặt</a></li>
										<li><form id="logoutForm" method="POST"
												action="${pageContext.request.contextPath}/logout">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" />
											</form></li>
										<li class="personal-setting"><a class="personal-profile"
											onclick="document.forms['logoutForm'].submit()">Đăng xuất</a></li>
									</ul></li>
							</div>
						</c:if>
						<c:if test="${pageContext.request.userPrincipal.name ==null }">
							<div class="header_top_account">
								<div class="header_login_top pull-right">
									<a href="${pageContext.request.contextPath}/login"
										class="header_login_link"><i class="fa fa-user"></i>Đăng
										nhập</a>
								</div>
								<div class="header_login_top pull-right">
									<a href="${pageContext.request.contextPath}/register"
										class="header_login_link"><i class="fa fa-user"></i>Đăng
										ký</a>
								</div>
									<div class="header_login_top pull-right">
									<a href="${pageContext.request.contextPath}/viewCart"
										class="header_login_link"><i class="glyphicon glyphicon-shopping-cart"></i>Xem giỏ hàng</a>
								</div>
								<div class="header_login_top pull-right hidden-xs">
									<a href="#"
										class="header_login_link"><i class="glyphicon glyphicon-pencil"></i>Kiểm tra đơn hàng</a>
								</div>
							</div>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<section class="header_middle">
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<div class="header_logo">
					<a href="${pageContext.request.contextPath }/home"><img
						src="${pageContext.request.contextPath }/resource/images/logo/int-logo.png"></a>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="header_search">
					<form action="${pageContext.request.contextPath }/searchname">
						<div class="input-group input_find">
							<input type="text" class="form-control"
								placeholder="Search for..." name="name" style="height: 38px"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="submit" style="height: 38px">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</span>
						</div>
					</form>
				</div>
			</div>
			<div class="col-sm-3 hidden-xs">
				<div class="header_middle_item pull-right">
					<div class="header_middle_cart" id="header_middle_cart">
						<a href="#" class="cart_link" data-toggle="modal"
							data-target="#myCart"> <i
							class="fa fa-shopping-cart cart-icon"></i> <b>Giỏ hàng</b> <c:if
								test="${not empty carts }">
								<span class="cart_quantity">${carts.size() }</span>
							</c:if>
						</a>

					</div>
					<c:if test="${not empty carts }">
						<c:set var="sum"
							value="${sum +carts.get(i).getProduct().getPrice()+carts.get(i).getQuantity() }"></c:set>
						<div class="modal fade" id="myCart" role="dialog">
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">

										<div class="row">
											<div class="col-sm-6">
												<h4 class="modal-title">
													<i class="glyphicon glyphicon-ok-circle"></i>Bạn vừa thêm 1
													sản phẩm vào giỏ hàng của bạn
												</h4>
											</div>
											<div class="col-sm-6">
												<h4 style="margin-top: 0px">
													Xem giỏ hàng (${ carts.size()} sản phẩm)<a
														href="${pageContext.request.contextPath }/viewCart"><i
														class="fa fa-edit"
														style="margin-left: 10px; font-size: 20px; color: #11252f"></i></a>
												</h4>
												<div class="row">
													<div class="col-sm-6">
														<label>Tạm tính</label>
													</div>
													<div class="col-sm-3"></div>
													<div class="col-sm-3">
														<p>
															<fmt:formatNumber value="${sum}" type="number" />
															đ
														</p>
													</div>
												</div>
											</div>
										</div>

									</div>
									<c:set var="i" value="${fn:length(carts)}"></c:set>
									<c:forEach var="cart" items="${carts }" varStatus="cartCount">
										<c:set var="s" value="${s+cart.product.price*cart.quantity }"></c:set>
										<c:if test="${ cartCount.count > (i-1)}">
											<div class="row modal-body-cart-header">
												<div class="col-sm-6">
													<div class="cart_modal_img">
														<img alt=""
															src="${pageContext.request.contextPath }/resource/images/product/${cart.product.image}">
													</div>
													<div class="cart_modal_info">
														<p>${cart.product.name}</p>
														<p>${cart.product.description }</p>
														<p>${cart.quantity }cái</p>
														<label><fmt:formatNumber
																value="${cart.product.price}" type="number" />đ</label>
													</div>
												</div>

												<div class="col-sm-6">
													<div class="row">
														<div class="col-sm-6">
															<label>Thành tiền
																<p style="font-weight: normal;">(Số tiền thanh toán)</p>
															</label>
														</div>
														<div class="col-sm-3"></div>
														<div class="col-sm-3">
															<p>
																<fmt:formatNumber value="${s}" type="number" />
																đ
															</p>
														</div>
													</div>
													<div class="row">
														<div class="col-sm-6" style="margin-top: 10px">
															<a href="${pageContext.request.contextPath }/home"
																style="text-decoration: none">TIẾP TỤC MUA HÀNG</a>
														</div>
														<div class="col-sm-6">
															<a href="${pageContext.request.contextPath }/home"><button
																	class="btn btn-primary"
																	style="border-radius: 0; margin-left: -5px;">TIẾN
																	HÀNH ĐẶT HÀNG</button></a>
														</div>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											data-dismiss="modal" style="border-radius: 0">X</button>
									</div>
								</div>

							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</section>

<div class="header_menu_bg" id="header_scroll_main">
	<div class="container no-padding">
		<div class="main_menu_bg">
			<div class="main_menu_item">
				<a href="#" class="main_menu_item_active">Home</a>
			</div>
			<div class="main_menu_item">
				<a href="#" class="main_menu_item_link">Công nghệ<span
					class="laptop_item">Laptop</span></a>
			</div>
			<div class="main_menu_item" id="main_menu">
				<a href="#" class="main_menu_item_link">Thời trang<span
					class="fashion_item">Thời trang</span></a>
				<div class="sub_menu_bg hidden-xs" id="show_main_menu">
					<div class="sub_menu_col">
						<a href="#" class="sub_menu_col_title">Thời trang nam</a> <a
							href="#" class="sub_menu_col_item"><span>Áo sơ mi nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo thun nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo body nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo khoác
								nam</span></a>
					</div>
					<div class="sub_menu_col">
						<a href="#" class="sub_menu_col_title">Thời trang nam</a> <a
							href="#" class="sub_menu_col_item"><span>Áo sơ mi nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo thun nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo body nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo khoác
								nam</span></a>
					</div>
					<div class="sub_menu_col">
						<a href="#" class="sub_menu_col_title">Thời trang nam</a> <a
							href="#" class="sub_menu_col_item"><span>Áo sơ mi nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo thun nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo body nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo khoác
								nam</span></a>
					</div>
				</div>
			</div>
			<div class="main_menu_item">
				<a href="#" class="main_menu_item_link">Đồng hồ<span
					class="watch_item">Đồng hồ</span></a>
			</div>
			<div class="main_menu_item" id="main_menu1">
				<a href="#" class="main_menu_item_link">Giày dép<span
					class="shoe_item">Giày dép</span></a>
				<div class="sub_menu_bg hidden-xs" id="show_main_menu1">
					<div class="sub_menu_col">
						<a href="#" class="sub_menu_col_title">Thời trang nam</a> <a
							href="#" class="sub_menu_col_item"><span>Áo sơ mi nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo thun nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo body nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo khoác
								nam</span></a>
					</div>
					<div class="sub_menu_col">
						<a href="#" class="sub_menu_col_title">Thời trang nam</a> <a
							href="#" class="sub_menu_col_item"><span>Áo sơ mi nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo thun nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo body nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo khoác
								nam</span></a>
					</div>
					<div class="sub_menu_col">
						<a href="#" class="sub_menu_col_title">Thời trang nam</a> <a
							href="#" class="sub_menu_col_item"><span>Áo sơ mi nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo thun nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo body nam</span></a>
						<a href="#" class="sub_menu_col_item"><span>Áo khoác
								nam</span></a>
					</div>
				</div>
			</div>
			<div class="main_menu_item">
				<a href="#" class="main_menu_item_link">Sắc đẹp<span
					class="beauty_item">Sắc đẹp</span></a>
			</div>
			<div class="main_menu_item">
				<a href="#" class="main_menu_item_link">Trang sức<span
					class="jewelry_item">Trang sức</span></a>
			</div>
			<div class="main_menu_item">
				<a href="#" class="main_menu_item_link">Trẻ em<span
					class="child_item">Trẻ em</span></a>
			</div>
			<div class="main_menu_item">
				<a href="#" class="main_menu_item_link">Liên hệ<span
					class="contact_item">Liên hệ</span></a>
			</div>
		</div>
	</div>
	<a href="#" id="pull" class="menu_reponsive">Menu</a>
</div>
<!--    END HEADER-->