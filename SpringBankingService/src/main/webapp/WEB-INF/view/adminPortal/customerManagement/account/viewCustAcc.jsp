<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto">
			<h3 class="mb-4">View Customer Account</h3>
		</div>
		<div class="col-auto">
			<div class="row justify-content-end align-items-center mb-2">
				<div class="col-auto">
					<button class="btn btn-success" data-bs-toggle="modal" data-bs-id="${custAcc.accNum}"
						data-bs-target="#depositModal">
						<i class="fa-solid fa-circle-dollar-to-slot fa-fw me-2"></i>Deposit Money
					</button>
				</div>
				<div class="col-auto">
					<button class="btn btn-danger" data-bs-toggle="modal" data-bs-id="${custAcc.accNum}"
						data-bs-max="${custAcc.availBal}" data-bs-target="#withdrawModal">
						<i class="fa-solid fa-arrow-up-from-bracket fa-fw me-2"></i>Withdraw Money
					</button>
				</div>
				<div class="col-auto">
					<c:choose>
						<c:when test="${fn:toLowerCase(custAcc.status) == 'active'}">
							<button class="btn btn-secondary" data-bs-toggle="modal" data-bs-id="${custAcc.accNum}"
								data-bs-target="#deactivateCustAccModal">
								<i class="fa-solid fa-circle-xmark fa-fw me-2"></i>Deactivate
							</button>
						</c:when>
						<c:when test="${fn:toLowerCase(custAcc.status) == 'inactive'}">
							<button class="btn btn-secondary" data-bs-toggle="modal" data-bs-id="${custAcc.accNum}"
								data-bs-target="#activateCustAccModal">
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
					<div class="step" data-target="#accountDetails">
						<button type="button" class="step-trigger" role="tab" aria-controls="accountDetails" id="accountDetailsTrigger">
							<span class="bs-stepper-circle">1</span><span class="bs-stepper-label">Account Details</span>
						</button>
					</div>
					<div class="line"></div>
					<div class="step" data-target="#transactionHistory">
						<button type="button" class="step-trigger" role="tab" aria-controls="transactionHistory"
							id="transactionHistoryTrigger">
							<span class="bs-stepper-circle">2</span><span class="bs-stepper-label">Transaction History</span>
						</button>
					</div>
				</div>
				<div class="bs-stepper-content p-0">
					<!-- Contents -->
					<div id="accountDetails" class="content" role="tabpanel" aria-labelledby="accountDetailsTrigger">
						<ul class="list-group list-group-flush">
							<li class="list-group-item px-4 py-3">
								<div class="row align-items-center">
									<div class="col-3 text-secondary fw-bold mx-2">Customer</div>
									<div class="col-auto text-capitalize">
										<a href="<c:url value="/admin/customer-management/view/${custAcc.customer.id}" />"><c:out
												value="${custAcc.customer.name}" /></a>
									</div>
								</div>
							</li>
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
										<fmt:formatNumber value="${custAcc.account.interestRate}" type="percent" maxFractionDigits="3" />
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
							<table id="custAccTransactionTable" class="table">
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
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="./depositModal.jsp" />
<jsp:include page="./withdrawModal.jsp" />
<jsp:include page="./deactivateCustAcc.jsp" />
<jsp:include page="./activateCustAcc.jsp" />
<script>
	//Update input value based on search query params
	let queryParams = new URLSearchParams(window.location.search);
	let transactionMonth = queryParams.get("transactionMonth");
	let transactionForm = document.forms['filterTransaction'];
	if (transactionMonth != null) {
		transactionForm['transactionMonth'].value = transactionMonth;
	}

	$(document).ready(function() {
		$('#custAccTransactionTable').DataTable({
			order: [[0, 'desc']],
			dom: '<"container-fluid"<"row mb-3"<"col-auto"B>><"row"<"col-auto"l><"col"f>>>rtip',
			lengthMenu: [10,25,50,100],
			buttons: [
	            {
	                extend: 'excelHtml5',
	                text: 'Export Excel',
	                exportOptions: {
	                	columns: [ ':not(:last-child)' ]
	                },
	                title:"Account ${custAcc.accNum} Transactions - " + transactionForm['transactionMonth'].value
	            },
	            {
	                extend: 'pdfHtml5',
	                text: 'Export PDF',
	                exportOptions: {
	                	columns: [ ':not(:last-child)' ]
	                },
	                title:"Account ${custAcc.accNum} Transactions - " + transactionForm['transactionMonth'].value
	            },
	            {
	                extend: 'print',
	                text: 'Print',
	                exportOptions: {
	                	columns: [ ':not(:last-child)' ]
	                },
	                title:"Account ${custAcc.accNum} Transactions - " + transactionForm['transactionMonth'].value
	            }
	        ],
		});
	});

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