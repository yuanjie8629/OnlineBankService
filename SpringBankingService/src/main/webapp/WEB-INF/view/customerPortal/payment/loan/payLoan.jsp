<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:formatNumber var="amount" value="${loanPayment.amount}" minFractionDigits="2" maxFractionDigits="2" pattern="#.##" />
<fmt:formatNumber var="principal" value="${loanPayment.principal}" minFractionDigits="2" maxFractionDigits="2" pattern="#.##" />
<fmt:formatNumber var="interest" value="${loanPayment.interestCharged}" minFractionDigits="2" maxFractionDigits="2" pattern="#.##" />
<fmt:formatNumber var="additionalCharge" value="${loanPayment.additionalCharge}" minFractionDigits="2" maxFractionDigits="2" pattern="#.##" />
<fmt:formatNumber var="total" value="${loanPayment.amount + loanPayment.additionalCharge}"  minFractionDigits="2" maxFractionDigits="2" pattern="#.##" />
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto mb-3">
			<h3>Pay Loan</h3>
		</div>
	</div>
	<div class="container my-4">
		<div class="card card-shadow">
			<div class="card-body p-4">
				<div class="bs-stepper py-3 w-50 mx-auto">
					<div class="bs-stepper-header m-auto mb-4" role="tablist">
						<!-- Steps -->
						<div class="step" data-target="#selectAccount">
							<button type="button" class="step-trigger" role="tab" aria-controls="selectAccount" id="selectAccountTrigger">
								<span class="bs-stepper-circle">1</span><span class="bs-stepper-label">Select Account</span>
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
						<form name="loanPayment" class="needs-validation" action="save" method="post" novalidate>
							<input type="hidden" name="id" value="${loanPayment.id}">
							<div id="selectAccount" class="content" role="tabpanel" aria-labelledby="selectAccountTrigger">
								<c:if test="${not empty msg}">
									<div class="alert alert-danger" role="alert">
										<c:out value="${msg}" />
									</div>
								</c:if>
								<div class="row mb-3">
									<label for="accNum" class="col-5 col-lg-3 col-form-label">From</label>
									<div class="col-12 col-lg-9">
										<select class="form-select" name="accNum" required>
											<c:forEach var="custAcc" items="${custAccList}">
												<option value="${custAcc.accNum}">
													<c:out value="${custAcc.accNum} ${custAcc.account.title}" /> [SGD
													<fmt:formatNumber value="${custAcc.availBal}" type="currency" currencySymbol="" />]
												</option>
											</c:forEach>
										</select>
										<div class="invalid-feedback">Please select your account to transfer from.</div>
									</div>
								</div>
								<div class="row mb-3">
									<label for="accTo" class="col-5 col-lg-3 col-form-label">To</label>
									<div class="col-12 col-lg-9">
										<input class="form-control" value="Loan Payment to ${loanPayment.loan.id}" disabled>
									</div>
								</div>
								<div class="row mb-3">
									<label for="amount" class="col-5 col-lg-3 col-form-label">Principal Amount</label>
									<div class="col-12 col-lg-9">
										<div class="input-group has-validation mb-3">
											<input class="form-control" type="number" min="0" step="0.01" value="${principal}" disabled>
										</div>
									</div>
								</div>
								<div class="row mb-3">
									<label for="interestCharged" class="col-5 col-lg-3 col-form-label">Interest Charged</label>
									<div class="col-12 col-lg-9">
										<div class="input-group has-validation mb-3">
											<input class="form-control" type="number" min="0" step="0.01" value="${interest}"
												disabled>
										</div>
									</div>
								</div>
								<div class="row mb-3">
									<label for="additionalCharge" class="col-5 col-lg-3 col-form-label">Additional Charges</label>
									<div class="col-12 col-lg-9">
										<div class="input-group has-validation mb-3">
											<input class="form-control" type="number" min="0" step="0.01" value="${additionalCharge}"
												disabled>
										</div>
									</div>
								</div>
								<div class="row mb-3">
									<label for="totalAmount" class="col-5 col-lg-3 col-form-label">Total Amount</label>
									<div class="col-12 col-lg-9">
										<div class="input-group has-validation mb-3">
											<input class="form-control" type="number" min="0" step="0.01" value="${total}" disabled>
										</div>
									</div>
								</div>
								<div class="row justify-content-end">
									<div class="col-auto">
										<button onclick="return submitTransfer(false)" class="btn btn-danger btn-next-form float-end px-4 py-2">Next</button>
									</div>
								</div>
							</div>
							<div id="confirmation" class="content" role="tabpanel" aria-labelledby="confirmationTrigger">
								<div class="row mb-3">
									<label for="accNum" class="col-5 col-lg-4 col-form-label">From</label>
									<div id="accNum" class="col-12 col-lg-8 col-form-label"></div>
								</div>
								<div class="row mb-3">
									<label for="accTo" class="col-5 col-lg-4 col-form-label">To</label>
									<div class="col-12 col-lg-8 col-form-label">
										Loan Payment to <c:out value="${loanPayment.loan.id}" />
									</div>
								</div>
								<div class="row mb-3">
									<label for="amount" class="col-5 col-lg-4 col-form-label">Principal Amount (SGD)</label>
									<div class="col-12 col-lg-8 col-form-label">
										<c:out value="${principal}" />
									</div>
								</div>
								<div class="row mb-3">
									<label for="amount" class="col-5 col-lg-4 col-form-label">Interest Charged (SGD)</label>
									<div class="col-12 col-lg-8 col-form-label">
										<c:out value="${interest}" />
									</div>
								</div>
								<div class="row mb-3">
									<label for="amount" class="col-5 col-lg-4 col-form-label">Additional Charges (SGD)</label>
									<div class="col-12 col-lg-8 col-form-label">
										<c:out value="${additionalCharge}" />
									</div>
								</div>
								<div class="row mb-3">
									<label for="amount" class="col-5 col-lg-4 col-form-label">Total Amount (SGD)</label>
									<div class="col-12 col-lg-8 col-form-label">
										<c:out value="${total}" />
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
<script>
	// Script to initialize the stepper
	var stepper;
	document.addEventListener('DOMContentLoaded', function() {
		stepper = new Stepper(document.querySelector('.bs-stepper'))
	})
	
	let form = document.forms['loanPayment'];
	
	// Form Validation
	function submitTransfer(validate) {
		if (!form.checkValidity()) {
			event.preventDefault();
			event.stopPropagation();
		} else if (validate == false){
			let accNum = document.getElementById("accNum");
			accNum.innerHTML = form['accNum'].value;
			
			stepper.next();
		}
		form.classList.add('was-validated')
		return validate;
	}
</script>