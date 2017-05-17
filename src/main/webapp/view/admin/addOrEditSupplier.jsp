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
                Add Supplier
            </header>
            <div class="panel-body">
                <div class="form">
                    <form:form action="${pageContext.request.contextPath}/admin/saveSupplier" commandName="supplier"
                               class="cmxform form-horizontal tasi-form" id="addSupplier"
                               method="post">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <form:input path="supplierId" type="hidden"/>
                            </div>
                            <div class="form-group ">
                                <label for="supplierName" class="control-label col-lg-3">Supplier name <span style="color: red">(*)</span></label>
                                <div class="col-lg-7">
                                    <form:input path="supplierName" class=" form-control"
                                                placeholder="Enter supplier name"
                                                id="supplierName" name="supplierName" type="text"/>
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
