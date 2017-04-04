<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<li>${children1.name}
<c:forEach var="children1" items="${paramValues.menu}">
	<ul>
		<c:choose>
			<c:when test="${empty children1.listCategories}">
				${children1.getName()}
			</c:when>
			<c:otherwise>
				<jsp:include page="categorypartial.jsp">
					<jsp:param name="Children" value="${children1.listCategories}"></jsp:param>
				</jsp:include>
			</c:otherwise>
		</c:choose> 

		<li>${children1}</li>
	</ul>
	
</c:forEach>	
</li>