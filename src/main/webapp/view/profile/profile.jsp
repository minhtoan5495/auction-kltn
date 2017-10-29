<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                <label>Profile</label>

                                <p>
                                    <strong>Full Name</strong>: ${user.name}
                                </p>

                                <p>
                                    <strong>Email</strong>: ${user.email }
                                </p>
                                <c:if test="${not empty user.address}">
                                    <p>
                                        <strong>Address</strong>: ${user.address }
                                    </p>
                                </c:if>
                                <c:if test="${not empty user.district}">
                                    <p>
                                        <strong>District</strong>: ${user.district.districtName }
                                    </p>
                                </c:if>
                                <c:if test="${not empty user.city}">
                                    <p>
                                        <strong>City</strong>: ${user.city.cityName }
                                    </p>
                                </c:if>
                                <p>
                                    <strong>Phone Number</strong>: ${user.phone }
                                </p>

                                <p>
                                    <strong>Birthday</strong>:
                                    <fmt:formatDate value="${user.birthday }" pattern="dd-MM-yyyy"/>
                                </p>
                            </div>
                        </div>
                    </aside>
                    <div class="col-sm-9" id="profile_scoll_item">
                        <c:if test="${not empty message }">
                            <div class="alert alert-success" id="message">
                                    ${message}
                            </div>
                        </c:if>
                        <div>
                            <ul id="profile-infor-detail" class="nav nav-tabs profile-tab">
                                <li class="active"><a href="#home" data-toggle="tab">Summary</a></li>
                                <li><a data-toggle="tab" href="#product_item">Ordered</a></li>
                                <li><a data-toggle="tab" href="#auction_item">Auctioning</a></li>
                                <%--<li><a data-toggle="tab" href="#auction_success">Auction Success</a></li>--%>
                                <li><a data-toggle="tab" href="#order_item">Invoice Status</a></li>
                            </ul>
                        </div>
                        <div class="tab-content main_content_profile">
                            <jsp:useBean id="currentDate" type="java.util.Date" scope="request"></jsp:useBean>
                            <fmt:formatDate var="now" value="${currentDate}" pattern="yyyy-MM-dd"/>
                            <div id="home" class="tab-pane fade in active" style="margin-top: 10px">
                                <div class="row">
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-4">
                                        <div class="profile_info_item">
                                            <h4>Profile</h4>
                                            <a href="${pageContext.request.contextPath }/changePassword">
                                                Change Password
                                            </a><br>
                                            <a href="#">Change Email</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="profile_info_item">
                                            <a href="${pageContext.request.contextPath }/updateProfile"
                                               type="submit" class="btn btn-danger btn-edit-profile"> <i
                                                    class="fa fa-edit"></i> Change Info
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 profile_item_order_home">
                                        <h4>Order nearly</h4>
                                        <table class="table table-hover">
                                            <thead>
                                            <tr>
                                                <th>Order date</th>
                                                <th>Price</th>
                                                <th>Status</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="invoice" items="${ordered }">
                                                <c:if test="${not empty invoice.invoiceDetails}">
                                                    <c:forEach var="invoiceDetail" items="${invoice.invoiceDetails }">
                                                        <tr>
                                                            <td><fmt:formatDate value="${invoice.createDate }"
                                                                                pattern="yyyy-MM-dd"/></td>
                                                            <td><fmt:formatNumber
                                                                    value="${invoiceDetail.price}"
                                                                    type="number"/> đ
                                                            </td>
                                                            <td>${invoice.invoiceStatus.invoiceStatusName }</td>
                                                            <td class="btn_view_detail_order"><a
                                                                    href="${pageContext.request.contextPath }/orderDetail?invoiceId=${invoice.invoiceId}">
                                                                <button class="btn btn-primary"
                                                                        style="border-radius: 0">
                                                                    <i class="fa fa-edit"></i>View
                                                                </button>
                                                            </a></td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div id="product_item" class="tab-pane fade">
                                <div class="profile_item_title">
                                    <h3>List Product</h3>
                                </div>
                                <c:if test="${not empty ordered}">
                                    <div class="panel panel-default profile_item_content">
                                        <div class="panel-heading">Product Info</div>
                                        <div class="panel-body profile_body_item">
                                            <div class="row" style="margin-left: 5px; margin-right: 5px;">
                                                <div class="col-sm-12 profile_feedback_product">
                                                    <label>Feedback</label>

                                                    <p>If our product has any problems make you don't satisfied, you
                                                        should be call for our to
                                                        your problem solved asap within 48h.
                                                        After 48h, we will not take any responsibility for your product.
                                                    </p>
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
                                                                <c:set var="images"
                                                                       value="${orderDetail.product.images}"/>
                                                                <div class="col-sm-3">
                                                                    <img alt=""
                                                                         src="${pageContext.request.contextPath }/resource/images/product/${images.get(i).imageUrl}">
                                                                </div>
                                                            </c:if>
                                                            <div class="col-sm-6">
                                                                <label class="profile_body_item_name">${orderDetail.product.name}
                                                                    <p style="color: #59b210; font-weight: 400">
                                                                        Quantity :
                                                                            ${orderDetail.quantity}</p>

                                                                    <p style="color: #ff4f4f; font-weight: 400">
                                                                        Price :
                                                                        <fmt:formatNumber value="${orderDetail.price}"
                                                                                          type="number"/>
                                                                        đ
                                                                    </p> <strong>Order Date <fmt:formatDate
                                                                            value="${order.createDate}"
                                                                            pattern="dd-MM-yyyy"/>
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
                                    <h3>Your auction</h3>
                                </div>
                                <%-- <c:if test="${not empty ordered}"> --%>
                                <div class="panel panel-default profile_item_content">
                                    <div class="panel-heading">Auction info</div>
                                    <div class="panel-body profile_body_item">
                                        <c:forEach var="userAuction" items="${userAuctions}">
                                            <div class="row"
                                                 style="border: 1px solid #fff; margin-left: 5px; margin-right: 5px; margin-bottom: 5px;">
                                                <c:choose>
                                                    <c:when test="${userAuction.auction.endTime >=now }">
                                                        <div class="col-sm-3">
                                                            <a href="${pageContext.request.contextPath }/detail?productId=${userAuction.auction.product.productId}">
                                                                <img alt=""
                                                                     src="${pageContext.request.contextPath }/resource/images/product/${userAuction.auction.product.imageUrl}">
                                                            </a>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <strong> ${userAuction.auction.product.name} </strong><br>
                                                            <label
                                                                    class="profile_body_item_name">Start date
                                                                <fmt:formatDate
                                                                        value="${userAuction.auction.startTime}"
                                                                        pattern="dd-MM-yyyy"/>
                                                                <p style="color: #59b210; font-weight: 400">
                                                                    End date
                                                                    <fmt:formatDate
                                                                            value="${userAuction.auction.endTime}"
                                                                            pattern="dd-MM-yyyy"/>
                                                                </p>

                                                                <p style="color: #ff4f4f; font-weight: 400">
                                                                    Product price:
                                                                    <fmt:formatNumber
                                                                            value="${userAuction.auction.product.price}"
                                                                            type="number"/>
                                                                    đ
                                                                </p>
                                                                <label style="color: black; font-weight: bold;">
                                                                    Current price :
                                                                    <fmt:formatNumber value="${userAuction.price}"
                                                                                      type="number"/>
                                                                    đ
                                                                </label>

                                                            </label>
                                                        </div>
                                                    </c:when>
                                                </c:choose>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div id="auction_success" class="tab-pane fade">
                                <div class="profile_item_title">
                                    <h3>Product that you bought success</h3>
                                </div>
                                <c:if test="${not empty ordered}">
                                    <div class="panel panel-default profile_item_content">
                                        <div class="panel-heading">Info</div>
                                        <div class="panel-body profile_body_item">
                                            <c:forEach var="userAuction" items="${userAuctions}">
                                                <div class="row"
                                                     style="border: 1px solid gray; margin-left: 5px; margin-right: 5px; margin-bottom: 5px;">
                                                    <div class="col-sm-3">
                                                        <img alt=""
                                                             src="${pageContext.request.contextPath }/resource/images/product/${userAuction.auction.product.imageUrl}">
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <strong> ${userAuction.auction.product.name} </strong><br>
                                                        <label
                                                                class="profile_body_item_name">Start date :
                                                            <fmt:formatDate
                                                                    value="${userAuction.auction.startTime}"
                                                                    pattern="dd-MM-yyyy"/>
                                                            <p style="color: #59b210; font-weight: 400">
                                                                End date :
                                                                <fmt:formatDate value="${userAuction.auction.endTime}"
                                                                                pattern="dd-MM-yyyy"/>
                                                            </p>

                                                            <p style="color: #ff4f4f; font-weight: 400">
                                                                Price :
                                                                <fmt:formatNumber
                                                                        value="${userAuction.auction.product.price}"
                                                                        type="number"/>
                                                                đ
                                                            </p>
                                                        </label>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                            <div class="tab-pane fade" id="order_item">
                                <div class="profile_item_title">
                                    <h3>Your Invoices</h3>
                                </div>
                                <c:forEach var="invoice" items="${ordered}">
                                    <div class="panel panel-default profile_body_item_order">
                                        <div class="panel-heading profile_heading_main_item">
                                            <c:if test="${not empty invoice.invoiceDetails}">
                                                <div class="profile_heading_date">
                                                    <p>Invoice : ${invoice.invoiceDetails.get(i).invoiceDetailId }</p>

                                                    <p>
                                                        Order date :
                                                        <fmt:formatDate value="${invoice.createDate }"
                                                                        pattern="dd-MM-yyyy"/>
                                                    </p>
                                                </div>
                                            </c:if>
                                            <div class="profile_heading_manager">
                                                <a
                                                        href="${pageContext.request.contextPath }/orderDetail?invoiceId=${invoice.invoiceId}">
                                                    <button class="btn_profile_heading_manager">
                                                        <i class="fa fa-edit"></i>Manage your invoice
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
                                                                     src="${pageContext.request.contextPath }/resource/images/product/${invoice.invoiceDetails.get(i).product.imageUrl}"
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