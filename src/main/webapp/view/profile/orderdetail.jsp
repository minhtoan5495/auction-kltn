<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="tab-content main_content_profile">
	<div id="home" class="tab-pane fade in active" style="margin-top: 10px">
		<h4>Chi tiết đơn hàng</h4>
		<div class="row content_main_profile_order">
			<div class="col-sm-4">
				<div class="profile_info_item_order">
					<h4>Đơn hàng ${invoice.idinvoicedetail }</h4>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="profile_info_item_order">
					<h4>Đặt ngày <fmt:formatDate value="${invoice.createdate }"
								pattern="dd-MM-yyyy" /></h4>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="profile_info_item_order">
					<h4>Tổng tiền thanh toán <fmt:formatNumber value="${invoice.totalprice}"
										type="number" /> đ</h4>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12 content_main_profile_order_detail">
				<div class="panel panel-default profile_order_item">
					<div class="panel-heading profile_order_item_header">
						<i class="fa fa-gift"></i> Đơn hàng 1
					</div>
					<div class="panel-body profile_order_item_body">
						<p style="margin-left: 10px;"><i class="glyphicon glyphicon-calendar"></i>Hình thức giao hàng bình thường</p>
						<p style="color: #59b210">Ngày giao hàng ngày 12/12/2012</p>
					</div>
					<div class="row">
						<div class="col-sm-2">
						</div>
						<div class="col-sm-9">
							<div class="profile_order_item_check">
								<p>Ngày <fmt:formatDate value="${invoice.createdate }"
								pattern="dd-MM-yyyy" /></p>
								<p style="margin-left: 20px">Đơn hàng đã được đặt thành công và được hệ thống xác nhận thông</p>
							</div>
						</div>
						<div class="col-sm-1">
						</div>
					</div>
					<div class="row profile_order_item_body_info">
					<div class="col-sm-12">
						<table class="tbl_order_item_body_info">
							<tbody>
								<tr>
									<td>
										<img alt="" src="${pageContext.request.contextPath }/resource/images/banner/${invoice.product.image}" style="width:100px ">
									</td>
									<td>
										${invoice.product.name}
									</td>
									<td>
										${invoice.quantity }
									</td>
									<td>
									 <fmt:formatNumber value="${invoice.product.price}"
										type="number" /> đ
									</td>
										<td>
										<button class="btn-status-order">Hủy đơn hàng</button>
									</td>
								</tr>
							</tbody>
						</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>