<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<section id="main-content" ng-app="discount">
    <section class="wrapper">
        <!-- page start-->
        <section class="panel">
            <header class="panel-heading">
                Manage Discount
            </header>
            <div class="panel-body">
                <div class="adv-table editable-table" ng-controller="DiscountController" ng-init='init(${discounts})'>
                    <div class="btn-group">
                        <a href="${pageContext.request.contextPath}/admin/addDiscount" type="button" id="addNewDiscount"
                           class="btn green">
                            Add New Discount
                        </a>
                    </div>
                    <c:if test="${not empty message }">
                        <div class="alert alert-success" id="message">
                                ${message}
                        </div>
                    </c:if>
                    <table class="table table-striped table-hover table-bordered"
                           id="manageDiscountTable">
                        <thead>
                        <tr>
                            <th hidden="hidden"></th>
                            <th>Discount Title</th>
                            <th>Discount Content</th>
                            <th>Discount Percent</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Show</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%--<c:forEach var="discount" items="${discounts}">--%>
                            <tr ng-repeat="discount in discounts">
                                <td hidden="hidden">{{discount.discountId}}</td>
                                <td>{{discount.discountTitle}}</td>
                                <td>{{discount.discountContent}}</td>
                                <td>{{discount.discountPercent}}</td>
                                <td>{{discount.startDate | date:'yyyy-MM-dd'}}</td>
                                <td>{{discount.endDate | date:'yyyy-MM-dd'}}</td>
                                <td><a class="" href="${pageContext.request.contextPath}/admin/">Show</a></td>
                                <td><a class="edit" href="javascript:;">Edit</a></td>
                                <td><a class="delete" href="javascript:;">Delete</a></td>
                            </tr>
                        <%--</c:forEach>--%>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <!-- page end-->
    </section>
</section>