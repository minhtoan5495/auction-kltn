<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                <p>Được sản xuất bởi: <a>${singleProduct.supplier. supplierName}</a>
                <p>Ngày sản xuất:<a><fmt:formatDate value="${singleProduct.manufactureDate }"
                                                    pattern="dd-MM-yyyy"/></a></p>
            </div>
            <div class="col-sm-9">
                <div class="row">
                <form action="addAuction">
                	<input value="${singleProduct.productId }" name="productId" type="hidden">
                    <div class="col-sm-4">
                        <div class="detail-product-item">
                            <div class="tab-content">
                                <div class="tab-pane active" id="imageContainer">
                                    <div class="product-detail-image">
                                        <img id="imageContainer1" name="image_main"
                                             src="resource/images/banner/${singleProduct.images.get(i).getImageUrl() }">
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
                               style="font-family: 'Bitter', serif">Lượt bình chọn :
                                <input type="hidden" value="${ratingNumber}" id="ratingNumber"></p><div id="ratingShow"></div>
                            <p>(${ratingNumber} sao)</p>
                            <p class="detail-product-id"
                               style="font-family: 'Bitter', serif">Mã sản phẩm
                                :${singleProduct.productId }</p>
                            <div class="product-detail-view">
                                <label><i class="glyphicon glyphicon-eye-open"></i> Lượt
                                    xem : ${singleProduct.viewNumber}</label>
                                <p>(Còn lại ${singleProduct.stockQuantity} sản phẩm)</p>
                            </div>
                            <div class="product-detail-color">
                                <p><i class="glyphicon glyphicon-ok"></i>Màu sắc ${singleProduct.productDetails.get(i).color }</p>
                                <p><i class="glyphicon glyphicon-ok"></i>Kích cỡ ${singleProduct.productDetails.get(i).size }</p>
                            </div>
                            <div class="product-detail-price">
                                <h2>
                                    <fmt:formatNumber value="${singleProduct.price}" type="number"/>
                                    đ
                                </h2>
                            </div>
                            <div class="product-detail-description">
                                <p>${singleProduct.description }</p>
                            </div>
                            <div class="box-detail-information">
                                <form class="form-detail-information">
                                    <c:if test="${singleProduct.transactionType.transactionTypeId == 1}">
                                        <div class="form-detail-size">
                                         <label style="color: #f37021">Kết thúc vào ngày</label> <p style="font-size: 30px"><fmt:formatDate value="${singleProduct.auctions.get(i).getEndTime() }"
                                                    pattern="dd-MM-yyyy"/></p>
                                            <label>Thời gian còn lại</label>
                                            <div class="form-detail-timecountdown">
                                                <h3>12</h3>
                                                <p>Giờ</p>
                                                <h3>12</h3>
                                                <p>Phút</p>
                                            </div>
                                        </div>
                                        <div class="form-detail-quantity">
                                            <label>Giá đấu:</label> <input
                                                class="form-control input-field" type="text" id="price" name="price">

                                        </div>
                                    </c:if>
                                    <div class="form-detail-addcart">
                                        <c:choose>
                                            <c:when test="${singleProduct.transactionType.transactionTypeId == 1 }">
                                                <div class="submit-button">
                                                    <button type="submit"><img
                                                            class=""
                                                            src="resource/css/images/icon-title.png">ĐẤU GIÁ</button>

                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="submit-button">
                                                    <a
                                                            href="${pageContext.request.contextPath }/addCart?idproduct=${singleProduct.productId}"
                                                            class="btn submit-btn"> <span><i
                                                            class="glyphicon glyphicon-shopping-cart"></i> MUA NGAY </span>
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
                                        <h2 style="font-size: 20px">Giới thiệu về sản phẩm ${singleProduct.name }</h2>
                                    </div>
                                    <div class="tab-descript">
                                        <p>${singleProduct.description }</p>
                                        <img
                                                src="resource/images/banner/${singleProduct.images.get(i).getImageUrl() }"
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
                                                data-target="#myModal">Đánh giá và nhận xét
                                        </button>
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
                                                        <a href="${pageContext.request.contextPath }/login">
                                                            <button
                                                                    class="btn btn-danger btn-modal-comment">Đăng
                                                                nhập tại đây
                                                            </button>
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
                                            <div class="col-sm-9">
                                                <div class="review_boxes_item">
                                                    <label>Vui lòng chia sẻ nhận xét đánh giá về sản
                                                        phẩm này</label>
                                                    <p>Bình chọn sản phẩm này</p>
                                                    <form:form commandName="ratingDto" method="post"
                                                               action="${pageContext.request.contextPath }/rating/${singleProduct.productId}">
                                                        <p>
                                                        <div id="ratingStars">
                                                            <form:input class="form-control title-comments"
                                                                        id="ratingInput"
                                                                        type="hidden" path="rating"></form:input>
                                                        </div>
                                                        </p>
                                                        <p>Nhận xét tổng quan</p>
                                                        <form:input class="form-control title-comments"
                                                                    placeholder="Nhận xét tổng quan"
                                                                    path="title"></form:input>
                                                        <p>Mô tả đánh giá</p>
                                                        <form:textarea
                                                                placeholder="Viết đánh giá nhận xét cho sản phẩm này..."
                                                                path="content" class="comment_input"></form:textarea>
                                                        <button type="submit"
                                                                class="btn btn-success sumit_comment">Bình chọn
                                                        </button>
                                                    </form:form>
                                                    <div class="status-upload">
                                                    </div>
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
                                <label>Có ${singleProduct.ratings.size() } nhận xét</label>
                                <c:forEach var="rating" items="${singleProduct.ratings }">
                                    <div class="comment-items">
                                        <img class="img-responsive user-photo"
                                             src="resource/images/avatar/avartar-cmt.png"
                                             style="width: 31px">
                                        <div class="panel panel-default"
                                             style="margin-left: 40px; margin-top: -30px;">
                                            <div class="panel-heading comment-heading">
                                                <label><a href="#">${rating.user.username }</a></label>
                                                <p class="memberpost-infor">
                                                    Đã comment vào
                                                        <%-- <fmt:formatDate value="${comment.createdate }"
                                                            pattern="yyyy-MM-dd" /> --%>
                                                </p>
                                            </div>
                                            <label class="memberpost-infor">${rating.ratingTitle }</label>
                                            <div class="content-comment">
                                                <p>${rating.ratingContent }</p>
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
	                                    <%-- <td>${userAuction.bidtime}</td>
	                                    <td>${userAuction.price}</td> --%>
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
										<a
											href=""><img
											src="resource/images/banner/${getRelateProduct.images.get(i).getImageUrl() }"></a>
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
											<p class="single-product-infor-name-title">${getRelateProduct.name }</p>
										</div>
										<!-- 	<div class="single-product-inforsale">
                                            Giảm giá 25%
                                         </div> -->
										<div class="single-product-inforprice">
											<p>
												<fmt:formatNumber value="${getRelateProduct.price }" type="number" />đ
											</p>
										</div>
										<div class="single-product-inforsale">
											<a
												href=""><button
													class="btn btn-success btn-countdown">
													<i class="fa fa-shopping-cart"></i> MUA NGAY
												</button></a>
										</div>
										<div class="single-product-inforrating">
											<div class="rating-box">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star-half-empty" style="color: gray"></i> <br>
												<span>(Có  10 nhận xét)</span>

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