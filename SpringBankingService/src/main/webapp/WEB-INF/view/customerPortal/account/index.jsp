<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto my-auto">
			<h3>All Accounts</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-12 col-md-6 col-lg-4">
			<div class="card card-btn bg-light my-4">
				<div class="card-body p-4">
					<div class="text-secondary mb-2">Saving Account</div>
					<h5 class="mb-3">Privilege Saver Account</h5>
					<div class="mb-2">6445533431</div>
					<div>Available Balance</div>
					<div class="row">
						<div class="col-auto">SGD</div>
						<div class="col">
							<h2>2000.00</h2>
						</div>
					</div>
					<div class="w-50">
						<hr>
					</div>
					<div class="row">
						<div class="col-auto">Current Balance</div>
						<div class="col fw-bold">SGD 2200.00</div>
					</div>
					<div>
						<a href="<c:url value="/customer/account/6445533431/summary" />" role="button"
							class="btn btn-danger stretched-link float-end">View More</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-6 col-lg-4">
			<div class="card card-btn bg-light my-4">
				<div class="card-body p-4">
					<div class="text-secondary mb-2">Saving Account</div>
					<h5 class="mb-3">Privilege Saver Account</h5>
					<div class="mb-2">6554433212</div>
					<div>Available Balance</div>
					<div class="row">
						<div class="col-auto">SGD</div>
						<div class="col">
							<h2>4000.00</h2>
						</div>
					</div>
					<div class="w-50">
						<hr>
					</div>
					<div class="row">
						<div class="col-auto">Current Balance</div>
						<div class="col fw-bold">SGD 4500.00</div>
					</div>
					<div>
						<a href="<c:url value="/customer/account/6445533431/summary" />" role="button"
							class="btn btn-danger stretched-link float-end">View More</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>