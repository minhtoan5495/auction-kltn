<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!--    CONTENT-->
<style>
.content-result-page ul {
	list-style: none;
}

.content-result-page .buttons {
	margin-bottom: 20px;
}

.content-result-page .list .new-product-main {
	width: 100%;
	margin-bottom: 10px;
	padding-bottom: 10px;
}

.content-result-page .grid .new-product-main {
	padding: 20px;
}

.content-result-page .list .new-product-main .single-product-item {
	display: flex;
}

.content-result-page .list .new-product-main .single-product-showinfor {
	margin-left: 15px;
}

.content-result-page .grid .new-product-main .single-product-infor-description
	{
	display: none;
}

.content-result-page .list .new-product-main .single-product-showinfor {
	width: 50%
}

.buttons {
	margin-top: 10px;
	display: flex;
}

.content-result-page .list .new-product-main .single-product-btn {
	float: left;
}

.content-result-page .grid .new-product-main .single-product-btn {
	margin-top: -25px
}
</style>
<div class="content-page">
	<div class="container content-result-page">
		<h4>${message}</h4>
		<div class="buttons">
			<p style="margin-right: 10px; margin-top: 5px;">Xem theo</p>
			<button class="grid" style="margin-right: 5px">
				<i class="glyphicon glyphicon-th"
					style="color: rgba(0, 159, 255, 0.59); font-size: 20px;"></i>
			</button>
			<button class="list">
				<i class="glyphicon glyphicon-th-list"style="color: rgba(0, 159, 255, 0.59); font-size: 20px;"></i>
			</button>
		</div>
		<div class="content-page">
			<div class="row">
				<ul class="list">
					<c:forEach var="product" items="${resultList }">
						<jsp:useBean id="currentDate" type="java.util.Date"
							scope="request"></jsp:useBean>
						<fmt:formatDate var="now" value="${currentDate}"
							pattern="yyyy-MM-dd" />
						<div class="col-sm-3 new-product-main">
							<div class="new-product">
								<div class="single-product-item">
									<div class="single-product-image">
										<a
											href="${pageContext.request.contextPath }/detail?productId=${product.productId}"><img
											style="width: 253px; height: 250px;"
											src="${pageContext.request.contextPath }/resource/images/product/${product.images.get(i).imageUrl }"></a>
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
									<div class="single-product-showinfor">
										<div class="single-product-infor-name">
											<p class="single-product-infor-name-title">${product.name }</p>
										</div>
										<div class="single-product-infor-description">
											<p class="single-product-infor-name-description">${product.description }</p>
										</div>
										<c:if test="${not empty (product.discounts) }">
											<c:if test="${product.discounts.get(i).endDate >= now }">
												<div class="single-product-inforsale">Giảm giá
													${product.discounts.get(i).discountPercent }%</div>
											</c:if>
										</c:if>
										<div class="single-product-infor-name">
											<p>
												<i class="glyphicon glyphicon-fire">
													${product.viewNumber }</i> lượt xem
											</p>
										</div>
										<div class="single-product-inforprice">
											<c:choose>
												<c:when
													test="${not empty(product.discounts) and product.discounts.get(i).endDate >= now }">
													<strike style="color: black"> <fmt:formatNumber
															value="${product.price}" type="number" /> đ
													</strike>
												</c:when>
												<c:otherwise>
													<strike style="color: #eee">000</strike>
													<p style="color: black">
														<fmt:formatNumber value="${product.price}" type="number" />
														đ
													</p>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="single-product-inforprice">
											<c:if
												test="${not empty(product.discounts) and product.discounts.get(i).endDate >= now  }">
												<p>
													<fmt:formatNumber
														value="${(product.price)-((product.price*product.discounts.get(i).discountPercent)/100)}"
														type="number" />
													đ
												</p>
											</c:if>
										</div>
										<div class="single-product-inforrating">
											<div class="rating-box">
												<span>(Có ${product.ratings.size() } nhận xét)</span>
											</div>
										</div>
										<div class="single-product-btn">
											<input hidden value="${product.productId}" id="productId">
											<c:choose>
												<c:when
													test="${product.transactionType.transactionTypeId==2 }">
													<a
														href="${pageContext.request.contextPath }/addCart?productId=${product.productId}">
														<button class="btn  btn-countdown">
															<i class="fa fa-shopping-cart"></i> MUA NGAY
														</button>
													</a>
												</c:when>
												<c:otherwise>
													<a
														href="${pageContext.request.contextPath }/detail?productId=${product.productId}">
														<button class="btn  btn-countdown">
															<i class="fa fa-shopping-cart"></i> XEM CHI TIẾT
														</button>
													</a>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- END CONTENT -->