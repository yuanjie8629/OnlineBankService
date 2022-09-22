<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto my-auto">
			<h3>All Loans</h3>
		</div>
	</div>
	<div class="row">
		<c:choose>
			<c:when test="${not empty custLoanList}">
				<c:forEach var="custLoan" items="${custLoanList}">
					<div class="col-12 col-md-6 col-lg-4">
						<div class="card card-btn bg-light my-4">
							<div class="card-body p-4">
								<div class="text-secondary mb-2 text-capitalize"><c:out value="${custLoan.loan.type}" /> Loan</div>
								<h5 class="mb-3"><c:out value="${custLoan.loan.title}" /></h5>
								<div class="mb-2"><c:out value="${custLoan.id}" /></div>
								<div>Principal Balance</div>
								<div class="row">
									<div class="col-auto">SGD</div>
									<div class="col">
										<h2><fmt:formatNumber value="${custLoan.principalBal}" type="currency" currencySymbol=""/></h2>
									</div>
								</div>
								<div class="w-50">
									<hr>
								</div>
								<div class="row">
									<div class="col-auto">Repayment Period</div>
									<div class="col fw-bold"><c:out value="${custLoan.repaymentPeriod}" /> Year(s)</div>
								</div>
								<div>
									<a href="<c:url value="/customer/loan/summary/${custLoan.id}" />" role="button"
										class="btn btn-danger stretched-link float-end">View More</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="alert alert-danger my-3 mx-auto w-50 text-center" role="alert">
				  You don't have any loan with us...
				</div>
			</c:otherwise>
		</c:choose>
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
	<c:remove scope="session" var="msg"/>
</c:if>