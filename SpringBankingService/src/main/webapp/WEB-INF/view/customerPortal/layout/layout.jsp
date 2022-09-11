<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="https://cdn.jsdelivr.net/npm/bs-stepper/dist/css/bs-stepper.min.css" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs5/dt-1.12.1/cr-1.5.6/sp-2.0.2/datatables.min.css"/>
		<link href="<c:url value="/resources/css/customerPortal.css" />" rel="stylesheet">
		<link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bs-stepper/dist/js/bs-stepper.min.js"></script>
		<script src="https://kit.fontawesome.com/4715c71a30.js" crossorigin="anonymous"></script>
 		<script src="https://cdn.datatables.net/v/bs5/dt-1.12.1/cr-1.5.6/sp-2.0.2/datatables.min.js"></script>
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