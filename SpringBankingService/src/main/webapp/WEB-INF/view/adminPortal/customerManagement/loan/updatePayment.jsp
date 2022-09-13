<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<fmt:formatNumber var="principal" value="${loanPayment.principal}" type="currency" currencySymbol="" />
<fmt:formatNumber var="interest" value="${loanPayment.interestCharged}" type="currency" currencySymbol="" />
<fmt:formatNumber var="amount" value="${loanPayment.amount}" type="currency" currencySymbol="" />
<fmt:formatNumber var="endBal" value="${loanPayment.balance}" type="currency" currencySymbol="" />
<fmt:formatNumber var="formattedBal" value="${loanPayment.balance}"  maxFractionDigits="2" pattern="#"/>
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto">
			<h3 class="mb-4">Update Loan Payment</h3>
		</div>
	</div>
	<div class="card card-shadow">
		<div class="card-body p-4">
			<div class="bs-stepper w-50 py-3 mx-auto">
				<div class="bs-stepper-header m-auto mb-3" role="tablist">
					<!-- Steps -->
					<div class="step" data-target="#addPayment">
						<button type="button" class="step-trigger" role="tab" aria-controls="addPayment" id="addPaymentTrigger">
							<span class="bs-stepper-circle">1</span><span class="bs-stepper-label">Update Payment</span>
						</button>
					</div>
				</div>
				<div class="bs-stepper-content p-0">
					<!-- Contents -->
					<div id="addPayment" class="content" role="tabpanel" aria-labelledby="addPaymentTrigger">
						<c:if test="${not empty loanPayment}">
							<form:form name="addPayment" modelAttribute="loanPayment" action="save" method="post" class="needs-validation" novalidate="true">
								<form:input type="hidden" path="id" />
								<input type="hidden" name="loanId" value="${loanPayment.loan.id}"/>
								<form:input type="hidden" path="balance" value="${formattedBal}" />
								<div class="mb-3">
									<label for="amount" class="form-label">Loan ID</label>
									<input class="form-control" value="${loanPayment.loan.id}" readonly />
								</div>
								<div class="mb-3">
									<label for="amount" class="form-label">Payment Month</label>
									<form:input class="form-control" path="paymentMonth" readonly="true"/>
								</div>
								<div class="mb-3">
									<label for="amount" class="form-label">Principal Paid</label>
									<div class="input-group">
										<form:input class="form-control" path="principal" value="${principal}" type="number" min="0" step="0.01" readonly="true"/>
										<span class="input-group-text">SGD</span>
									</div>
								</div>
								<div class="mb-3">
									<label for="interestCharged" class="form-label">Interest Charged</label>
									<div class="input-group">
										<form:input class="form-control" path="interestCharged" value="${interest}" type="number" min="0" step="0.01" readonly="true" />
										<span class="input-group-text">SGD</span>
									</div>
								</div>
								<div class="mb-3">
									<label for="amount" class="form-label">Total Amount</label>
									<div class="input-group">
										<form:input class="form-control" path="amount" value="${amount}" type="number" min="0" step="0.01" readonly="true" />
										<span class="input-group-text">SGD</span>
									</div>
								</div>
								<div class="mb-3">
									<label for="amount" class="form-label">Ending Balance</label>
									<div class="input-group">
										<input class="form-control" value="${endBal}" readonly/>
										<span class="input-group-text">SGD</span>
									</div>
								</div>
								<spring:bind path="description">
									<div class="mb-3">
										<label for="description" class="form-label">Description</label>
										<form:input class="form-control${status.error ? 'is-invalid' : ''}" path="description" required="required" />
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="description" />
												</c:when>
												<c:otherwise>
													Please enter payment description.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="dueDate">
									<fmt:parseDate value="${loanPayment.dueDate}" var="parsedDueDate" type="both" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${parsedDueDate}" var="formattedDueDate" pattern="yyyy-MM-dd" />
									<div class="mb-3">
										<label for="dueDate" class="form-label">Due Date</label>
										<form:input class="form-control${status.error ? 'is-invalid' : ''}" name="dueDate" path="dueDate" value="${formattedDueDate}" type="date" required="required" />
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="dueDate" />
												</c:when>
												<c:otherwise>
													Please select payment due date.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="additionalCharge">
									<div class="mb-3">
										<label for="additionalCharge" class="form-label">Additional Charges</label>
										<form:input class="form-control${status.error ? 'is-invalid' : ''}" path="additionalCharge" type="number"
											min="0" step="0.01" />
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="additionalCharge" />
												</c:when>
												<c:otherwise>
													Please select payment due date.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<button class="btn btn-danger px-4 float-end" type="submit">Update Payment</button>
							</form:form>
						</c:if>
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
	<c:remove var="msg" />
</c:if>
<script>
	(() => {
	  'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  const forms = document.querySelectorAll('.needs-validation')

	  // Loop over them and prevent submission
	  Array.from(forms).forEach(form => {
	    form.addEventListener('submit', event => {
	      if (!form.checkValidity()) {
	        event.preventDefault()
	        event.stopPropagation()
	      }

	      form.classList.add('was-validated')
	    }, false)
	  })
	})()
	
	// Script to initialize the stepper
	var stepper;
	document.addEventListener('DOMContentLoaded', function() {
		stepper = new Stepper(document.querySelector('.bs-stepper'));
	})
</script>