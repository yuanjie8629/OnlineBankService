<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<div style="padding-top: 150px;"></div>
<header class="fixed-top">
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container">
			<a class="navbar-brand" href="<c:url value="/customer/home" />" > <img src="<c:url value="/resources/images/logo.png" />" alt="logo"
				width="100">
			</a>
			<div class="nav-item">
				<a class="nav-link" href="<c:url value="/logout" />">Logout</a>
			</div>
		</div>
	</nav>
	<nav class="navbar navbar-dark navbar-expand-lg bg-danger">
		<div class="container">
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul id="header-nav" class="navbar-nav text-center">
					<li id="home" class="nav-item active"><a class="nav-link" aria-current="page" href="<c:url value="/customer/home" />">Home</a></li>
					<li id="account" class="nav-item"><a class="nav-link" href="<c:url value="/customer/account" />">Account</a></li>
					<li id="credit-card" class="nav-item dropdown-center">
						<a class="nav-link" role="button" data-bs-toggle="dropdown" aria-expanded="false">Credit Card</a>
						<div class="dropdown-menu">
							<span class="dropdown-menu-arrow d-none d-lg-block"></span>
							<ul class="list-unstyled">
								<li><a class="dropdown-item" href="<c:url value="/customer/credit-card/view" />" >View Credit Cards</a></li>
								<li><a class="dropdown-item" href="<c:url value="/customer/credit-card/transfer" />" >Transfer to Account</a></li>
							</ul>
						</div>
					</li>
					<li id="loan" class="nav-item"><a class="nav-link" href="<c:url value="/customer/loan" />">Loan</a></li>
					<li id="fund-transfer" class="nav-item dropdown-center">
						<a class="nav-link" role="button" data-bs-toggle="dropdown" aria-expanded="false">Fund Transfer</a>
						<div class="dropdown-menu">
							<span class="dropdown-menu-arrow d-none d-lg-block"></span>
							<ul class="list-unstyled">
								<li><a class="dropdown-item" href="<c:url value="/customer/fund-transfer/own" />" >Own Account Transfer</a></li>
								<li><a class="dropdown-item" href="<c:url value="/customer/fund-transfer/others" />" >Transfer to Others</a></li>
							</ul>
						</div>
					</li>
					<li id="payment" class="nav-item dropdown-center">
						<a class="nav-link" role="button" data-bs-toggle="dropdown" aria-expanded="false">Payment</a>
						<div class="dropdown-menu">
							<span class="dropdown-menu-arrow d-none d-lg-block "></span>
							<ul class="list-unstyled">
								<li><a class="dropdown-item" href="<c:url value="/customer/payment/credit-card" />">Credit Card Payment</a></li>
								<li><a class="dropdown-item" href="<c:url value="/customer/payment/loan" />" >Loan Payment</a></li>
							</ul>
						</div>
					</li>
					<li id="profile-management" class="nav-item"><a class="nav-link"
						href="<c:url value="/customer/profile-management" />" >Profile Management</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<script>
	let url = window.location.href;
	let navbar = document.getElementById("header-nav").children;
	for (var i = 0; i < navbar.length; i++) {
		if (url.split("/")[5].includes(navbar[i].id)) {
			navbar[i].className += " active";
		} else {
			navbar[i].className = navbar[i].className.replace(" active", "");
		}
	}
</script>