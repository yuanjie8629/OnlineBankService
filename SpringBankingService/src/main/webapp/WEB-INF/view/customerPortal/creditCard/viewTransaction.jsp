<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto mb-3">
			<h3>View Credit Card Transaction History</h3>
		</div>
	</div>
	<div class="mb-5">
		<ul class="list-group list-group-flush">
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
					<div class="col-auto text-capitalize">
						<c:out value="${custCreditCard.cardDisplayName}" />
					</div>
				</div>
			</li>
			<li class="list-group-item px-4 py-3">
				<div class="row align-items-center">
					<div class="col-3 text-secondary fw-bold mx-2">Currency</div>
					<div class="col-auto text-capitalize">
						SGD
					</div>
				</div>
			</li>
		</ul>
	</div>
	<div class="row align-items-center mb-4">
		<label class="col-auto col-form-label"> Transaction Month </label>
		<div class="col-auto">
			<form name="filterTransaction" action="">
				<select class="form-select" name="transactionMonth" onchange="submitForm();">
					<c:forEach var="month" items="${months}">
						<fmt:parseDate value="${month}" var="parsedMonth" pattern="yyyyMM" />
						<option value="${month}"><fmt:formatDate pattern="MMMM, yyyy" value="${parsedMonth}" /></option>
					</c:forEach>
				</select>
			</form>
		</div>
	</div>
	<div class="row">
		<table id="accTransactionTable" class="table">
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
						<td><c:out value="${transaction.reference}"/></td>
						<td><c:out value="${not empty transaction.description ? transaction.description : '-'}"/></td>
						<td><c:out value="${fn:toLowerCase(transaction.type) == 'deposit' ? amount : '-'}"/></td>
						<td><c:out value="${fn:toLowerCase(transaction.type) == 'withdraw' ? amount : '-'}"/></td>
						<td><fmt:formatNumber value="${transaction.balance}" type="currency" currencySymbol="" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<script>
	$(document).ready(function() {
		$('#accTransactionTable').DataTable({
			order: [[0, 'desc']]
		});
	});
	
	
	// Change the default value of the transaction month based on search query
	let queryParams = new URLSearchParams(window.location.search);
	let transactionMonth = queryParams.get("transactionMonth");
	let form = document.forms['filterTransaction'];
	if (transactionMonth != null) {
		form['transactionMonth'].value = transactionMonth;
	}
	
	function submitForm() {
		form.submit();
	}
</script>