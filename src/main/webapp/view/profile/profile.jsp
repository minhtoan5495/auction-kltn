<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="content-page" style="background: rgba(238, 238, 238, 0.48);">
    <div class="container">
        <div class="row">
            <div class="content-page-profile">
                <div class="row">
                    <aside class="col-sm-3">
                        <div class="profile-avarta">
                            <div class="profile-image">
                                <img alt="" src="http://bootdey.com/img/Content/avatar/avatar1.png">
                            </div>
                            <div class="profile-infor">
                                <p class="profile-infor-name" style="text-align: center;">${user.username }</p>
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
                                <p>
                                    <strong>Số điện thoại</strong>: ${user.phone }
                                </p>
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
                            <div class="tab-content main_content_profile">
                                <div id="home" class="tab-pane fade in active" style="margin-top: 10px">
                                    <h4>Quản lý tài khoản</h4>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="profile_info_item">
                                                <h4>Thông tin cá nhân</h4>
                                                <p>${pageContext.request.userPrincipal.name }</p>
                                                <p>${user.email }</p>
                                                <p>${user.phone }</p>
                                                <a href="${pageContext.request.contextPath }/changePassword">Thay đổi mật khẩu</a><br> <a href="#">Thay đổi
                                                Email</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="profile_info_item">
                                                <h4>Thông tin địa chỉ giao hàng</h4>
                                                <p>${user.name }</p>
                                                <c:if test="${not empty user.city}">
                                                    <p>${user.district.districtName }</p>
                                                    <p>${user.city.cityName }</p>
                                                </c:if>
                                                <c:if test="${empty user.city}">
                                                    <p>Bạn chưa thêm địa chỉ ! </p>
                                                </c:if>
                                                <br>
                                                <p></p>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="profile_info_item">
                                                <button class="btn btn-danger btn-edit-profile">
                                                    <i class="fa fa-edit"></i> Cập nhật thông tin
                                                </button>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 profile_item_order_home">
                                            <h4>Thông tin đơn hàng gần đây</h4>
                                            <table class="table table-hover">
                                                <thead>
                                                <tr>
                                                    <th>Ngày đặt hàng</th>
                                                    <th>Thành tiền</th>
                                                    <th>Trạng thái</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="invoice" items="${ordered }">
                                                    <c:if test="${not empty invoice.invoiceDetails}">
                                                        <tr>
                                                                <%--  <td class="hidden">${invoice.invoiceId }</td> --%>
                                                            <td><fmt:formatDate value="${invoice.createDate }"
                                                                                pattern="dd-MM-yyyy"/></td>
                                                            <td><fmt:formatNumber
                                                                    value="${invoice.invoiceDetails.get(i).product.price}"
                                                                    type="number"/> đ
                                                            </td>
                                                            <td>${invoice.invoiceStatus.invoiceStatusName }</td>
                                                            <td class="btn_view_detail_order"><a
                                                                    href="${pageContext.request.contextPath }/orderDetail?invoiceId=${invoice.invoiceId}">
                                                                <button class="btn btn-primary" style="border-radius: 0">
                                                                    <i class="fa fa-edit"></i>View
                                                                </button>
                                                            </a></td>
                                                        </tr>
                                                    </c:if>
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
                                    <c:if test="${not empty ordered}">
                                        <div class="panel panel-default profile_item_content">
                                            <div class="panel-heading">Thông tin sản phẩm</div>
                                            <div class="panel-body profile_body_item">
                                                <div class="row" style="margin-left: 5px; margin-right: 5px;">
                                                    <div class="col-sm-12 profile_feedback_product">
                                                        <label>Thông tin phản hồi</label>
                                                        <p>Nếu sản phẩm gặp lỗi về kỹ thuật hoặc sản phẩm không đúng
                                                            mô tả quý khách có thể phản hồi hoặc gửi trả sản phẩm trong vòng
                                                            48h kể từ khi nhận hàng. Nếu qua thời gian đó sản phẩm có gặp
                                                            bất kỳ vấn đề gì chúng tôi sẽ không giải quyết. Mong quý khách
                                                            thông cảm!!</p>
                                                        <button class="btn btn-danger">
                                                            <i class="fa fa-phone"></i> Contact Us
                                                        </button>
                                                    </div>
                                                </div>
                                                <c:forEach var="order" items="${ordered}">
                                                    <c:if test="${not empty order.invoiceDetails}">
                                                        <c:forEach var="orderDetail" items="${order.invoiceDetails}">
                                                            <div class="row"
                                                                 style="border: 1px solid gray; margin-left: 5px; margin-right: 5px; margin-bottom: 5px;">
                                                                <c:if test="${not empty orderDetail.product.images}">
                                                                    <c:set var="images" value="${orderDetail.product.images}"/>
                                                                    <div class="col-sm-3">
                                                                        <img alt=""
                                                                             src="${pageContext.request.contextPath }/resource/images/product/${images.get(i).imageUrl}">
                                                                    </div>
                                                                </c:if>
                                                                <div class="col-sm-6">
                                                                    <label class="profile_body_item_name">${orderDetail.product.name}
                                                                        <p style="color: #59b210; font-weight: 400">Số lượng:
                                                                                ${orderDetail.quantity}</p>
                                                                        <p style="color: #ff4f4f; font-weight: 400">
                                                                            Giá tiền:
                                                                            <fmt:formatNumber value="${orderDetail.price}" type="number"/>
                                                                            đ
                                                                        </p> <strong>Ngày mua <fmt:formatDate
                                                                                value="${order.createDate}" pattern="dd-MM-yyyy"/>
                                                                        </strong>

                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                                <div id="auction_item" class="tab-pane fade">
                                    <div class="profile_item_title">
                                        <h3>Danh sách phiên đấu giá tham gia</h3>
                                    </div>
                                    <%-- <c:if test="${not empty ordered}"> --%>
                                    <div class="panel panel-default profile_item_content">
                                        <div class="panel-heading">Thông tin đấu giá</div>
                                        <div class="panel-body profile_body_item">
                                            <c:forEach var="auction" items="${auctions}">
                                                <div class="row"
                                                     style="border: 1px solid gray; margin-left: 5px; margin-right: 5px; margin-bottom: 5px;">
                                                    <div class="col-sm-3">
                                                        <img alt=""
                                                             src="${pageContext.request.contextPath }/resource/images/product/${auction.auction.product.images.get(i).getImageUrl()}">
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <strong> ${auction.auction.product.name}
                                                        </strong><br>
                                                        <label class="profile_body_item_name">Ngày bắt đầu <fmt:formatDate
                                                                value="${auction.auction.startTime}" pattern="dd-MM-yyyy"/>
                                                            <p style="color: #59b210; font-weight: 400">Ngày kết thúc
                                                                <fmt:formatDate
                                                                        value="${auction.auction.endTime}" pattern="dd-MM-yyyy"/></p>
                                                            <p style="color: #ff4f4f; font-weight: 400">
                                                                Giá tiền:
                                                                <fmt:formatNumber value="${auction.auction.product.price}" type="number"/>
                                                                đ
                                                            </p>

                                                        </label>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="order_item">
                                    <div class="profile_item_title">
                                        <h3>Danh sách đơn hàng</h3>
                                    </div>
                                    <c:forEach var="invoice" items="${ordered}">
                                        <div class="panel panel-default profile_body_item_order">
                                            <div class="panel-heading profile_heading_main_item">
                                                <c:if test="${not empty invoice.invoiceDetails}">
                                                    <div class="profile_heading_date">
                                                        <p>Đơn hàng ${invoice.invoiceDetails.get(i).invoiceDetailId }</p>
                                                        <p>
                                                            Đặt hàng ngày
                                                            <fmt:formatDate value="${invoice.createDate }"
                                                                            pattern="dd-MM-yyyy"/>
                                                        </p>
                                                    </div>
                                                </c:if>
                                                <div class="profile_heading_manager">
                                                    <a
                                                            href="${pageContext.request.contextPath }/orderDetail?invoiceId=${invoice.invoiceId}">
                                                        <button class="btn_profile_heading_manager">
                                                            <i class="fa fa-edit"></i>Quản lý đơn hàng
                                                        </button>
                                                    </a>
                                                </div>
                                            </div>
                                            <c:if test="${not empty invoice.invoiceDetails}">
                                                <c:set var="product"
                                                       value="${invoice.invoiceDetails.get(i).product}"/>
                                                <div class="panel-body">
                                                    <div class="profile_order_item_detail">
                                                        <div class="row">
                                                            <div class="col-sm-1" style="width: 0.333333%"></div>
                                                            <c:if test="${not empty product.images}">
                                                                <div class="col-sm-4" style="width: 20.33333%">
                                                                    <img alt=""
                                                                         src="${pageContext.request.contextPath }/resource/images/product/${invoice.invoiceDetails.get(i).product.images.get(i).imageUrl}"
                                                                         style="width: 100px">
                                                                </div>
                                                            </c:if>
                                                            <div class="col-sm-6">
                                                                <p>${invoice.invoiceDetails.get(i).product.name }</p>
                                                                <button class="btn btn-primary btn-status-order">${invoice.invoiceStatus.invoiceStatusName }</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
