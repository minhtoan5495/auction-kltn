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
                    <div class="space15"></div>
                    <c:if test="${not empty message }">
                        <div class="alert alert-success" id="message">
                                ${message}
                        </div>
                    </c:if>
                    <table class="table table-striped table-hover table-bordered" id="manageAccountTable">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Username</th>
                            <th>Full name</th>
                            <th>Address</th>
                            <th>District</th>
                            <th>City</th>
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
                                <td>${user.district.districtName}</td>
                                <td>${user.city.cityName}</td>
                                <td>${user.email}</td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                    value="${user.birthday}"/></td>
                                <td>${user.phone}</td>
                                <td><c:forEach var="role" items="${user.roles}">${role.roleName}  </c:forEach></td>
                                <td><a class=""
                                       href="${pageContext.request.contextPath }/admin/editRole?username=${user.username}">Edit</a>
                                </td>
                                <td><a class="delete" href="javascript:;">Delete</a></td>
                            </tr>
                            <c:set var="i" value="${i+1}"/>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <!-- page end-->
    </section>
</section>