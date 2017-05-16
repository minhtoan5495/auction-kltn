<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <section class="panel">
            <header class="panel-heading">
                Manage Auction
            </header>
            <div class="panel-body">
                <div class="adv-table editable-table ">
                    <div class="clearfix">
                        <div class="btn-group">
                            <a href="${pageContext.request.contextPath }/admin/addAuction" type="button"
                               id="addNewAuction" class="btn green">
                                Add New Auction
                            </a>
                        </div>
                    </div>
                    <div class="space15"></div>
                    <c:if test="${not empty message }">
                        <div class="alert alert-success" id="message">
                                ${message}
                        </div>
                    </c:if>
                    <table class="table table-striped table-hover table-bordered" id="manageAuctionTable">
                        <thead>
                        <tr>
                            <th hidden="hidden"></th>
                            <th>Start Time</th>
                            <th>End Time</th>
                            <th>Status</th>
                            <th>Product</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${auctions}" var="auction">
                            <tr class="">
                                <td hidden="hidden">${auction.auctionId}</td>
                                <td><fmt:formatDate value="${auction.startTime}" pattern="hh:mm yyyy-MM-dd"/> </td>
                                <td><fmt:formatDate value="${auction.endTime}" pattern="hh:mm yyyy-MM-dd"/></td>
                                <td>${auction.status}</td>
                                <td>${auction.product.name}</td>
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