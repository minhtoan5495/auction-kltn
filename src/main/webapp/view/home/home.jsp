
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--    CONTENT-->
<div class="content-page">
	<div class="container">
		<div class="row">
			<div class="container slide-show">
				<div class="row">
					<div>
						<div id="slider-carousel" class="carousel slide slide-show-item" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item">
								<div class="col-sm-6">
									<h1><span>Auction</span>-Sale</h1>
									<h2>Giày thể thao nam Biti's Hunter Liteknit II DS1252 (Đen)</h2>
									<div class="item-slide-product-description">
									<p>Công nghệ quai dệt Litekit Ở phiên bản mới của Hunter, Biti's đã thay thế chất liệu Air Mesh cũ bằng công nghệ mới có tên gọi Liteknit. Đây là công nghệ dệt để tạo nên phần thân của giày với nhiều lỗ thoáng khí, tăng sự thoải mái và dễ chịu cho người mang. Ngoài ra, cải tiến này còn giúp cho việc vệ sinh đôi giày trở nên dễ dàng và thuận tiện hơn.</p>
									</div>
									<a href="${pageContext.request.contextPath }/detail?idproduct=${auction.productId}"><button type="button" class="btn btn-default get">Chi tiết</button></a>
								</div>
								<div class="col-sm-6">
									<img src="resource/images/slideImage/bititshunter.png" class="girl img-responsive" alt="" style="width: 360px;height: 360px"/>
								</div>
							</div>
							<c:forEach var="auction" items="${listProduct2 }">
							<div class="item">
								<div class="col-sm-6">
							<h1><span>Aution</span>-Sale</h1>
									<h2>${auction.name }</h2>
									<div class="item-slide-product-description">
									<p>${auction.description }</p>
									</div>
									<a href="${pageContext.request.contextPath }/detail?idproduct=${auction.productId}"><button type="button" class="btn btn-default get">Chi tiết</button></a>
								</div>
								<div class="col-sm-6">
									<img src="resource/images/slideImage/bititshunter1.png" class="girl img-responsive" alt="" style="width: 360px;height: 360px"/>
									
								</div>
							</div>
							</c:forEach>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left s-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right s-right"></i>
						</a>
					</div>

						<div class="infor-box">
							<div class="infor_box_inner">
								<div class="row">
									<div class="col-sm-4">
										<div class="infor_box_left">
											<div class="row">
												<div class="col-xs-12">
													<h4 class="infor_box_heading">ĐỔI TRẢ HÀNG</h4>
												</div>
											</div>
											<h6 class="infor_text">2 ngày sau khi giao hàng nếu
												không đúng với mẫu mã cam kết</h6>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="infor_box_left">
											<div class="row">
												<div class="col-xs-12">
													<h4 class="infor_box_heading">MIỄN PHÍ GIAO HÀNG</h4>
												</div>
											</div>
											<h6 class="infor_text">Miễn phí giao hàng với những hóa
												đơn dưới 100k</h6>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="infor_box_left">
											<div class="row">
												<div class="col-xs-12">
													<h4 class="infor_box_heading">HÌNH THỨC ĐẤU GIÁ</h4>
												</div>
											</div>
											<h6 class="infor_text">Thủ tục đấu giá rất đơn giản</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="content-page">
				<div class="content-page-title">
					<h2 class="content-paget-title-item">SẢN PHẨM BÁN</h2>
				</div>
				<div class="row">
					<h4>${message}</h4>
					<c:forEach var="listProduct" items="${listProduct }">
						<div class="col-sm-3 new-product-main">
							<div class="new-product">
								<div class="single-product-item">
									<div class="single-product-image">
										<a
											href="${pageContext.request.contextPath }/detail?idproduct=${listProduct.productId}"><img
											style="width: 253px;height: 250px;" src="resource/images/product/${listProduct.images.get(i).getImageUrl() }"></a>
										<div class="overplay-content">
											<ul>
												<li><a
													href="${pageContext.request.contextPath }/detail?idproduct=${listProduct.productId}"><i
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
											<p class="single-product-infor-name-title">${listProduct.name }</p>
										</div>
										<c:if test="${not empty (listProduct.discounts) }">
											<div class="single-product-inforsale">
                                            Giảm giá ${listProduct.discounts.get(i).getDiscountPercent() }%
                                         </div>
                                         </c:if>
										<div class="single-product-infor-name">
											<p>
												<i class="glyphicon glyphicon-fire">
													${listProduct.viewNumber }</i> lượt xem
											</p>
										</div>
										<div class="single-product-inforprice">
										<c:choose>
										<c:when test="${not empty(listProduct.discounts) }">
											<strike style="color: black">
												<fmt:formatNumber value="${listProduct.price}" type="number" />
												đ
											</strike>
										</c:when>
										<c:otherwise>
										<p style="color: black">
												<fmt:formatNumber value="${listProduct.price}" type="number" />
												đ
											</p>
										</c:otherwise>
										</c:choose>
										</div>
										<div class="single-product-inforprice">
										<c:if test="${not empty(listProduct.discounts)  }">
											<p>
												<fmt:formatNumber value="${(listProduct.price)-((listProduct.price*listProduct.discounts.get(i).getDiscountPercent())/100)}" type="number" />
												đ
											</p>
										</c:if>
										</div>
										<div class="single-product-inforsale">
											<a
												href="${pageContext.request.contextPath }/addCart?idproduct=${listProduct.productId}"><button
													class="btn btn-success btn-countdown">
													<i class="fa fa-shopping-cart"></i> MUA NGAY
												</button></a>
										</div>
										<div class="single-product-inforrating">
											<div class="rating-box">
												<span>(Có ${listProduct.ratings.size() } nhận xét)</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<c:url value="/" var="page"></c:url>
                    <ul class="pagination" style="float:right">
                    	<li><a href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
                    <c:forEach var="i" begin="0" end="${totalPage -i}">
						<li>
                            <a href="${page }${i}">
                            <c:out value="${i }"></c:out>
                            </a>
                        </li>
                        </c:forEach>
                        <li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
                    </ul>
				</div>
				<div class="content-page-title">
					<h2 class="content-paget-title-item">SẢN PHẨM ĐẤU GIÁ</h2>
				</div>
				<div class="row">
					<h4>${message}</h4>
					<c:forEach var="product" items="${listProduct2 }">
						<div class="col-sm-3">
							<div class="new-product">
								<div class="single-product-item">
									<div class="single-product-image">
										<a
											href="${pageContext.request.contextPath }/detail?idproduct=${product.productId}"><img
												style="width: 255px;height: 250px;" src="${pageContext.request.contextPath}/resource/images/product/${product.images.get(i).imageUrl }"></a>
										<div class="overplay-content">
											<ul>
												<li><a
													href=""><i
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
										<!-- 	<div class="single-product-inforsale">
                                            Giảm giá 25%
                                         </div> -->
										<p id="demo" style="text-align: center;"></p>
										<div class="single-product-info-timecountdown" id="countDownAuction">
											<div class="single-product-info-timecountdown-title">
												<p>THỜI GIAN CÒN LẠI</p>
											</div>
											<div class="single-product-info-timecountdown-item">
												<div id="clockdiv">
													<div>
														<span class="days"></span>
														<div class="smalltext">Days</div>
													</div>
													<div>
														<span class="hours"></span>
														<div class="smalltext">Hours</div>
													</div>
													<div>
														<span class="minutes"></span>
														<div class="smalltext">Minutes</div>
													</div>
													<div>
														<span class="seconds"></span>
														<div class="smalltext">Seconds</div>
													</div>
												</div>
											</div>
											<input value="${product.auctions.get(i).endTime }" id="endTime" type="hidden">
											<div class="single-product-info-timecountdown-title-notice">
												<label>Ngày kết thúc</label>
												<p><fmt:formatDate value="${product.auctions.get(i).endTime }"
                                                    pattern="dd-MM-yyyy"/>
											</div>
										</div>
										<div class="single-product-infor-name">
											<p>
												<i class="glyphicon glyphicon-fire">
													${product.viewNumber }</i> lượt xem
											</p>
										</div>
										<div class="single-product-inforprice">
											<p>
												<fmt:formatNumber value="${product.price}"
													type="number" />
												đ
											</p>
										</div>
										<div class="single-product-inforsale">
											<a
												href="${pageContext.request.contextPath }/detail?idproduct=${product.productId}"><button
													class="btn btn-success btn-countdown">
													<i class="fa fa-shopping-cart"></i> XEM CHI TIẾT
												</button></a>
										</div>
										<div class="single-product-inforreview">
											<%-- <span>(${listProduct.commentItems.size() } nhận xét)</span> --%>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="content-page-title">
					<h2 class="content-paget-title-item">SẢN PHẨM ĐẤU GIÁ</h2>
				</div>
				<div class="row">
				<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div class="carousel slide multi-item-carousel" id="theCarousel">
        <div class="carousel-inner">
          <div class="item active">
            <div class="col-xs-4"><a href="#1"><img src="http://placehold.it/300/f44336/000000" class="img-responsive"></a></div>
          </div>
          <div class="item">
            <div class="col-xs-4"><a href="#1"><img src="http://placehold.it/300/e91e63/000000" class="img-responsive"></a></div>
          </div>
          <div class="item">
            <div class="col-xs-4"><a href="#1"><img src="http://placehold.it/300/9c27b0/000000" class="img-responsive"></a></div>
          </div>
          <div class="item">
            <div class="col-xs-4"><a href="#1"><img src="http://placehold.it/300/673ab7/000000" class="img-responsive"></a></div>
          </div>
          <div class="item">
            <div class="col-xs-4"><a href="#1"><img src="http://placehold.it/300/4caf50/000000" class="img-responsive"></a></div>
          </div>
          <div class="item">
            <div class="col-xs-4"><a href="#1"><img src="http://placehold.it/300/8bc34a/000000" class="img-responsive"></a></div>
          </div>
          <!-- add  more items here -->
          <!-- Example item start:  -->
          
          <div class="item">
            <div class="col-xs-4"><a href="#1"><img src="http://placehold.it/300/8bc34a/000000" class="img-responsive"></a></div>
          </div>
          
          <!--  Example item end -->
        </div>
        <a class="left carousel-control" href="#theCarousel" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <a class="right carousel-control" href="#theCarousel" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
      </div>
    </div>
  </div>
</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END CONTENT -->