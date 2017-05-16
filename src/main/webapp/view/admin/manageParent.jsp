<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<section id="main-content">
    <section class="wrapper">
        <!-- page start-->
        <section class="panel">
            <header class="panel-heading">
                DataTables hidden row details example
            </header>
            <div class="panel-body">
                <div class="adv-table">
                    <div class="btn-group">
                        <a href="${pageContext.request.contextPath }/admin/addParent" type="button" id="addNewParent" class="btn green">
                            Add New Supplier
                        </a>
                    </div>
                    <c:if test="${not empty message }">
                        <div class="alert alert-success" id="message">
                                ${message}
                        </div>
                    </c:if>
                    <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="manageParentTable">
                        <thead>
                        <tr>
                            <th hidden="hidden"></th>
                            <th>Parent Name</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="parent" items="${parents}">
                            <tr class="gradeX">
                                <td hidden="hidden">${parent.parentId}</td>
                                <td>${parent.parentName}</td>
                                <td><a class="" href="${pageContext.request.contextPath }/admin/editParent?parentId=${parent.parentId}">Edit</a></td>
                                <td><a class="delete" href="javascript:;">Delete</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </section>
        <!-- page end-->
    </section>
</section>