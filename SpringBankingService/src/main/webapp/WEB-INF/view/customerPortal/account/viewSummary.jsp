<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container my-4">
	<div class="row justify-content-between align-items-center mb-3">
		<div class="col-auto">
			<h3>Account Summary</h3>
		</div>
		<div class="col-auto">
			<a href="<c:url value="/customer/account/transaction/${custAcc.accNum}" />" role="button" class="btn btn-danger">View Transaction History</a>
		</div>
	</div>
	<div>
		<ul class="list-group list-group-flush">
			<li class="list-group-item px-4 py-3">
				<div class="row align-items-center">
					<div class="col-3 text-secondary fw-bold mx-2">Account</div>
					<div class="col-auto text-capitalize">
						<c:out value="${custAcc.account.title}" />
					</div>
				</div>
			</li>
			<li class="list-group-item px-4 py-3">
				<div class="row align-items-center">
					<div class="col-3 text-secondary fw-bold mx-2">Account Number</div>
					<div class="col-auto">
						<c:out value="${custAcc.accNum}" />
					</div>
				</div>
			</li>
			<li class="list-group-item px-4 py-3">
				<div class="row align-items-center">
					<div class="col-3 text-secondary fw-bold mx-2">Account Type</div>
					<div class="col-auto text-capitalize">
						<c:out value="${custAcc.account.type}" />
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
					<div class="col-3 text-secondary fw-bold mx-2">Current Balance</div>
					<div class="col-auto text-capitalize">
						<fmt:formatNumber value="${custAcc.curBal}" type="currency" currencySymbol="" />
					</div>
				</div>
			</li>
			<li class="list-group-item px-4 py-3">
				<div class="row align-items-center">
					<div class="col-3 text-secondary fw-bold mx-2">Available Balance</div>
					<div class="col-auto text-capitalize">
						<fmt:formatNumber value="${custAcc.availBal}" type="currency" currencySymbol="" />
					</div>
				</div>
			</li>
			<li class="list-group-item px-4 py-3">
				<div class="row align-items-center">
					<div class="col-3 text-secondary fw-bold mx-2">Hold Amount</div>
					<div class="col-auto text-capitalize">
						<fmt:formatNumber value="${custAcc.holdAmt}" type="currency" currencySymbol="" />
					</div>
				</div>
			</li>
			<li class="list-group-item px-4 py-3">
				<div class="row align-items-center">
					<div class="col-3 text-secondary fw-bold mx-2">Interest Rate</div>
					<div class="col-auto">
						<fmt:formatNumber value="${custAcc.account.interestRate}" type="percent" maxFractionDigits="3"/>
						p.a.
					</div>
				</div>
			</li>
			<li class="list-group-item px-4 py-3">
				<div class="row align-items-center">
					<div class="col-3 text-secondary fw-bold mx-2">Status</div>
					<div class="col-auto text-capitalize">
						<c:out value="${custAcc.status}" />
					</div>
				</div>
			</li>
		</ul>
	</div>
</div>