<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
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
                <div class="form">
                    <form:form action="${pageContext.request.contextPath}/admin/saveCategory" commandName="category" class="cmxform form-horizontal tasi-form" id="addCategory"
                                method="post" >
                        <div class="col-lg-12">
                        <div class="form-group">
                    <form:label for="usr" path="categoryId">ID</form:label>
                         <form:input type="text" class="form-control" path="categoryId" disabled="true" />
                         <form:input path="categoryId" type="hidden"/>
                    </div>
                            <div class="form-group ">
                                <label for="name" class="control-label col-lg-3">Category name</label>
                                <div class="col-lg-7">
                                    <form:input path="categoryName" class=" form-control" placeholder="Enter category name"
                                                id="categoryName" name="categoryName" type="text"/>
                                </div>
                            </div>
                             <div class="form-group ">
                                <label for="name" class="control-label col-lg-3">Parent Id</label>
                                <div class="col-lg-7">
                                    <form:input path="parentId" class=" form-control" placeholder="Enter Parent Id"
                                                id="parentId" name="parentId" type="text"/>
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
