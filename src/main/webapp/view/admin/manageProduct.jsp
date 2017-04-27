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
                DataTables hidden row details example
            </header>
            <div class="panel-body">
                <div class="adv-table">
                    <div class="btn-group">
                        <a href="${pageContext.request.contextPath}/admin/addProduct" type="button" id="addNewProduct" class="btn green">
                            Add New Product
                        </a>
                    </div>
                    <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="manageProductTable">
                        <thead>
                        <tr>
                            <th hidden="hidden"></th>
                            <th>Product Image</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Create date</th>
                            <th>Manufacture date</th>
                            <th>Category</th>
                            <th>Supplier</th>
                            <th>Transaction Type</th>
                            <th hidden="hidden"></th>
                            <th hidden="hidden"></th>
                            <th hidden="hidden"></th>
                            <th hidden="hidden"></th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="product" items="${products}">
                            <c:set var="ratingNumber" value="${0}"/>
                            <c:if test="${not empty product.ratings}">
                                <c:forEach var="rating" items="${product.ratings}">
                                    <c:set var="ratingNumber" value="${ratingNumber + rating.rating}"/>
                                </c:forEach>
                                <c:set var="ratingNumber" value="${ratingNumber/(product.ratings.size())}"/>
                            </c:if>
                            <tr class="gradeX">
                                <td hidden="hidden">${product.productId}</td>
                                <td><a href="${pageContext.request.contextPath}/detail?idproduct=${product.productId}"><img src="${pageContext.request.contextPath}/resource/images/product/${product.images.get(i).imageUrl}" style="width:80px;height:80px"/></a></td>
                                <td>${product.name}</td>
                                <td><fmt:formatNumber value="${product.price}" type="number"/> đ</td>
                                <td>${product.createDate}</td>
                                <td>${product.manufactureDate}</td>
                                <td>${product.category.categoryName}</td>
                                <td>${product.supplier.supplierName}</td>
                                <td>${product.transactionType.transactionTypeName}</td>
                                <td hidden="hidden">${product.description}</td>
                                <td hidden="hidden">${product.stockQuantity}</td>
                                <td hidden="hidden">${product.viewNumber}</td>
                                <td hidden="hidden">${ratingNumber}</td>
                                <td><a class="edit" href="${pageContext.request.contextPath}/admin/editProduct?productId=${product.productId}">Edit</a></td>
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