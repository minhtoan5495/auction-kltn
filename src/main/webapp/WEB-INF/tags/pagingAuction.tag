<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ tag import="org.springframework.util.StringUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="pagedListHolder1" required="true"
	type="org.springframework.beans.support.PagedListHolder"%>
<%@ attribute name="pagedLink1" required="true" type="java.lang.String"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resource/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath }/resource/js/jquery-1.8.3.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resource/js/bootstrap.min.js"></script>

<c:if test="${pagedListHolder1.pageCount > 1 }">
	<ul class="pagination pull-right">
		<c:if test="${!pagedListHolder1.firstPage}">
			<li class="previous"><a
				href="<%=StringUtils.replace(pagedLink1, "~", String.valueOf(pagedListHolder1.getPage() - 1))%>"><</a></li>
		</c:if>
		<c:if test="${pagedListHolder1.firstLinkedPage > 0}">
			<li><a href="<%=StringUtils.replace(pagedLink1, "~", "0")%>">1</a></li>
		</c:if>
		<c:if test="${pagedListHolder1.firstLinkedPage > 1}">
			<li><span class="pagingDots">...</span></li>
		</c:if>
		<c:forEach begin="${pagedListHolder1.firstLinkedPage }"
			end="${pagedListHolder1.lastLinkedPage }" var="i">
			<c:choose>
				<c:when test="${pagedListHolder1.page ==i }">
					<li class="active"><a href="#">${i+1 }</a></li>
				</c:when>
				<c:otherwise>
					<li><a
						href="<%=StringUtils.replace(pagedLink1, "~", String.valueOf(jspContext.getAttribute("i")))%>">${i+1 }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if
			test="${pagedListHolder1.lastLinkedPage < pagedListHolder1.pageCount - 2 }">
			<li><span class="pagingDots">...</span></li>
		</c:if>
		<c:if
			test="${pagedListHolder1.lastLinkedPage < pagedListHolder1.pageCount - 1 }">
			<li><a
				href="<%=StringUtils.replace(pagedLink1, "~", String.valueOf(pagedListHolder1.getPageCount() - 1))%>">${pagedListHolder1.pageCount }</a></li>
		</c:if>
		<c:if test="${!pagedListHolder1.lastPage }">
			<li class="next"><a
				href="<%=StringUtils.replace(pagedLink1, "~", String.valueOf(pagedListHolder1.getPage() + 1))%>">></a></li>
		</c:if>
	</ul>
</c:if>