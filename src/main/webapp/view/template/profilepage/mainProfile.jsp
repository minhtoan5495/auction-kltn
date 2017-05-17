<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title><tiles:getAsString name="title" /></title>
<title><tiles:getAsString name="title" /></title>
<link rel="shortcut icon" href="resource/css/images/icon-title.png">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="${pageContext.request.contextPath }/resource/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resource/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resource/css/owl.carousel.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resource/css/responsive.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/resource/css/main12.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resource/css/profile.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/resource/css/cart.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resource/css/submenu_v2.css"
	rel="stylesheet">

</head>
<body>
	<header>
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</header>
	<div class="content-page"
		style="background: rgba(238, 238, 238, 0.48);">
		<div class="container">
			<div class="row">
				<div class="content-page-profile">
					<div class="row">
						<aside class="col-sm-3">
							<div class="profile-avarta">
								<div class="profile-image">
									<img alt=""
										src="http://bootdey.com/img/Content/avatar/avatar1.png">
								</div>
								<div class="profile-infor">
									<label>Thông tin cá nhân</label>
									<p>
										<strong>Họ và tên</strong>: ${user.name}
									</p>
									<p>
										<strong>Email</strong>: ${user.email }
									</p>
									<c:if test="${not empty user.address}">
										<p>
											<strong>Địa chỉ</strong>: ${user.address }
										</p>
									</c:if>
									<c:if test="${not empty user.district}">
										<p>
											<strong>Quận</strong>: ${user.district.districtName }
										</p>
									</c:if>
									<c:if test="${not empty user.city}">
										<p>
											<strong>Thành phố</strong>: ${user.city.cityName }
										</p>
									</c:if>
									<p>
										<strong>Số điện thoại</strong>: ${user.phone }
									</p>
									<p>
										<strong>Ngày sinh</strong>:
										<fmt:formatDate value="${user.birthday }" pattern="dd-MM-yyyy" />
									</p>
								</div>
							</div>
						</aside>
						<div class="col-sm-9" id="profile_scoll_item">
							<div>
								<ul id="profile-infor-detail" class="nav nav-tabs profile-tab">
									<li class="active"><a href="#home" data-toggle="tab">Tất
											cả</a></li>
									<li><a data-toggle="tab" href="#product_item">Danh
											sách đã mua</a></li>
									<li><a data-toggle="tab" href="#auction_item">Đang đấu
											giá</a></li>
									<li><a data-toggle="tab" href="#auction_success">Đấu
											giá thành công</a></li>
									<li><a data-toggle="tab" href="#order_item">Tình trạng
											đơn hàng</a></li>
								</ul>
							</div>
							<tiles:insertAttribute name="body"></tiles:insertAttribute>
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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resource/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"
	type="text/javascript"></script>
<!-- Include Date Range Picker -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
<script>
	function loadDistrict() {
		var cityId = $('#cityId').val();
		$.ajax({
			type : 'GET',
			url : '/getDistrict',
			data : "cityId=" + cityId,
			success : function(response) {
				var select = $('#districtId');
				select.find('option').remove();
				$.each(response, function(index, value) {
					$('<option>').val(value.districtId)
							.text(value.districtName).appendTo(select);
				});
			}
		});
	}

	jQuery(function($) {
		$(".date").mask("99/99/9999");
	});

	$(document).ready(
			function() {
				var date_input = $('input[name="date"]'); //our date input has the name "date"
				var container = $('.bootstrap-iso form').length > 0 ? $(
						'.bootstrap-iso form').parent() : "body";
				date_input.datepicker({
					format : 'yyyy-mm-dd',
					container : container,
					todayHighlight : true,
					autoclose : true,
				})
			})

	function validate() {
		var element = document.getElementById('phone');
		element.value = element.value.replace(/[^0-9+()]+/, '');
	};
</script>
</html>