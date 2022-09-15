<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto mb-3">
			<h3>Credit Card Payment</h3>
		</div>
	</div>
	<c:choose>
		<c:when test="${empty custCreditCardList}">
			<div class="alert alert-danger my-3 mx-auto w-50 text-center" role="alert">You don't have any credit card with us...</div>
		</c:when>
		<c:otherwise>
			<div class="row align-items-center my-4">
				<label class="col-auto col-form-label">Select Your Credit Card</label>
				<div class="col-auto">
					<form name="selectCreditCard" action="">
						<select class="form-select" name="creditCardFrom" required onchange="submitForm()">
							<c:forEach var="custCreditCard" items="${custCreditCardList}">
								<option value="${custCreditCard.id}">
									<c:out value="${custCreditCard.cardNum} ${custCreditCard.creditCard.title}" />
								</option>
							</c:forEach>
						</select>
					</form>
				</div>
			</div>
			<div class="mb-5">
				<ul class="list-group list-group-flush">
					<li class="list-group-item px-4 py-3">
						<div class="row align-items-center">
							<div class="col-3 text-secondary fw-bold mx-2">Card Number</div>
							<div class="col-auto">
								<c:out value="${selectedCreditCard.cardNum}" />
							</div>
						</div>
					</li>
					<li class="list-group-item px-4 py-3">
						<div class="row align-items-center">
							<div class="col-3 text-secondary fw-bold mx-2">Card Display Name</div>
							<div class="col-auto text-capitalize">
								<c:out value="${selectedCreditCard.cardDisplayName}" />
							</div>
						</div>
					</li>
					<li class="list-group-item px-4 py-3">
						<div class="row align-items-center">
							<div class="col-3 text-secondary fw-bold mx-2">Currency</div>
							<div class="col-auto text-capitalize">SGD</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="row">
				<table id="creditCardPaymentTable" class="table">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Month</th>
							<th scope="col">Payment Description</th>
							<th scope="col">Amount</th>
							<th scope="col">Interest</th>
							<th scope="col">Additional Charges</th>
							<th scope="col">Total Amount</th>
							<th scope="col">Due Date</th>
							<th scope="col">Status</th>
							<th scope="col" style="width:10%">Action</th>
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
							<fmt:parseDate value="${payment.paymentMonth}" var="date" type="both" pattern="yyyyMM" />
							<fmt:parseDate value="${payment.dueDate}" var="dueDate" type="both" pattern="yyyy-MM-dd" />
							<fmt:formatNumber var="amount" value="${payment.amount}" type="currency" currencySymbol="" />
							<fmt:formatNumber var="interest" value="${payment.interestCharged}" type="currency" currencySymbol="" />
							<fmt:formatNumber var="additionalCharge" value="${payment.additionalCharge}" type="currency" currencySymbol="" />
							<fmt:formatNumber var="total" value="${payment.amount + payment.interestCharged + payment.additionalCharge}" type="currency" currencySymbol="" />
							<tr>
								<td><c:out value="${payment.id}" /></td>
								<td><fmt:formatDate type="both" pattern="MMM, yyyy" value="${date}" /></td>
								<td><c:out value="${not empty payment.description ? payment.description : '-'}" /></td>
								<td><c:out value="${amount}" /></td>
								<td><c:out value="${interest}" /></td>
								<td><c:out value="${additionalCharge}" /></td>
								<td><c:out value="${total}" /></td>
								<td><fmt:formatDate type="both" pattern="dd-MMM-yyyy" value="${dueDate}" /></td>
								<td><span class="badge text-bg-${status} text-white text-capitalize w-100"><c:out value="${payment.status}" /></span></td>
								<td>
									<c:choose>
										<c:when test="${fn:toLowerCase(payment.status) != 'completed'}">
											<a role="button" class="btn btn-outline-danger btn-sm w-100" href="<c:url value="/customer/payment/credit-card/pay/${payment.id}" />" >
												<i class="fa-solid fa-money-bill me-2"></i>Pay
											</a>
										</c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<jsp:include page="./noAccModal.jsp" />
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
<c:if test="${noAcc == true}">
	<script>
		// Success Modal
		let noAccModal = new bootstrap.Modal('#noAccModal');
		noAccModal.show();
	</script>
</c:if>
<script>
	$(document).ready(function() {
		$('#creditCardPaymentTable').DataTable({
			order: [[0, 'desc']],
			columnDefs: [
				{ orderable: false, targets: -1 }
			],
			dom: '<"container-fluid"<"row mb-3"<"col-auto"B>><"row"<"col-auto"l><"col"f>>>rtip',
			lengthMenu: [10,25,50,100],
			buttons: [
	            {
	                extend: 'excelHtml5',
	                text: 'Export Excel',
	                exportOptions: {
	                	columns: [ ':not(:last-child)' ]
	                },
	                title:"Payments for Credit Card ${fn:split(selectedCreditCard.cardNum,' ')[3]}"
	            },
	            {
	                extend: 'pdfHtml5',
	                text: 'Export PDF',
	                exportOptions: {
	                	columns: [ ':not(:last-child)' ]
	                },
	                title:"Payments for Credit Card ${fn:split(selectedCreditCard.cardNum,' ')[3]}"
	            },
	            {
	                extend: 'print',
	                text: 'Print',
	                exportOptions: {
	                	columns: [ ':not(:last-child)' ]
	                },
	                title:"Payments for Credit Card ${fn:split(selectedCreditCard.cardNum,' ')[3]}"
	            }
	        ],
		});
	});

	let form = document.forms['selectCreditCard'];

	function submitForm() {
		form.submit();
	}
</script>