<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <section class="panel">
            <header class="panel-heading">
                Manage Category
            </header>
            <div class="panel-body">
                <div class="adv-table editable-table ">
                    <div class="clearfix">
                        <div class="btn-group">
                            <a href="${pageContext.request.contextPath }/admin/addCategory" type="button" id="addNewCategory" class="btn green">
                            Add New Category
                        </a>
                        </div>
                    </div>
                    <div class="space15"></div>
                    <table class="table table-striped table-hover table-bordered" id="manageCategoryTable">
                        <thead>
                        <tr>
                            <th hidden="hidden"></th>
                            <th>Category Name</th>
                            <th>Parent Id</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="category" items="${categories}">
                            <tr class="gradeX">
                                <td hidden="hidden">${category.categoryId}</td>
                                <td>${category.categoryName}</td>
                                <td>${category.parentId}</td>
                                <td><a class="" href="${pageContext.request.contextPath }/admin/editCategory?categoryId=${category.categoryId}">Edit</a></td>
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
