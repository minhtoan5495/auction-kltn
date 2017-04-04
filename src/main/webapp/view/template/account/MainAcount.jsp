<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
          <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
          <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
           <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
 <html>
<head>
	<title><tiles:getAsString name="title" /></title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="resource/css/bootstrap.min.css" rel="stylesheet">
    <link href="resource/css/font-awesome.min.css" rel="stylesheet">
    <link href="resource/css/login.css" rel="stylesheet">
    
</head>
<body>
	<tiles:insertAttribute name="body"></tiles:insertAttribute>
</body>
<script src="resource/js/jquery-1.8.3.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script type="text/javascript" src="resource/js/login.js"></script>
</html>