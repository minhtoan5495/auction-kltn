<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datepicker/css/datepicker.css"/>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datetimepicker/css/datetimepicker.css"/>
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <section class="panel">
            <header class="panel-heading">
                Add Category
            </header>
            <div class="panel-body">
                <c:if test="${not empty error }">
                    <div class="alert alert-danger" id="message">
                            ${error}
                    </div>
                </c:if>
                <div class="form">
                    <form:form action="${pageContext.request.contextPath}/admin/saveCategory" commandName="categoryDto"
                               class="cmxform form-horizontal tasi-form" id="addCategory"
                               method="post">
                        <div class="col-lg-12">
                            <form:input path="categoryId" value="${category.categoryId}" hidden="hidden"/>
                            <div class="form-group">
                                <label for="categoryName" class="control-label col-lg-3">Category name <span style="color: red">(*)</span></label>
                                <div class="col-lg-7">
                                    <form:input path="categoryName" class=" form-control" value="${category.categoryName}"
                                                placeholder="Enter category name"
                                                id="categoryName" name="categoryName" type="text"/>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="parentId" class="control-label col-lg-3">Parent Name <span style="color: red">(*)</span></label>
                                <div class="col-lg-7">
                                    <form:select path="parentId" class="col-lg-5" id="parentId" style="height: 34px;">
                                        <option value="">Select category</option>
                                        <c:forEach var="parent" items="${parents}">
                                            <c:if test="${parent.parentName eq category.parent.parentName}">
                                                <option value="${parent.parentId}"
                                                        selected>${parent.parentName}</option>
                                            </c:if>
                                            <c:if test="${parent.parentName ne category.parent.parentName}">
                                                <option value="${parent.parentId}">${parent.parentName}</option>
                                            </c:if>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <input class="btn btn-danger" value="Save" type="submit"/>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </section>
        <!-- page end-->
    </section>
</section>
