<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!--HEADER-->
<div class="header_top_bg">
	<div class="container no-padding">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-6"></div>
			<div class="col-sm-4 header_account_reponsive">
				<div class="header_top_account pull-right">
					<ul class="nav nav-pills">
						<c:if test="${pageContext.request.userPrincipal.name !=null }">
							<li class="check_order"><a href="#" class="check_order_link">Kiểm
									tra đơn hàng</a></li>
							<li class="personal-setting"><a
								href="${pageContext.request.contextPath }/profile"
								class="personal-profile">Chào
									${pageContext.request.userPrincipal.name}</a></li>
							<li class="dropdown"><a href="#"
								class="dropdown-toggle user_avat_toggle" data-toggle="dropdown">
									<img alt="" src="resource/images/avatar/google_avatar.png"
									height="27" width="27" data-ytimg="1" onload=";__ytRIL(this)"
									aria-hidden="true"> <!--  <b class="caret"></b> -->
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
						</c:if>
						<c:if test="${pageContext.request.userPrincipal.name ==null }">
							<div class="header_top_account">
								<div class="header_login_top pull-right">
									<a href="${pageContext.request.contextPath}/login"
										class="header_login_link"><i class="fa fa-lock"></i>Đăng
										nhập/Đăng ký</a>
								</div>
								<div class="header_login pull-right">
									<a href="#" class="header_login_link"><i class="fa fa-user"></i>Tài
										khoản của tôi</a>
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
								placeholder="Search for..." name="name"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="submit">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</span>
						</div>
					</form>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="header_middle_item pull-right">
					<div class="header_middle_cart" id="header_middle_cart">
						<a href="#" class="cart_link"> <i
							class="fa fa-shopping-cart cart-icon"></i> <b>Giỏ hàng</b> <span
							class="cart_quantity">5</span>
						</a>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<div class="container cart-toggle-header">
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div id="cart_toggle">
				<div class="main-content-cart">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Hình ảnh</th>
								<th>Mô tả</th>
								<th>Xóa</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="cart_toggle_img">
									<img alt="" src="${pageContext.request.contextPath }/resource/images/banner/1.jpg">
								</td>
								<td>Đồng hồ--350,000đ</td>
								<td class="del-cart-toggle"><a href="#">X</a></td>
							</tr>
						</tbody>
					</table>
					<button class="btn btn-success btn-view-cart-toggle">Xem giỏ hàng</button>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="header_menu_bg">
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
		</div>
	</div>
	<a href="#" id="pull" class="menu_reponsive">Menu</a>
</div>
<!--    END HEADER-->