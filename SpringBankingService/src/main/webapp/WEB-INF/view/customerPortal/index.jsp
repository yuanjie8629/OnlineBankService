<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<div class="container mt-4">
	<div>
		<h3>Welcome to OBS Connect, ${user.name}</h3>
		<div>Login Time: ${loginTime}</div>
	</div>
	<!-- Button Navigation -->
	<div class="row mx-0 my-4">
		<div class="row g-4 m-auto text-center" style="width: 60%;">
			<div class="col-12 col-md-6">
				<div class="card card-btn h-100">
					<div class="card-body">
						<div class="p-2 m-auto" style="max-width: 120px;">
							<img src="<c:url value="/resources/images/customerPortal/home/Account.png" />" alt="acc" class="img-fluid rounded img-btn" />
						</div>
						<div class="my-2">
							<a href="account" class="stretched-link text-dark text-decoration-none fw-bold fs-5">Account</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6">
				<div class="card card-btn h-100">
					<div class="card-body">
						<div class="p-2 m-auto" style="max-width: 120px;">
							<img src="<c:url value="/resources/images/customerPortal/home/FundTransfer.png" />" alt="funcTransfer" class="img-fluid rounded img-btn" />
						</div>
						<div class="my-2">
							<a href="fund-transfer" class="stretched-link text-dark text-decoration-none fw-bold fs-5">Fund Transfer</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6">
				<div class="card card-btn h-100">
					<div class="card-body">
						<div class="p-2 m-auto" style="max-width: 120px;">
							<img src="<c:url value="/resources/images/customerPortal/home/Payment.png" />" alt="payment" class="img-fluid rounded img-btn" />
						</div>
						<div class="my-2">
							<a href="payment" class="stretched-link text-dark text-decoration-none fw-bold fs-5">Payment</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6">
				<div class="card card-btn h-100">
					<div class="card-body">
						<div class="p-2 m-auto" style="max-width: 120px;">
							<img src="<c:url value="/resources/images/customerPortal/home/ProfileManagement.png" />" alt="profileMgmt" class="img-fluid rounded img-btn" />
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