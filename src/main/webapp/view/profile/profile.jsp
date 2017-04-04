 <%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--    CONTENT-->
    <div class="content-page">
        <div class="container">
            <div class="row">
                <div class="content-page-profile">
                    <div class="row">
                		<aside class="col-sm-3">
                			<div class="profile-avarta">
                				<div class="profile-image">
                					<img alt="" src="resource/images/avatar/avatar.png">
                				</div>
                				<div class="profile-infor">
                					<p class="profile-infor-name">${user.username }</p>
                				</div>
                			</div>
                		</aside>
                		<div class="col-sm-9">
                			<ul id="profile-infor-detail" class="nav nav-tabs profile-tab">
                				<li class="active"><a>Tất cả</a></li>
                				<li><a href="">Danh sách đã mua</a></li>
                				<li><a href="">Đang đấu giá</a></li>
                				<li><a href="">Đã đấu giá</a></li>
                				<li><a href="">Danh sách bán</a></li>
                			</ul>
                		</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END CONTENT -->