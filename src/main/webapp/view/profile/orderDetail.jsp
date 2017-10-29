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
                        <div>
                            <ul id="profile-infor-detail" class="nav nav-tabs profile-tab">
                                <li class="active"><a href="#home" data-toggle="tab">Summary</a></li>
                                <li><a data-toggle="tab" href="#product_item">Ordered</a></li>
                                <li><a data-toggle="tab" href="#auction_item">Auctioning</a></li>
                                <li><a data-toggle="tab" href="#auction_success">Auction Success</a></li>
                                <li><a data-toggle="tab" href="#order_item">Invoice Status</a></li>
                            </ul>
                        </div>
                        <div class="tab-content main_content_profile">
                            <div id="home" class="tab-pane fade in active" style="margin-top: 10px">
                                <h4>Invoice Detail</h4>

                                <div class="row content_main_profile_order">
                                    <div class="col-sm-4">
                                        <div class="profile_info_item_order">
                                            <h4>Invoice ${invoices.invoiceDetails.get(i).getInvoiceDetailId() }</h4>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="profile_info_item_order">
                                            <h4>Order date <fmt:formatDate value="${invoices.createDate }"
                                                                           pattern="dd-MM-yyyy"/></h4>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="profile_info_item_order">
                                            <h4>Total <fmt:formatNumber
                                                    value="${invoices.invoiceDetails.get(i).getPrice()}"
                                                    type="number"/> đ</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 content_main_profile_order_detail">
                                        <div class="panel panel-default profile_order_item">
                                            <div class="panel-heading profile_order_item_header">
                                                <i class="fa fa-gift"></i> Order
                                            </div>
                                            <div class="panel-body profile_order_item_body">
                                                <p style="margin-left: 10px;"><i
                                                        class="glyphicon glyphicon-calendar"></i>
                                                    Shipping type
                                                </p>

                                                <p style="color: #59b210">Ship date <fmt:formatDate
                                                        value="${invoices.shipDate }"
                                                        pattern="dd-MM-yyyy"/></p>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-1">
                                                </div>
                                                <div class="col-sm-10">
                                                    <c:choose>
                                                        <c:when test="${invoices.invoiceStatus eq 'CANCELED'}">
                                                            <div class="profile_order_item_check"
                                                                 style="background: rgba(255, 255, 0, 0.43)">
                                                                <p>Date <fmt:formatDate value="${invoices.createDate }"
                                                                                        pattern="dd-MM-yyyy"/></p>

                                                                <p style="margin-left: 20px">
                                                                    The order is canceled because some personal reason
                                                                    and we are accepted !
                                                                    We are so sorry.
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="profile_order_item_check">
                                                                <p>Date <fmt:formatDate value="${invoices.createDate }"
                                                                                        pattern="dd-MM-yyyy"/></p>

                                                                <p style="margin-left: 20px">You have successfully
                                                                    ordered</p>
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
                                                            <form:form
                                                                    action="${pageContext.request.contextPath}/orderDetail">
                                                                <td>
                                                                    <img alt=""
                                                                         src="${pageContext.request.contextPath }/resource/images/product/${invoices.invoiceDetails.get(i).product.images.get(i).imageUrl}"
                                                                         style="width:100px ">
                                                                </td>
                                                                <td>
                                                                        ${invoices.invoiceDetails.get(i).product.name}
                                                                </td>
                                                                <td>
                                                                        ${invoices.invoiceDetails.get(i).quantity }
                                                                </td>
                                                                <td>
                                                                    <fmt:formatNumber
                                                                            value="${invoices.invoiceDetails.get(i).product.price}"
                                                                            type="number"/> đ
                                                                </td>
                                                            </form:form>
                                                            <c:choose>
                                                                <c:when test="${invoices.invoiceStatus eq 'DONE'}">
                                                                    <a href="${pageContext.request.contextPath }/updateInvoiceStatus?invoiceId=${invoices.invoiceId}"
                                                                       style="display: none">
                                                                        <button class="btn-status-order">${invoices.invoiceStatus }</button>
                                                                    </a>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td>
                                                                        <a href="${pageContext.request.contextPath }/updateInvoiceStatus?invoiceId=${invoices.invoiceId}">
                                                                            <button class="btn-status-order">${invoices.invoiceStatus }</button>
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