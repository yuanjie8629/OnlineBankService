<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto my-auto">
			<h3>Manage Loan Applications</h3>
		</div>
	</div>
	<form name="filterLoanApp" method="get" action="<c:url value="/admin/application-management/loan" />" onsubmit="validateForm(this)">
		<input type="hidden" name="status">
		<div class="card card-shadow my-4">
			<div class="card-body p-4">
				<h4 class="mb-4">Loan Application List</h4>
				<div class="row justify-content-between align-items-center g-3 mt-2 mb-5">
					<div class="col-auto">
						<!-- Application Status Tabs -->
						<nav id="app-status" class="nav nav-pills nav-tab-category fw-bold">
							<a id="all" class="nav-link px-3 py-2 me-4 active" href="javascript:showAppStatus('all');">All</a>
							<a id="pending" class="nav-link px-3 py-2 me-4" href="javascript:showAppStatus('pending');">Pending</a>
							<a id="approved" class="nav-link px-3 py-2 me-4" href="javascript:showAppStatus('approved');">Approved</a>
							<a id="rejected" class="nav-link px-3 py-2 me-4" href="javascript:showAppStatus('rejected');">Rejected</a>
							<a id="furtherAction" class="nav-link px-3 py-2" href="javascript:showAppStatus('furtherAction');">Further Action</a>
						</nav>
					</div>
				</div>
				<!-- Loan Application List -->
				<table id="loanAppTable" class="table table-hover" style="width: 100%">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">NRIC/Passport Number</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Contact Number</th>
							<th scope="col">Loan</th>
							<th scope="col">Status</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="loanApp" items="${loanAppList}">
							<tr>
								<th scope="row"><c:out value="${loanApp.getId()}" /></th>
								<td><c:out value="${loanApp.getIdentityNumber()}" /></td>
								<td><c:out value="${loanApp.getName()}" /></td>
								<td><c:out value="${loanApp.getEmail()}" /></td>
								<td><c:out value="${loanApp.getContactNo()}" /></td>
								<td><c:out value="${loanApp.getLoan().getTitle()}" /></td>
								<td class="text-capitalize"><c:out value="${loanApp.getStatus()}" /></td>
								<td class="text-center">
									<div class="dropdown-center">
										<i class="fa-solid fa-ellipsis fa-xl menu-ellipsis" data-bs-toggle="dropdown" aria-expanded="false"></i>
										<ul class="dropdown-menu">
											<li><a href="<c:url value="/admin/application-management/account/view/${accApp.getId()}" />" class="dropdown-item" style="cursor: pointer;"><i class="fa-solid fa-eye fa-fw me-2"></i>View</a></li>
											<c:if test="${accApp.status != 'approved' and accApp.status != 'rejected'}">
												<li><a href="" class="dropdown-item" style="cursor: pointer;"><i class="fa-solid fa-thumbs-up fa-fw me-2"></i>Approve</a></li>
												<li><a href="" class="dropdown-item" style="cursor: pointer;"><i class="fa-solid fa-thumbs-down fa-fw me-2"></i>Reject</a></li>
												<li><a href="" class="dropdown-item" style="cursor: pointer;"><i class="fa-solid fa-circle-exclamation fa-fw me-2"></i>Further Action</a></li>
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
<script>
	$(document).ready(function() {
		$('#loanAppTable').DataTable();
	});
	
	/* Message Toast */
	<%if (request.getAttribute("msg") != null) {%>
		let msgToast = document.getElementById("msgToast");
		let msgBsToast = new bootstrap.Toast(msgToast);
		msgBsToast.show();
	<%}%>
	
	/* Script to make tab active based on url params */
	let queryParams = new URLSearchParams(window.location.search);
	let loanStatus = queryParams.get("status");
	let filterLoanAppForm = document.forms["filterLoanApp"];
	if (loanStatus != null) {
		filterLoanAppForm['status'].value = loanStatus;
		let loanStatusList = document.getElementById("app-status").children;
		for (var i = 0; i < loanStatusList.length; i++) {
			if (loanStatusList[i].id.toLowerCase() == loanStatus.toLowerCase())
				loanStatusList[i].className += " active";
			else
				loanStatusList[i].className = loanStatusList[i].className.replace(
						" active", "");
		}
	}

	/* Function to append loanStatus to search query */
	function showAppStatus(status) {
		let filterLoanAppForm = document.forms["filterLoanApp"];
		if (status != "all") {
			filterLoanAppForm['status'].value = status;
		} else {
			filterLoanAppForm['status'].disabled = true;
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
		let form = document.forms["filterLoanApp"];
		validateForm(form);
		form.submit();
	}
</script>