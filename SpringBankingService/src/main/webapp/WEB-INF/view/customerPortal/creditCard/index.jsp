<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row mx-0 my-4">
	<div class="row justify-content-center g-4 m-auto text-center" style="width: 80%;">
		<div class="col-12 col-md-6 col-lg-4">
			<div class="card card-btn h-100">
				<div class="card-body">
					<div class="p-2 m-auto" style="max-width: 120px;">
						<img src="<c:url value="/resources/images/customerPortal/creditCard/ViewCreditCards.png" />"
							alt="viewCreditCards" class="img-fluid rounded img-btn" />
					</div>
					<div class="my-2">
						<a href="credit-card/view" class="stretched-link text-dark text-decoration-none fw-bold fs-5">View Credit Cards</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-6 col-lg-4">
			<div class="card card-btn h-100">
				<div class="card-body">
					<div class="p-2 m-auto" style="max-width: 120px;">
						<img src="<c:url value="/resources/images/customerPortal/creditCard/TransferToAccount.png" />"
							alt="transferToAccount" class="img-fluid rounded img-btn" />
					</div>
					<div class="my-2">
						<a href="credit-card/transfer" class="stretched-link text-dark text-decoration-none fw-bold fs-5">Transfer to Account</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>