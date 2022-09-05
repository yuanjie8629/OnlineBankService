<%@ page import="com.utils.URLUtils" %>
<div class="container mt-4">
	<h3>Welcome, Admin</h3>
	<!-- Button Navigation -->
	<div class="row mx-0 my-4">
		<div class="row g-4 m-auto text-center" style="width: 80%;">
			<div class="col-12 col-md-6 col-lg-4">
				<div class="card card-btn h-100">
					<div class="card-body">
						<div class="p-2 m-auto" style="max-width: 120px;">
							<img src="${URLUtils.getBasePath()}/resources/images/adminPortal/home/AccountManagement.png" alt="accMgmt" class="img-fluid rounded img-btn" />
						</div>
						<div class="my-2">
							<a href="account-management" class="stretched-link text-dark text-decoration-none fw-bold fs-5">Account Management</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-4">
				<div class="card card-btn h-100">
					<div class="card-body">
						<div class="p-2 m-auto" style="max-width: 120px;">
							<img src="${URLUtils.getBasePath()}/resources/images/adminPortal/home/CardManagement.png" alt="cardMgmt" class="img-fluid rounded img-btn" />
						</div>
						<div class="my-2">
							<a href="card-management" class="stretched-link text-dark text-decoration-none fw-bold fs-5">Card Management</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-4">
				<div class="card card-btn h-100">
					<div class="card-body">
						<div class="p-2 m-auto" style="max-width: 120px;">
							<img src="${URLUtils.getBasePath()}/resources/images/adminPortal/home/LoanManagement.png" alt="loanMgmt" class="img-fluid rounded img-btn" />
						</div>
						<div class="my-2">
							<a href="loan-management" class="stretched-link text-dark text-decoration-none fw-bold fs-5">Loan Management</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-4">
				<div class="card card-btn h-100">
					<div class="card-body">
						<div class="p-2 m-auto" style="max-width: 120px;">
							<img src="${URLUtils.getBasePath()}/resources/images/adminPortal/home/CustomerManagement.png" alt="customerMgmt" class="img-fluid rounded img-btn" />
						</div>
						<div class="my-2">
							<a href="customer-management" class="stretched-link text-dark text-decoration-none fw-bold fs-5">Customer Management</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-4">
				<div class="card card-btn h-100">
					<div class="card-body">
						<div class="p-2 m-auto" style="max-width: 120px;">
							<img src="${URLUtils.getBasePath()}/resources/images/adminPortal/home/ApplicationManagement.png" alt="applicationMgmt" class="img-fluid rounded img-btn" />
						</div>
						<div class="my-2">
							<a href="application-management" class="stretched-link text-dark text-decoration-none fw-bold fs-5">Application Management</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-4">
				<div class="card card-btn h-100">
					<div class="card-body">
						<div class="p-2 m-auto" style="max-width: 120px;">
							<img src="${URLUtils.getBasePath()}/resources/images/adminPortal/home/ProfileManagement.png" alt="profileMgmt" class="img-fluid rounded img-btn" />
						</div>
						<div class="my-2">
							<a href="profile-management" class="stretched-link text-dark text-decoration-none fw-bold fs-5">Profile Management</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>