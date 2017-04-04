<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="main-content-detail">
	<div class="container">
		<div class="row">
			<div class="content-detail-title">
				<h2 class="content-paget-title-item">Chi tiết sản phẩm</h2>
			</div>
			<div class="col-sm-8">
				<div class="row">
					<div class="col-sm-4">
						<div class="detail-product-item">
							<div class="tab-content">
								<div class="tab-pane active" id="imageContainer">
									<div class="product-detail-image">
										<img id="imageContainer" name="image_main"
											src="resource/images/banner/${singleProduct.image }">
									</div>
									<ul class="nav navbar-nav">
										<c:forEach var="image" items="${singleProduct.imageItem }">
											<li class="image-list"><img
												src="resource/images/banner/${image.link_image }"
												style="width: 65px; height: 100px; padding: 5px"></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="detail-product-infor">
							<h2 class="detail-product-name"
								style="font-family: 'Bitter', serif">${singleProduct.name }</h2>
							<p class="detail-product-name"
								style="font-family: 'Bitter', serif">Mã sản phẩm
								:${singleProduct.idproduct }</p>
							<div class="product-detail">
								<label>Người đăng:<a href="#">Shinmu13194</a></label>| <label
									class="memberpost-infor" style="font-weight: 100; color: #333;">Quảng
									Nam</label> <label class="memberpost-infor"
									style="font-weight: 100; color: #333;">01665102292</label>
							</div>
							<div class="detail-product-share">
								<ul class="product-share">
									<li><a href="#" class="face-share"><i
											class="fa fa-facebook"></i></a></li>
									<li><a href="#" class="ins-share"><i
											class="fa fa-instagram"></i></a></li>
									<li><a href="#" class="twit-share"><i
											class="fa fa-twitter"></i></a></li>
								</ul>
							</div>
							<div class="product-detail-view">
								<label><i class="glyphicon glyphicon-eye-open"></i> Lượt
									xem : ${singleProduct.view}</label>
								<p>(Còn lại ${singleProduct.quantity} sản phẩm)</p>
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
									<div class="form-detail-size">
										<label>Thời gian đấu:
											<button class="btn btn-success">12:20:30</button>
										</label>
									</div>
									<p>
										<br>
									</p>
									<div class="form-detail-quantity">
										<label>Giá đấu:</label> <input
											class="form-control input-field" type="text">

									</div>
									<div class="form-detail-addcart">
										<div class="submit-button">
											<a href="#" class="btn submit-btn"
												style="background: green; border-color: green"> <span><i
													class=""></i> Bắt đầu đấu giá </span>
											</a>
										</div>
										<div class="submit-button"
											style="margin-left: 175px; margin-top: -55px">
											<a
												href="${pageContext.request.contextPath }/cart?idproduct=${singleProduct.idproduct}"
												class="btn submit-btn"
												style="background: #00509d; border-color: #00509d"> <span><i
													class=""></i> Thêm vào giỏ hàng </span>
											</a>
										</div>
									</div>
									<p>
										<br>
									</p>

								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12" id="infor-scroll">
						<div class="product-informore" id="infor-scroll-item">
							<ul class="nav nav-tabs more-infor">
								<li class="active">
								<a href="#detail">Chi tiết sản phẩm</a>
								</li>
								<li><a href="#review">Đánh giá sản phẩm</a></li>
								<li><a href="#comment">Bình luận-Hỏi đáp</a></li>
							</ul>
							<div class="tab-content-detail" id="detail">
								<div class="tab-pane active">
									
									<div class="tab-descript">
										<p>${singleProduct.description }</p>
										<img src="resource/images/banner/${singleProduct.image }"
											style="width: 100%">
									</div>
								</div>
							</div>
						</div>
						<div class="row" id="review">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-8">
										<h2 style="font-size: 20px; font-weight: bold;">Đánh giá
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
												<div class="modal-content">
													<div class="modal-header">
														<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
														<div class="alert alert-success">
															<strong>Cảnh báo!</strong> Bạn phải đăng nhập mới được
															bình luận sản phẩm này
														</div>
													</div>
													<div class="modal-body">
														<a href="${pageContext.request.contextPath }/login"><button class="btn btn-danger btn-modal-comment">Đăng nhập tại đây</button></a>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-primary"
															data-dismiss="modal" style="border-radius:0 ">X</button>
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
													<div class="rating_star_item">
														<a href="#"><img alt=""
															src="${pageContext.request.contextPath }/resource/images/backgroundmenu/rating_3.png"></a>
														<a href="#"><img alt=""
															src="${pageContext.request.contextPath }/resource/images/backgroundmenu/rating_3.png"></a>
														<a href="#"><img alt=""
															src="${pageContext.request.contextPath }/resource/images/backgroundmenu/rating_3.png"></a>
														<a href="#"><img alt=""
															src="${pageContext.request.contextPath }/resource/images/backgroundmenu/rating_2.png"></a>
														<a href="#"><img alt=""
															src="${pageContext.request.contextPath }/resource/images/backgroundmenu/rating_3.png"></a>
													</div>
													<div class="status-upload">
														<form:form commandName="CommentDto"
															action="${pageContext.request.contextPath }/comment/${singleProduct.idproduct }">
															<p>Nhận xét tổng quan</p>
															<form:input class="form-control title-comments"
																placeholder="Nhận xét tổng quan" path="title"></form:input>
															<p>Mô tả đánh giá</p>
															<form:textarea
																placeholder="Viết đánh giá nhận xét cho sản phẩm này..."
																path="content" class="comment_input"></form:textarea>
															<button type="submit"
																class="btn btn-success sumit_comment">Bình luận</button>
														</form:form>
													</div>
													<!-- Status Upload  -->
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
								<h2 style="font-size: 20px; font-weight: bold;">Nhận xét
									sản phẩm ${singleProduct.name }</h2>
								<label>Có ${singleProduct.commentItems.size() } nhận xét</label>
								<c:forEach var="comment" items="${singleProduct.commentItems }">
									<div class="comment-items">
										<img class="img-responsive user-photo"
											src="resource/images/avatar/avartar-cmt.png"
											style="width: 31px">
										<div class="panel panel-default"
											style="margin-left: 40px; margin-top: -30px;">
											<div class="panel-heading comment-heading">
												<label><a href="#">${comment.user.username }</a></label>
												<p class="memberpost-infor">
													Đã comment vào
													<fmt:formatDate value="${comment.createdate }"
														pattern="yyyy-MM-dd" />
												</p>
											</div>
											<label class="memberpost-infor">${comment.title }</label>
											<div class="content-comment">
												<p>${comment.content }</p>
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
				<div class="col-sm-4">
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
									<tr>
										<td>Shinmu13194</td>
										<td>17:30:35</td>
										<td>355,000</td>
									</tr>
									<tr>
										<td>Lucky</td>
										<td>17:30:35</td>
										<td>340,000</td>
									</tr>
									<tr>
										<td>Mesutozil</td>
										<td>17:30:35</td>
										<td>345,000</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
