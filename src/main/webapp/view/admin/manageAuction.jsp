<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<section id="main-content" ng-app="auction">
    <section class="wrapper">
        <!-- page start-->
        <section class="panel">
            <header class="panel-heading">
                Manage Auction
            </header>
            <div class="panel-body">
                <div class="adv-table editable-table " ng-controller="AuctionController" ng-init='init(${auctions})'>
                    <div class="clearfix">
                        <div class="btn-group">
                             <a href="${pageContext.request.contextPath }/admin/addAuction" type="button" id="addNewAuction" class="btn green">
                            Add New Auction
                        </a>
                        </div>
                    </div>
                    <div class="space15"></div>
                    <table class="table table-striped table-hover table-bordered" id="manageAuctionTable">
                        <thead>
                        <tr>
                            <th hidden="hidden"></th>
                            <th>Start Time</th>
                            <th>End Time</th>
                            <th>Status</th>
                            <th>Product</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody >
                        <%--<c:set var="i" value="${1}"/>--%>
                        <%--<c:forEach var="auction" items="${auctions}">--%>
                            <tr ng-repeat="auction in auctions" class="">
                                <td hidden="hidden">{{auction.auctionId}}</td>
                                <td>{{auction.startTime | date:'yyyy-MM-dd'}}</td>
                                <td>{{auction.endTime | date:'yyyy-MM-dd'}}</td>
                                <td>{{auction.status}}</td>
                                <td>{{auction.product.name}}</td>
                                <td><a class="" href="${pageContext.request.contextPath }/admin/updateAuction?auctionId={{auction.auctionId}}">Edit</a></td>
                                <td><a class="delete" href="javascript:;">Delete</a></td>
                            </tr>
                            <%--<c:set var="i" value="${i+1}"/>--%>
                        <%--</c:forEach>--%>
                        </tbody>
                    </table>
                </div>
            </div>
            <%--<header class="panel-heading">--%>
                <%--Advanced Form validations--%>
            <%--</header>--%>
            <%--<div class="panel-body">--%>
                <%--<div class="form">--%>
                    <%--<form class="cmxform form-horizontal tasi-form" id="signupForm" method="get" action="">--%>
                        <%--<div class="col-lg-6">--%>
                            <%--<div class="form-group ">--%>
                                <%--<label for="name" class="control-label col-lg-2">Full name</label>--%>
                                <%--<div class="col-lg-10">--%>
                                    <%--<input class=" form-control" id="name" name="name" type="text"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group ">--%>
                                <%--<label for="username" class="control-label col-lg-2">Username</label>--%>
                                <%--<div class="col-lg-10">--%>
                                    <%--<input class="form-control " id="username" name="username" type="text"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group ">--%>
                                <%--<label for="password" class="control-label col-lg-2">Password</label>--%>
                                <%--<div class="col-lg-10">--%>
                                    <%--<input class="form-control " id="password" name="password" type="password"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group ">--%>
                                <%--<label for="confirm_password" class="control-label col-lg-2">Confirm Password</label>--%>
                                <%--<div class="col-lg-10">--%>
                                    <%--<input class="form-control " id="confirm_password" name="confirm_password"--%>
                                           <%--type="password"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group ">--%>
                                <%--<label for="phone" class="control-label col-lg-2">Phone</label>--%>
                                <%--<div class="col-lg-10">--%>
                                    <%--<input class="form-control" id="phone" name="phone" type="text"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="col-lg-6">--%>
                            <%--<div class="form-group ">--%>
                                <%--<label for="email" class="control-label col-lg-2">Email</label>--%>
                                <%--<div class="col-lg-10">--%>
                                    <%--<input class="form-control " id="email" name="email" type="email"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group ">--%>
                                <%--<label for="address" class="control-label col-lg-2">Address</label>--%>
                                <%--<div class="col-lg-10">--%>
                                    <%--<input class="form-control " id="address" name="address" type="text"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group ">--%>
                                <%--<div>--%>
                                    <%--<label for="city" class="control-label col-lg-2 col-sm-3">City</label>--%>
                                    <%--<select class="col-lg-5" onchange="getDistrict();" id="city">--%>
                                        <%--<option>Select city</option>--%>
                                        <%--<c:forEach var="city" items="${cities}">--%>
                                            <%--<option value="${city.cityId}">${city.cityName}</option>--%>
                                        <%--</c:forEach>--%>
                                    <%--</select>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group ">--%>
                                <%--<div>--%>
                                    <%--<label for="city" class="control-label col-lg-2 col-sm-3">District</label>--%>
                                    <%--<select class="col-lg-5" id="district">--%>
                                    <%--</select>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group ">--%>
                                <%--<label class="control-label col-lg-2 col-sm-3">Role</label>--%>
                                <%--<div class="col-lg-10">--%>
                                    <%--<c:forEach var="role" items="${roles}">--%>
                                        <%--<label class="checkbox-inline">--%>
                                            <%--<input type="checkbox" id="inlineCheckbox1"--%>
                                                   <%--value="${role.roleId}"> ${role.roleName}--%>
                                        <%--</label>--%>
                                    <%--</c:forEach>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<div class="col-lg-offset-2 col-lg-10">--%>
                                    <%--<button class="btn btn-danger" type="submit">Save</button>--%>
                                    <%--<button class="btn btn-default" type="button">Cancel</button>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</form>--%>
                <%--</div>--%>
            <%--</div>--%>
        </section>
        <!-- page end-->
    </section>
</section>
