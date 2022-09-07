<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
		<link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
		<link href="<c:url value="/resources/css/adminPortal.css" />" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/4715c71a30.js" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs5/dt-1.12.1/cr-1.5.6/sp-2.0.2/datatables.min.css"/>
 		<script type="text/javascript" src="https://cdn.datatables.net/v/bs5/dt-1.12.1/cr-1.5.6/sp-2.0.2/datatables.min.js"></script>
		<title><tiles:insertAttribute name="title" ignore="true" /></title>
	</head>
	<body class="d-flex flex-column min-vh-100">
		<div>
			<tiles:insertAttribute name="header" />
		</div>
		<div>
			<tiles:insertAttribute name="body" />
		</div>
		<div class="footer mt-auto">
			<tiles:insertAttribute name="footer" />
		</div>
	</body>
</html>