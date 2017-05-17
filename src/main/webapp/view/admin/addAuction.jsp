<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<style>
    .multiselect-parent {
        width: 120px;
    }

    .dropdown-toggle {
        width: 100%;
    }
</style>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datepicker/css/datepicker.css"/>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datetimepicker/css/datetimepicker.css"/>
<section id="main-content" ng-app="productForAuction">
    <section class="wrapper">
        <!-- page start-->
        <section class="panel">
            <header class="panel-heading">
                Add Auction
            </header>
            <div class="panel-body">
                <c:if test="${not empty message }">
                    <div class="alert alert-warning" id="message">
                            ${message}
                    </div>
                </c:if>
                <c:if test="${not empty error }">
                    <div class="alert alert-danger" id="message">
                            ${error}
                    </div>
                </c:if>
                <div class="form">
                    <form ng-controller="ProductForAuctionController" ng-init='init(${products})'
                          class="cmxform form-horizontal tasi-form" id="addAuction"
                          method="post">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label class="control-label col-lg-3">Choose Time <span style="color: red">(*)</span></label>
                                <div class="col-md-4">
                                    <div class="input-group input-large">
                                        <input ng-model="startDate" readonly type="text" placeholder="Choose start date"
                                               id="startDate" class="form-control"
                                               name="startDate">
                                        <span class="input-group-addon">To</span>
                                        <input ng-model="endDate" readonly placeholder="Choose end date" type="text"
                                               id="endDate" class="form-control"
                                               name="endDate">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group last">
                                <label class="control-label col-md-3">Select Product <span style="color: red">(*)</span></label>
                                <div class="col-lg-7">
                                    <div ng-dropdown-multiselect="" options="example14data"
                                         selected-model="example14model" checkboxes="true"
                                         extra-settings="example14settings"></div>
                                    <input id="productIds" ng-model="productIds" type="text" value="{{example14model}}"
                                           hidden/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <input onclick="addAuction()" class="btn btn-danger" value="Save" type="submit"/>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- page end-->
    </section>
</section>
