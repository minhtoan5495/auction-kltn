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
                Manage Discount Detail
            </header>
            <div class="panel-body">
                <div class="adv-table editable-table">
                    <table class="table table-striped table-hover table-bordered"
                           id="discountDetailTable">
                        <thead>
                        <tr>
                            <th hidden></th>
                            <th>Username</th>
                            <th>Time auction</th>
                            <th>Price auction</th>
                            <th>End time</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${userAuctions}" var="userAuction">
                            <tr class="">
                                <td hidden>${userAuction.userAuctionId}</td>
                                <td>${userAuction.user.username}</td>
                                <td><fmt:formatDate value="${userAuction.bidtime}" pattern="HH:mm yyyy-MM-dd"/></td>
                                <td>${userAuction.price} VNĐ</td>
                                <td><fmt:formatDate value="${userAuction.auction.endTime}" pattern="HH:mm yyyy-MM-dd"/></td>
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