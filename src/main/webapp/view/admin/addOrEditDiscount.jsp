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
                Add Discount
            </header>
            <div class="panel-body">
                <div class="form">
                    <form:form action="${pageContext.request.contextPath}/admin/saveDiscount" commandName="discount" class="cmxform form-horizontal tasi-form" id="addDiscount"
                                method="post" >
                        <div class="col-lg-12">
                        <div class="form-group">
                    <form:label for="usr" path="discountId">ID</form:label>
                         <form:input type="text" class="form-control" path="discountId" disabled="true" />
                         <form:input path="discountId" type="hidden"/>
                    </div>
                            <div class="form-group ">
                                <label for="name" class="control-label col-lg-3">Discount Title</label>
                                <div class="col-lg-7">
                                    <form:input path="discountTitle" class=" form-control" placeholder="Enter discount title"
                                                id="discountTitle" name="discountTitle" type="text"/>
                                </div>
                            </div>
                             <div class="form-group ">
                                <label for="name" class="control-label col-lg-3">Discount Content</label>
                                <div class="col-lg-7">
                                    <form:input path="discountContent" class=" form-control" placeholder="Enter discount content"
                                                id="discountContent" name="discountContent" type="text"/>
                                </div>
                            </div>
                             <div class="form-group ">
                                <label for="name" class="control-label col-lg-3">Discount Percent</label>
                                <div class="col-lg-7">
                                    <form:input path="discountPercent" class=" form-control" placeholder="Enter discount percent"
                                                id="discountPercent" name="discountPercent" type="text"/>
                                </div>
                            </div>
                              <div class="form-group">
                                <label class="control-label col-lg-3">Start Date</label>
                                <div class="col-lg-7">
                                    <form:input path="startDate" name="startDate" id="startDate"
                                                class="form-control form-control-inline input-medium default-date-picker"
                                                type="text" placeholder="Choose discount start date"
                                    />
                                </div>
                            </div>
                           <div class="form-group">
                                <label class="control-label col-lg-3">End Date</label>
                                <div class="col-lg-7">
                                    <form:input path="endDate" name="endDate" id="endDate"
                                                class="form-control form-control-inline input-medium default-date-picker"
                                                type="text" placeholder="Choose discount end date"
                                    />
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
