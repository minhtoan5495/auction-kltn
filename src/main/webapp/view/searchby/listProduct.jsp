 <%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--    CONTENT-->
    <div class="content-page">
        <div class="container">
            <div class="row">
                <div class="content-page">
                    <div class="content-page-title">
                        <h2 class="content-paget-title-item">Sản phẩm</h2>
                        <p style="font-size: 15px;font-weight: bold;">${message}</p>
                    </div>
                    <div class="row">
                     <c:forEach var="product" items="${category.products }">
                        <div class="col-sm-3">
                            <div class="new-product">
                                <div class="single-product-item">
                                    <div class="single-product-image">
                                        <a href="${pageContext.request.contextPath }/detail?productId=${product.productId}"><img src="resource/images/banner/${product.imageUrl }"></a>
                                        <div class="overplay-content">
                                            <ul>
                                                <li>
                                                    <a href="${pageContext.request.contextPath }/detail?productId=${product.productId}"><i class="fa fa-search"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#"><i class="fa fa-retweet"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#"><i class="fa fa-heart-o"></i></a>
                                                </li> 
                                            </ul>
                                        </div>
                                    </div>
                                     <div class="single-product-showinfor">
                                        <div class="single-product-infor-name">
                                            <p>${product.name }</p>
                                        </div>
                                        <div class="single-product-infor-name">
                                            <p><i class="glyphicon glyphicon-fire"> ${product.viewNumber }</i> lượt xem</p>
                                        </div>
                                        <div class="single-product-inforprice">
                                            <p><fmt:formatNumber value="${product.price}" type="number" />đ</p>
                                         </div>
                                        <div class="single-product-inforsale">
                                            <button class="btn btn-success btn-countdown">20:17:80</button>
                                         </div>
                                         <div class="single-product-inforreview">
                                             <span>(${product.ratings.size() } nhận xét)</span>
                                         </div>
                                         <div class="single-product-inforrating">
                                             <div class="rating-box">
                                                 <i class="fa fa-star"></i>
                                                 <i class="fa fa-star"></i>
                                                 <i class="fa fa-star"></i>
                                                 <i class="fa fa-star"></i>
                                                 <i class="fa fa-star-half-empty" style="color:gray"></i>
                                             </div>
                                         </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END CONTENT -->