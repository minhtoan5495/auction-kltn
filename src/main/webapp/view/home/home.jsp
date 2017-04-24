
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
											src="resource/images/banner/${listProduct.images.get(i).getImageUrl() }"></a>
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
											<div class="single-product-inforsale">
                                            Giảm giá 25%
                                         </div>
										<div class="single-product-infor-name">
											<p>
												<i class="glyphicon glyphicon-fire">
													${listProduct.viewNumber }</i> lượt xem
											</p>
										</div>
										<div class="single-product-inforprice">
											<p>
												<fmt:formatNumber value="${listProduct.price}" type="number" />
												đ
											</p>
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
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star-half-empty" style="color: gray"></i> <br>
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
					<c:forEach var="auction" items="${listAuction }">
						<div class="col-sm-3">
							<div class="new-product">
								<div class="single-product-item">
									<div class="single-product-image">
										<a
											href="${pageContext.request.contextPath }/detail?idproduct=${auction.product.productId}"><img
											src="resource/images/banner/${auction.product.images.get(i).getImageUrl() }"></a>
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
											<p class="single-product-infor-name-title">${auction.product.name }</p>
										</div>
										<!-- 	<div class="single-product-inforsale">
                                            Giảm giá 25%
                                         </div> -->
										<div class="single-product-info-timecountdown">
											<div class="single-product-info-timecountdown-title">
												<p>THỜI GIAN CÒN LẠI</p>
											</div>
											<div class="single-product-info-timecountdown-item">
												<h3>12</h3>
												<p>GIỜ</p>
												<h3>12</h3>
												<p>PHÚT</p>
											</div>
											<div class="single-product-info-timecountdown-title-notice">
												<label>Ngày kết thúc</label>
												<p><fmt:formatDate value="${auction.endTime }"
                                                    pattern="dd-MM-yyyy"/>
											</div>
										</div>
										<div class="single-product-infor-name">
											<p>
												<i class="glyphicon glyphicon-fire">
													${auction.product.viewNumber }</i> lượt xem
											</p>
										</div>
										<div class="single-product-inforprice">
											<p>
												<fmt:formatNumber value="${auction.product.price}"
													type="number" />
												đ
											</p>
										</div>
										<div class="single-product-inforsale">
											<a
												href="${pageContext.request.contextPath }/detail?idproduct=${auction.product.productId}"><button
													class="btn btn-success btn-countdown">
													<i class="fa fa-shopping-cart"></i> XEM CHI TIẾT
												</button></a>
										</div>
										<div class="single-product-inforreview">
											<%-- <span>(${listProduct.commentItems.size() } nhận xét)</span> --%>
										</div>
										<div class="single-product-inforrating">
											<div class="rating-box">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star-half-empty" style="color: gray"></i>
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