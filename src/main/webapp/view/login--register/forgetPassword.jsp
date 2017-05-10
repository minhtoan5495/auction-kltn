<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<link href="${pageContext.request.contextPath }/resource/css/register.css" rel="stylesheet">
<!-- CONTENT -->
<div class="container">
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6 form-register">
            <div class="register-avatar">
                <img src="resource/images/avatar/icon-lg-register-blue1.png">
            </div>
            <c:if test="${not empty error }">
                <div class="error_check">
                        ${error }
                </div>
            </c:if>
            <section class="form_register">
                <form action="${pageContext.request.contextPath }/forgetPassword" method="post"
                      id="saveRegister">
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                    <div class="form_input_register">
                        <div class="form-group">
                            <div class='input-group'>
                                <input type="text" placeholder="Tên đăng nhập" class="input" id="username"
                                       name="username">
                                <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-user"></span>
                                    </span>
                            </div>
                        </div>
                    </div>
                    <div class="form_input_register">
                        <div class="form-group">
                            <div class='input-group'>
                                <input class="input" type="text" placeholder="Email" id="email" name="email">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-envelope"></span>
                                    </span>
                            </div>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>
    <div class="col-sm-3"></div>
</div>

<!-- END CONTENT -->