<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <section class="panel">
            <header class="panel-heading">
                List Comment Of Product ID : ${product.productId}
            </header>
            <div class="panel-body">
                <div class="adv-table">
                    <c:if test="${not empty message }">
                        <div class="alert alert-success" id="message">
                                ${message}
                        </div>
                    </c:if>
                    <div id="messageDelete">
                    </div>
                    <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered"
                           id="manageRatingTable">
                        <thead>
                        <tr>
                            <th hidden="hidden"></th>
                            <th>Title</th>
                            <th>Content</th>
                            <th>Rating Number</th>
                            <th>Username</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="rating" items="${ratings}">
                            <input hidden value="${rating.ratingId}" id="categoryId">
                            <tr class="gradeX">
                                <td hidden="hidden">${rating.ratingId}</td>
                                <td>${rating.ratingTitle}</td>
                                <td>${rating.ratingContent}</td>
                                <td>${rating.user.username}</td>
                                <td><a class="delete" href="javascript:;">Delete</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <!-- page end-->
    </section>
</section>