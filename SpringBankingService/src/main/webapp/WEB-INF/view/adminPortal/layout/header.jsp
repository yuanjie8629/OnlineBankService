<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div style="padding-top: 150px;"></div>
<header class="fixed-top">
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container">
			<a class="navbar-brand" href="home"> <img src="<c:url value="/resources/images/logo.png" />" alt="logo" width="100">
			</a>
			<div class="nav-item">
				<a class="nav-link" href="<c:url value="/logout" />" >Logout</a>
			</div>
		</div>
	</nav>
	<nav class="navbar navbar-dark navbar-expand-lg bg-danger">
		<div class="container">
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul id="header-nav" class="navbar-nav text-center">
					<li id="home" class="nav-item active"><a class="nav-link" aria-current="page" href="<c:url value="/admin/home" />" >Home</a></li>
					<li id="account-management" class="nav-item dropdown"><a class="nav-link" role="button" data-bs-toggle="dropdown" aria-expanded="false">Account Management</a>
						<div class="dropdown-menu w-100">
							<span class="dropdown-menu-arrow d-none d-lg-block"></span>
							<ul class="list-unstyled">
								<li><a class="dropdown-item" href="<c:url value="/admin/account-management" />" >View Accounts</a></li>
								<li><a class="dropdown-item" href="<c:url value="/admin/account-management/add" />" >Add Account</a></li>
							</ul>
						</div></li>
					<li id="card-management" class="nav-item dropdown"><a class="nav-link" role="button" data-bs-toggle="dropdown" aria-expanded="false">Card Management</a>
						<div class="dropdown-menu w-100">
							<span class="dropdown-menu-arrow d-none d-lg-block"></span>
							<ul class="list-unstyled">
								<li><a class="dropdown-item" href="<c:url value="/admin/card-management" />">View Cards</a></li>
								<li><a class="dropdown-item" href="<c:url value="/admin/card-management/add" />">Add Card</a></li>
							</ul>
						</div></li>
					<li id="loan-management" class="nav-item dropdown"><a class="nav-link" role="button" data-bs-toggle="dropdown" aria-expanded="false">Loan Management</a>
						<div class="dropdown-menu w-100">
							<span class="dropdown-menu-arrow d-none d-lg-block "></span>
							<ul class="list-unstyled">
								<li><a class="dropdown-item" href="<c:url value="/admin/loan-management" />">View Loans</a></li>
								<li><a class="dropdown-item" href="<c:url value="/admin/loan-management/add" />">Add Loan</a></li>
							</ul>
						</div></li>
					<li id="customer-management" class="nav-item"><a class="nav-link" href="<c:url value="/admin/customer-management" />" >Customer Management</a></li>
					<li id="application-management" class="nav-item"><a class="nav-link" href="<c:url value="/admin/application-management" />" >Application Management</a></li>
					<li id="profile-management" class="nav-item"><a class="nav-link" href="<c:url value="/admin/profile-management" />" >Profile Management</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<script>
	let url = window.location.href;
	let navbar = document.getElementById("header-nav").children;
	for (var i = 0; i < navbar.length; i++) {
		if (url.includes(navbar[i].id)) {
			navbar[i].className += " active";
		} else {
			navbar[i].className = navbar[i].className.replace(" active", "");
		}
	}
</script>