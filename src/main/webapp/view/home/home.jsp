
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
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<img src="resource/images/banner/banner-huongdanmua.gif"
										style="height: 233px" alt="Chania">
								</div>

								<div class="item">
									<img src="resource/images/banner/download.jpg" alt="Chania">
								</div>

								<div class="item">
									<img src="resource/images/banner/banner.jpg" alt="Flower">
								</div>

								<div class="item">
									<img src="resource/images/banner/banner12.jpg" alt="Flower">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel" role="button"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								role="button" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
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
						<div class="col-sm-3">
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
										<!-- 	<div class="single-product-inforsale">
                                            Giảm giá 25%
                                         </div> -->
										<div class="single-product-infor-name">
											<p>
												<i class="glyphicon glyphicon-fire"> ${listProduct.viewNumber }</i>
												lượt xem
											</p>
										</div>
										<div class="single-product-inforprice">
											<p>
												<fmt:formatNumber value="${listProduct.price}" type="number" />
												đ
											</p>
										</div>
										<div class="single-product-inforsale">
											<button class="btn btn-success btn-countdown">20:17:80</button>
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