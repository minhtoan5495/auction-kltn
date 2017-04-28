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
                Manage Discount
            </header>
            <div class="panel-body">
                <div class="adv-table">
                    <div class="btn-group">
                      <a href="${pageContext.request.contextPath}/admin/addDiscount" type="button" id="addNewDiscount" class="btn green">
                            Add New Discount
                        </a>
                    </div>
                    <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="manageProductTable">
                        <thead>
                        <tr>
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
                        <c:forEach var="discount" items="${discounts}">
                            <tr class="gradeX">
                            <td>${discount.discountTitle}</td>
                                <td>${discount.discountContent}</td>
                                <td>${discount.discountPercent}</td>
                                <td><fmt:formatDate value="${discount.startDate }"
                                                    pattern="dd-MM-yyyy"/></td>
                                <td><fmt:formatDate value="${discount.endDate }"
                                                    pattern="dd-MM-yyyy"/></td>
                                <td><a class="" href="${pageContext.request.contextPath}/admin/">Show</a></td>
                                <td><a class="" href="">Edit</a></td>
                                <td><a class="" href="${pageContext.request.contextPath}/admin/">Delete</a></td>
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