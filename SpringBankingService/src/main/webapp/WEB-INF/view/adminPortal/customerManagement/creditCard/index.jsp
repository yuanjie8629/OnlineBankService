<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container my-4">
	<div class="row justify-content-between align-items-center my-auto">
		<div class="col-auto">
			<h3>Manage Customer Credit Cards</h3>
		</div>
	</div>
	<div class="card card-shadow my-5">
		<div class="card-body p-4">
			<h4 class="mb-4">Customer Credit Card List</h4>
			<div class="row justify-content-between align-items-center g-3 mt-2 mb-5">
				<div class="col-auto">
					<!-- Credit Card Status Tabs -->
					<nav id="credit-card-status" class="nav nav-pills nav-tab-category fw-bold">
						<a id="all" class="nav-link px-3 py-2 me-4 active" href="credit-card">All</a>
						<a id="active" class="nav-link px-3 py-2 me-4" href="credit-card?status=active">Active</a>
						<a id="inactive" class="nav-link px-3 py-2 me-4" href="credit-card?status=inactive">Inactive</a>
					</nav>
				</div>
			</div>
			<!-- Customer Credit Card List -->
			<table id="custCreditCardTable" class="table table-hover">
				<thead>
					<tr>
						<th scope="col">Create Date</th>
						<th scope="col">Card Number</th>
						<th scope="col">Card Title</th>
						<th scope="col">Card Brand</th>
						<th scope="col">Customer Name</th>
						<th scope="col">Customer Email</th>
						<th scope="col">Expiration Date</th>
						<th scope="col">Status</th>
						<th scope="col" style="width: 10%;">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="custCreditCard" items="${custCreditCardList}">
						<fmt:parseDate value="${custCreditCard.createDate}" var="createDate" type="both" pattern="yyyy-MM-dd'T'HH:mm" />
						<c:choose>
							<c:when test="${fn:toLowerCase(custCreditCard.status) == 'active'}">
								<c:set var="status" value="success" />
							</c:when>
							<c:when test="${fn:toLowerCase(custCreditCard.status) == 'inactive'}">
								<c:set var="status" value="danger" />
							</c:when>
							<c:otherwise>
								<c:set var="status" value="secondary" />
							</c:otherwise>
						</c:choose>
						<tr>
							<td><fmt:formatDate type="both" pattern="dd-MMM-yyyy HH:mm" value="${createDate}" /></td>
							<td><c:out value="${custCreditCard.cardNum}" /></td>
							<td class="text-capitalize"><c:out value="${custCreditCard.creditCard.title}" /></td>
							<td><c:out value="${custCreditCard.brand}" /></td>
							<td><c:out value="${custCreditCard.customer.name}" /></td>
							<td><c:out value="${custCreditCard.customer.email}" /></td>
							<td><c:out value="${custCreditCard.expirationDate}" /></td>
							<td><span class="badge text-bg-${status} text-white text-capitalize w-100"><c:out value="${custCreditCard.status}" /></span></td>
							<td class="text-center">
								<div class="dropdown-center">
									<i class="fa-solid fa-ellipsis fa-xl menu-ellipsis" data-bs-toggle="dropdown" aria-expanded="false"></i>
									<ul class="dropdown-menu">
										<li>
											<a href="<c:url value="/admin/customer-management/credit-card/view/${custCreditCard.id}" />" class="dropdown-item" style="cursor: pointer;">
												<i class="fa-solid fa-eye fa-fw me-2"></i>View
											</a>
										</li>
										<li>
											<c:choose>
												<c:when test="${fn:toLowerCase(custCreditCard.status) == 'active'}">
													<a class="dropdown-item" style="cursor: pointer;" data-bs-toggle="modal" data-bs-id="${custCreditCard.id}"
														data-bs-target="#deactivateCustCreditCardModal"> <i class="fa-solid fa-circle-xmark fa-fw me-2"></i>Deactivate
													</a>
												</c:when>
												<c:when test="${fn:toLowerCase(custCreditCard.status) == 'inactive'}">
													<a class="dropdown-item" style="cursor: pointer;" data-bs-toggle="modal" data-bs-id="${custCreditCard.id}"
														data-bs-target="#activateCustCreditCardModal"> <i class="fa-solid fa-circle-check fa-fw me-2"></i>Activate
													</a>
												</c:when>
											</c:choose>
										</li>
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
		$('#custCreditCardTable').DataTable({
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
	                }
	            },
	            {
	                extend: 'pdfHtml5',
	                text: 'Export PDF',
	                exportOptions: {
	                	columns: [ ':not(:last-child)' ]
	                },
	            },
	            {
	                extend: 'print',
	                text: 'Print',
	                exportOptions: {
	                	columns: [ ':not(:last-child)' ]
	                },
	            }
	        ],
		});
	});

	/* Script to make tab active based on url params */
	let queryParams = new URLSearchParams(window.location.search);
	let custCreditCardStatus = queryParams.get("status");
	let filterCustCreditCardForm = document.forms["filterCustCreditCard"];
	if (custCreditCardStatus != null) {
		let custCreditCardStatusList = document.getElementById("credit-card-status").children;
		for (var i = 0; i < custCreditCardStatusList.length; i++) {
			if (custCreditCardStatusList[i].id.toLowerCase() == custCreditCardStatus
					.toLowerCase())
				custCreditCardStatusList[i].className += " active";
			else
				custCreditCardStatusList[i].className = custCreditCardStatusList[i].className
						.replace(" active", "");
		}
	}
</script>