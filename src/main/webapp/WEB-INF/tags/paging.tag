<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ tag import="org.springframework.util.StringUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="productSalePage" required="true"
	type="org.springframework.beans.support.PagedListHolder"%>
<%@ attribute name="pagedLink" required="true" type="java.lang.String"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resource/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath }/resource/js/jquery-1.8.3.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resource/js/bootstrap.min.js"></script>

<c:if test="${productSalePage.pageCount > 1 }">
	<ul class="pagination pull-right">
		<c:if test="${!productSalePage.firstPage}">
			<li class="previous"><a
				href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(productSalePage.getPage() - 1))%>"><</a></li>
		</c:if>
		<c:if test="${productSalePage.firstLinkedPage > 0}">
			<li><a href="<%=StringUtils.replace(pagedLink, "~", "0")%>">1</a></li>
		</c:if>
		<c:if test="${productSalePage.firstLinkedPage > 1}">
			<li><span class="pagingDots">...</span></li>
		</c:if>
		<c:forEach begin="${productSalePage.firstLinkedPage }"
			end="${productSalePage.lastLinkedPage }" var="i">
			<c:choose>
				<c:when test="${productSalePage.page ==i }">
					<li class="active"><a href="#" class="paging-first">${i+1 }</a></li>
				</c:when>
				<c:otherwise>
					<li><a class="paging-link-item"
						href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(jspContext.getAttribute("i")))%>">${i+1 }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if
			test="${productSalePage.lastLinkedPage < productSalePage.pageCount - 2 }">
			<li><span class="pagingDots">...</span></li>
		</c:if>
		<c:if
			test="${productSalePage.lastLinkedPage < productSalePage.pageCount - 1 }">
			<li><a class="paging-link-item"
				href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(productSalePage.getPageCount() - 1))%>">${productSalePage.pageCount }</a></li>
		</c:if>
		<c:if test="${!productSalePage.lastPage }">
			<li class="next"><a class="paging-link-item"
				href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(productSalePage.getPage() + 1))%>" style="    border-radius: 100px;"><i class="glyphicon glyphicon-play"></i></a></li>
		</c:if>
	</ul>
</c:if>