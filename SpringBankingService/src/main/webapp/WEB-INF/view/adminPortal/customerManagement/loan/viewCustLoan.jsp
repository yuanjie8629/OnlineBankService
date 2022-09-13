<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto">
			<h3 class="mb-4">View Customer Loan</h3>
		</div>
		<div class="col-auto">
			<div class="row justify-content-end align-items-center mb-2">
				<c:if test="${fn:toLowerCase(custLoan.status) != 'completed'}">
					<div class="col-auto">
						<a role="button" class="btn btn-danger"  href="<c:url value="/admin/customer-management/loan/${custLoan.id}/payment/add" />">
							<i class="fa-solid fa-sack-dollar fa-fw me-2"></i>Add Payment
						</a>
					</div>
					<div class="col-auto">
						<button class="btn btn-success" data-bs-toggle="modal" data-bs-id="${custLoan.id}"
							data-bs-target="#completeCustLoanModal">
							<i class="fa-solid fa-circle-check fa-fw me-2"></i>Mark as completed
						</button>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<div class="card card-shadow">
		<div class="card-body p-4">
			<div class="bs-stepper py-3 mx-auto">
				<div class="bs-stepper-header w-50 m-auto mb-3" role="tablist">
					<!-- Steps -->
					<div class="step" data-target="#loanDetails">
						<button type="button" class="step-trigger" role="tab" aria-controls="loanDetails" id="loanDetailsTrigger">
							<span class="bs-stepper-circle">1</span><span class="bs-stepper-label">Loan Details</span>
						</button>
					</div>
					<div class="line"></div>
					<div class="step" data-target="#paymentHistory">
						<button type="button" class="step-trigger" role="tab" aria-controls="paymentHistory" id="paymentHistoryTrigger">
							<span class="bs-stepper-circle">2</span><span class="bs-stepper-label">Payment History</span>
						</button>
					</div>
				</div>
				<div class="bs-stepper-content p-0">
					<!-- Contents -->
					<div id="loanDetails" class="content" role="tabpanel" aria-labelledby="loanDetailsTrigger">
						<ul class="list-group list-group-flush">
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Customer</div>
									<div class="col-auto text-capitalize">
										<a href="<c:url value="/admin/customer-management/view/${custLoan.customer.id}" />"><c:out
												value="${custLoan.customer.name}" /></a>
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Loan</div>
									<div class="col-auto text-capitalize">
										<c:out value="${custLoan.loan.title}" />
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Loan ID</div>
									<div class="col-auto">
										<c:out value="${custLoan.id}" />
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Currency</div>
									<div class="col-auto text-capitalize">SGD</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Total Loan Amount</div>
									<div class="col-auto text-capitalize">
										<fmt:formatNumber value="${custLoan.totalAmount}" type="currency" currencySymbol="" />
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Paid Down Payment</div>
									<div class="col-auto text-capitalize">
										<fmt:formatNumber value="${custLoan.downpayment}" type="currency" currencySymbol="" />
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Principal Balance</div>
									<div class="col-auto text-capitalize">
										<fmt:formatNumber value="${custLoan.principalBal}" type="currency" currencySymbol="" />
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Interest Rate</div>
									<div class="col-auto text-capitalize">
										<fmt:formatNumber value="${custLoan.interestRate}" type="percent" maxFractionDigits="3" />
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Repayment Period</div>
									<div class="col-auto">
										<c:out value="${custLoan.repaymentPeriod}" />
										Year(s)
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Disbursement Bank</div>
									<div class="col-auto text-capitalize">
										<c:out value="${custLoan.disbursementBank}" />
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Disbursement Account Type</div>
									<div class="col-auto text-capitalize">
										<c:out value="${custLoan.disbursementAccType}" />
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Disbursement Account Number</div>
									<div class="col-auto text-capitalize">
										<c:out value="${custLoan.disbursementAccNum}" />
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Status</div>
									<div class="col-auto text-capitalize">
										<c:out value="${custLoan.status}" />
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div id="paymentHistory" class="content" role="tabpanel" aria-labelledby="paymentHistoryTrigger">
						<div class="row">
							<table id="custLoanPaymentTable" class="table">
								<thead>
									<tr>
										<th scope="col">Month</th>
										<th scope="col">Payment Description</th>
										<th scope="col">Principal Paid</th>
										<th scope="col">Interest</th>
										<th scope="col">Add. Charges</th>
										<th scope="col">Total Amount</th>
										<th scope="col">Due Date</th>
										<th scope="col">Status</th>
										<th scope="col" style="width: 10%"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="payment" items="${payments}">
										<c:choose>
											<c:when test="${fn:toLowerCase(payment.status) == 'completed'}">
												<c:set var="status" value="success" />
											</c:when>
											<c:otherwise>
												<c:set var="status" value="secondary" />
											</c:otherwise>
										</c:choose>
										<fmt:parseDate value="${payment.paymentMonth}" var="paymentMonth" type="both" pattern="yyyyMM" />
										<fmt:parseDate value="${payment.dueDate}" var="dueDate" type="both" pattern="yyyy-MM-dd" />
										<fmt:formatNumber var="amount" value="${payment.amount + payment.additionalCharge}" type="currency" currencySymbol="" />
										<fmt:formatNumber var="additionalCharge" value="${payment.additionalCharge}" type="currency" currencySymbol="" />
										<fmt:formatNumber var="interest" value="${payment.interestCharged}" type="currency" currencySymbol="" />
										<fmt:formatNumber var="principal" value="${payment.principal}" type="currency" currencySymbol="" />
										<tr>
											<td><fmt:formatDate type="both" pattern="MMM, yyyy" value="${paymentMonth}" /></td>
											<td><c:out value="${not empty payment.description ? payment.description : '-'}" /></td>
											<td><c:out value="${principal}" /></td>
											<td><c:out value="${interest}" /></td>
											<td><c:out value="${additionalCharge}" /></td>
											<td><c:out value="${amount}" /></td>
											<td><fmt:formatDate type="both" pattern="dd-MMM-yyyy" value="${dueDate}" /></td>
											<td><span class="badge text-bg-${status} text-white text-capitalize w-100"><c:out value="${payment.status}" /></span></td>
											<td>
												<c:if test="${fn:toLowerCase(payment.status) != 'completed'}">
													<a href="<c:url value="/admin/customer-management/loan/payment/update/${payment.id}" />" role="button" class="btn btn-outline-primary btn-sm w-100">
														<i class="fa-solid fa-pen-to-square me-2"></i>Update
													</a>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="./completeCustLoan.jsp" />
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
	$(document).ready(function() {
		$('#custLoanPaymentTable').DataTable({
			order : [ [ 0, 'desc' ] ]
		});
	});

	let transactionForm = document.forms['filterTransaction'];

	// Update input value based on search query params
	let queryParams = new URLSearchParams(window.location.search);
	let transactionMonth = queryParams.get("transactionMonth");
	if (transactionMonth != null) {
		transactionForm['transactionMonth'].value = transactionMonth;
	}

	document.addEventListener('DOMContentLoaded', function() {
		stepper = new Stepper(document.querySelector('.bs-stepper'), {
			linear : false
		});

		if (transactionMonth != null)
			stepper.to(2);
	});

	function submitTransactionForm() {
		transactionForm.submit();
	}
</script>