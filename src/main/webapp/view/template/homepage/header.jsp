<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
           prefix="security" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!--HEADER-->
<div class="header_top_bg">
    <div class="container no-padding">
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-3"></div>
            <div class="col-sm-7 col-xs-4 header_account_reponsive">
                <div class="header_top_account pull-right">
                    <ul class="nav nav-pills">
                        <c:if test="${pageContext.request.userPrincipal.name != null }">
                            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EMPLOYEE')">
                                <div class="header_top_account">
                                    <div class="header_login_top pull-right">
                                        <a href="${pageContext.request.contextPath}/admin"
                                           class="header_login_link"><i class="fa fa-user"></i>Admin</a>
                                    </div>
                                </div>
                            </sec:authorize>
                            <div class="header_top_account">
                                <div class="header_login_top pull-right">
                                    <a href="${pageContext.request.contextPath}/viewCart"
                                       class="header_login_link"><i class="fa fa-lock"></i>Xem giỏ hàng</a>
                                </div>
                            </div>
                            <%--<sec:authentication property="principal.authorities" var="authorities" />--%>
                            <%--<c:forEach items="${authorities}" var="authority" varStatus="vs">--%>
                            <%--<p>${authority.authority}</p>--%>
                            <%--</c:forEach>--%>
                            <div class="header_login pull-left">
                                <a href="#"
                                   class="header_login_link">Chào
                                        ${pageContext.request.userPrincipal.name},</a>
                            </div>
                            <div class="header_login pull-right">
                                <a class="header_login_link"
                                   href="${pageContext.request.contextPath }/profile">Trang
                                    cá nhân</a>
                            </div>
                            <div class="header_login pull-right">
                                <<a class="header_login_link"
                                    href=""> Cài đặt</a>
                            </div>
                            <div class="header_login pull-right">
                                <a>
                                    <form id="logoutForm" method="POST"
                                          action="${pageContext.request.contextPath}/logout">
                                        <input type="hidden" name="${_csrf.parameterName}"
                                               value="${_csrf.token}"/>
                                    </form>
                                </a>
                            </div>
                            <div class="header_login pull-right">
                                <a class="header_login_link"
                                   onclick="document.forms['logoutForm'].submit()">Đăng
                                    xuất</a></a>
                            </div>
                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal.name == null }">
                            <div class="header_top_account">
                                <div class="header_login_top pull-right">
                                    <a href="${pageContext.request.contextPath}/login"
                                       class="header_login_link"><i class="fa fa-user"></i>Đăng
                                        nhập</a>
                                </div>
                                <div class="header_login_top pull-right">
                                    <a href="${pageContext.request.contextPath}/register"
                                       class="header_login_link"><i class="fa fa-user"></i>Đăng
                                        ký</a>
                                </div>
                                <div class="header_login_top pull-right">
                                    <a href="${pageContext.request.contextPath}/viewCart"
                                       class="header_login_link"><i class="glyphicon glyphicon-shopping-cart"></i>Xem
                                        giỏ hàng</a>
                                </div>
                            </div>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<section class="header_middle">
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="header_logo">
                    <a href="${pageContext.request.contextPath }/home"><img
                            src="${pageContext.request.contextPath }/resource/images/logo/int-logo.png"></a>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="header_search">
                    <form action="${pageContext.request.contextPath }/searchName">
                        <div class="input-group input_find">
                            <input type="text" class="form-control"
                                   placeholder="Search for..." name="name" style="height: 38px"> <span
                                class="input-group-btn">
								<button class="btn btn-default" type="submit" style="height: 38px">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</span>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-3 hidden-xs">
                <div class="header_middle_item pull-right">
                    <div class="header_middle_cart" id="header_middle_cart">
                        <a href="#" class="cart_link" data-toggle="modal"
                           data-target="#myCart"> <i
                                class="fa fa-shopping-cart cart-icon"></i> <b>Giỏ hàng</b> <c:if
                                test="${not empty carts }">
                            <span class="cart_quantity">${carts.size() }</span>
                        </c:if>
                        </a>

                    </div>
                    <c:if test="${not empty carts }">
                        <c:set var="sum"
                               value="${sum +carts.get(i).getProduct().getPrice()*carts.get(i).getQuantity() }"></c:set>
                        <div class="modal fade" id="myCart" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <h4 style="margin-top: 0px">
                                                    Xem giỏ hàng (${ carts.size()} sản phẩm)<a
                                                        href="${pageContext.request.contextPath }/viewCart"><i
                                                        class="fa fa-edit"
                                                        style="margin-left: 10px; font-size: 20px; color: #11252f"></i></a>
                                                </h4>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <label>Tạm tính</label>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <p>
                                                            <fmt:formatNumber value="${sum}" type="number"/>
                                                            đ
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                        <%-- 	<c:set var="i" value="${fn:length(cart)}"></c:set> --%>
                                        <%-- <c:if test="${ cartCount.count > (i-1)}"> --%>
                                    <div class="row modal-body-cart-header">
                                        <c:forEach var="cart" items="${carts }" varStatus="cartCount">
                                            <div class="col-sm-3">
                                                <div class="cart_modal_img">
                                                    <img alt=""
                                                         src="${pageContext.request.contextPath }/resource/images/product/${cart.product.images.get(i).imageUrl}">
                                                </div>
                                            </div>
                                            <div class="col-sm-9">
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <label>Tên sản phẩm</label>
                                                        <p>${cart.product.name}</p>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label>Số lượng</label>
                                                        <p>${cart.quantity } cái</p>

                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label>Giá</label>
                                                        <p><fmt:formatNumber
                                                                value="${cart.product.price}" type="number"/>đ</p>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label>Thành tiền</label>
                                                        <p><fmt:formatNumber
                                                                value="${cart.product.price * cart.quantity}"
                                                                type="number"/>đ</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="row modal-footer">
                                        <div class="col-sm-4">
                                            <a href="${pageContext.request.contextPath }/home"
                                               style="text-decoration: none">TIẾP TỤC MUA HÀNG</a>
                                        </div>
                                        <div class="col-sm-4" style="margin-top: 10px">
                                            <button
                                                    class="btn btn-primary"
                                                    style="border-radius: 0; margin-left: -5px;">TIẾN
                                                HÀNH ĐẶT HÀNG
                                            </button>
                                        </div>
                                        <div class="col-sm-4" style="margin-top: 10px">
                                            <button type="button" class="btn btn-primary"
                                                    data-dismiss="modal" style="border-radius: 0">X
                                            </button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="header_menu_bg" id="header_scroll_main">
    <div class="container no-padding">
        <div class="main_menu_bg">
            <div class="main_menu_item">
                <a href="${pageContext.request.contextPath }/home" class="main_menu_item_link"><span
                        class="home_item">Trang chủ</span>Trang chủ</a>
            </div>
            <c:forEach var="parent" items="${parents}">
                <div class="main_menu_item">
                    <a href="#" class="main_menu_item_link">${parent.parentName}</a>
                    <div class="sub_menu_bg hidden-xs">
                        <c:forEach var="category" items="${parent.categories}">
                            <div class="sub_menu_col">
                                <a href="#" class="sub_menu_col_item"><span>${category.categoryName}</span></a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:forEach>
            <div class="main_menu_item">
                <a href="${pageContext.request.contextPath }/about" class="main_menu_item_link">Giới thiệu</a>
            </div>
            <div class="main_menu_item">
                <a href="${pageContext.request.contextPath }/contact" class="main_menu_item_link">Liên hệ</a>
            </div>
        </div>
    </div>
    <a href="#" id="pull" class="menu_reponsive">Menu</a>
</div>
<!-- END HEADER-->