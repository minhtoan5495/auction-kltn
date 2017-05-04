<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datepicker/css/datepicker.css"/>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/resource/admin/assets/bootstrap-datetimepicker/css/datetimepicker.css"/>
<section id="main-content" ng-app="auction">
    <section class="wrapper">
        <!-- page start-->
        <section class="panel">
            <header class="panel-heading">
                Add Auction
            </header>
            <div class="panel-body">
                <div class="form">
                    <form ng-submit="submit()" ng-controller="AuctionController" ng-init='init(${products})'
                               class="cmxform form-horizontal tasi-form" id="addAuction"
                               method="post">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label class="control-label col-lg-3">Start Time</label>
                                <div class="col-lg-7">
                                    <input ng-model="startDate" name="startTime" id="startDate"
                                                class="form-control form-control-inline input-medium default-date-picker"
                                                type="text" placeholder="Choose start date"
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3">End Time</label>
                                <div class="col-lg-7">
                                    <input ng-model="endDate" name="endTime" id="endDate"
                                                class="form-control form-control-inline input-medium default-date-picker"
                                                type="text" placeholder="Choose end date"
                                    />
                                </div>
                            </div>
                            <div class="form-group last">
                                <label class="control-label col-md-3">Select Product</label>
                                <div class="col-lg-7">
                                    <div ng-dropdown-multiselect="" options="example14data"
                                         selected-model="example14model" checkboxes="true"
                                         extra-settings="example14settings"></div>
                                    <input id="productIds" ng-model="productIds" type="text" value="{{example14model}}" hidden/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <input class="btn btn-danger" value="Save" type="submit"/>
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
