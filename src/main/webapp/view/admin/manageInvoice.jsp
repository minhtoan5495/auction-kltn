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
                    </div>
                    <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="manageInvoiceTable">
                        <thead>
                        <tr>
                        	<th>Id</th>
                            <th>Create Date</th>
                            <th>Shipping Date</th>
                            <th>Username</th>
                            <th>Status</th>
                            <th>Show</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="invoice" items="${invoices}">
                            <tr class="gradeX">
                            <td>${invoice.invoiceId}</td>
                                <td><fmt:formatDate value="${invoice.createDate }"
                                                    pattern="dd-MM-yyyy"/></td>
                                <td><fmt:formatDate value="${invoice.shipDate }"
                                                    pattern="dd-MM-yyyy"/></td>
                                <td>${invoice.username}</td>
                                <td>${invoice.invoiceStatus.invoiceStatusName}</td>
                                <td><a class="" href="${pageContext.request.contextPath}/admin/showDetailInvoice?invoiceId=${invoice.invoiceId}">Show</a></td>
                                <td><a class="" href="">Edit</a></td>
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