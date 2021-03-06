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
                Edit Auction
            </header>
            <div class="panel-body">
                <div class="form">
                    <form action="${pageContext.request.contextPath}/admin/updateAuction"
                          class="cmxform form-horizontal tasi-form" id="addAuction"
                          method="post">
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>

                        <div class="col-lg-12">
                            <div class="form-group">
                                <input value="${auction.auctionId}" name="auctionId" id="auctionId" type="hidden">
                            </div>
                            <div class="form-group ">
                                <label class="control-label col-lg-3">Status <span style="color: red">(*)</span></label>

                                <div class="col-lg-7">
                                    <select id="auctionStatus" name="auctionStatus" style="height: 34px;">
                                        <option value="PENDING" selected>PENDING</option>
                                        <option value="AUCTIONING">AUCTIONING</option>
                                        <option value="ENDED">ENDED</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <input class="btn btn-danger" value="Save" type="submit"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- page end-->
    </section>
</section>
