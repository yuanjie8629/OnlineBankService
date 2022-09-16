<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container my-4">
	<div class="row justify-content-between align-items-center mb-3">
		<div class="col-auto">
			<h3>Loan Summary</h3>
		</div>
		<div class="col-auto">
			<a href="<c:url value="/customer/payment/loan//${loanAcc.id}" />" role="button" class="btn btn-danger">View Payment History</a>
		</div>
	</div>
	<div>
		<ul class="list-group list-group-flush">
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
						<fmt:formatNumber value="${custLoan.interestRate}" type="percent" maxFractionDigits="3"/>
					</div>
				</div>
			</li>
			<li class="list-group-item px-4 py-3">
				<div class="row align-items-center">
					<div class="col-3 text-secondary fw-bold mx-2">Repayment Period</div>
					<div class="col-auto">
						<c:out value="${custLoan.repaymentPeriod}" /> Year(s)
					</div>
				</div>
			</li>
			<li class="list-group-item px-4 py-3">
				<div class="row align-items-center">
					<div class="col-3 text-secondary fw-bold mx-2">Disbursement Bank</div>
					<div class="col-auto text-capitalize"><c:out value="${custLoan.disbursementBank}" /></div>
				</div>
			</li>
			<li class="list-group-item px-4 py-3">
				<div class="row align-items-center">
					<div class="col-3 text-secondary fw-bold mx-2">Disbursement Account Type</div>
					<div class="col-auto text-capitalize"><c:out value="${custLoan.disbursementAccType}" /></div>
				</div>
			</li>
			<li class="list-group-item px-4 py-3">
				<div class="row align-items-center">
					<div class="col-3 text-secondary fw-bold mx-2">Disbursement Account Number</div>
					<div class="col-auto text-capitalize"><c:out value="${custLoan.disbursementAccNum}" /></div>
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
</div>