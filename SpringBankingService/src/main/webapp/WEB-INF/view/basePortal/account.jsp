<!-- Carousel -->
<div class="row m-0">
	<div class="carousel p-0">
		<div class="carousel-item active" style="height: 300px;">
			<div class="container">
				<div class="carousel-caption carousel-caption-middle">
					<h1>Accounts</h1>
				</div>
			</div>
			<img src="resources/images/basePortal/account/AccountBackground.jpg" alt="account" height="300">
		</div>
	</div>
</div>

<div class="container my-5">
	<!-- Account Type Tabs -->
	<nav id="account-type" class="nav nav-pills nav-tab-category fw-bold fs-5">
		<a class="nav-link px-5 py-4 mx-4 active" href="account?type=saving">Saving Account</a>
		<a class="nav-link px-5 py-4 mx-3" href="account?type=current">Current Account</a>
	</nav>

	<!-- List of Accounts Available -->
	<div class="my-5">
		<div class="row g-4">
			<div class="col-3">
				<div class="card card-hover">
					<img src="resources/images/basePortal/account/savingAcc.jpg" class="card-img-top" alt="savingAcc">
					<div class="card-body">
						<h5 class="card-title">Privilege Saver Account</h5>
						<p class="card-text text-justify">Grow your saving with our Privilege Saver Account.</p>
						<table class=" table text-justify">
							<tr>
								<td>Interest Rate</td>
								<td>3.5% p.a.</td>
							</tr>
							<tr>
								<td>Min Deposit Amount</td>
								<td>1000 SGD</td>
							</tr>
						</table>
						<a href="#" class="btn btn-danger w-100">Apply Now</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Script to make tab active based on url params -->
<script>
	let searchParams = new URLSearchParams(window.location.search);
	let accType = searchParams.get("type");
	if (accType != null) {
		let accTypeList = document.getElementById("account-type").children;
		for (var i = 0; i < accTypeList.length; i++) {
			if (accTypeList[i].innerHTML.toLowerCase().replace(" account", "") == accType.toLowerCase())
				accTypeList[i].className += " active";
			else
				accTypeList[i].className = accTypeList[i].className.replace(
						" active", "");
		}
	}
</script>