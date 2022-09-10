<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Approve Modal -->
<form:form name="cardAppApprove" modelAttribute="custLoan" action="approve" method="post" class="needs-validation"
	novalidate="true">
	<input type="hidden" name="appId" value="${loanApp.id}" />
	<div class="modal fade" id="approveModal" tabindex="-1" aria-labelledby="approveModal" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered modal-confirm">
			<div class="modal-content p-4">
				<div class="d-flex justify-content-end">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-header flex-column">
					<i class="fa-solid fa-thumbs-up fa-7x text-success"></i>
					<h3 class="mt-4 text-capitalize">Loan Application Approval</h3>
				</div>
				<div class="modal-body px-5">
					<p class="text-center">Please enter the following details to approve the loan application</p>
					<table class="table table-borderless table-fit m-auto">
						<tr>
							<spring:bind path="totalAmount">
								<td class="align-middle"><label class="form-label m-0" for="totalAmount">Total Loan Amount</label></td>
								<td>
									<div class="input-group has-validation">
										<form:input class="form-control${status.error ? ' is-invalid' : ''}" path="totalAmount" type="number" min="0"
											step="0.01" required="required" />
										<span class="input-group-text">SGD</span>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="totalAmount" />
												</c:when>
												<c:otherwise>
												Please enter the total loan amount.
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</td>
							</spring:bind>
						<tr>
							<spring:bind path="repaymentPeriod">
								<td class="align-middle"><label class="form-label" for="repaymentPeriod">Repayment Period</label></td>
								<td><form:select class="form-select ${status.error ? 'is-invalid' : ''}" path="repaymentPeriod">
										<c:choose>
											<c:when test="${loanApp.loan.type == 'personal'}">
												<form:option value="1">1 years</form:option>
												<form:option value="2">2 years</form:option>
												<form:option value="3">3 years</form:option>
												<form:option value="4">4 years</form:option>
												<form:option value="5">5 years</form:option>
											</c:when>
											<c:when test="${loanApp.loan.type == 'home'}">
												<form:option value="5">5 years</form:option>
												<form:option value="10">10 years</form:option>
												<form:option value="15">15 years</form:option>
												<form:option value="20">20 years</form:option>
												<form:option value="25">25 years</form:option>
												<form:option value="30">30 years</form:option>
											</c:when>
											<c:otherwise>
												<form:option value="1">1 years</form:option>
												<form:option value="2">2 years</form:option>
												<form:option value="3">3 years</form:option>
												<form:option value="4">4 years</form:option>
												<form:option value="5">5 years</form:option>
												<form:option value="6">6 years</form:option>
												<form:option value="7">7 years</form:option>
												<form:option value="8">8 years</form:option>
												<form:option value="9">9 years</form:option>
											</c:otherwise>
										</c:choose>
									</form:select>
									<div class="invalid-feedback">
										<c:choose>
											<c:when test="${status.error}">
												<form:errors path="repaymentPeriod" />
											</c:when>
											<c:otherwise>
													Please select the repayment period.
											</c:otherwise>
										</c:choose>
									</div></td>
							</spring:bind>
						</tr>
						<tr>
							<spring:bind path="interestRate">
								<td class="align-middle"><label class="form-label m-0" for="interestRate">Final Loan Interest Rate</label></td>
								<td>
									<div class="input-group has-validation">
										<form:input class="form-control${status.error ? ' is-invalid' : ''}" path="interestRate" type="number" min="0" max="100"
											step="0.01" required="required" />
										<span class="input-group-text">%</span>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="interestRate" />
												</c:when>
												<c:otherwise>
												Please enter the final loan interest rate.
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</td>
							</spring:bind>
						<tr>
						<tr>
							<spring:bind path="disbursementBank">
								<td class="align-middle"><label class="form-label" for="disbursementBank">Disbursement Bank</label></td>
								<td><form:select class="form-select ${status.error ? 'is-invalid' : ''}" path="disbursementBank"
										required="required">
										<form:option value="DBS">DBS</form:option>
										<form:option value="UOB">UOB</form:option>
										<form:option value="OCBC">OCBC</form:option>
										<form:option value="HSBC">HSBC</form:option>
										<form:option value="Citybank">Citybank</form:option>
										<form:option value="Maybank">Maybank</form:option>
										<form:option value="Standard Chartered">Standard Chartered</form:option>
										<form:option value="CIMB">CIMB</form:option>
									</form:select>
									<div class="invalid-feedback">
										<c:choose>
											<c:when test="${status.error}">
												<form:errors path="disbursementBank" />
											</c:when>
											<c:otherwise>
												Please select the disbursement bank.
											</c:otherwise>
										</c:choose>
									</div></td>
							</spring:bind>
						<tr>
						<tr>
							<spring:bind path="disbursementAccType">
								<td class="align-middle"><label class="form-label" for="disbursementAccType">Disbursement Account
										Type</label></td>
								<td><form:select class="form-select ${status.error ? 'is-invalid' : ''}" path="disbursementAccType"
										required="required">
										<form:option value="saving">Saving Account</form:option>
										<form:option value="current">Current Account</form:option>
									</form:select>
									<div class="invalid-feedback">
										<c:choose>
											<c:when test="${status.error}">
												<form:errors path="disbursementAccType" />
											</c:when>
											<c:otherwise>
												Please select the disbursement account type.
											</c:otherwise>
										</c:choose>
									</div></td>
							</spring:bind>
						<tr>
						<tr>
							<spring:bind path="disbursementAccNum">
								<td class="align-middle"><label class="form-label" for="disbursementAccNum">Disbursement Account
										Number</label></td>
								<td><form:input class="form-control ${status.error ? 'is-invalid' : ''}" path="disbursementAccNum"
										required="required" />
									<div class="invalid-feedback">
										<c:choose>
											<c:when test="${status.error}">
												<form:errors path="disbursementAccNum" />
											</c:when>
											<c:otherwise>
												Please select the disbursement account number.
											</c:otherwise>
										</c:choose>
									</div></td>
							</spring:bind>
						<tr>
						<tr>
							<spring:bind path="downpayment">
								<td class="align-middle"><label class="form-label m-0" for="downpayment">Down Payment Paid</label></td>
								<td>
									<div class="input-group has-validation">
										<form:input class="form-control${status.error ? ' is-invalid' : ''}" path="downpayment" type="number" min="0"
											step="0.01" required="required" />
										<span class="input-group-text">SGD</span>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="downpayment" />
												</c:when>
												<c:otherwise>
												Please enter the down payment paid.
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</td>
							</spring:bind>
						<tr>
					</table>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-secondary mx-2" data-bs-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-success mx-2">Approve</button>
				</div>
			</div>
		</div>
	</div>
</form:form>
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
</script>