<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<style>
    .separator {
        border-right: 1px solid #dfdfe0 !important;
    }

    .icon-btn-save {
        padding-top: 0 !important;
        padding-bottom: 0 !important;
    }

    .input-group {
        margin-bottom: 10px !important;
        width: 100% !important;
    }

    .btn-save-label {
        position: relative !important;
        left: -12px !important;
        display: inline-block !important;
        padding: 6px 12px !important;
        background: rgba(0, 0, 0, 0.15) !important;
        border-radius: 3px 0 0 3px !important;
    }

    .error_check {
        padding: 10px;
        border: 1px solid transparent;
        color: #a94442;
        background-color: #f2dede;
        border-color: #ebccd1;
        border-radius: 3px;
        font-size: 12px;
    }
</style>
<div class="container bootstrap snippet">
    <div class="row">
        <div class="col-xs-12 col-sm-9 col-md-9 col-md-offset-1">
            <div class="panel panel-info" style="margin-top: 30px;">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="glyphicon glyphicon-th"></span>
                        Update Profile
                    </h3>
                </div>
                <form:form commandName="profileDto" action="${pageContext.request.contextPath }/updateProfile"
                           method="POST">
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 col-md-4 separator social-login-box"><br>
                                <img style="margin-top: 50px;" alt="" class="img-thumbnail"
                                     src="http://bootdey.com/img/Content/avatar/avatar1.png">
                            </div>
                            <div class="col-xs-7 col-sm-7 col-md-7 login-box" style="margin-left:20px; ">
                                <c:if test="${not empty error }">
                                    <div class="error_check">
                                            ${error }
                                    </div>
                                </c:if>
                                <c:if test="${not empty message }">
                                    <div class="message_check">
                                            ${message }
                                    </div>
                                </c:if>
                                <div class="form-group" style="margin-top: 20px;">
                                    <div class="input-group">
                                        <label for="name" class="control-label">Họ Tên</label>
                                        <form:input path="name" class="form-control" name="name" id="name" type="text"
                                                    value="${user.name}" require="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <label for="phone" class="control-label">Số điện thoại</label>
                                        <form:input path="phone" onkeyup="validate()" class="form-control" name="phone" require="true"
                                                    id="phone" type="number"
                                                    value="${user.phone}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <label for="address" class="control-label">Địa chỉ cụ thể</label>
                                        <form:input path="address" class="form-control" name="address" id="address" require="true"
                                                    type="text"
                                                    value="${user.address}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class='input-group date' id='date'>
                                        <label class="control-label" for="date">Ngày sinh</label>
                                        <input class="form-control" name="date" value="<fmt:formatDate value="${user.birthday }"
                                                                                pattern="yyyy-MM-dd"/>"
                                               type="text" require="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <label for="cityId" class="control-label">Thành phố</label>
                                        <select class="form-control" onchange="loadDistrict();"
                                                name="cityId" id="cityId">
                                            <option>Select city</option>
                                            <c:forEach var="city" items="${cities}">
                                                <option value="${city.cityId}">${city.cityName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <label for="districtId" class="control-label">Quận</label>
                                        <select class="form-control" name="districtId"
                                                id="districtId">
                                            <option>Select district</option>
                                            <c:forEach var="district" items="${districts}">
                                                <option value="${district.districtId}">${district.districtName}</option>
                                            </c:forEach>    
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6"></div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <button class="btn icon-btn-save btn-success" type="submit">
                                    <span class="btn-save-label"><i class="glyphicon glyphicon-floppy-disk"></i></span>save
                                </button>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>