<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${customer}" var="customer">
    <tr id="tr_${customer.id}">
        <td>${customer.id}</td>
        <td>${customer.firstname}</td>
        <td>${customer.lastname}</td>
        <td>${customer.age}</td>
        <td>${customer.email}</td>
        <td>${customer.address}</td>
        <td>${customer.phone}</td>
    </tr>
</c:forEach>