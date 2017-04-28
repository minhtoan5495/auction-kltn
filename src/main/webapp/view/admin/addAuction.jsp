<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                Add Auction
            </header>
            <div class="panel-body">
                <div class="form">
                    <form:form action="${pageContext.request.contextPath}/admin/saveAuction" commandName="auction" class="cmxform form-horizontal tasi-form" id="addAuction"
                                method="post" >
                        <div class="col-lg-12">
                     <%--    <div class="form-group">
                    <form:label for="usr" path="auctionId">ID</form:label>
                         <form:input type="text" class="form-control" path="auctionId" disabled="true" />
                         <form:input path="auctionId" type="hidden"/>
                    </div> --%>
                             <div class="form-group">
                                <label class="control-label col-lg-3">Start Time</label>
                                <div class="col-lg-7">
                                    <form:input path="startTime" name="startTime" id="startTime"
                                                class="form-control form-control-inline input-medium default-date-picker"
                                                type="text" placeholder="Choose start date"
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">End Time</label>
                                <div class="col-lg-7">
                                    <form:input path="endTime" name="endTime" id="endTime"
                                                class="form-control form-control-inline input-medium default-date-picker"
                                                type="text" placeholder="Choose end date"
                                    />
                                </div>
                            </div>
                             <div class="form-group ">
                                <label for="status" class="control-label col-lg-3">Status</label>
                                <div class="col-lg-7">
                                    <form:input path="status" class=" form-control" placeholder="Enter Auction Status"
                                                id="status" name="status" type="text"/>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="product" class="control-label col-lg-3">Product</label>
                                <div class="col-lg-9">
                                    <form:select path="productId" class="col-lg-9" style="height: 34px;" id="product">
                                        <option>Select product</option>
                                        <c:forEach var="product" items="${products}">
                                            <option value="${product.productId}">${product.name}</option>
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
