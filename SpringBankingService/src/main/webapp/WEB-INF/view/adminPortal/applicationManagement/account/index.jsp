<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto my-auto">
			<h3>Manage Account Applications</h3>
		</div>
	</div>
	<form name="filterAccApp" method="get" action="<c:url value="/admin/application-management/account" />" onsubmit="validateForm(this)">
		<input type="hidden" name="status" />
		<div class="card card-shadow my-4">
			<div class="card-body p-4">
				<h4 class="mb-4">Account Application List</h4>
				<div class="row justify-content-between align-items-center g-3 mt-2 mb-5">
					<div class="col-auto">
						<!-- Application Status Tabs -->
						<nav id="app-status" class="nav nav-pills nav-tab-category fw-bold">
							<a id="All" class="nav-link px-3 py-2 me-4 active" href="javascript:showAppStatus('All');">All</a>
							<a id="Pending" class="nav-link px-3 py-2 me-4" href="javascript:showAppStatus('Pending');">Pending</a>
							<a id="Approved" class="nav-link px-3 py-2 me-4" href="javascript:showAppStatus('Approved');">Approved</a>
							<a id="Rejected" class="nav-link px-3 py-2 me-4" href="javascript:showAppStatus('Rejected');">Rejected</a>
							<a id="Further Action" class="nav-link px-3 py-2" href="javascript:showAppStatus('Further Action');">Further Action</a>
						</nav>
					</div>
				</div>
				<!-- Account Application List -->
				<table id="accAppTable" class="table table-hover" style="width: 100%">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Identity Number</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Account</th>
							<th scope="col">Application Date</th>
							<th scope="col">Status</th>
							<th scope="col" style="width: 10%;"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="accApp" items="${accAppList}">
							<fmt:parseDate value="${accApp.applyDate}" var="applyDate" type="both" pattern="yyyy-MM-dd'T'HH:mm" />
							<c:choose>
								<c:when test="${fn:toLowerCase(accApp.status) == 'approved'}">
									<c:set var="status" value="success" />
								</c:when>
								<c:when test="${fn:toLowerCase(accApp.status) == 'rejected'}">
									<c:set var="status" value="danger" />
								</c:when>
								<c:when test="${fn:toLowerCase(accApp.status) == 'further action'}">
									<c:set var="status" value="warning" />
								</c:when>
								<c:otherwise>
									<c:set var="status" value="secondary" />
								</c:otherwise>
							</c:choose>
							<tr>
								<th scope="row"><c:out value="${accApp.id}" /></th>
								<td><c:out value="${accApp.identityNumber}" /></td>
								<td><c:out value="${accApp.name}" /></td>
								<td><c:out value="${accApp.email}" /></td>
								<td><c:out value="${accApp.account.title}" /></td>
								<td><fmt:formatDate type="both" pattern="dd-MMM-yyyy HH:mm" value="${applyDate}" /></td>
								<td><span class="badge text-bg-${status} text-white text-capitalize w-100"><c:out value="${accApp.status}" /></span></td>
								<td>
									<div class="row g-3">
										<div class="col-12">
											<a href="<c:url value="/admin/application-management/account/${accApp.id}" />"
												class="btn btn-outline-secondary"><i class="fa-solid fa-eye fa-fw me-2"></i>View</a>
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
<jsp:include page="approveModal.jsp" />
<jsp:include page="rejectModal.jsp" />
<jsp:include page="furtherActionModal.jsp" />
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
	<c:remove var="msg"/>
</c:if>
<script>
	$(document).ready(function() {
		$('#accAppTable').DataTable({
			order: [[5, 'desc']]
		});
	});
	
	/* Script to make tab active based on url params */
	let queryParams = new URLSearchParams(window.location.search);
	let accStatus = queryParams.get("status");
	let filterAccAppForm = document.forms["filterAccApp"];
	if (accStatus != null) {
		filterAccAppForm['status'].value = accStatus;
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
		let filterAccAppForm = document.forms["filterAccApp"];
		if (status != "All") {
			filterAccAppForm['status'].value = status;
		} else {
			filterAccAppForm['status'].disabled = true;
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
		let form = document.forms["filterAccApp"];
		validateForm(form);
		form.submit();
	}
</script>