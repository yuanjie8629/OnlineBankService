<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto">
			<h3 class="mb-4">View Customer Credit Card</h3>
		</div>
		<div class="col-auto">
			<div class="row justify-content-end align-items-center mb-2">
				<div class="col-auto">
					<a role="button" class="btn btn-danger"
						href="<c:url value="/admin/customer-management/credit-card/${custCreditCard.id}/payment/add" />"> <i
						class="fa-solid fa-credit-card fa-fw me-2"></i>Add Payment
					</a>
				</div>
				<div class="col-auto">
					<c:choose>
						<c:when test="${fn:toLowerCase(custCreditCard.status) == 'active'}">
							<button class="btn btn-secondary" data-bs-toggle="modal" data-bs-id="${custCreditCard.id}"
								data-bs-target="#deactivateCustCreditCardModal">
								<i class="fa-solid fa-circle-xmark fa-fw me-2"></i>Deactivate
							</button>
						</c:when>
						<c:when test="${fn:toLowerCase(custCreditCard.status) == 'inactive'}">
							<button class="btn btn-secondary" data-bs-toggle="modal" data-bs-id="${custCreditCard.id}"
								data-bs-target="#activateCustCreditCardModal">
								<i class="fa-solid fa-circle-check fa-fw me-2"></i>Activate
							</button>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<div class="card card-shadow">
		<div class="card-body p-4">
			<div class="bs-stepper py-3 mx-auto">
				<div class="bs-stepper-header w-50 m-auto mb-3" role="tablist">
					<!-- Steps -->
					<div class="step" data-target="#cardDetails">
						<button type="button" class="step-trigger" role="tab" aria-controls="cardDetails" id="cardDetailsTrigger">
							<span class="bs-stepper-circle">1</span><span class="bs-stepper-label">Card Details</span>
						</button>
					</div>
					<div class="line"></div>
					<div class="step" data-target="#transactionHistory">
						<button type="button" class="step-trigger" role="tab" aria-controls="transactionHistory"
							id="transactionHistoryTrigger">
							<span class="bs-stepper-circle">2</span><span class="bs-stepper-label">Transaction History</span>
						</button>
					</div>
					<div class="line"></div>
					<div class="step" data-target="#paymentHistory">
						<button type="button" class="step-trigger" role="tab" aria-controls="paymentHistory" id="paymentHistoryTrigger">
							<span class="bs-stepper-circle">3</span><span class="bs-stepper-label">Payment History</span>
						</button>
					</div>
				</div>
				<div class="bs-stepper-content p-0">
					<!-- Contents -->
					<div id="cardDetails" class="content" role="tabpanel" aria-labelledby="cardDetailsTrigger">
						<ul class="list-group list-group-flush">
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Customer</div>
									<div class="col-auto text-capitalize">
										<a href="<c:url value="/admin/customer-management/view/${custCreditCard.customer.id}" />"><c:out
												value="${custCreditCard.customer.name}" /></a>
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Credit Card</div>
									<div class="col-auto text-capitalize">
										<c:out value="${custCreditCard.creditCard.title}" />
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Card Number</div>
									<div class="col-auto">
										<c:out value="${custCreditCard.cardNum}" />
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Card Display Name</div>
									<div class="col-auto">
										<c:out value="${custCreditCard.cardDisplayName}" />
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Expiration Date</div>
									<div class="col-auto text-capitalize">
										<c:out value="${custCreditCard.expirationDate}" />
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
									<div class="col-3 text-secondary fw-bold mx-2">Credit Limit</div>
									<div class="col-auto text-capitalize">
										<fmt:formatNumber value="${custCreditCard.creditLimit}" type="currency" currencySymbol="" />
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Interest Rate</div>
									<div class="col-auto">
										<fmt:formatNumber value="${custCreditCard.creditCard.interestRate}" type="percent" maxFractionDigits="3" />
										p.a.
									</div>
								</div>
							</li>
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Status</div>
									<div class="col-auto text-capitalize">
										<c:out value="${custCreditCard.status}" />
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div id="transactionHistory" class="content" role="tabpanel" aria-labelledby="transactionHistoryTrigger">
						<div class="row align-items-center mb-4">
							<label class="col-auto col-form-label"> Transaction Month </label>
							<div class="col-auto">
								<form name="filterTransaction" action="">
									<select class="form-select" name="transactionMonth" onchange="submitTransactionForm()">
										<c:forEach var="month" items="${months}">
											<fmt:parseDate value="${month}" var="parsedMonth" pattern="yyyyMM" />
											<option value="${month}"><fmt:formatDate pattern="MMMM, yyyy" value="${parsedMonth}" /></option>
										</c:forEach>
									</select>
								</form>
							</div>
						</div>
						<div class="row">
							<table id="creditCardTransactionTable" class="table">
								<thead>
									<tr>
										<th scope="col">Transaction Date</th>
										<th scope="col">Transaction Reference</th>
										<th scope="col">Transaction Description</th>
										<th scope="col">Deposit Amount</th>
										<th scope="col">Withdrawal Amount</th>
										<th scope="col">Balance</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="transaction" items="${transactions}">
										<fmt:parseDate value="${transaction.date}" var="date" type="both" pattern="yyyy-MM-dd'T'HH:mm" />
										<fmt:formatNumber var="amount" value="${transaction.amount}" type="currency" currencySymbol="" />
										<tr>
											<td><fmt:formatDate type="both" pattern="dd-MMM-yyyy HH:mm" value="${date}" /></td>
											<td><c:out value="${transaction.reference}" /></td>
											<td><c:out value="${not empty transaction.description ? transaction.description : '-'}" /></td>
											<td><c:out value="${fn:toLowerCase(transaction.type) == 'deposit' ? amount : '-'}" /></td>
											<td><c:out value="${fn:toLowerCase(transaction.type) == 'withdraw' ? amount : '-'}" /></td>
											<td><fmt:formatNumber value="${transaction.balance}" type="currency" currencySymbol="" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div id="paymentHistory" class="content" role="tabpanel" aria-labelledby="paymentHistoryTrigger">
						<div class="row">
							<table id="creditCardPaymentTable" class="table">
								<thead>
									<tr>
										<th scope="col">Month</th>
										<th scope="col">Payment Description</th>
										<th scope="col">Amount</th>
										<th scope="col">Interest</th>
										<th scope="col">Add. Charges</th>
										<th scope="col">Total</th>
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
										<fmt:parseDate value="${payment.date}" var="date" type="both" pattern="yyyy-MM-dd" />
										<fmt:parseDate value="${payment.paymentMonth}" var="paymentMonth" type="both" pattern="yyyyMM" />
										<fmt:parseDate value="${payment.dueDate}" var="dueDate" type="both" pattern="yyyy-MM-dd" />
										<fmt:formatNumber var="amount" value="${payment.amount}" type="currency" currencySymbol="" />
										<fmt:formatNumber var="interest" value="${payment.interestCharged}" type="currency" currencySymbol="" />
										<fmt:formatNumber var="additionalCharge" value="${payment.additionalCharge}" type="currency" currencySymbol="" />
										<fmt:formatNumber var="total" value="${payment.amount + payment.interestCharged + payment.additionalCharge}" type="currency" currencySymbol="" />
										<tr>
											<td><fmt:formatDate type="both" pattern="MMM, YYYY" value="${paymentMonth}" /></td>
											<td><c:out value="${not empty payment.description ? payment.description : '-'}" /></td>
											<td><c:out value="${amount}" /></td>
											<td><c:out value="${interest}" /></td>
											<td><c:out value="${additionalCharge}" /></td>
											<td><c:out value="${total}" /></td>
											<td><span class="badge text-bg-${status} text-white text-capitalize w-100"><c:out
														value="${payment.status}" /></span></td>
											<td>
												<c:if test="${fn:toLowerCase(payment.status) != 'completed'}">
													<a href="<c:url value="/admin/customer-management/credit-card/payment/update/${payment.id}" />" role="button" class="btn btn-outline-primary btn-sm w-100">
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
<jsp:include page="./activateCustCreditCard.jsp" />
<jsp:include page="./deactivateCustCreditCard.jsp" />
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
		$('#creditCardTransactionTable').DataTable({
			order : [ [ 0, 'desc' ] ]
		});
	});

	$(document).ready(function() {
		$('#creditCardPaymentTable').DataTable({
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