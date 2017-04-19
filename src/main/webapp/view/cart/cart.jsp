<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!-- CONTENT -->
<div class="main-content-cart">
    <div class="container">
        <c:choose>
            <c:when test="${empty cart }">
                <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <div class="content-cart-menu">
                            <h4>Không có sản phẩm nào trong giỏ hàng</h4>
                            <a href="${pageContext.request.contextPath }/home">
                                <button>Tiếp
                                    tục mua hàng
                                </button>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="row"
                     style="border-bottom: 1px solid rgba(128, 128, 128, 0.34)">
                    <div class="cart_continue_shopping_item">
                        <p></p>
                        <br> <a href="${pageContext.request.contextPath }/home">TIẾP
                        TỤC MUA HÀNG</a>
                    </div>
                    <div class="content-cart-title">
                        <h2 class="content-paget-title-item">Giỏ hàng</h2>
                    </div>
                    <div class="col-sm-12">
                        <div class="table-responsive">
                            <form action="update" method="post">
                                <table class="table table-cart-item">
                                    <thead>
                                    <tr>
                                        <th class="cart-product-item"></th>
                                        <th class="cart-product-item"></th>
                                        <th class="cart-product-item">Giá</th>
                                        <th class="cart-product-item">Số lượng</th>
                                        <th class="cart-product-item">Thành tiền</th>
                                        <th class="cart-product-item"></th>
                                    </tr>
                                    </thead>
                                    <c:forEach var="cart" items="${cart}">
                                        <c:set var="s" value="${s + cart.product.price*cart.quantity}"></c:set>
                                        <tbody class="table_body_cart">
                                        <tr>
                                            <td class="cart-product-infor"><a
                                                    href="${pageContext.request.contextPath }/detail?idproduct=${cart.product.productId}"><img
                                                    src="${pageContext.request.contextPath }/resource/images/banner/${cart.product.images.get(i).getImageUrl()}"
                                                    style="width: 100px; height: 100px"></a></td>
                                            <td class="cart-product-infor"><label
                                                    class="cart-product-name">${cart.product.name }</label><br>
                                            <input id="price" value="${cart.product.price}" type="hidden">
                                            <td class="cart-product-infor"><label
                                                                                  class="cart-product-name"><fmt:formatNumber
                                                    value="${cart.product.price}" type="number"/>
                                                đ</label><br>
                                                    <%-- <small>${cart.product.description }</small><br></td> --%>
                                            <td class="cart-product-infor"><input
                                                    class="form-control input-field"
                                                    type="number"
                                                    value="${cart.quantity}"
                                                    name="quantity" id="quantity" onchange="updateCart()"> <input
                                                    type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}"/>
                                                <button class="btn btn-success btn-update-cart"
                                                        type="submit">
                                                    <i class="fa fa-edit"></i>Cập nhật
                                                </button>
                                            </td>
                                            <td class="cart-product-infor">
                                                <p>
                                                    <fmt:formatNumber
                                                            value="${cart.product.price*cart.quantity}" type="number"/>
                                                    đ
                                                </p>
                                            </td>
                                            <td class="cart-product-infor"><a
                                                    href="${pageContext.request.contextPath }/removeCart?idproduct=${cart.product.productId}"><i
                                                    class="glyphicon glyphicon-trash"></i></a></td>
                                        </tr>
                                        </tbody>
                                    </c:forEach>
                                    <tfoot>
                                    <tr class="cart-total-price">
                                        <td class="cart-empty" colspan="2" rowspan="5"></td>
                                        <td class="cart-right-price" colspan="1"
                                            style="font-size: 16px;">Tổng tiền tạm tính
                                        </td>
                                        <td class="cart-right-price" colspan="1"><fmt:formatNumber
                                                value="${s}" type="number"/> đ
                                        </td>
                                        <td class="cart-right-price" colspan="1"></td>
                                    </tr>

                                    </tfoot>
                                </table>
                            </form>
                            <c:choose>
                                <c:when test="${pageContext.request.userPrincipal==null }">
                                    <div class="submit-button pull-right"
                                         style="margin-bottom: 30px;">
                                        <button class="btn btn-danger review_item"
                                                id="review_item_toggle" data-toggle="modal"
                                                data-target="#myModal">THANH TOÁN ĐƠN HÀNG
                                        </button>
                                    </div>
                                    <div class="modal fade" id="myModal" role="dialog">
                                        <div class="modal-dialog">
                                            <!-- Modal content-->
                                            <div class="modal-content-order">
                                                <div class="modal-header">
                                                    <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                                                    <div class="alert alert-success">
                                                        <strong>Cảnh báo!</strong> Bạn phải đăng nhập mới được đặt
                                                        hàng sản phẩm này
                                                    </div>
                                                </div>
                                                <div class="modal-body">
                                                    <a href="${pageContext.request.contextPath }/checkout">
                                                        <button
                                                                class="btn btn-danger btn-modal-comment">Đăng
                                                            nhập tại đây
                                                        </button>
                                                    </a>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-primary"
                                                            data-dismiss="modal" style="border-radius: 0">X
                                                    </button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="submit-button pull-right"
                                         style="margin-bottom: 30px;">
                                        <a href="${pageContext.request.contextPath }/checkout">
                                            <button
                                                    class="btn btn-danger review_item">THANH TOÁN ĐƠN
                                                HÀNG
                                            </button>
                                        </a>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!-- END CONTENT -->