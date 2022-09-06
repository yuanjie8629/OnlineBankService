<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<div style="padding-top: 69px;"></div>
<header class="fixed-top">
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container">
			<a class="navbar-brand" href="<c:url value="/admin/home" />"> <img src="/SpringBankingService/resources/images/logo.png" alt="logo" width="100">
			</a>
			<div class="nav-item">
				<a class="nav-link" href="<c:url value="/logout" />" >Logout</a>
			</div>
		</div>
	</nav>
</header>