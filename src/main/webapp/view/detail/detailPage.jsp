<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="header_detail_lg hidden-xs" id="header_detail_scroll">
	<div class="container no-padding">
		<div class="main_header_detail">
			<div class="main_header_detail_item">
				<a href="#" class="main_header_detail_item_link">Thông tin chi
					tiết</a>
			</div>
			<div class="main_header_detail_item">
				<a href="#" class="main_header_detail_item_link"> > </a>
			</div>
			<div class="main_header_detail_item">
				<a href="#" class="main_header_detail_item_link">Đánh giá sản
					phẩm</a>
			</div>
			<div class="main_header_detail_item">
				<a href="#" class="main_header_detail_item_link"> > </a>
			</div>
			<div class="main_header_detail_item">
				<a href="#" class="main_header_detail_item_link">${singleProduct.category.categoryName }</a>
			</div>
			<div class="main_header_detail_item">
				<a href="#" class="main_header_detail_item_link"> > </a>
			</div>
			<div class="main_header_detail_item">
				<a href="#" class="main_header_detail_item_link"><span
					class="main_header_detail_item_name">${singleProduct.name }</span></a>
			</div>
		</div>
	</div>
</div>
<section class="main-content-detail">
	<div class="container main-content-detail-contain">
		<div class="row">
			<div class="content-detail-title">
				<p>
					Được sản xuất bởi: <a>${singleProduct.supplier. supplierName}</a>
				<p>
					Ngày sản xuất:<a><fmt:formatDate
							value="${singleProduct.manufactureDate }" pattern="dd-MM-yyyy" /></a>
				</p>
			</div>
			<div class="col-sm-9">
				<div class="row">
					<form action="addAuction">
						<input value="${singleProduct.productId }" name="productId"
							type="hidden">
						<div class="col-sm-4">
							<div class="detail-product-item">
								<div class="tab-content">
									<div class="tab-pane active" id="imageContainer">
										<div class="product-detail-image">
											<img id="imageContainer1" name="image_main"
												src="resource/images/product/${singleProduct.images.get(i).imageUrl }">
										</div>
										<div class="product-detail-multi-image">
											<div class="carousel slide multi-item-carousel"
												id="theCarousel">
												<div class="carousel-inner">
													<div class="item">
														<div class="col-xs-4">
															<a href="#1"><img
																src="resource/images/product/bititshunter.jpg"
																class="img-responsive"></a>
														</div>
													</div>
													<div class="item">
														<div class="col-xs-4">
															<a href="#1"><img
																src="resource/images/product/bititshunter1.jpg"
																class="img-responsive"></a>
														</div>
													</div>
													<div class="item">
														<div class="col-xs-4">
															<a href="#1"><img
																src="resource/images/product/bititshunter2.jpg"
																class="img-responsive"></a>
														</div>
													</div>
													<div class="item">
														<div class="col-xs-4">
															<a href="#1"><img
																src="resource/images/product/bititshunter3.jpg"
																class="img-responsive"></a>
														</div>
													</div>
													<div class="item">
														<div class="col-xs-4">
															<a href="#1"><img
																src="resource/images/product/bititshunter4.jpg"
																class="img-responsive"></a>
														</div>
													</div>
													<div class="item">
														<div class="col-xs-4">
															<a href="#1"><img
																src="resource/images/product/bititshunter.jpg"
																class="img-responsive" id="imageContainer1"></a>
														</div>
													</div>
													<!-- add  more items here -->
													<!-- Example item start:  -->

													<div class="item">
														<div class="col-xs-4">
															<a href="#1"><img
																src="resource/images/product/bititshunter4.jpg"
																class="img-responsive"></a>
														</div>
													</div>

													<!--  Example item end -->
												</div>
												<a class="left carousel-control" href="#theCarousel"
													data-slide="prev"><i
													class="glyphicon glyphicon-chevron-left"
													style="font-size: 15px; margin-top: -7px"></i></a> <a
													class="right carousel-control" href="#theCarousel"
													data-slide="next"><i
													class="glyphicon glyphicon-chevron-right"
													style="font-size: 15px; margin-top: -7px"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-8">
							<div class="detail-product-infor">
								<h2 class="detail-product-name"
									style="font-family: 'Bitter', serif">${singleProduct.name }</h2>
								<p class="detail-product-id"
									style="font-family: 'Bitter', serif">
									Lượt bình chọn : <input type="hidden" value="${ratingNumber}"
										id="ratingNumber">
								</p>
								<div id="ratingShow"></div>
								<p>(${ratingNumber} sao)</p>
								<p class="detail-product-id"
									style="font-family: 'Bitter', serif">Mã sản phẩm
									:${singleProduct.productId }</p>
								<div class="product-detail-view">
									<label><i class="glyphicon glyphicon-eye-open"></i>
										Lượt xem : ${singleProduct.viewNumber}</label>
									<p>(Còn lại ${singleProduct.stockQuantity} sản phẩm)</p>
								</div>
								<div class="product-detail-color">
									<%--<p><i class="glyphicon glyphicon-ok"></i>Màu sắc ${singleProduct.productDetails.get(i).color }</p>--%>
									<%--<p><i class="glyphicon glyphicon-ok"></i>Kích cỡ ${singleProduct.productDetails.get(i).size }</p>--%>
								</div>
								<div class="product-detail-price">
									<h2>
										<fmt:formatNumber value="${singleProduct.price}" type="number" />
										đ
									</h2>
								</div>
								<div class="product-detail-description">
									<p>${singleProduct.description }</p>
								</div>
								<div class="box-detail-information">
									<form class="form-detail-information">
										<c:if
											test="${singleProduct.transactionType.transactionTypeId == 1}">
											<p id="demo" style="text-align: center;"></p>
											<div id="countDownAuction">
												<div class="form-detail-size">
													<label style="color: #f37021">Kết thúc vào ngày</label>
													<p style="font-size: 30px">
														<fmt:formatDate
															value="${singleProduct.auctions.get(i).endTime}"
															pattern="dd-MM-yyyy" />
													</p>
													<input value="${singleProduct.auctions.get(i).endTime }"
														id="endTime" type="hidden"> <label>Thời
														gian còn lại</label>
													<div class="form-detail-timecountdown">
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
												</div>
												<div class="form-detail-quantity">
													<label>Giá đấu:</label> <input
														class="form-control input-field" type="text" id="price"
														name="price">

												</div>
											</div>
										</c:if>
										<div class="form-detail-addcart">
											<c:choose>
												<c:when
													test="${singleProduct.transactionType.transactionTypeId == 1 }">
													<div class="submit-button" id="buttonAuction">
														<button type="submit">
															<img class="" src="resource/css/images/icon-title.png">ĐẤU
															GIÁ
														</button>

													</div>
												</c:when>
												<c:otherwise>
													<div class="submit-button">
														<a
															href="${pageContext.request.contextPath }/addCart?idproduct=${singleProduct.productId}"
															class="btn submit-btn"> <span><i
																class="glyphicon glyphicon-shopping-cart"></i> MUA NGAY
														</span>
														</a>
													</div>
												</c:otherwise>
											</c:choose>
										</div>
										<p>
											<br>
										</p>
									</form>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="row">
					<div class="col-sm-12" id="infor-scroll">
						<div class="product-informore" id="infor-scroll-item">
							<ul class="nav nav-tabs more-infor">
								<li class="active"><a href="#detail">Chi tiết sản phẩm</a>
								</li>
								<li><a href="#review">Đánh giá sản phẩm</a></li>
								<li><a href="#comment">Bình luận-Hỏi đáp</a></li>
							</ul>
							<div class="tab-content-detail" id="detail">
								<div class="tab-pane active">
									<div class="content-detail-title">
										<h2 style="font-size: 20px">Giới thiệu về sản phẩm
											${singleProduct.name }</h2>
									</div>
									<div class="tab-descript">
										<p>${singleProduct.description }</p>
										<img
											src="resource/images/product/${singleProduct.images.get(i).imageUrl}"
											style="width: 100%">
									</div>
								</div>
							</div>
						</div>
						<div class="row" id="review">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-8">
										<h2 style="font-size: 15px; font-weight: bold;">Đánh giá
											và nhận xét cho sản phẩm ${singleProduct.name }</h2>
									</div>
									<div class="col-sm-4">
										<button class="btn btn-danger review_item"
											id="review_item_toggle" data-toggle="modal"
											data-target="#myModal">Đánh giá và nhận xét</button>
									</div>
								</div>
								<c:choose>
									<c:when test="${pageContext.request.userPrincipal==null }">
										<div class="modal fade" id="myModal" role="dialog">
											<div class="modal-dialog">
												<!-- Modal content-->
												<div class="modal-content-review">
													<div class="modal-header">
														<div class="alert alert-success">
															<strong>Cảnh báo!</strong> Bạn phải đăng nhập mới được
															bình luận sản phẩm này
														</div>
													</div>
													<div class="modal-body">
														<a
															href="${pageContext.request.contextPath }/rating/${singleProduct.productId}">
															<button class="btn btn-danger btn-modal-comment">Đăng
																nhập tại đây</button>
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
										<div class="row review_boxes" id="review_item_show">
											<div class="col-sm-8">
												<div class="review_boxes_item">
													<label>Vui lòng chia sẻ nhận xét đánh giá về sản
														phẩm này</label>
													<p>Bình chọn sản phẩm này</p>
													<form:form commandName="ratingDto" method="post"
														action="${pageContext.request.contextPath }/rating/${singleProduct.productId}">
														<p>
														<div id="ratingStars">
															<form:input class="form-control title-comments"
																id="ratingInput" type="hidden" path="rating"></form:input>
														</div>
														</p>
														<p>Nhận xét tổng quan</p>
														<form:input class="form-control title-comments"
															placeholder="Nhận xét tổng quan" path="title"></form:input>
														<p>Mô tả đánh giá</p>
														<form:textarea
															placeholder="Viết đánh giá nhận xét cho sản phẩm này..."
															path="content" class="comment_input"></form:textarea>
														<button type="submit"
															class="btn btn-success sumit_comment">Bình chọn
														</button>
													</form:form>
													<div class="status-upload"></div>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="review_boxes_item">
													<label>Lưu ý khi nhận xét sản phẩm</label>
													<p>+Nhận xét một cách khách quan,</p>
													<p>+Đánh giá sản phẩm,thông số, bề ngoài chất liệu</p>
													<p>+Liệt kê những ưu điểm,khuyết điểm để chúng tôi có
														thể xem xét và đưa ra những sản phẩm chất lượng nhất có
														thể</p>
													<p>+Không chửi thề, văng tục, nhận xét tiêu cực quá
														đáng dùng từ ngữ vô văn hóa</p>
												</div>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
								<!-- Widget Area -->
							</div>
						</div>
						<div class="row" id="comment">
							<div class="col-sm-12">
								<h2 style="font-size: 15px; font-weight: bold;">Nhận xét
									sản phẩm ${singleProduct.name }</h2>
								<label>Có ${ratings.size() } nhận xét</label>
								<c:forEach var="rating" items="${ratings }">
									<div class="comment-items">
										<div class="row">
											<div class="col-sm-2">
												<img class="img-responsive user-photo"
													src="resource/images/avatar/avartar-cmt.png">
											</div>
											<div class="col-sm-10">
												<div class="comment-items-user">
													<label class="comment-items-user-name">${rating.user.username }</label>
												</div>
												<div class="comment-items-time">
													<label class="comment-items-time"><fmt:formatDate
															value="${rating.createDate }" pattern="dd-mm-yyyy" /> at
														<fmt:formatDate value="${rating.createDate }"
															pattern="hh:mm:ss" /></label>
												</div>
												<div class="comment-items-content">
													<h3>${rating.ratingTitle  }</h3><br> <label>${rating.ratingContent  }</label>
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
			<div class="row">
				<div class="col-sm-3">
					<c:if test="${singleProduct.transactionType.transactionTypeId==1 }">
						<div class="product-viewed">
							<div class="product-detail-viewed">
								<h2 class="content-paget-title-item">Danh sách người đấu</h2>
							</div>
							<div class="infor_user_auction">
								<table class="table table-bordered">
									<thead>
										<tr class="table_heading">
											<th class="table_heading_item">Tên tài khoản</th>
											<th class="table_heading_item">Thời gian đấu</th>
											<th class="table_heading_item">Giá tiền</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="userAuction" items="${userAuctions }">
											<tr>
												<td>${userAuction.user.username }</td>
												<td><fmt:formatDate value="${userAuction.bidtime }"
														pattern="HH:MM:ss" /></td>
												<td><fmt:formatNumber value="${userAuction.price}"
														type="number" /> đ</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</c:if>
					<div class="product-detail-relate">
						<div class="product-detail-relate-item-title">
							<h3>Sản phẩm liên quan</h3>
						</div>
						<div class="product-detail-relate-item-stack">
							<c:forEach var="getRelateProduct" items="${getRelateProduct }">
								<div class="new-product" style="margin-bottom: 5px">
									<div class="single-product-item">
										<div class="single-product-image">
											<a href=""><img
												src="resource/images/product/${getRelateProduct.images.get(i).getImageUrl() }"></a>
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
												<p class="single-product-infor-name-title">${getRelateProduct.name }</p>
											</div>
											<!-- 	<div class="single-product-inforsale">
                                                Giảm giá 25%
                                             </div> -->
											<div class="single-product-inforprice">
												<p>
													<fmt:formatNumber value="${getRelateProduct.price }"
														type="number" />
													đ
												</p>
											</div>
											<div class="single-product-inforsale">
												<a href="">
													<button class="btn btn-success btn-countdown">
														<i class="fa fa-shopping-cart"></i> MUA NGAY
													</button>
												</a>
											</div>
											<div class="single-product-inforrating">
												<div class="rating-box">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star-half-empty" style="color: gray"></i> <br>
													<span>(Có 10 nhận xét)</span>

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
	</div>
</section>