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
                <a href="#" class="main_header_detail_item_link">${product.category.categoryName }</a>
            </div>
            <div class="main_header_detail_item">
                <a href="#" class="main_header_detail_item_link"> > </a>
            </div>
            <div class="main_header_detail_item">
                <a href="#" class="main_header_detail_item_link"><span
                        class="main_header_detail_item_name">${product.name }</span></a>
            </div>
        </div>
    </div>
</div>
<section class="main-content-detail">
    <div class="container main-content-detail-contain">
        <div class="row">
            <div class="content-detail-title">
                <p>
                    Được sản xuất bởi: <a>${product.supplier. supplierName}</a>

                <p>
                    Ngày sản xuất:<a><fmt:formatDate
                        value="${product.manufactureDate }" pattern="dd-MM-yyyy"/></a>
                </p>
            </div>
            <div class="col-sm-8">
                <jsp:useBean id="currentDate" type="java.util.Date" scope="request"></jsp:useBean>
                <fmt:formatDate var="now" value="${currentDate}"
                                pattern="yyyy-MM-dd"/>
                <div class="row">
                    <form action="${pageContext.request.contextPath }/addAuction">
                        <input value="${product.productId }" name="productId"
                               type="hidden">

                        <div class="col-sm-6" style="width: 40%">
                            <div class="detail-product-item">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="imageContainer">
                                        <div id="examples">
                                            <ul id="example3" class="etalage">
                                                <c:forEach var="image" items="${image }">
                                                    <li><img class="etalage_thumb_image"
                                                             src="${pageContext.request.contextPath }/resource/images/product/${image.imageUrl}">
                                                        <img class="etalage_source_image"
                                                             src="${pageContext.request.contextPath }/resource/images/product/${image.imageUrl}">
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6" style="width: 60%;padding-left: 50px;">
                            <div class="detail-product-infor">
                                <h2 class="detail-product-name"
                                    style="font-family: 'Bitter', serif">${product.name }</h2>

                                <p class="detail-product-id"
                                   style="font-family: 'Bitter', serif">
                                    Lượt bình chọn : <input type="hidden" value="${ratingNumber}"
                                                            id="ratingNumber">
                                </p>

                                <div id="ratingShow"></div>
                                <p>(${ratingNumber} sao)</p>

                                <p class="detail-product-id"
                                   style="font-family: 'Bitter', serif">Mã sản phẩm
                                    :${product.productId }</p>

                                <div class="product-detail-view">
                                    <label><i class="glyphicon glyphicon-eye-open"></i>
                                        Lượt xem : ${product.viewNumber}</label>

                                    <p>(Còn lại ${product.stockQuantity} sản phẩm)</p>
                                </div>
                                <div class="single-product-infor-name">
                                    <p>
                                        <i class="glyphicon glyphicon-fire"> ${product.viewNumber }</i>
                                        lượt xem
                                    </p>
                                </div>
                                <div class="product-detail-price">
                                    <c:if test="${not empty (product.discounts) and  product.discounts.get(i).endDate >= now }">
                                        <div class="detail-product-inforsale">Giảm giá
                                                ${product.discounts.get(i).discountPercent }%
                                        </div>
                                        <br>
                                    </c:if>
                                    <div class="single-product-inforprice">
                                        <c:choose>
                                            <c:when
                                                    test="${not empty(product.discounts) and product.discounts.get(i).endDate >= now }">
                                                <strike style="color: black"> <fmt:formatNumber
                                                        value="${product.price}" type="number"/> đ
                                                </strike>

                                                <p>
                                                    <fmt:formatNumber
                                                            value="${(product.price)-((product.price*product.discounts.get(i).discountPercent)/100)}"
                                                            type="number"/>
                                                    đ
                                                </p>
                                            </c:when>
                                            <c:otherwise>
                                                <c:if test="${'Auction' ne product.transactionType.transactionTypeName}">
                                                    <h2>
                                                        <fmt:formatNumber value="${product.price}" type="number"/>
                                                        đ
                                                    </h2>
                                                </c:if>
                                                <c:if test="${'Auction' eq product.transactionType.transactionTypeName}">
                                                    <label style="color: #0e0e0e">Giá thấp nhất bạn có thể đấu:</label>
                                                    <h2>
                                                        <fmt:formatNumber value="${userAuction.price + 10000}" type="number"/>
                                                    </h2>
                                                    <input value="${userAuction.price + 10000}" hidden id="maxPrice">
                                                    <span>VNĐ</span>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="product-detail-description">
                                    <p>${product.description }</p>
                                </div>
                                <div class="box-detail-information">
                                    <form class="form-detail-information" nam="auction">
                                        <c:choose>
                                            <c:when
                                                    test="${product.transactionType.transactionTypeName eq 'Auction' and product.auctions.get(i).endTime >=now}">
                                                <p id="demo" style="text-align: center;"></p>

                                                <div id="countDownAuction">
                                                    <div class="form-detail-size">
                                                        <label style="color: #f37021">Kết thúc vào ngày</label>

                                                        <p style="font-size: 30px">
                                                            <fmt:formatDate
                                                                    value="${product.auctions.get(i).endTime}"
                                                                    pattern="dd-MM-yyyy"/>
                                                        </p>
                                                        <input value="${product.auctions.get(i).endTime }"
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
                                                        <label>Giá đấu:</label> <input required="true"
                                                            class="form-control input-field" type="text" id="priceAuction"
                                                            name="price">
                                                    </div>

                                                    <c:choose>
                                                        <c:when test="${pageContext.request.userPrincipal==null }">
                                                            <div class="submit-button">
                                                                <button class="btn btn-danger review_item"
                                                                        id="review_item_toggle" data-toggle="modal"
                                                                        data-target="#myModal">ĐẤU GIÁ
                                                                </button>
                                                            </div>
                                                            <div class="modal fade" id="myModal" role="dialog">
                                                                <div class="modal-dialog">
                                                                    <!-- Modal content-->
                                                                    <div class="modal-content-order">
                                                                        <div class="modal-header">
                                                                            <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                                                                            <div class="alert alert-success">
                                                                                <strong>Cảnh báo!</strong> Bạn phải đăng
                                                                                nhập mới
                                                                                được đấu giá sản phẩm này
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <a href="${pageContext.request.contextPath }/login">
                                                                                <button class="btn btn-danger btn-modal-comment">
                                                                                    Đăng
                                                                                    nhập tại đây
                                                                                </button>
                                                                            </a>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button"
                                                                                    class="btn btn-primary"
                                                                                    data-dismiss="modal"
                                                                                    style="border-radius: 0">X
                                                                            </button>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button class="btn btn-danger review_item"
                                                                    onClick="return validPrice()"
                                                                    >ĐẤU GIÁ
                                                            </button>
                                                            <%--<div class="modal fade" id="myAuction" role="dialog">--%>
                                                                <%--<div class="modal-dialog">--%>
                                                                    <%--<!-- Modal content-->--%>
                                                                    <%--<div class="modal-content-review">--%>
                                                                        <%--<div class="modal-header">--%>
                                                                            <%--<div class="alert alert-success">--%>
                                                                                <%--<strong>Thông báo!</strong> Cảm ơn bạn--%>
                                                                                <%--đã quan tâm--%>
                                                                                <%--đến sản phẩm và có hứng thú khi tham gia--%>
                                                                                <%--đấu giá.Để--%>
                                                                                <%--chắc chắn rằng bạn muốn đấu giá cho sản--%>
                                                                                <%--phẩm này thì--%>
                                                                                <%--xin bạn hãy xác nhận lại một lần--%>
                                                                                <%--nữa..Cảm ơn bạn!!--%>
                                                                            <%--</div>--%>
                                                                        <%--</div>--%>
                                                                        <%--<div class="modal-body">--%>

                                                                            <%--<button type="submit"--%>
                                                                                    <%--class="btn btn-danger btn-modal-comment">--%>
                                                                                <%--Xác--%>
                                                                                <%--nhận tại đây--%>
                                                                            <%--</button>--%>
                                                                        <%--</div>--%>
                                                                        <%--<div class="modal-footer">--%>
                                                                            <%--<button type="button"--%>
                                                                                    <%--class="btn btn-primary"--%>
                                                                                    <%--data-dismiss="modal"--%>
                                                                                    <%--style="border-radius: 0">X--%>
                                                                            <%--</button>--%>
                                                                        <%--</div>--%>
                                                                    <%--</div>--%>

                                                                <%--</div>--%>
                                                            <%--</div>--%>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <c:if
                                                        test="${ product.transactionType.transactionTypeName eq 'Sale'  }">
                                                    <div class="submit-button">
                                                        <a
                                                                href="${pageContext.request.contextPath }/addCart?productId=${product.productId}"
                                                                class="btn submit-btn"> <span><i
                                                                class="glyphicon glyphicon-shopping-cart"></i> MUA NGAY
														</span>
                                                        </a>
                                                    </div>
                                                </c:if>
                                                <c:if
                                                        test="${ product.transactionType.transactionTypeName eq 'Auction' and product.auctions.get(i).endTime <=now and not empty liUserAuctions}">
                                                    <div class="row">
                                                        <div class="col-sm-3"></div>
                                                        <div class="col-sm-5">
                                                            <div class="detail-win-item">
                                                                <h3 class="detail-win-title">Chúc mừng</h3>
                                                                <img alt=""
                                                                     src="${pageContext.request.contextPath }/resource/images/banner/winner.png">
                                                                <c:forEach var="userAuctionWin"
                                                                           items="${liUserAuctions }">
                                                                    <h4 class="detail-user-win">${userAuctionWin.user.username}</h4>
                                                                    <h5>Giá đấu cao nhất</h5>
                                                                    <h4 class="detail-user-win"
                                                                        style="color: rgb(61, 255, 0);">
                                                                        <fmt:formatNumber
                                                                                value="${userAuctionWin.price}"
                                                                                type="number"/>
                                                                        đ
                                                                    </h4>
                                                                </c:forEach>
                                                                <p>Thời gian kết thúc</p>

                                                                <p>
                                                                    <fmt:formatDate
                                                                            value="${product.auctions.get(i).endTime}"
                                                                            pattern="dd-MM-yyyy HH:mm:ss"/>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if
                                                        test="${empty liUserAuctions and product.transactionType.transactionTypeName eq 'Auction'}">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <div class="detail-win-item">
                                                                <h3 class="detail-win-title">Phiên đấu giá đã kết
                                                                    thúc và không ai đấu giá cho sản phẩm này</h3>
                                                                <img alt=""
                                                                     src="${pageContext.request.contextPath }/resource/images/banner/cancelled.png">

                                                                <p>Thời gian kết thúc</p>

                                                                <p>
                                                                    <fmt:formatDate
                                                                            value="${product.auctions.get(i).endTime}"
                                                                            pattern="dd-MM-yyyy HH:mm:ss"/>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>
                                        <p>
                                            <br>
                                        </p>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6" style="width: 40%">
                            <div class="detail-product-item">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="imageContainer">
                                        <div id="examples">
                                            <ul id="example3" class="etalage">
                                                <c:forEach var="image" items="${image }">
                                                    <li><img class="etalage_thumb_image"
                                                             src="${pageContext.request.contextPath }/resource/images/product/${image.imageUrl}">
                                                        <img class="etalage_source_image"
                                                             src="${pageContext.request.contextPath }/resource/images/product/${image.imageUrl}">
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>

                                    </div>
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
                                            ${product.name }</h2>
                                    </div>
                                    <div class="tab-descript">
                                        <p>${product.description }</p>
                                        <img
                                                src="resource/images/product/${product.imageUrl }"
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
                                            và nhận xét cho sản phẩm ${product.name }</h2>
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
                                                        <a
                                                                href="${pageContext.request.contextPath }/rating/${product.productId}">
                                                            <button class="btn btn-danger btn-modal-comment">Đăng
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
                                            <div class="col-sm-8">
                                                <div class="review_boxes_item">
                                                    <label>Vui lòng chia sẻ nhận xét đánh giá về sản
                                                        phẩm này</label>

                                                    <p>Bình chọn sản phẩm này</p>
                                                    <form:form commandName="ratingDto" method="post"
                                                               action="${pageContext.request.contextPath }/rating/${product.productId}">
                                                        <p>

                                                        <div id="ratingStars">
                                                            <form:input class="form-control title-comments"
                                                                        id="ratingInput" type="hidden"
                                                                        path="rating"></form:input>
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
                                    sản phẩm ${product.name }</h2>
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
                                                            value="${rating.createDate }" pattern="dd-MM-yyyy"/> at
                                                        <fmt:formatDate value="${rating.createDate }"
                                                                        pattern="HH:MM:ss"/></label>
                                                </div>
                                                <div class="comment-items-content">
                                                    <label>${rating.ratingTitle  }</label><br>
                                                    <label>${rating.ratingContent  }</label>
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
            <div class="col-sm-4">
                <c:if
                        test="${not empty userAuctions and product.transactionType.transactionTypeName eq 'Auction' }">
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
                                                            pattern="HH:mm"/></td>
                                        <td><fmt:formatNumber value="${userAuction.price}"
                                                              type="number"/> đ
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty relateProducts }">
                    <div class="product-detail-relate">
                        <div class="product-detail-relate-item-title">
                            <h3>Sản phẩm liên quan</h3>
                        </div>
                        <div class="product-detail-relate-item-stack">
                            <c:forEach var="productRelate" items="${relateProducts }">
                                <div class="new-product" style="margin-bottom: 5px">
                                    <div class="single-product-item">
                                        <div class="single-product-image">
                                            <a
                                                    href="${pageContext.request.contextPath }/detail?productId=${productRelate.productId}"><img
                                                    src="resource/images/product/${productRelate.imageUrl }"
                                                    style="width: 253px; height: 300px;"></a>

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
                                                <p class="single-product-infor-name-title">${productRelate.name }</p>
                                            </div>
                                            <c:if test="${not empty (productRelate.discounts) }">
                                                <c:if
                                                        test="${productRelate.discounts.get(i).endDate >= now }">
                                                    <div class="single-product-inforsale">Giảm giá
                                                            ${productRelate.discounts.get(i).discountPercent }%
                                                    </div>
                                                </c:if>
                                            </c:if>
                                            <div class="single-product-infor-name">
                                                <p>
                                                    <i class="glyphicon glyphicon-fire">
                                                            ${productRelate.viewNumber }</i> lượt xem
                                                </p>
                                            </div>
                                            <div class="single-product-inforprice">
                                                <c:choose>
                                                    <c:when
                                                            test="${not empty(productRelate.discounts) and productRelate.discounts.get(i).endDate >= now }">
                                                        <strike style="color: black"> <fmt:formatNumber
                                                                value="${productRelate.price}" type="number"/> đ
                                                        </strike>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p style="color: black">
                                                            <fmt:formatNumber value="${productRelate.price}"
                                                                              type="number"/>
                                                            đ
                                                        </p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="single-product-inforprice">
                                                <c:if
                                                        test="${not empty(productRelate.discounts) and productRelate.discounts.get(i).endDate >= now  }">
                                                    <p>
                                                        <fmt:formatNumber
                                                                value="${(productRelate.price)-((productRelate.price*productRelate.discounts.get(i).discountPercent)/100)}"
                                                                type="number"/>
                                                        đ
                                                    </p>
                                                </c:if>
                                            </div>
                                            <input hidden value="${productRelate.productId}"
                                                   id="productId">
                                            <c:choose>
                                                <c:when
                                                        test="${productRelate.transactionType.transactionTypeName eq 'Sale' }">
                                                    <div class="single-product-inforsale">
                                                        <a
                                                                href="${pageContext.request.contextPath }/addCart?productId=${productRelate.productId}">
                                                            <button class="btn btn-countdown">
                                                                <i class="fa fa-shopping-cart"></i> MUA NGAY
                                                            </button>
                                                        </a>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="single-product-inforsale">
                                                        <a
                                                                href="${pageContext.request.contextPath }/detail?productId=${productRelate.productId}">
                                                            <button class="btn btn-countdown">
                                                                <i class="fa fa-shopping-cart"></i> XEM CHI TIẾT
                                                            </button>
                                                        </a>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="single-product-inforrating">
                                                <div class="rating-box">
														<span>(Có ${productRelate.ratings.size() } nhận
															xét)</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</section>