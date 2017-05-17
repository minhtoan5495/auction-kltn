<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!-- CONTENT-->
<style>
.single-product-image {
	position: relative;
	overflow: hidden;
	margin-bottom: 20px;
}

.single-product-image:hover {
	bottom: 0;
}

.single-product-image img {
	-webkit-transition: all 0.7s ease;
	transition: all 0.7s ease;
}

.single-product-image:hover img {
	-webkit-transform: scale(1.3);
	transform: scale(1.3);
}
</style>
<div class="content-page">
	<jsp:useBean id="currentDate" type="java.util.Date" scope="request"></jsp:useBean>
	<fmt:formatDate var="now" value="${currentDate}" pattern="yyyy-MM-dd" />
	<jsp:useBean id="timeNow" type="java.util.Date" scope="request"></jsp:useBean>
	<fmt:formatDate var="timeNow" value="${timeNow}" pattern="yyyy-MM-dd" />
	<div class="container">
		<div class="row">
			<div class="container slide-show">
				<div id="myCarousel" class="carousel slide slide-show-item"
					data-ride="carousel">

					<!-- Wrapper for slides -->
					<div class="carousel-inner">

						<div class="item active">
							<div class="col-sm-6">
								<h2>Chính sách đổi trả</h2>
								<div class="item-slide-product-description">
									<p>Hệ thống cam kết bán hàng nguyên mới và đảm bảo đúng
										chất lượng của nhà sản xuất. Đồng thời, sản phẩm mà khách hàng
										nhận được phải nguyên vẹn, hoạt động tốt và đúng với các thông
										tin mô tả trên website.</p>
									<p>Nếu sản phẩm quý khách nhận được không đúng với cam kết
										trên, quý khách vui lòng thông báo ngay cho hệ thống trong
										vòng 48 giờ kể từ thời điểm nhận hàng.</p>
									<p>Hệ thống xin từ chối hỗ trợ mọi khiếu nại về tình trạng
										ngoại quan của sản phẩm trong trường hợp quý khách thông báo
										cho hệ thống sau thời gian này..</p>
								</div>
							</div>
							<div class="col-sm-6">
								<img src="resource/images/banner/doitrahang.png"
									class="girl img-responsive" alt=""
									style="width: 360px; height: 360px" />
							</div>
						</div>
						<!-- End Item -->

						<div class="item">
							<div class="col-sm-6">
								<h2>Miễn phí giao hàng</h2>
								<div class="item-slide-product-description">
									<p>Dịch vụ “Miễn phí giao hàng Nhanh toàn quốc 1-2 ngày" áp
										dụng đơn giản cho tất cả các đơn hàng sau:</p>
									<p>+Từ 300.000 đối với đơn hàng chuyển đến TPHCM</p>
									<p>+Từ 500.000 đối với đơn hàng chuyển đến tất cả các tỉnh,
										thành phố khác tại Việt Nam bao gồm tất cả sản phẩm có bán tại
										hệ thống…</p>
								</div>
							</div>
							<div class="col-sm-6">
								<img src="resource/images/banner/giao-hang.png"
									class="girl img-responsive" alt=""
									style="width: 360px; height: 360px" />
							</div>
						</div>
						<!-- End Item -->

						<div class="item">
							<div class="col-sm-6">
								<h2>Hình thức đấu giá đơn giản</h2>
								<div class="item-slide-product-description">
									<p>Hệ thống ngoài việc bán hàng trực tuyến còn là một hệ
										thống đấu giá trực tuyến được xây dựng với mong muốn đem đến
										một trải nghiệm mua sắm đặc biệt và thú vị cho người Việt Nam.</p>
									<p>Đến với hệ thống chúng tôi là để khám phá sự độc đáo và
										trải nghiệm cảm giác chiến thắng để sở hữu sản phẩm thực sự
										dành cho bạn. Chúng luôn tin rằng các giá trị của sản phẩm
										phải thực sự do bạn quyết định, chính vì vậy đấu giá trực
										tuyến sẽ là phương thức đơn giản nhất để định giá sản phẩm
										theo cách của riêng bạn.</p>
								</div>
							</div>
							<div class="col-sm-6">
								<img src="resource/images/banner/daugia.png"
									class="girl img-responsive" alt=""
									style="width: 360px; height: 360px" />
							</div>
						</div>
						<!-- End Item -->

						<div class="item">
							<div class="col-sm-6">
								<h2>Dịch vụ chăm sóc khách hàng</h2>
								<div class="item-slide-product-description">
									<p>Đối với bất kỳ câu hỏi hoặc phản hồi của bạn, vui lòng
										liên hệ với dịch vụ khách hàng của chúng tôi tại đây. Chúng
										tôi sẽ cố gắng đáp ứng yêu cầu của bạn trong vòng 24 giờ..</p>
									<p>Liên hệ chúng tôi</p>
									<p>+Email: saleauction@gmail.com</p>
									<p>+SĐT: 01223456789</p>
									<p>+Facebook: www.facebook.com/saleauctiongroup</p>
								</div>
							</div>
							<div class="col-sm-6">
								<img src="resource/images/banner/cskh.png"
									class="girl img-responsive" alt=""
									style="width: 360px; height: 360px; border-radius: 70px;" />
							</div>
						</div>
						<!-- End Item -->

					</div>
					<!-- End Carousel Inner -->


					<ul class="nav nav-pills nav-justified nav-slide-info">
						<li data-target="#myCarousel" data-slide-to="0"
							class="active nav-slide-info-item"><a href="#"
							class="nav-slide-info-item-link">CHÍNH SÁCH ĐỔI TRẢ <small>2
									ngày sau khi giao nếu không đúng mẫu mã cam kết </small>
						</a></li>
						<li data-target="#myCarousel" data-slide-to="1"
							class="nav-slide-info-item"><a href="#"
							class="nav-slide-info-item-link">MIỄN PHÍ GIAO HÀNG <small>Miễn
									phí giao hàng với những hóa đơn được cập nhật trên </small>
						</a></li>
						<li data-target="#myCarousel" data-slide-to="2"
							class="nav-slide-info-item"><a href="#"
							class="nav-slide-info-item-link">HÌNH THỨC ĐẤU GIÁ ĐƠN GIẢN <small>Thủ
									tục đấu giá đơn giản </small>
						</a></li>
						<li data-target="#myCarousel" data-slide-to="3"
							class="nav-slide-info-item"><a href="#"
							class="nav-slide-info-item-link">CHĂM SÓC KHÁCH HÀNG <small>Dịch
									vụ chăm sóc khách hàng luôn hỗ trợ trong 24h </small>
						</a></li>
					</ul>


				</div>
				<!-- End Carousel -->
			</div>
		</div>
		<div class="row">
			<div class="content-page">
				<c:if test="${not empty message }">
					<div class="alert alert-success" style="text-align: center;" id="message">
							${message}
					</div>
				</c:if>
				<div class="content-page-title">
					<h2 class="content-paget-title-item">SẢN PHẨM BÁN</h2>
				</div>
				<div class="row">
					<h4>${message}</h4>
					<c:forEach var="product" items="${productSalePage.pageList }">
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
									<div class="single-product-showinfor">
										<div class="single-product-infor-name">
											<p class="single-product-infor-name-title">${product.name }</p>
										</div>
										<c:if
											test="${not empty (product.discounts) and  product.discounts.get(i).endDate >= now }">
											<div class="single-product-inforsale">Giảm giá
												${product.discounts.get(i).discountPercent }%</div>
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
													<p style="color: #ec2800">
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
										<div class="single-product-btn">
											<input hidden value="${product.productId}" id="productId">
											<a
												href="${pageContext.request.contextPath }/addCart?productId=${product.productId}">
												<button class="btn  btn-countdown">
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
								</div>
							</div>
						</div>
					</c:forEach>
					<jsp:useBean id="productSalePage" scope="request"
						type="org.springframework.beans.support.PagedListHolder">
					</jsp:useBean>
					<c:url value="/home" var="pagedLink">
						<c:param name="p" value="~"></c:param>
					</c:url>
					<tg:paging pagedLink="${pagedLink }"
						productSalePage="${productSalePage }"></tg:paging>
				</div>
				<div class="content-page-title">
					<h2 class="content-paget-title-item">SẢN PHẨM ĐẤU GIÁ</h2>
				</div>
				<div class="row">
					<h4>${message}</h4>
					<c:forEach var="product" items="${productAuctionPage.pageList }">
						<c:if
							test="${ product.auctions.get(i).status eq 'ĐANG ĐẤU GIÁ' or product.auctions.get(i).endTime >=now }">
							<div class="col-sm-3 new-product-main">
								<div class="new-product">
									<div class="single-product-item">
										<div class="single-product-image">
											<a
												href="${pageContext.request.contextPath }/detail?productId=${product.productId}">
												<img style="width: 253px; height: 300px;"
												src="${pageContext.request.contextPath}/resource/images/product/${product.images.get(i).imageUrl }">
											</a>
											<div class="overplay-content"></div>
										</div>
										<div class="single-product-showinfor">
											<div class="single-product-infor-name">
												<p class="single-product-infor-name-title">${product.name }</p>
											</div>
											<div class="single-product-info-timecountdown">
												<input value="${product.auctions.get(i).endTime }"
													id="endTime" type="hidden">
												<c:choose>
												<c:when test="${ product.auctions.get(i).endTime >=timeNow}">
													<div class="single-product-info-timecountdown-title-notice">
														<label>Ngày kết thúc</label>
														<p>
															<fmt:formatDate
																value="${product.auctions.get(i).endTime }"
																pattern="dd-MM-yyyy hh:mm" />
													</div>
												</c:when>
												<c:otherwise>
													<div class="single-product-info-timecountdown-title-notice">
														<h4 style="color: #b0d136">Phiên đấu giá đã kết thúc</h4>
													</div>
													<div class="single-product-info-timecountdown-title-notice">
														<label style="color: #eee">0</label>
														<p></p>
													</div>
												</c:otherwise>
												</c:choose>
											</div>
											<div class="single-product-infor-name">
												<p>
													<i class="glyphicon glyphicon-fire">
														${product.viewNumber }</i> lượt xem
												</p>
											</div>
											<div class="single-product-inforprice">
												<p>
													<fmt:formatNumber value="${product.price}" type="number" />
													đ
												</p>
											</div>
											<div class="single-product-btn" style="margin-top: -40px">
												<a
													href="${pageContext.request.contextPath }/detail?productId=${product.productId}">
													<button class="btn btn-countdown">
														<i class="fa fa-shopping-cart"></i> XEM CHI TIẾT
													</button>
												</a>
											</div>
											<div class="single-product-inforreview"></div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
					<jsp:useBean id="productAuctionPage" scope="request"
						type="org.springframework.beans.support.PagedListHolder">
					</jsp:useBean>
					<c:url value="/home" var="pagedLink1">
						<c:param name="page" value="~"></c:param>
					</c:url>
					<tg:pagingAuction pagedLink1="${pagedLink1 }"
						productAuctionPage="${productAuctionPage }"></tg:pagingAuction>
				</div>

				<div class="row">
					<div class="box-product-view">

						<div class="carousel">

							<header class="hgroup">
								<div class="nav-carousel">
									<a href="#" class="btn flex-prev"><span>Prev</span></a> <a
										href="#" class="btn flex-next"><span>Next</span></a>
								</div>
								<h3>Sản phẩm có lượt xem nhiều nhất</h3>
							</header>

							<ul class="products slides">
								<c:forEach var="productView" items="${listProductHighView }">
									<li class="h-product">
										<div class="new-product" style="background: #fff">
											<div class="single-product-item">
												<div class="single-product-image">
													<a
														href="${pageContext.request.contextPath }/detail?productId=${productView.productId}"><img
														style="width: 253px; height: 300px;"
														src="resource/images/product/${productView.images.get(i).imageUrl }"></a>
													<div class="overplay-content">
														<ul>
															<li><a
																href="${pageContext.request.contextPath }/detail?productId=${productView.productId}"><i
																	class="fa fa-search"></i></a></li>
															<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
															<li><a href="#"><i class="fa fa-retweet"></i></a></li>
															<li><a href="#"><i class="fa fa-heart-o"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="single-product-showinfor">
													<div class="single-product-infor-name">
														<p class="single-product-infor-name-title">${productView.name }</p>
													</div>
													<c:if
														test="${not empty (productView.discounts) and productView.discounts.get(i).endDate >= now  }">
														<div class="single-product-inforsale">Giảm giá
															${productView.discounts.get(i).discountPercent }%</div>
													</c:if>
													<div class="single-product-infor-name">
														<p>
															<i class="glyphicon glyphicon-fire">
																${productView.viewNumber }</i> lượt xem
														</p>
													</div>
													<div class="single-product-inforprice">
														<c:choose>
															<c:when
																test="${not empty(productView.discounts) and productView.discounts.get(i).endDate >= now }">
																<strike style="color: black"> <fmt:formatNumber
																		value="${productView.price}" type="number" /> đ
																</strike>
															</c:when>
															<c:otherwise>
																<strike style="color: #fff">000</strike>
																<p style="color: #ec2800">
																	<fmt:formatNumber value="${productView.price}"
																		type="number" />
																	đ
																</p>
															</c:otherwise>
														</c:choose>
													</div>
													<div class="single-product-inforprice">
														<c:if
															test="${not empty(productView.discounts) and productView.discounts.get(i).endDate >= now  }">
															<p>
																<fmt:formatNumber
																	value="${(productView.price)-((productView.price*productView.discounts.get(i).discountPercent)/100)}"
																	type="number" />
																đ
															</p>
														</c:if>
													</div>
													<c:choose>
														<c:when
															test="${productView.transactionType.transactionTypeName eq 'Sale' }">
															<div class="single-product-inforsale">
																<input hidden value="${productView.productId}"
																	id="productSale"> <a
																	href="${pageContext.request.contextPath }/addCart?productId=${productView.productId}">
																	<button class="btn btn-countdown">
																		<i class="fa fa-shopping-cart"></i> MUA NGAY
																	</button>
																</a>
															</div>
														</c:when>
														<c:otherwise>
															<div class="single-product-inforsale">
																<input hidden value="${productView.productId}"
																	id="productAuction"> <a
																	href="${pageContext.request.contextPath }/detail?productId=${productView.productId}">
																	<button class="btn btn-countdown">
																		<i class="fa fa-shopping-cart"></i> XEM CHI TIẾT
																	</button>
																</a>
															</div>
														</c:otherwise>
													</c:choose>
													<div class="single-product-inforrating">
														<div class="rating-box">
															<span>(Có ${productView.ratings.size() } nhận xét)</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>

						</div>

					</div>
				</div>
				<div class="row main-content-page-supplier" style="margin-left: 1px">
					<div class="content-page-supplier">
						<h4>Thương hiệu nổi tiếng</h4>
						<div class="content-page-supplier-logo-item">
							<div class="col-sm-2">
								<a href="#"><img
									src="${pageContext.request.contextPath }/resource/images/supplier/bitis.png"
									style="width: 100px; height: 100px; margin-top: 30px; margin-bottom: 30px"></a>
							</div>
							<div class="col-sm-2">
								<a href="#"><img
									src="${pageContext.request.contextPath }/resource/images/supplier/fmen.png"
									style="width: 100px; height: 100px; margin-top: 30px; margin-bottom: 30px"></a>
							</div>
							<div class="col-sm-2">
								<a href="#"><img
									src="${pageContext.request.contextPath }/resource/images/supplier/kemei.png"
									style="width: 100px; height: 100px; margin-top: 30px; margin-bottom: 30px"></a>
							</div>
							<div class="col-sm-2">
								<a href="#"><img
									src="${pageContext.request.contextPath }/resource/images/supplier/rolex.png"
									style="width: 100px; height: 100px; margin-top: 30px; margin-bottom: 30px"></a>
							</div>
							<div class="col-sm-2">
								<a href="#"><img
									src="${pageContext.request.contextPath }/resource/images/supplier/urban.png"
									style="width: 100px; height: 100px; margin-top: 30px; margin-bottom: 30px"></a>
							</div>
							<div class="col-sm-2">
								<a href="#"><img
									src="${pageContext.request.contextPath }/resource/images/supplier/rolex.png"
									style="width: 100px; height: 100px; margin-top: 30px; margin-bottom: 30px"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END CONTENT -->