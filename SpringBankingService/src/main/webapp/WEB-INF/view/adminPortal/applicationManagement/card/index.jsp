<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto my-auto">
			<h3>Manage Card Applications</h3>
		</div>
	</div>
	<form name="filterCardApp" method="get" action="<c:url value="/admin/application-management/card" />"
		onsubmit="validateForm(this)">
		<input type="hidden" name="status">
		<div class="card card-shadow my-4">
			<div class="card-body p-4">
				<h4 class="mb-4">Card Application List</h4>
				<div class="row justify-content-between align-items-center g-3 mt-2 mb-5">
					<div class="col-auto">
						<!-- Application Status Tabs -->
						<nav id="app-status" class="nav nav-pills nav-tab-category fw-bold">
							<a id="all" class="nav-link px-3 py-2 me-4 active" href="javascript:showAppStatus('all');">All</a>
							<a id="pending" class="nav-link px-3 py-2 me-4" href="javascript:showAppStatus('pending');">Pending</a>
							<a id="accepted" class="nav-link px-3 py-2 me-4" href="javascript:showAppStatus('accepted');">Accepted</a>
							<a id="rejected" class="nav-link px-3 py-2 me-4" href="javascript:showAppStatus('rejected');">Rejected</a>
							<a id="furtherAction" class="nav-link px-3 py-2" href="javascript:showAppStatus('furtherAction');">Further Action</a>
						</nav>
					</div>
				</div>
				<!-- Account Application List -->
				<table id="cardAppTable" class="table table-hover" style="width: 100%">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">NRIC/Passport Number</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Contact Number</th>
							<th scope="col">Card</th>
							<th scope="col">Status</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cardApp" items="${cardAppList}">
							<tr>
								<th scope="row"><c:out value="${cardApp.getId()}" /></th>
								<td><c:out value="${cardApp.getIdentityNumber()}" /></td>
								<td><c:out value="${cardApp.getName()}" /></td>
								<td><c:out value="${cardApp.getEmail()}" /></td>
								<td><c:out value="${cardApp.getContactNo()}" /></td>
								<td><c:out value="${cardApp.getCreditCard().getTitle()}" /></td>
								<td class="text-capitalize"><c:out value="${cardApp.getStatus()}" /></td>
								<td class="text-center">
									<div class="dropdown-center">
										<i class="fa-solid fa-ellipsis fa-xl menu-ellipsis" data-bs-toggle="dropdown" aria-expanded="false"></i>
										<ul class="dropdown-menu">
											<li><a href="<c:url value="/admin/application-management/account/view/${accApp.getId()}" />" class="dropdown-item" style="cursor: pointer;"><i class="fa-solid fa-eye fa-fw me-2"></i>View</a></li>
											<c:if test="${accApp.getStatus() != 'approved'}">
												<li><a href="" class="dropdown-item" style="cursor: pointer;"><i class="fa-solid fa-thumbs-up fa-fw me-2"></i>Approve</a></li>
											</c:if>
											<c:if test="${accApp.getStatus() != 'rejected'}">
												<li><a href="" class="dropdown-item" style="cursor: pointer;"><i class="fa-solid fa-thumbs-down fa-fw me-2"></i>Reject</a></li>
											</c:if>
											<li><a href="" class="dropdown-item" style="cursor: pointer;"><i class="fa-solid fa-circle-exclamation fa-fw me-2"></i>Further Action</a></li>
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
		$('#cardAppTable').DataTable();
	});

	/* Message Toast */
	<%if (request.getAttribute("msg") != null) {%>
		let msgToast = document.getElementById("msgToast");
		let msgBsToast = new bootstrap.Toast(msgToast);
		msgBsToast.show();
	<%}%>
		
	/* Script to make tab active based on url params */
	let queryParams = new URLSearchParams(window.location.search);
	let accStatus = queryParams.get("status");
	let filterCardAppForm = document.forms["filterCardApp"];
	if (accStatus != null) {
		filterCardAppForm['status'].value = accStatus;
		let accStatusList = document.getElementById("app-status").children;
		for (var i = 0; i < accStatusList.length; i++) {
			if (accStatusList[i].id.toLowerCase() == accStatus.toLowerCase())
				accStatusList[i].className += " active";
			else
				accStatusList[i].className = accStatusList[i].className.replace(
						" active", "");
		}
	}
	
	/* Function to append accStatus to search query */
	function showAppStatus(status) {
		let filterCardAppForm = document.forms["filterCardApp"];
		if (status != "all") {
			filterCardAppForm['status'].value = status;
		} else {
			filterCardAppForm['status'].disabled = true;
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
		let form = document.forms["filterCardApp"];
		validateForm(form);
		form.submit();
	}
</script>