<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!-- CONTENT-->
<div class="content-page">
	<div class="container">
		<div class="row">
			<div class="container slide-show">
				<div class="row">
					<div>
						<div id="slider-carousel" class="carousel slide slide-show-item"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#slider-carousel" data-slide-to="0"
									class="active"></li>
								<li data-target="#slider-carousel" data-slide-to="1"></li>
								<li data-target="#slider-carousel" data-slide-to="2"></li>
							</ol>

							<div class="carousel-inner">
								<div class="item">
									<div class="col-sm-6">
										<h1>
											<span>Auction</span>-Sale
										</h1>
										<h2>Giày thể thao nam Biti's Hunter Liteknit II DS1252
											(Đen)</h2>
										<div class="item-slide-product-description">
											<p>Công nghệ quai dệt Litekit Ở phiên bản mới của Hunter,
												Biti's đã thay thế chất liệu Air Mesh cũ bằng công nghệ mới
												có tên gọi Liteknit. Đây là công nghệ dệt để tạo nên phần
												thân của giày với nhiều lỗ thoáng khí, tăng sự thoải mái và
												dễ chịu cho người mang. Ngoài ra, cải tiến này còn giúp cho
												việc vệ sinh đôi giày trở nên dễ dàng và thuận tiện hơn.</p>
										</div>
										<a href="#">
											<button type="button" class="btn btn-default get">Chi
												tiết</button>
										</a>
									</div>
									<div class="col-sm-6">
										<img src="resource/images/slideImage/bititshunter.png"
											class="girl img-responsive" alt=""
											style="width: 360px; height: 360px" />
									</div>
								</div>
								<c:forEach var="auction" items="${productAuctions }">
									<div class="item">
										<div class="col-sm-6">
											<h1>
												<span>Aution</span>-Sale
											</h1>
											<h2>${auction.name }</h2>
											<div class="item-slide-product-description">
												<p>${auction.description }</p>
											</div>
											<a href="#">
												<button type="button" class="btn btn-default get">Chi
													tiết</button>
											</a>
										</div>
										<div class="col-sm-6">
											<img src="resource/images/slideImage/bititshunter1.png"
												class="girl img-responsive" alt=""
												style="width: 360px; height: 360px" />

										</div>
									</div>
								</c:forEach>

							</div>

							<a href="#slider-carousel"
								class="left control-carousel hidden-xs" data-slide="prev"> <i
								class="fa fa-angle-left s-left"></i>
							</a> <a href="#slider-carousel"
								class="right control-carousel hidden-xs" data-slide="next">
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
				<div class="search-advance-item">
					<div class="dropdown search-supplier-item">
						<button class="btn dropdown-toggle btn-supplier-item"
							type="button" data-toggle="dropdown">
							Hãng sản xuất <span class="caret"></span>
						</button>
						<ul class="dropdown-menu supplier-dropdown-item">
							<c:forEach var="supplier" items="${suppliers }">
								<li><a
									href="${pageContext.request.contextPath }/supplier?supplierId=${supplier.supplierId}">${supplier.supplierName}</a>
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
				<div class="row">
					<h4>${message}</h4>
					<c:forEach var="product" items="${pagedListHolder.pageList }">
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
										<c:if test="${not empty (product.discounts) }">
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
												<c:when test="${not empty(product.discounts) }">
													<strike style="color: black"> <fmt:formatNumber
															value="${product.price}" type="number" /> đ
													</strike>
												</c:when>
												<c:otherwise>
													<p style="color: black">
														<fmt:formatNumber value="${product.price}" type="number" />
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
					<jsp:useBean id="pagedListHolder" scope="request"
						type="org.springframework.beans.support.PagedListHolder">
					</jsp:useBean>
					<c:url value="/home" var="pagedLink">
						<c:param name="p" value="~"></c:param>
					</c:url>
					<tg:paging pagedLink="${pagedLink }"
						pagedListHolder="${pagedListHolder }"></tg:paging>
				</div>
				<div class="content-page-title">
					<h2 class="content-paget-title-item">SẢN PHẨM ĐẤU GIÁ</h2>
				</div>
				<div class="row">
					<h4>${message}</h4>
					<c:forEach var="product" items="${pagedListHolder1.pageList }">
						<div class="col-sm-3 new-product-main">
							<div class="new-product">
								<div class="single-product-item">
									<div class="single-product-image">
										<a
											href="${pageContext.request.contextPath }/detail?productId=${product.productId}"><img
											style="width: 253px; height: 300px;"
											src="${pageContext.request.contextPath}/resource/images/product/${product.images.get(i).imageUrl }"></a>
										<div class="overplay-content">
											<ul>
												<li><a href=""><i class="fa fa-search"></i></a></li>
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
										<div class="single-product-info-timecountdown">
											<input value="${product.auctions.get(i).endTime }"
												id="endTime" type="hidden">
											<div class="single-product-info-timecountdown-title-notice">
												<label>Ngày kết thúc</label>
												<p>
													<fmt:formatDate value="${product.auctions.get(i).endTime }"
														pattern="dd-MM-yyyy hh:mm" />
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
										<div class="single-product-inforreview">
											<%-- <span>(${listProduct.commentItems.size() } nhận xét)</span> --%>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<jsp:useBean id="pagedListHolder1" scope="request"
						type="org.springframework.beans.support.PagedListHolder">
					</jsp:useBean>
					<c:url value="/home" var="pagedLink1">
						<c:param name="page" value="~"></c:param>
					</c:url>
					<tg:pagingAuction pagedLink1="${pagedLink1 }"
						pagedListHolder1="${pagedListHolder1 }"></tg:pagingAuction>
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
								<c:forEach var="productView" items="${productHighViews }">
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
													<c:if test="${not empty (productView.discounts) }">
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
															<c:when test="${not empty(productView.discounts) }">
																<strike style="color: black"> <fmt:formatNumber
																		value="${productView.price}" type="number" /> đ
																</strike>
															</c:when>
															<c:otherwise>
																<p style="color: black">
																	<fmt:formatNumber value="${productView.price}"
																		type="number" />
																	đ
																</p>
															</c:otherwise>
														</c:choose>
													</div>
													<div class="single-product-inforprice">
														<c:if test="${not empty(productView.discounts)  }">
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
															test="${productView.transactionType.transactionTypeId==2 }">
															<div class="single-product-inforsale">
																<input hidden value="${productView.productId}"
																	id="productId"> <a
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
																	id="productId"> <a
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
			</div>
		</div>
	</div>
</div>
<!-- END CONTENT -->