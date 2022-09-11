<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto mb-3">
			<h3>Transfer to Others</h3>
		</div>
	</div>
	<div class="container my-4">
		<div class="card card-shadow">
			<div class="card-body p-4">
				<div class="bs-stepper py-3 w-50 mx-auto">
					<div class="bs-stepper-header m-auto mb-4" role="tablist">
						<!-- Steps -->
						<div class="step" data-target="#enterDetails">
							<button type="button" class="step-trigger" role="tab" aria-controls="enterDetails" id="enterDetailsTrigger">
								<span class="bs-stepper-circle">1</span><span class="bs-stepper-label">Enter Details</span>
							</button>
						</div>
						<div class="line"></div>
						<div class="step" data-target="#confirmation">
							<button type="button" class="step-trigger" role="tab" aria-controls="confirmation" id="confirmationTrigger">
								<span class="bs-stepper-circle">2</span><span class="bs-stepper-label">Confirmation</span>
							</button>
						</div>
					</div>
					<div class="bs-stepper-content p-0">
						<!-- Contents -->
						<form name="transferToOthers" class="needs-validation" action="others/save" method="post" novalidate>
							<div id="enterDetails" class="content" role="tabpanel" aria-labelledby="enterDetailsTrigger">
								<c:if test="${not empty msg}">
									<div class="alert alert-danger" role="alert">
										<c:out value="${msg}" />
									</div>
								</c:if>
								<div class="row mb-3">
									<label for="accFrom" class="col-5 col-lg-3 col-form-label">From</label>
									<div class="col-12 col-lg-9">
										<select class="form-select" name="accFrom" required onchange="accFromChange()">
											<c:forEach var="custAcc" items="${custAccList}">
												<option data-amount="${custAcc.availBal}" value="${custAcc.accNum}">
													<c:out value="${custAcc.accNum} ${custAcc.account.title}" />
													[SGD <fmt:formatNumber value="${custAcc.availBal}" type="currency" currencySymbol="" />]
												</option>
											</c:forEach>
										</select>
										<div class="invalid-feedback">Please select your account to transfer from.</div>
									</div>
								</div>
								<div class="row mb-3">
									<label for="accTo" class="col-5 col-lg-3 col-form-label">To</label>
									<div class="col-12 col-lg-9">
										<input class="form-control" name="accTo" required>
										<div class="invalid-feedback">Please enter your account to transfer to.</div>
									</div>
								</div>
								<div class="row mb-3">
									<label for="amount" class="col-5 col-lg-3 col-form-label">Amount</label>
									<div class="col-12 col-lg-9">
										<div class="input-group has-validation mb-3">
											<input class="form-control" type="number" min="0" step="0.01" name="amount" required onkeyup="amountChange()">
											<span class="input-group-text">SGD</span>
											<div id="amount-invalid" class="invalid-feedback">Please enter the amount you want to transfer.</div>
										</div>
									</div>
								</div>
								<div class="row mb-3">
									<label for="amount" class="col-5 col-lg-3 col-form-label">Description</label>
									<div class="col-12 col-lg-9">
										<input class="form-control" placeholder="Optional" name="description">
									</div>
								</div>
								<div class="row justify-content-end">
									<div class="col-auto">
										<input type="reset" class="btn btn-danger float-end px-4 py-2" value="Clear" />
									</div>
									<div class="col-auto">
										<button onclick="return submitTransfer(false)" class="btn btn-danger btn-next-form float-end px-4 py-2">Next</button>
									</div>
								</div>
							</div>
							<div id="confirmation" class="content" role="tabpanel" aria-labelledby="confirmationTrigger">
								<div class="row mb-3">
									<label for="accFrom" class="col-5 col-lg-3 col-form-label">From</label>
									<div id="accFrom" class="col-12 col-lg-9 col-form-label">
									</div>
								</div>
								<div class="row mb-3">
									<label for="accTo" class="col-5 col-lg-3 col-form-label">To</label>
									<div id="accTo" class="col-12 col-lg-9 col-form-label">
									</div>
								</div>
								<div class="row mb-3">
									<label for="amount" class="col-5 col-lg-3 col-form-label">Amount (SGD)</label>
									<div id="amount" class="col-12 col-lg-9 col-form-label">
									</div>
								</div>
								<div class="row mb-3">
									<label for="amount" class="col-5 col-lg-3 col-form-label">Description</label>
									<div id="description" class="col-12 col-lg-9 col-form-label">
									</div>
								</div>
								<div class="row justify-content-end">
									<div class="col-auto">
										<button type="button" class="btn btn-danger float-end px-4 py-2" onclick="stepper.previous()">Back</button>
									</div>
									<div class="col-auto">
										<button type="submit" class="btn btn-danger float-end px-4 py-2">Submit</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="./successModal.jsp" />
<c:if test="${success == true}">
	<script>
		// Success Modal
		let successModal = new bootstrap.Modal('#successModal');
		successModal.show();
	</script>
</c:if>
<script>
	// Script to initialize the stepper
	var stepper;
	document.addEventListener('DOMContentLoaded', function() {
		stepper = new Stepper(document.querySelector('.bs-stepper'))
	})
	
	let form = document.forms['transferToOthers'];
	
	// Amount Validation
	function amountChange() {
		// Set error message for the amount
		let amountErr = document.getElementById("amount-invalid");
		if (parseInt(form['amount'].value) > parseInt(form['amount'].max)) {
			amountErr.innerHTML = "Your account available balance is not sufficient for this transaction.";
		} else {
			amountErr.innerHTML = "Please enter the amount you want to transfer.";
		}
	}
	
	// Form Validation
	function submitTransfer(validate) {
		amountChange();
		if (!form.checkValidity()) {
			event.preventDefault();
			event.stopPropagation();
		} else if (validate == false){
			let accFrom = document.getElementById("accFrom");
			accFrom.innerHTML = form['accFrom'].value;
			
			let accTo = document.getElementById("accTo");
			accTo.innerHTML = form['accTo'].value;
			
			let amount = document.getElementById("amount");
			amount.innerHTML = form['amount'].value;
			
			let description = document.getElementById("description");
			description.innerHTML = form['description'].value;
			
			stepper.next();
		}
		form.classList.add('was-validated')
		return validate;
	}
	
	// Update validation for max amount to be transferred
	function accFromChange() {
		let accFromSelect = form['accFrom'];
		let selectedAccFrom = accFromSelect.options[accFromSelect.selectedIndex];
		form['amount'].max = selectedAccFrom.dataset.amount;
	}
	
	window.addEventListener("load", () => {
		accFromChange();
	});
</script>