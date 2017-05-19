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
                            <th hidden></th>
                            <th>Product Name</th>
                            <th>Product Image</th>
                            <th>Product Price</th>
                            <th>Discount Percent</th>
                            <th>Price Before Discount</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${products}" var="product">
                            <tr class="">
                                <td hidden>${discount.discountId}</td>
                                <td hidden>${product.productId}</td>
                                <td>${product.name}</td>
                                <td><a href="${pageContext.request.contextPath}/detail?productId=${product.productId}"><img src="${pageContext.request.contextPath}/resource/images/product/${product.imageUrl}" style="width:80px;height:80px"/></a></td>
                                <td><fmt:formatNumber value="${product.price}"/></td>
                                <td>${discount.discountPercent} %</td>
                                <td><fmt:formatNumber value="${product.price * (100-discount.discountPercent)/100}"/></td>
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