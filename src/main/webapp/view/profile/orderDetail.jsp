<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
                                                                         pattern="dd-MM-yyyy"/></h4>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="profile_info_item_order">
                                            <h4>Tổng tiền thanh toán <fmt:formatNumber value="${invoices.invoiceDetails.get(i).getPrice()}"
                                                                                       type="number"/> đ</h4>
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
                                                <p style="margin-left: 10px;"><i class="glyphicon glyphicon-calendar"></i>Hình thức giao hàng
                                                    bình thường</p>
                                                <p style="color: #59b210">Ngày giao hàng <fmt:formatDate value="${invoices.shipDate }"
                                                                                                         pattern="dd-MM-yyyy"/></p>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-1">
                                                </div>
                                                <div class="col-sm-10">
                                                    <c:choose>
                                                        <c:when test="${invoices.invoiceStatus.invoiceStatusId ==4}">
                                                            <div class="profile_order_item_check" style="background: rgba(255, 255, 0, 0.43)">
                                                                <p>Ngày <fmt:formatDate value="${invoices.createDate }"
                                                                                        pattern="dd-MM-yyyy"/></p>
                                                                <p style="margin-left: 20px">Đơn hàng đã được hủy vì một vài lí do nào đó và
                                                                    được hệ thống xác nhận.
                                                                    Mong quý khách thông cảm vì sản phẩm ko được ưng ý, chúng tôi sẽ xem xét để
                                                                    đưa ra các sản phẩm và dịch vụ tốt nhất
                                                                    Một lần nữa chúng tôi xin lỗi và mong quý khách thông cảm
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="profile_order_item_check">
                                                                <p>Ngày <fmt:formatDate value="${invoices.createDate }"
                                                                                        pattern="dd-MM-yyyy"/></p>
                                                                <p style="margin-left: 20px">Đơn hàng đã được đặt thành công và được hệ thống
                                                                    xác nhận</p>
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
                                                            <form:form action="${pageContext.request.contextPath}/orderDetail">
                                                                <td>
                                                                    <img alt=""
                                                                         src="${pageContext.request.contextPath }/resource/images/product/${invoices.invoiceDetails.get(i).getProduct().getImages().get(i).getImageUrl()}"
                                                                         style="width:100px ">
                                                                </td>
                                                                <td>
                                                                        ${invoices.invoiceDetails.get(i).getProduct().getName()}
                                                                </td>
                                                                <td>
                                                                        ${invoices.invoiceDetails.get(i).getQuantity() }
                                                                </td>
                                                                <td>
                                                                    <fmt:formatNumber
                                                                            value="${invoices.invoiceDetails.get(i).getProduct().getPrice()}"
                                                                            type="number"/> đ
                                                                </td>
                                                            </form:form>
                                                            <c:choose>
                                                                <c:when test="${invoices.invoiceStatus.invoiceStatusId == 4}">
                                                                    <a href="${pageContext.request.contextPath }/cancelOrder?invoiceId=${invoices.invoiceId}"
                                                                       style="display: none">
                                                                        <button class="btn-status-order">${invoices.invoiceStatus.invoiceStatusName }</button>
                                                                    </a>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td>
                                                                        <a href="${pageContext.request.contextPath }/cancelOrder?invoiceId=${invoices.invoiceId}">
                                                                            <button class="btn-status-order">${invoices.invoiceStatus.invoiceStatusName }</button>
                                                                        </a>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>