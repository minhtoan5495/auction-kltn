<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <section class="panel">
            <header class="panel-heading">
                Update Role For ${user.username}
            </header>
            <div class="panel-body">
                <c:if test="${not empty error }">
                    <div class="alert alert-danger" id="message">
                            ${error}
                    </div>
                </c:if>
                <div class="form">
                    <form action="${pageContext.request.contextPath}/admin/updateRole"
                          class="cmxform form-horizontal tasi-form"
                          method="post">
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <input hidden name="username" value="${user.username}"/>
                            </div>
                            <div class="form-group ">
                                <label for="role" class="control-label col-lg-3">Select role name <span style="color: red">(*)</span></label>
                                <div class="col-lg-7">
                                    <c:forEach var="role" items="${roles}">
                                        <div class="checkbox">
                                            <label><input id="role" name="roleId" type="checkbox"
                                                          value="${role.roleId}">${role.roleName}</label>
                                        </div>
                                    </c:forEach>
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
