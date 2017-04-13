<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<title><tiles:getAsString name="title" /></title>
<title><tiles:getAsString name="title" /></title><link rel="shortcut icon" href="resource/css/images/icon-title.png">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="resource/css/bootstrap.min.css" rel="stylesheet">
    <link href="resource/css/font-awesome.min.css" rel="stylesheet">
    <link href="resource/css/owl.carousel.css" rel="stylesheet">
    <link href="resource/css/responsive.css" rel="stylesheet">
    <link href="resource/css/main12.css" rel="stylesheet">
    <link href="resource/css/detail.css" rel="stylesheet">
    <link href="resource/css/checkoutsuccess.css" rel="stylesheet">
    <link href="resource/css/profile.css" rel="stylesheet">
    <link href="resource/css/cart.css" rel="stylesheet">
    <link href="resource/css/checkout.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/submenu_v2.css" rel="stylesheet">

</head>
<body>
	<header>
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</header>
	<div class="content-page" style="background: rgba(238, 238, 238, 0.48);">
	<div class="container">
		<div class="row">
			<div class="content-page-profile">
				<div class="row">
					<aside class="col-sm-3">
						<div class="profile-avarta">
							<div class="profile-image">
								<img alt="" src="resource/images/avatar/avatar.png">
							</div>
							<div class="profile-infor">
								<p class="profile-infor-name" style="text-align: center;">${user.username }</p>
								<label>Thông tin cá nhân</label>
								<p>
									<strong>Họ và tên</strong>:${user.firstname} ${user.lastname }
								</p>
								<p>
									<strong>Email</strong>:${user.email }
								</p>
								<p>
									<strong>Địa chỉ</strong>:${user.address }
								</p>
								<p>
									<strong>Số điện thoại</strong>:${user.phone }
								</p>
								<button class="btn btn-danger btn-edit-profile">
									<i class="fa fa-edit"></i> Cập nhật thông tin
								</button>
							</div>
						</div>
					</aside>
					<div class="col-sm-9" id="profile_scoll_item">
						<div>
							<ul id="profile-infor-detail" class="nav nav-tabs profile-tab">
								<li class="active"><a href="#home" data-toggle="tab">Tất
										cả</a></li>
								<li><a data-toggle="tab" href="#product_item">Danh sách
										đã mua</a></li>
								<li><a data-toggle="tab" href="#auction_item">Đang đấu
										giá</a></li>
								<li><a data-toggle="tab" href="#auction_success">Đấu
										giá thành công</a></li>
								<li><a data-toggle="tab" href="#order_item">Tình trạng
										đơn hàng</a></li>
							</ul>
							<tiles:insertAttribute name="body"></tiles:insertAttribute>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<footer style="margin-top: 20px;">
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</footer>
</body>
<script src="resource/js/jquery-1.8.3.min.js"></script>
<script src="resource/js/bootstrap.min.js"></script>
<script src="resource/js/photoZoom.min.js"></script>
<script src="resource/js/customer.js"></script>
</html>