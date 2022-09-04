<!-- Carousel -->
<div class="row m-0">
	<div class="carousel p-0">
		<div class="carousel-item active" style="height: 300px;">
			<div class="container">
				<div class="carousel-caption carousel-caption-middle" style="width: 40%;">
					<h1>Loans</h1>
				</div>
			</div>
			<img src="resources/images/basePortal/loan/LoanBackground.jpg" alt="loan" height="300">
		</div>
	</div>
</div>
<div class="container my-5">
	<!-- Loan Type Tabs -->
	<nav id="loan-type" class="nav nav-pills nav-tab-category fw-bold fs-5">
		<a class="nav-link px-5 py-4 mx-4 active" href="loan?type=personal">Personal Loan</a> 
		<a class="nav-link px-5 py-4 mx-3" href="loan?type=home">Home Loan</a>
		<a class="nav-link px-5 py-4 mx-3" href="loan?type=car">Car Loan</a>
		<a class="nav-link px-5 py-4 mx-3" href="loan?type=education">Education Loan</a>
	</nav>

	<!-- List of Loans Available -->
	<div class="my-5">
		<div class="row g-4">
			<div class="col-3">
				<div class="card card-hover">
					<img src="resources/images/basePortal/loan/OBS_PersonalLoan.jpg" class="card-img-top" alt="loan">
					<div class="card-body">
						<h5 class="card-title">OBS Personal Loan</h5>
						<p class="card-text text-justify">Get a OBS Bank Personal Loan now with affordable monthly installments.</p>
						<table class=" table text-justify">
							<tr>
								<td>Interest Rate</td>
								<td>5.88% p.a.</td>
							</tr>
							<tr>
								<td>Down Payment</td>
								<td>5% from total</td>
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
	let loanType = searchParams.get("type");
	if (loanType != null) {
		let loanTypeList = document.getElementById("loan-type").children;
		for (var i = 0; i < loanTypeList.length; i++) {
			if (loanTypeList[i].innerHTML.toLowerCase().replace(" loan","") == loanType.toLowerCase()
					.toLowerCase())
				loanTypeList[i].className += " active";
			else
				loanTypeList[i].className = loanTypeList[i].className.replace(
						" active", "");
		}
	}
</script>