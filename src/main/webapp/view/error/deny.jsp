<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section id="main-content-404">
    <div class="content-page-404">
        <div class="img-404">
            <img alt=""
                 src="${pageContext.request.contextPath }/resource/images/backgroundmenu/404.png">
        </div>
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <div class="header_search">
                    <form action="${pageContext.request.contextPath }/searchName">
                        <div class="input-group input_find">
                            <input type="text" class="form-control"
                                   placeholder="Tìm kiếm tên sản phẩm..." name="name"
                                   style="height: 38px"> <span class="input-group-btn">
								<button class="btn btn-default" type="submit"
                                        style="height: 38px">
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
							</span>
                        </div>
                    </form>
                </div>
                <div class="contact-service-item">
                    <a href="${pageContext.request.contextPath }/home"><button class="btn btn-success btn-contact-404">Trở về trang chủ</button></a>
                </div>
            </div>
        </div>
    </div>
</section>