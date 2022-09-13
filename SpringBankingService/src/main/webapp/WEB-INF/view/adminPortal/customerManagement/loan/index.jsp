<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="container my-4">
	<div class="row justify-content-between align-items-center my-auto">
		<div class="col-auto">
			<h3>Manage Customer Loans</h3>
		</div>
	</div>
	<div class="card card-shadow my-5">
		<div class="card-body p-4">
			<h4 class="mb-4">Customer Loan List</h4>
			<div class="row justify-content-between align-items-center g-3 mt-2 mb-5">
				<div class="col-auto">
					<!-- Loan Status Tabs -->
					<nav id="loan-status" class="nav nav-pills nav-tab-category fw-bold">
						<a id="all" class="nav-link px-3 py-2 me-4 active" href="loan">All</a>
						<a id="active" class="nav-link px-3 py-2 me-4" href="loan?status=active">Active</a>
						<a id="completed" class="nav-link px-3 py-2 me-4" href="loan?status=completed">Completed</a>
					</nav>
				</div>
			</div>
			<!-- Customer Loan List -->
			<table id="custLoanTable" class="table table-hover">
				<thead>
					<tr>
						<th scope="col">Loan ID</th>
						<th scope="col">Loan Title</th>
						<th scope="col">Customer Name</th>
						<th scope="col">Customer Email</th>
						<th scope="col">Total Amount</th>
						<th scope="col">Interest Rate</th>
						<th scope="col">Repayment Period</th>
						<th scope="col">Status</th>
						<th scope="col" style="width: 10%;"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="custLoan" items="${custLoanList}">
						<c:choose>
							<c:when test="${fn:toLowerCase(custLoan.status) == 'active'}">
								<c:set var="status" value="success" />
							</c:when>
							<c:when test="${fn:toLowerCase(custLoan.status) == 'inactive'}">
								<c:set var="status" value="danger" />
							</c:when>
							<c:otherwise>
								<c:set var="status" value="secondary" />
							</c:otherwise>
						</c:choose>
						<tr>
							<th scope="row"><c:out value="${custLoan.id}" /></th>
							<td class="text-capitalize"><c:out value="${custLoan.loan.title}" /></td>
							<td><c:out value="${custLoan.customer.name}" /></td>
							<td><c:out value="${custLoan.customer.email}" /></td>
							<td><c:out value="${custLoan.totalAmount}" /></td>
							<td><fmt:formatNumber value="${custLoan.interestRate}" type="percent" maxFractionDigits="3" /> p.a.</td>
							<td><c:out value="${custLoan.repaymentPeriod}" /> Year(s)</td>
							<td><span class="badge text-bg-${status} text-white text-capitalize w-100"><c:out value="${custLoan.status}" /></span></td>
							<td class="text-center">
								<div class="dropdown-center">
									<i class="fa-solid fa-ellipsis fa-xl menu-ellipsis" data-bs-toggle="dropdown" aria-expanded="false"></i>
									<ul class="dropdown-menu">
										<li>
											<a href="<c:url value="/admin/customer-management/loan/view/${custLoan.id}" />" class="dropdown-item" style="cursor: pointer;">
												<i class="fa-solid fa-eye fa-fw me-2"></i>View
											</a>
										</li>
										<c:if test="${fn:toLowerCase(custLoan.status) != 'completed'}">
											<li>
												<a class="dropdown-item" style="cursor: pointer;" data-bs-toggle="modal" data-bs-id="${custLoan.id}" data-bs-target="#completeCustLoanModal">
													<i class="fa-solid fa-circle-check fa-fw me-2"></i>Mark as completed
												</a>
											</li>
										</c:if>
									</ul>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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
		$('#custLoanTable').DataTable();
	});

	/* Script to make tab active based on url params */
	let queryParams = new URLSearchParams(window.location.search);
	let custLoanStatus = queryParams.get("status");
	let filterCustLoanForm = document.forms["filterCustLoan"];
	if (custLoanStatus != null) {
		let custLoanStatusList = document.getElementById("loan-status").children;
		for (var i = 0; i < custLoanStatusList.length; i++) {
			if (custLoanStatusList[i].id.toLowerCase() == custLoanStatus
					.toLowerCase())
				custLoanStatusList[i].className += " active";
			else
				custLoanStatusList[i].className = custLoanStatusList[i].className
						.replace(" active", "");
		}
	}
</script>