<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<style>
    .multiselect-parent{
        width: 120px;
    }
    .dropdown-toggle{
        width: 100%;
    }
</style>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datepicker/css/datepicker.css"/>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datetimepicker/css/datetimepicker.css"/>
<section id="main-content" ng-app="productForAuction">
    <section class="wrapper">
        <c:if test="${not empty message }">
            <div class="alert alert-warning">
                    ${message}
            </div>
        </c:if>
        <!-- page start-->
        <section class="panel">
            <header class="panel-heading">
                Add Auction
            </header>
            <div class="panel-body">
                <div class="form">
                    <form ng-submit="submit()" ng-controller="ProductForAuctionController" ng-init='init(${products})'
                          class="cmxform form-horizontal tasi-form" id="addAuction"
                          method="post">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label class="control-label col-lg-3">Choose Time</label>
                                <div class="col-md-4">
                                    <div class="input-group input-large" data-date=""
                                         data-date-format="hh:ii - yyyy-mm-dd">
                                        <input ng-model="startDate" readonly type="text" placeholder="Choose start date" id="startDate" class="form-control dpd1"
                                               name="startDate">
                                        <span class="input-group-addon">To</span>
                                        <input ng-model="endDate" readonly placeholder="Choose end date" type="text" id="endDate" class="form-control dpd2"
                                               name="endDate">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group last">
                                <label class="control-label col-md-3">Select Product</label>
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
                                    <input href="/admin/manageAuction" class="btn btn-danger" value="Save" type="submit"/>
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
