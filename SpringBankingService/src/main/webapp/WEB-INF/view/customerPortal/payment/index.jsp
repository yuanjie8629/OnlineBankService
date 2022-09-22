<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row mx-0 my-4">
	<div class="row justify-content-center g-4 m-auto text-center" style="width: 80%;">
		<div class="col-12 col-md-6 col-lg-4">
			<div class="card card-btn h-100">
				<div class="card-body">
					<div class="p-2 m-auto" style="max-width: 120px;">
						<img src="<c:url value="/resources/images/customerPortal/payment/CreditCardPayment.png" />"
							alt="creditCardPayment" class="img-fluid rounded img-btn" />
					</div>
					<div class="my-2">
						<a href="payment/credit-card" class="stretched-link text-dark text-decoration-none fw-bold fs-5">Credit Card Payment</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-6 col-lg-4">
			<div class="card card-btn h-100">
				<div class="card-body">
					<div class="p-2 m-auto" style="max-width: 120px;">
						<img src="<c:url value="/resources/images/customerPortal/payment/LoanPayment.png" />"
							alt="loanPayment" class="img-fluid rounded img-btn" />
					</div>
					<div class="my-2">
						<a href="payment/loan" class="stretched-link text-dark text-decoration-none fw-bold fs-5">Loan Payment</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="toast-container position-fixed bottom-0 end-0 p-3">
	<div id="msgToast" class="toast text-bg-danger" role="alert" aria-live="assertive" aria-atomic="true">
		<div class="d-flex align-items-center p-2">
			<div class="toast-body">
				<c:out value="${msg}" />
			</div>
		</div>
	</div>
</div>
<c:if test="${not empty msg}">
	<script>
		// Message Toast
		let msgToast = document.getElementById("msgToast");
		let msgBsToast = new bootstrap.Toast(msgToast);
		msgBsToast.show();
	</script>
	<c:remove scope="session" var="msg" />
</c:if>