<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section id="main-content">
	<section class="wrapper">
		<!-- page start-->
		<section class="panel">
			<header class="panel-heading"> Invoice Details </header>
			<div class="panel-body">
				<div class="adv-table">
					<div class="btn-group"></div>
					<div class="row">
						<div class="col-sm-6">
							<div class="panel panel-primary manage-invoice-detail">
								<div class="panel-heading" style="background-color: #2a3542">
									Thông tin khách hàng</div>
								<div class="panel-body ">
									<p>Tên khách hàng:${user.name }</p>
									<p>Địa chỉ:${user.address }</p>
									<p>Số điện thoại:${user.phone }</p>
									<p>Quận: ${user.city.cityName }</p>
									<p>Huyện:${user.district.districtName }</p>
									<p>
										Ngày mua hàng
										<fmt:formatDate value="${invoice.createDate }"
											pattern="dd-MM-yyyy" />
									</p>
									<p>
										Ngày giao hàng
										<fmt:formatDate value="${invoice.shipDate }"
											pattern="dd-MM-yyyy" />
									</p>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="panel panel-primary manage-invoice-detail">
								<div class="panel-heading" style="background-color: #2a3542">
									Thông tin địa chỉ giao hàng</div>
								<div class="panel-body ">
									<p>Địa chỉ cụ thể:${invoice.shippingInfos.get(i).address }</p>
									<p>Quận: ${invoice.shippingInfos.get(i).city.cityName }</p>
									<p>Huyện:${invoice.shippingInfos.get(i).district.districtName }
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="panel panel-primary manage-invoice-detail">
								<div class="panel-heading" style="background-color: #2a3542">
									Chi tiết hóa đơn</div>
								<div class="panel-body ">
									<table cellpadding="0" cellspacing="0" border="0"
										class="display table table-bordered">
										<thead>
											<tr>
												<th>Product Image</th>
												<th>Product Name</th>
												<th>Quantity</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<tr class="gradeX">
												<td><a
													href="${pageContext.request.contextPath}/admin/detailProduct?productId=${product.productId}"><img
														src="${pageContext.request.contextPath}/resource/images/product/${invoice.invoiceDetails.get(i).getProduct().getImages().get(i).getImageUrl()}"
														style="width: 80px; height: 80px" /></a></td>
												<td>${invoice.invoiceDetails.get(i).getProduct().getName()}</td>
												<td>${invoice.invoiceDetails.get(i).getQuantity()}</td>
												<td><fmt:formatNumber
														value="${invoice.invoiceDetails.get(i).getPrice()}"
														type="number" />đ</td>
											</tr>
										</tbody>
									</table>
									<div class="manage-detail-invoice-status">
										<label>Tình trạng đơn hàng</label><br>
										<button class="btn-manage-invoice-status">${invoice.invoiceStatus.invoiceStatusName }</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- page end-->
	</section>
</section>