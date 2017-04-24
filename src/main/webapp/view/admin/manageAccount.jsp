<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <section class="panel">
            <header class="panel-heading">
                Manage User
            </header>
            <div class="panel-body">
                <div class="adv-table editable-table ">
                    <div class="clearfix">
                        <div class="btn-group">
                            <button id="editable-sample_new" class="btn green">
                                Add New <i class="icon-plus"></i>
                            </button>
                        </div>
                        <div class="btn-group pull-right">
                            <button class="btn dropdown-toggle" data-toggle="dropdown">Tools <i
                                    class="icon-angle-down"></i>
                            </button>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="#">Print</a></li>
                                <li><a href="#">Save as PDF</a></li>
                                <li><a href="#">Export to Excel</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="space15"></div>
                    <table class="table table-striped table-hover table-bordered" id="editable-sample">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Username</th>
                            <th>Full name</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Birthday</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="i" value="${1}"/>
                        <c:forEach var="user" items="${users}">
                            <tr class="">
                                <td>${i}</td>
                                <td>${user.username}</td>
                                <td>${user.name}</td>
                                <td>${user.address}</td>
                                <td>${user.email}</td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                    value="${user.birthday}"/></td>
                                <td>${user.phone}</td>
                                <td><c:forEach var="role" items="${user.roles}">${role.roleName}  </c:forEach></td>
                                <td><a class="edit" href="javascript:;">Edit</a></td>
                                <td><a class="delete" href="javascript:;">Delete</a></td>
                            </tr>
                            <c:set var="i" value="${i+1}"/>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <header class="panel-heading">
                Advanced Form validations
            </header>
            <div class="panel-body">
                <div class="form">
                    <form class="cmxform form-horizontal tasi-form" id="signupForm" method="get" action="">
                        <div class="col-lg-6">
                            <div class="form-group ">
                                <label for="name" class="control-label col-lg-2">Full name</label>
                                <div class="col-lg-10">
                                    <input class=" form-control" id="name" name="name" type="text"/>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="username" class="control-label col-lg-2">Username</label>
                                <div class="col-lg-10">
                                    <input class="form-control " id="username" name="username" type="text"/>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="password" class="control-label col-lg-2">Password</label>
                                <div class="col-lg-10">
                                    <input class="form-control " id="password" name="password" type="password"/>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="confirm_password" class="control-label col-lg-2">Confirm Password</label>
                                <div class="col-lg-10">
                                    <input class="form-control " id="confirm_password" name="confirm_password"
                                           type="password"/>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="phone" class="control-label col-lg-2">Phone</label>
                                <div class="col-lg-10">
                                    <input class=" form-control" id="phone" name="phone" type="text"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group ">
                                <label for="email" class="control-label col-lg-2">Email</label>
                                <div class="col-lg-10">
                                    <input class="form-control " id="email" name="email" type="email"/>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="address" class="control-label col-lg-2">Address</label>
                                <div class="col-lg-10">
                                    <input class="form-control " id="address" name="address" type="text"/>
                                </div>
                            </div>
                            <div class="form-group ">
                                <div class="col-lg-7">
                                    <label for="city" class="control-label col-lg-2 col-sm-3">City</label>
                                    <select class="col-lg-10" style="left: 42px;" onchange="getDistrict();" id="city">
                                        <option>Select city</option>
                                        <c:forEach var="city" items="${cities}">
                                            <option value="${city.cityId}">${city.cityName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="city" class="control-label col-lg-2 col-sm-3">District</label>
                                <div class="col-lg-7">
                                    <select class="col-lg-10" id="district">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group ">

                            </div>
                            <div class="form-group ">
                                <label class="control-label col-lg-2 col-sm-3">Role</label>
                                <c:forEach var="role" items="${roles}">
                                    <input type='radio' id='radio_1' name='type' value='${role.roleId}' /> ${role.roleName}
                                </c:forEach>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <button class="btn btn-danger" type="submit">Save</button>
                                    <button class="btn btn-default" type="button">Cancel</button>
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
