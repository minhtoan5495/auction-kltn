<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ tag import="org.springframework.util.StringUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="pagedListHolder" required="true"
	type="org.springframework.beans.support.PagedListHolder"%>
<%@ attribute name="pagedLink" required="true" type="java.lang.String"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resource/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath }/resource/js/jquery-1.8.3.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resource/js/bootstrap.min.js"></script>

<c:if test="${pagedListHolder.pageCount > 1 }">
	<ul class="pagination pull-right">
		<c:if test="${!pagedListHolder.firstPage}">
			<li class="previous"><a
				href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPage() - 1))%>"><</a></li>
		</c:if>
		<c:if test="${pagedListHolder.firstLinkedPage > 0}">
			<li><a href="<%=StringUtils.replace(pagedLink, "~", "0")%>">1</a></li>
		</c:if>
		<c:if test="${pagedListHolder.firstLinkedPage > 1}">
			<li><span class="pagingDots">...</span></li>
		</c:if>
		<c:forEach begin="${pagedListHolder.firstLinkedPage }"
			end="${pagedListHolder.lastLinkedPage }" var="i">
			<c:choose>
				<c:when test="${pagedListHolder.page ==i }">
					<li class="active"><a href="#" class="paging-first">${i+1 }</a></li>
				</c:when>
				<c:otherwise>
					<li><a class="paging-link-item"
						href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(jspContext.getAttribute("i")))%>">${i+1 }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if
			test="${pagedListHolder.lastLinkedPage < pagedListHolder.pageCount - 2 }">
			<li><span class="pagingDots">...</span></li>
		</c:if>
		<c:if
			test="${pagedListHolder.lastLinkedPage < pagedListHolder.pageCount - 1 }">
			<li><a class="paging-link-item"
				href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPageCount() - 1))%>">${pagedListHolder.pageCount }</a></li>
		</c:if>
		<c:if test="${!pagedListHolder.lastPage }">
			<li class="next"><a class="paging-link-item"
				href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPage() + 1))%>" style="    border-radius: 100px;"><i class="glyphicon glyphicon-play"></i></a></li>
		</c:if>
	</ul>
</c:if>