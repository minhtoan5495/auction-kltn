<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  CONTENT -->
<div class="page_checkout_success">
	<div class="container no-padding">
		<div class="checkout_success_title">
			<div class="checkout_success_title_item">
				<img alt=""
					src="${pageContext.request.contextPath }/resource/css/images/icon-title.png">
			</div>
			<div class="checkout_success_title_item">
				<a href="#" class="checkout_success_title_item_link">Home<i
					class="glyphicon glyphicon-chevron-right"></i></a>
			</div>
			<div class="checkout_success_title_item">
				<a href="#" class="checkout_success_title_item_link">Đặt hàng <i
					class="glyphicon glyphicon-chevron-right"></i></a>
			</div>
			<div class="checkout_success_title_item">
				<a href="#" class="checkout_success_title_item_link">Đặt hàng
					thành công</a>
			</div>
		</div>
		<div class="checkout_success_heading">
			<h3>Đơn hàng của quý khách đã được đặt thành công. Chúng tôi sẽ
				xác nhận đơn hàng và dự kiến sẽ giao hàng trong khoảng thời gian từ
				3-5 ngày..Mong quý khách thông cảm và tiếp tục ủng hộ hệ thống của
				chúng tôi</h3>
		</div>
		<div class="checkout_success_notification">
			<h4>Thủ tục thanh toán đơn hàng</h4>
			<p>1.Hệ thống sẽ không gửi tin nhắn xác nhận đơn hàng đến quý
				khách.Nếu có nhu cầu xem lại đơn hàng thì kiểm tra xác nhận trong
				hàm thư email</p>
			<p>2.Thông tin giao hàng sẽ được chúng tôi cập nhật qua email và
				số điện thoại.Có thể kiểm tra đơn hàng tại...</p>
			<p>3.Nếu có vấn đề gì thì quý khách có thể hủy đơn hàng hoặc xem
				hướng dẫn tại...</p>
			<p>4.Quý khách có thể gửi ý kiến phản hồi, khiếu nại hay cảm ơn
				thì vui lòng ghé tại đây...</p>
			<strong>Lưu ý:
				<p>Đơn hàng có thể sớm hoặc trễ hơn..Hãy giữ liên lạc và thông
					cảm</p>
			</strong>
		</div>
		<div class="checkout_success_detail_order">
			<label class="checkout_success_detail_order_name">Chi tiết
				đơn hàng , bao gồm  sản phẩm
				được đặt </label><br> 
			<strong>Tên khách hàng: ${pageContext.request.userPrincipal.name}</strong>
			<p>Đường: ${addShip.address }</p>
		<%-- 	<p class="checkout_success_detail_order_item_district">Quận:
				${addShip.district.districtName }</p>
				<p class="checkout_success_detail_order_item_district">Quận:
				${addShip.city.cityName }</p> --%>
		<c:forEach var="cart" items="${cart }">
		<c:set var="s" value="${s+cart.product.price*cart.quantity }"></c:set>
			<div class="checkout_success_detail_order_product">
				<img
					src="${pageContext.request.contextPath }/resource/images/banner/${cart.product.images.get(i).getImageUrl()}">
				<label class="checkout_success_detail_order_product_name">${cart.product.name}
				<p style="color: black">Số lượng:${cart.quantity } cái</p>
				</label>
				 <label class="checkout_success_detail_order_delivery">Giao hàng từ
					thứ Bảy ngày 8 đến thứ 3 ngày 11 Tháng 4 năm 201</label>
				<div class="checkout_success_detail_order_price pull-right">
					<label><fmt:formatNumber value="${cart.quantity * cart.product.price}" type="number" />đ</label>
					<p>
						<strike>700,000đ</strike>
					</p>
					<p style="color: rgba(255, 0, 0, 0.74); margin-top: -10px">Tiết
						kiệm 50%</p>
				</div>
			</div>
				</c:forEach>
			<div class="checkout_success_detail_order_product_total pull-right">
				<p class="checkout_title_item">Tạm tính</p>
				<p class="checkout_price_item"><fmt:formatNumber value="${s}" type="number" />đ</p>
				<p class="checkout_title_item"
					style="color: #0ca70e; font-weight: bold;">Phí ship</p>
				<p class="checkout_price_item" style="color: #0ca70e; ">15,000đ</p>
				<p class="checkout_title_item" style="font-weight: bold;color: gray;    margin-left: -170px;">Tổng tiền thanh toán</p>
				<p class="checkout_price_item"><fmt:formatNumber value="${s}" type="number" />đ</p>
			</div>
		</div>
	</div>
</div>
<!--  END CONTENT -->