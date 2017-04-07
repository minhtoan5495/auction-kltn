<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!-- CONTENT -->
<div class="main-content-cart">
    <div class="container">
        <div class="row">
            <div class="content-cart-title">
                <h2 class="content-paget-title-item">Shopping - Cart</h2>
            </div>
            <div class="col-sm-12">
                <div class="content-cart-menu">
                    <ul class="step">
                        <li class="step-current first"><span>1.Cart</span></li>
                        <li class="step-todo second"><span>2.Sign in</span></li>
                        <li class="step-todo third"><span>3.Address Ship</span></li>
                        <li class="step-todo four"><span>4.Ship</span></li>
                        <li class="step-todo fifth"><span>5.Check out</span></li>
                    </ul>
                </div>
                <div class="table-responsive">
                    <form action="update" method="post">
                        <table class="table table-cart-item">
                            <thead>
                            <tr>
                                <th class="cart-product-item">Hình ảnh</th>
                                <th class="cart-product-item">Tên sản phẩm</th>
                                <th class="cart-product-item">Mô tả</th>
                                <th class="cart-product-item">Số lượng</th>
                                <th class="cart-product-item">Giá</th>
                                <th class="cart-product-item"></th>
                            </tr>
                            </thead>
                            <c:forEach var="cart" items="${cart}">
                                <c:set var="s" value="${s +cart.product.price*cart.quantity}"></c:set>
                                <tbody>
                                <tr>
                                    <td class="cart-product-infor"><a
                                            href="${pageContext.request.contextPath }/detail?idproduct=${cart.product.idproduct}"><img
                                            src="${pageContext.request.contextPath }/resource/images/banner/${cart.product.image}"
                                            style="width: 100px; height: 100px"></a></td>
                                    <td class="cart-product-infor">
                                        <label class="cart-product-name">${cart.product.name }</label>
                                    </td>
                                    <td class="cart-product-infor">
                                        <p class="cart-product-name">${cart.product.name }</p>
                                        <small>${cart.product.description }</small>
                                        <br>
                                    <td class="cart-product-infor"><input
                                            class="form-control input-field" type="number"
                                            value="${cart.quantity}" name="quantity"> <input type="hidden"
                                                                                             name="${_csrf.parameterName}"
                                                                                             value="${_csrf.token}"/>
                                        <input
                                                class="btn btn-success" value="update" type="submit">
                                    </td>
                                    <td class="cart-product-infor">
                                        <p>
                                            <fmt:formatNumber
                                                    value="${cart.product.price*cart.quantity}" type="number"/>
                                            đ
                                        </p>
                                    </td>
                                    <td class="cart-product-infor"><a
                                            href="${pageContext.request.contextPath }/removeCart?idproduct=${cart.product.idproduct}"><i
                                            class="glyphicon glyphicon-trash"></i></a></td>
                                </tr>
                                </tbody>
                            </c:forEach>
                            <tfoot>
                            <tr class="cart-total-price">
                                <td class="cart-empty" colspan="2" rowspan="5"></td>
                                <td class="cart-right-price" colspan="2"
                                    style="font-size: 18px;">Tổng tiền tạm tính
                                </td>
                                <td class="cart-right-price" colspan="1"><fmt:formatNumber
                                        value="${s}" type="number"/>đ
                                </td>
                                <td class="cart-right-price" colspan="1"></td>
                            </tr>

                            </tfoot>
                        </table>
                    </form>
                    <div class="submit-button pull-right" style="margin-bottom: 30px;">
                        <%-- <c:if test="${pageContext.request.userPrincipal!=null }"> --%>
                        <a href="${pageContext.request.contextPath }/checkout"
                           class="btn submit-btn"> <span><i
                                class="glyphicon glyphicon-shopping-cart submit-icon"></i>
								Checkout Shopping </span>
                        </a>
                        <%-- 				</c:if> --%>
                        <%-- 		<c:if test="${pageContext.request.userPrincipal==null }">
                                <a href="${pageContext.request.contextPath }/login"
                                    class="btn submit-btn"> <span><i
                                        class="glyphicon glyphicon-shopping-cart submit-icon"></i>
                                        Checkout Shopping </span>
                                </a>
                            </c:if> --%>
                    </div>
                    <div class="submit-button" style="margin-bottom: 30px;">
                        <a href="${pageContext.request.contextPath }/home"
                           class="btn submit-btn"
                           style="background: green; border-color: green"> <span><i
                                class="glyphicon glyphicon-shopping-cart submit-icon"></i>
								Continue Shopping </span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END CONTENT -->