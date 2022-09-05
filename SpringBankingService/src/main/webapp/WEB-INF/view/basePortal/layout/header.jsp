<header>
	<nav class="navbar navbar-expand-lg fixed-top bg-light py-3">
		<div class="container">
			<a class="navbar-brand" href="home"> <img src="resources/images/logo.png" alt="logo" width="100">
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="offcanvas offcanvas-end" id="navbarToggler" aria-labelledby="offcanvasNavbar">
				<ul id="header-nav" class="navbar-nav">
					<li id="about-us" class="nav-item active"><a class="nav-link" aria-current="page" href="about-us">About Us</a></li>
					<li id="products" class="nav-item">
						<div class="nav-item dropdown">
							<a class="nav-link" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Products & Services </a>
							<div class="dropdown-menu dropdown-inline">
								<span class="dropdown-menu-arrow d-none d-lg-block"></span>
								<ul class="d-flex justify-content-between flex-wrap p-0">
									<li><a class="dropdown-item" href="account">Account</a></li>
									<li><a class="dropdown-item" href="credit-card">Credit Card</a></li>
									<li><a class="dropdown-item" href="loan">Loan</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li id="track-application" class="nav-item"><a class="nav-link" aria-current="page" href="track-application"> Track My Application </a></li>
					<li id="contact-us" class="nav-item"><a class="nav-link" href="contact-us">Contact Us</a></li>
				</ul>
			</div>
			<a href="login" role="button" class="login-btn btn btn-outline-danger" style="padding: 12px 36px;"> <strong>Login</strong>
			</a>
		</div>
	</nav>
</header>
<script>
	let url = window.location.href;
	let navbar = document.getElementById("header-nav").children;
	for (var i = 0; i < navbar.length; i++) {
		if (url.includes(navbar[i].id) || navbar[i].id == "products"
				&& /account|credit-card|loan/.test(url)) {
			navbar[i].className += " active";
		} else {
			navbar[i].className = navbar[i].className.replace(" active", "");
		}
	}
</script>