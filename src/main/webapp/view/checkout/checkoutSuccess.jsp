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
		<div class="checkout_success_notification">
			<img alt="" src="${pageContext.request.contextPath }/resource/images/banner/congrulation.png">
		</div>
	</div>
</div>
<!--  END CONTENT -->