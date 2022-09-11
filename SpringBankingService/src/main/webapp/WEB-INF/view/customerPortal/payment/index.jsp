<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row mx-0 my-4">
	<div class="row justify-content-center g-4 m-auto text-center" style="width: 80%;">
		<div class="col-12 col-md-6 col-lg-4">
			<div class="card card-btn h-100">
				<div class="card-body">
					<div class="p-2 m-auto" style="max-width: 120px;">
						<img src="<c:url value="/resources/images/customerPortal/payment/CreditCardPayment.png" />"
							alt="ownAccountTransfer" class="img-fluid rounded img-btn" />
					</div>
					<div class="my-2">
						<a href="fund-transfer/own" class="stretched-link text-dark text-decoration-none fw-bold fs-5">Credit Card Payment</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-6 col-lg-4">
			<div class="card card-btn h-100">
				<div class="card-body">
					<div class="p-2 m-auto" style="max-width: 120px;">
						<img src="<c:url value="/resources/images/customerPortal/payment/LoanPayment.png" />"
							alt="transferToOthers" class="img-fluid rounded img-btn" />
					</div>
					<div class="my-2">
						<a href="fund-transfer/others" class="stretched-link text-dark text-decoration-none fw-bold fs-5">Loan Payment</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>