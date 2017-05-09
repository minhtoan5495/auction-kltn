<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- CONTENT-->
<div class="content-page">
    <div class="container">
        <div class="row">
            <div class="content-page">
                <div class="row">
                    <c:if test="${not empty products}">
                        <div class="content-cart-menu">
                            <h4>${message}</h4>
                        </div>
                        <div class="search-advance-item">
                            <div class="dropdown search-supplier-item">
                                <button class="btn dropdown-toggle btn-supplier-item"
                                        type="button" data-toggle="dropdown">
                                    Hãng sản xuất <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu supplier-dropdown-item">
                                    <c:forEach var="supplier" items="${suppliers }">
                                        <li>
                                            <a href="${pageContext.request.contextPath }/supplier?supplierId=${supplier.supplierId}">${supplier.supplierName}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="dropdown search-price-item">
                                <button class="btn dropdown-toggle btn-supplier-item"
                                        type="button" data-toggle="dropdown">
                                    Lọc theo giá tiền <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu supplier-dropdown-item">
                                    <li><a
                                            href="${pageContext.request.contextPath }/priceHighToLower">Giá
                                        thấp đến giá cao</a></li>
                                    <li><a
                                            href="${pageContext.request.contextPath }/priceLowerToHigh">Giá
                                        cao đến giá thấp</a></li>
                                </ul>
                            </div>
                        </div>
                        <c:forEach var="product" items="${products }">
                            <div class="col-sm-3 new-product-main">
                                <div class="new-product">
                                    <div class="single-product-item">
                                        <div class="single-product-image">
                                            <a
                                                    href="${pageContext.request.contextPath }/detail?productId=${product.productId}"><img
                                                    style="width: 253px; height: 300px;"
                                                    src="resource/images/product/${product.images.get(i).imageUrl }"></a>
                                            <div class="overplay-content">
                                                <ul>
                                                    <li><a
                                                            href="${pageContext.request.contextPath }/detail?productId=${product.productId}"><i
                                                            class="fa fa-search"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <c:if test="${product.transactionType.transactionTypeName eq 'Auction'}">
                                            <div class="single-product-showinfor">
                                                <div class="single-product-infor-name">
                                                    <p class="single-product-infor-name-title">${product.name }</p>
                                                </div>
                                                <div class="single-product-infor-name">
                                                    <p>
                                                        <i class="glyphicon glyphicon-fire">
                                                                ${product.viewNumber }</i> lượt xem
                                                    </p>
                                                </div>
                                                <div class="single-product-info-timecountdown">
                                                    <input value="${product.auctions.get(i).endTime }"
                                                           id="endTime" type="hidden">
                                                    <div class="single-product-info-timecountdown-title-notice">
                                                        <label style="font-size: 15px;">Ngày kết thúc</label>
                                                        <p style="font-size: 12px;">
                                                                <fmt:formatDate
                                                                        value="${product.auctions.get(i).endTime }"
                                                                        pattern="dd-MM-yyyy hh:mm"/>
                                                    </div>
                                                </div>
                                                <div class="single-product-inforprice">
                                                    <p>
                                                        <fmt:formatNumber value="${product.price}" type="number"/>
                                                        đ
                                                    </p>
                                                </div>
                                                <div class="single-product-inforsale">
                                                    <a
                                                            href="${pageContext.request.contextPath }/detail?productId=${product.productId}">
                                                        <button
                                                                class="btn btn-success btn-countdown">
                                                            <i class="fa fa-shopping-cart"></i> XEM CHI TIẾT
                                                        </button>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${product.transactionType.transactionTypeName eq 'Sale'}">
                                            <div class="single-product-showinfor">
                                                <div class="single-product-infor-name">
                                                    <p class="single-product-infor-name-title">${product.name }</p>
                                                </div>
                                                <c:if test="${not empty (product.discounts) }">
                                                    <div class="single-product-inforsale">Giảm giá
                                                            ${product.discounts.get(i).discountPercent }%
                                                    </div>
                                                </c:if>
                                                <div class="single-product-infor-name">
                                                    <p>
                                                        <i class="glyphicon glyphicon-fire">
                                                                ${product.viewNumber }</i> lượt xem
                                                    </p>
                                                </div>
                                                <div class="single-product-inforprice">
                                                    <c:choose>
                                                        <c:when test="${not empty(product.discounts) }">
                                                            <strike style="color: black"> <fmt:formatNumber
                                                                    value="${product.price}" type="number"/> đ
                                                            </strike>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p style="color: black">
                                                                <fmt:formatNumber value="${product.price}"
                                                                                  type="number"/>
                                                                đ
                                                            </p>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div class="single-product-inforprice">
                                                    <c:if test="${not empty(product.discounts)  }">
                                                        <p>
                                                            <fmt:formatNumber
                                                                    value="${(product.price)-((product.price*product.discounts.get(i).discountPercent)/100)}"
                                                                    type="number"/>
                                                            đ
                                                        </p>
                                                    </c:if>
                                                </div>
                                                <div class="single-product-inforsale">
                                                    <input hidden value="${product.productId}" id="productId">
                                                    <a
                                                            href="${pageContext.request.contextPath }/addCart?productId=${product.productId}">
                                                        <button
                                                                class="btn btn-success btn-countdown">
                                                            <i class="fa fa-shopping-cart"></i> MUA NGAY
                                                        </button>
                                                    </a>
                                                </div>
                                                <div class="single-product-inforrating">
                                                    <div class="rating-box">
                                                        <span>(Có ${product.ratings.size() } nhận xét)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <c:url value="/" var="page"></c:url>
                        <c:if test="${totalPage > 0}">
                            <ul class="pagination" style="float: right">
                                <li><a href="#" aria-label="Previous"> <span
                                        aria-hidden="true">&laquo;</span>
                                </a></li>
                                <c:forEach var="i" begin="1" end="${totalPage - i}">
                                    <li><a href="${page }${i}"> <c:out value="${i}"></c:out>
                                    </a></li>
                                </c:forEach>
                                <li><a href="#" aria-label="Next"> <span
                                        aria-hidden="true">&raquo;</span>
                                </a></li>
                            </ul>
                        </c:if>
                    </c:if>
                    <c:if test="${empty products}">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-4">
                            <div class="content-cart-menu">
                                <h4>Không tìm thấy sản phẩm nào</h4>
                            </div>
                        </div>
                        <div class="col-sm-4"></div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END CONTENT -->