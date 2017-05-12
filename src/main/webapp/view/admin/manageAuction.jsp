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
                            <tr ng-repeat="auction in auctions" class="">
                                <td hidden="hidden">{{auction.auctionId}}</td>
                                <td>{{auction.startTime | date:'hh:mm - yyyy-MM-dd'}}</td>
                                <td>{{auction.endTime | date:'hh:mm - yyyy-MM-dd'}}</td>
                                <td>{{auction.status}}</td>
                                <td>{{auction.product.name}}</td>
                                <td><a class="" href="${pageContext.request.contextPath }/admin/updateAuction?auctionId={{auction.auctionId}}">Edit</a></td>
                                <td><a class="delete" href="javascript:;">Delete</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <!-- page end-->
    </section>
</section>
