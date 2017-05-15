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
                        <a href="${pageContext.request.contextPath }/admin/addCategory" type="button"
                           id="addNewCategory" class="btn green">
                            Add New Category
                        </a>
                    </div>
                    <c:if test="${not empty message }">
                        <div class="alert alert-success" id="message">
                                ${message}
                        </div>
                    </c:if>
                    <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered"
                           id="manageCategoryTable">
                        <thead>
                        <tr>
                            <th hidden="hidden"></th>
                            <th>Category Name</th>
                            <th>Parent Name</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="category" items="${categories}">
                            <input hidden value="${category.categoryId}" id="categoryId">
                            <tr class="gradeX">
                                <td hidden="hidden">${category.categoryId}</td>
                                <td>${category.categoryName}</td>
                                <td>${category.parent.parentName}</td>
                                <td><a class="edit"
                                       href="${pageContext.request.contextPath}/admin/editCategory?categoryId=${category.categoryId}">Edit</a>
                                </td>
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