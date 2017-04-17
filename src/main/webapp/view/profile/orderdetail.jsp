<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="tab-content main_content_profile">
	<div id="home" class="tab-pane fade in active" style="margin-top: 10px">
		<h4>Chi tiết đơn hàng</h4>
		<div class="row content_main_profile_order">
			<div class="col-sm-4">
				<div class="profile_info_item_order">
					<h4>Đơn hàng ${invoices.invoiceDetails.get(i).getInvoiceDetailId() }</h4>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="profile_info_item_order">
					<h4>Đặt ngày <fmt:formatDate value="${invoices.createDate }"
								pattern="dd-MM-yyyy" /></h4>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="profile_info_item_order">
					<h4>Tổng tiền thanh toán <fmt:formatNumber value="${invoices.invoiceDetails.get(i).getPrice()}"
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
						<p style="color: #59b210">Ngày giao hàng <fmt:formatDate value="${invoices.shipDate }"
								pattern="dd-MM-yyyy" /></p>
					</div>
					<div class="row">
						<div class="col-sm-1">
						</div>
						<div class="col-sm-10">
						<c:choose>
						<c:when test="${invoices.invoiceStatus.invoiceStatusId ==4}">
						<div class="profile_order_item_check">
								<p>Ngày <fmt:formatDate value="${invoices.createDate }"
								pattern="dd-MM-yyyy" /></p>
								<p style="margin-left: 20px">Đơn hàng đã được hủy vì một vài lí do nào đó và được hệ thống xác nhận.
Mong quý khách thông cảm vì sản phẩm ko được ưng ý, chúng tôi sẽ xem xét để đưa ra các sản phẩm và dịch vụ tốt nhất
								Một lần nữa chúng tôi xin lỗi và mong quý khách thông cảm
							</div>
						</c:when>
						<c:otherwise>
							<div class="profile_order_item_check">
								<p>Ngày <fmt:formatDate value="${invoices.createDate }"
								pattern="dd-MM-yyyy" /></p>
								<p style="margin-left: 20px">Đơn hàng đã được đặt thành công và được hệ thống xác nhận</p>
							</div>
							</c:otherwise>
						</c:choose>
						</div>
						<div class="col-sm-1">
						</div>
					</div>
					<div class="row profile_order_item_body_info">
					<div class="col-sm-12">
						
						<table class="tbl_order_item_body_info">
							<tbody>
								<tr>
								<form:form action="${pageContext.request.contextPath}/orderdetail">
									<td>
										<img alt="" src="${pageContext.request.contextPath }/resource/images/banner/${invoices.invoiceDetails.get(i).getProduct().getImages().get(i).getImageUrl()}" style="width:100px ">
									</td>
									<td>
										${invoices.invoiceDetails.get(i).getProduct().getName()}
									</td>
									<td>
										${invoices.invoiceDetails.get(i).getQuantity() }
									</td>
									<td>
									 <fmt:formatNumber value="${invoices.invoiceDetails.get(i).getProduct().getPrice()}"
										type="number" /> đ
									</td>
										</form:form>
										<c:choose>
										<c:when test="${invoices.invoiceStatus.invoiceStatusId ==4}">
										<a href="${pageContext.request.contextPath }/cancelOrder?invoiceId=${invoices.invoiceId}" style="display: none"><button class="btn-status-order">${invoices.invoiceStatus.invoiceStatusName }</button></a>
										</c:when>
										<c:otherwise>
										<td>
										<a href="${pageContext.request.contextPath }/cancelOrder?invoiceId=${invoices.invoiceId}"><button class="btn-status-order">${invoices.invoiceStatus.invoiceStatusName }</button></a>
									</td>
									</c:otherwise>
									</c:choose>
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