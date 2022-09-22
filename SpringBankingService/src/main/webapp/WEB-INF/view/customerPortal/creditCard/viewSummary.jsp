<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cardPinMsg" value="${empty isPin ? 'Set' : 'Change'}" />
<div class="container my-4">
	<div class="row justify-content-between align-items-center mb-3">
		<div class="col-auto">
			<h3>Credit Card Summary</h3>
		</div>
		<div class="col-auto">
			<a href="<c:url value="/customer/credit-card/transaction/${custCreditCard.id}" />" role="button" class="btn btn-danger">View Transaction History</a>
		</div>
	</div>
	<div>
		<ul class="list-group list-group-flush">
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
						<c:out value="${encryptedCardNum}" />
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
						<fmt:formatNumber value="${custCreditCard.creditCard.interestRate}" type="percent" maxFractionDigits="3"/>
						p.a.
					</div>
				</div>
			</li>
			<li class="list-group-item px-4 py-3">
				<div class="row align-items-center">
					<div class="col-3 text-secondary fw-bold mx-2">Card Pin</div>
					<div class="col-auto">
						<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#changePinModal"><c:out value="${cardPinMsg}" /> Card Pin</button>
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
</div>
<jsp:include page="./changePin.jsp" />
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
	<c:remove scope="session" var="msg"/>
</c:if>
<c:if test="${not empty changePinMsg}">
	<script>
		let changePinModal = new bootstrap.Modal('#changePinModal');
		changePinModal.show();
	</script>
	<c:remove var="changePinMsg"/>
</c:if>