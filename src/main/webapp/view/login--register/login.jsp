<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<link href="${pageContext.request.contextPath }/resource/css/login.css" rel="stylesheet">

<!-- START CONTENT -->
<c:url value="/j_spring_security_check" var="loginUrl"/>
<div class="main">
    <div class="logoNIQOL">
        <img src="${pageContext.request.contextPath }/resource/images/avatar/icon-lg-register-blue1.png"/>
    </div>
    <div class="input_form">
        <c:if test="${not empty error }">
            <div class="error_check">
                    ${error }
            </div>
        </c:if>
        <form action="${loginUrl}" method="post">
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>
            <input class="input" type="text" name="username" id="username" placeholder="Nhập tài khoản" required="">
            <input class="input" type="password" name="password" id="password" placeholder="Mật khẩu" required="">
            <input type="submit" class="login" value="Login" />
            <span class="mot-de-passe-oubli">
            			<a href="#" >Quên mật khẩu?</a>
            </span>
            <hr class="line">
            <input data-toggle="modal"data-target="#registerModal" class="register-button" type="submit" value="Đăng kí" />
        </form>
    </div>
</div>
<!-- END CONTENT -->