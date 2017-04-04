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
    <link href="resource/css/owl.carousel.css" rel="stylesheet">
    <link href="resource/css/responsive.css" rel="stylesheet">
    <!-- <link href="resource/css/main.css" rel="stylesheet"> -->
    <link href="resource/css/main12.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resource/css/submenu_v2.css" rel="stylesheet">
    
</head>
<body>

<header>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
</header>
	<%-- <tiles:insertAttribute name="slide"></tiles:insertAttribute> --%>
	<tiles:insertAttribute name="body"></tiles:insertAttribute>
<footer style="margin-top: 20px;">
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</footer>
</body>
        <script src="resource/js/jquery-1.8.3.min.js"></script>
    <script src="resource/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resource/js/main.js"></script>
      <script  src="resource/js/photoZoom.min.js"></script>
     <script src="resource/js/customer.js"></script>
   <script type="text/javascript">
        $(document).ready(function(){
           $("#imageContainer").photoZoom();
        });
    </script>
  
</html>