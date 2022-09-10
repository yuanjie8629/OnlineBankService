<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto my-auto">
			<h3>Manage Accounts</h3>
		</div>
		<div class="col-auto my-auto">
			<a href="<c:url value="/admin/account-management/add" />" role="button" class="btn btn-danger"
				style="padding: 12px 36px;"> <strong>Add Account</strong></a>
		</div>
	</div>
	<form name="filterAcc" method="get" action="<c:url value="/admin/account-management" />" onsubmit="validateForm(this)">
		<input type="hidden" name="type">
		<div class="card card-shadow my-4">
			<div class="card-body p-4">
				<h4 class="mb-4">Account List</h4>
				<div class="row justify-content-between align-items-center g-3 mt-2 mb-5">
					<div class="col-auto">
						<!-- Account Type Tabs -->
						<nav id="account-type" class="nav nav-pills nav-tab-category fw-bold">
							<a id="all" class="nav-link px-3 py-2 me-4 active" href="javascript:showAccType('all');">All</a>
							<a id="saving" class="nav-link px-3 py-2 me-4" href="javascript:showAccType('saving');">Saving Account</a>
							<a id="current" class="nav-link px-3 py-2" href="javascript:showAccType('current');">Current Account</a>
						</nav>
					</div>
					<div class="col-auto">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="showDeleted" onchange="submitForm()" /> <label
								class="form-check-label" for="showDeleted">Show Deleted Accounts</label>
						</div>
					</div>
				</div>
				<!-- Account List -->
				<table id="accountTable" class="table table-hover" style="width: 100%">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col" style="width: 15%;">Thumbnail</th>
							<th scope="col">Title</th>
							<th scope="col">Type</th>
							<th scope="col" style="width: 20%;">Description</th>
							<th scope="col">Interest Rate</th>
							<th scope="col">Min Deposit Amount</th>
							<th scope="col" style="width: 10%;"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="acc" items="${accList}">
							<tr>
								<th scope="row"><c:out value="${acc.id}" /></th>
								<td style="max-height: 50px;"><img src="data:image/png;base64,${acc.getBase64Thumbnail()}"
									alt="accthumbnail-${acc.id}" class="img-fluid" /></td>
								<td><c:out value="${acc.title}" /></td>
								<td class="text-capitalize"><c:out value="${acc.type}" /></td>
								<td><c:out value="${acc.description}" /></td>
								<td><fmt:formatNumber value="${acc.interestRate}" type="percent" minFractionDigits="2" /> p.a.</td>
								<td><fmt:formatNumber value="${acc.minAmount}" type="currency" currencyCode="SGD" /></td>
								<td>
									<div class="row g-3">
										<div class="col-12">
											<a href="<c:url value="/admin/account-management/update/${acc.id}" />" role="button"
												class="btn btn-outline-primary btn-sm w-100"> <i class="fa-solid fa-pen-to-square me-2"></i> Update
											</a>
										</div>
										<div class="col-12">
											<c:choose>
												<c:when test="${!acc.isDeleted()}">
													<button type="button" class="btn btn-outline-danger btn-sm w-100" data-bs-toggle="modal"
														data-bs-target="#deleteAccModal" data-bs-id="${acc.id}">
														<i class="fa-solid fa-trash me-2"></i>Delete
													</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-outline-success btn-sm w-100" data-bs-toggle="modal"
														data-bs-target="#restoreAccModal" data-bs-id="${acc.id}">
														<i class="fa-solid fa-trash-can-arrow-up me-2"></i>Restore
													</button>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</form>
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
<jsp:include page="./deleteAccount.jsp" />
<jsp:include page="./restoreAccount.jsp" />
<c:if test="${not empty msg}">
	<script>
		// Message Toast
		let msgToast = document.getElementById("msgToast");
		let msgBsToast = new bootstrap.Toast(msgToast);
		msgBsToast.show();
	</script>
	<c:remove var="msg"/>
</c:if>
<script>
	$(document).ready(function() {
		$('#accountTable').DataTable();
	});
	
	/* Script to make tab active based on url params */
	let queryParams = new URLSearchParams(window.location.search);
	let accType = queryParams.get("type");
	let filterAccForm = document.forms["filterAcc"];
	if (accType != null) {
		filterAccForm['type'].value = accType;
		let accTypeList = document.getElementById("account-type").children;
		for (var i = 0; i < accTypeList.length; i++) {
			if (accTypeList[i].id.toLowerCase() == accType.toLowerCase())
				accTypeList[i].className += " active";
			else
				accTypeList[i].className = accTypeList[i].className.replace(
						" active", "");
		}
	}

	/* Script to tick the showDeleted checkbox according to url query*/
	let showDeleted = queryParams.get("showDeleted");
	if (showDeleted != null) {
		filterAccForm['showDeleted'].checked = true;
	}

	/* Function to append accType to search query */
	function showAccType(type) {
		let filterAccForm = document.forms["filterAcc"];
		if (type != "all") {
			filterAccForm['type'].value = type;
		} else {
			filterAccForm['type'].disabled = true;
		}
		submitForm();
	}
	
	/* Function to remove empty query from the search form  */
	function validateForm(form) {
		for (var element of form.elements){
			if (element.value == "") {
				element.disabled = true;
			}
		}
	}

	function submitForm() {
		let form = document.forms["filterAcc"];
		validateForm(form);
		form.submit();
	}
</script>