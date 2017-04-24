<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
    <title>Editable Table</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/resource/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/admin/css/bootstrap-reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/admin/assets/font-awesome/css/font-awesome.css"
          rel="stylesheet"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resource/admin/assets/data-tables/DT_bootstrap.css"/>
    <link href="${pageContext.request.contextPath}/resource/admin/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/admin/css/style-responsive.css" rel="stylesheet"/>

</head>

<body>
<section id="container" class="">
    <tiles:insertAttribute name="header"></tiles:insertAttribute>
    <tiles:insertAttribute name="menu"></tiles:insertAttribute>
    <tiles:insertAttribute name="body"></tiles:insertAttribute>
    <tiles:insertAttribute name="footer"></tiles:insertAttribute>
</section>
</body>

<script src="${pageContext.request.contextPath}/resource/admin/js/jquery-1.8.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/jquery.nicescroll.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/admin/js/jquery.validate.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resource/admin/assets/data-tables/DT_bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/common-scripts.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/editable-table.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/form-validation-script.js"></script>
<script src="${pageContext.request.contextPath}/resource/admin/js/mainAccount.js"></script>
<script>
    jQuery(document).ready(function () {
        EditableTable.init();
    });
</script>

</html>