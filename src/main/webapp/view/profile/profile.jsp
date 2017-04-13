
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="tab-content main_content_profile">
	<div id="home" class="tab-pane fade in active" style="margin-top: 10px">
		<h4>Quản lý tài khoản</h4>
		<div class="row">
			<div class="col-sm-4">
				<div class="profile_info_item">
					<h4>Thông tin cá nhân</h4>
					<p>maison</p>
					<p>Sonmv.itedu@gmail.com</p>
					<p>01665102292</p>
					<a href="#">Thay đổi mật khẩu</a><br> <a href="#">Thay đổi
						Email</a>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="profile_info_item">
					<h4>Thông tin địa chỉ giao hàng</h4>
					<p>Mai Văn Sơn</p>
					<p>181 H17/A Phan Thanh-Đà Nẵng</p>
					<p>Thanh Khê-Thạc Gián-Đà Nẵng</p>
					<button class="btn btn-danger btn-edit-profile">
						<i class="fa fa-edit"></i> Cập nhật thông tin
					</button>
					<br>
					<p></p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="profile_info_item">
					<h4>Thông tin địa chỉ thanh toán</h4>
					<p>Mai Văn Sơn</p>
					<p>181 H17/A Phan Thanh-Đà Nẵng</p>
					<p>Thanh Khê-Thạc Gián-Đà Nẵng</p>
					<button class="btn btn-danger btn-edit-profile">
						<i class="fa fa-edit"></i> Cập nhật thông tin
					</button>
					<br>
					<p></p>
				</div>
			</div>
			<div class="col-sm-12 profile_item_order_home">
				<h4>Thông tin đơn hàng gần đây</h4>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Mã đơn hàng</th>
							<th>Ngày đặt hàng</th>
							<th>Thành tiền</th>
							<th>Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="invoice" items="${invoice }">
							<tr>
								<td>${invoice.idinvoicedetail }</td>
								<td><fmt:formatDate value="${invoice.createdate }"
										pattern="dd-MM-yyyy" /></td>
								<td><fmt:formatNumber value="${invoice.product.price}"
										type="number" /> đ</td>
								<td>Đang xử lý</td>
								<td class="btn_view_detail_order"><button class="btn btn-primary"
										style="border-radius: 0">
										<i class="fa fa-edit"></i>View
									</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div id="product_item" class="tab-pane fade">
		<div class="profile_item_title">
			<h3>Danh sách sản phẩm</h3>
		</div>
		<div class="panel panel-default profile_item_content">
			<div class="panel-heading">Thông tin sản phẩm</div>
			<div class="panel-body profile_body_item">
				<div class="row">
					<div class="col-sm-3">
						<img alt=""
							src="${pageContext.request.contextPath }/resource/images/banner/1.jpg">
					</div>
					<div class="col-sm-6">
						<label class="profile_body_item_name">Đồng hồ dây da
							SP01258425-MK01
							<p style="color: #59b210; font-weight: 400">Số lượng: 1 cái</p>
							<p style="color: #ff4f4f; font-weight: 400">Giá tiền:
								350,000đ</p>
							<p>Tình trạng sản phẩm</p>
							<button class="btn btn-success">Đã mua</button> <br> <strong>Đơn
								hàng đã được giao ngày 20 tháng 4 năm 2017</strong>
							<button class="btn btn-success">Xem chi tiết đơn hàng</button>
						</label>
					</div>
					<div class="col-sm-3 profile_feedback_product">
						<label>Thông tin phản hồi</label>
						<p>Nếu sản phẩm gặp lỗi về kỹ thuật hoặc sản phẩm không đúng
							mô tả quý khách có thể phản hồi hoặc gửi trả sản phẩm trong vòng
							48h kể từ khi nhận hàng. Nếu qua thời gian đó sản phẩm có gặp bất
							kỳ vấn đề gì chúng tôi sẽ không giải quyết. Mong quý khách thông
							cảm!!</p>
						<button class="btn btn-danger">
							<i class="fa fa-phone"></i> Contact Us
						</button>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<img alt=""
							src="${pageContext.request.contextPath }/resource/images/banner/2.jpg">
					</div>
					<div class="col-sm-6">
						<label class="profile_body_item_name">Đồng hồ dây da
							SP01258425-MK01
							<p style="color: #59b210; font-weight: 400">Số lượng: 1 cái</p>
							<p style="color: #ff4f4f; font-weight: 400">Giá tiền:
								350,000đ</p>
							<p>Tình trạng sản phẩm</p>
							<button class="btn btn-success">Đã mua</button> <br> <strong>Đơn
								hàng đã được giao ngày 20 tháng 4 năm 2017</strong>
							<button class="btn btn-success">Xem chi tiết đơn hàng</button>
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="tab-pane fade" id="order_item">
		<div class="profile_item_title">
			<h3>Danh sách đơn hàng</h3>
		</div>
		<c:forEach var="invoice" items="${invoice }">
			<div class="panel panel-default profile_body_item_order">
				<div class="panel-heading profile_heading_main_item">
					<div class="profile_heading_date">
						<p>Đơn hàng ${invoice.idinvoicedetail }</p>
						<p>
							Đặt hàng ngày
							<fmt:formatDate value="${invoice.createdate }"
								pattern="dd-MM-yyyy" />
						</p>
					</div>
					<div class="profile_heading_manager">
						<a href="${pageContext.request.contextPath }/orderdetail?id=${invoice.idinvoicedetail}"><button class="btn_profile_heading_manager">
							<i class="fa fa-edit"></i>Quản lý đơn hàng
						</button></a>
					</div>
				</div>
				<div class="panel-body">
					<div class="profile_order_item_detail">
						<div class="row">
							<div class="col-sm-1" style="width: 0.333333%"></div>
							<div class="col-sm-4" style="width: 20.33333%">
								<img alt=""
									src="${pageContext.request.contextPath }/resource/images/banner/${invoice.product.image}"
									style="width: 100px">
							</div>
							<div class="col-sm-6">
								<p>${invoice.product.name }</p>
								<button class="btn btn-primary btn-status-order">Đang
									xử lý</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>