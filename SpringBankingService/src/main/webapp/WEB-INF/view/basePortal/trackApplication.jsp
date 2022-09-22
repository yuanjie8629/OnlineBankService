<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<div class="container my-5">
	<div class="row card-shadow">
		<div class="col-md-6 p-5">
			<h3>Check Your Application Status</h3>
			<form class="my-4 needs-validation" name="checkApplication" action="track-application" method="post" novalidate>
				<fieldset class="row mb-3">
					<legend class="col-form-label col-md-4 pt-0">Application Type :</legend>
					<div class="col-md-8">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="type" value="account" required> <label
								class="form-check-label" for="account">Account</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="type" value="creditCard"> <label
								class="form-check-label" for="credit card">Credit Card</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="type" value="loan"> <label class="form-check-label"
								for="loan">Loan</label>
						</div>
						<div>
							<input class="d-none" type="radio" name="type" value="">
							<div class="invalid-feedback">Please select application type.</div>
						</div>
					</div>
				</fieldset>
				<div class="mb-3">
					<label class="form-label" for="id" class="form-label">Reference Number / ID :</label>
					<input class="form-control" name="id" placeholder="Enter the reference number or ID of your application" required>
					<div class="invalid-feedback">Please enter the reference number.</div>
				</div>
				<div class="mb-3">
					<label class="form-label" for="identityNumber" class="form-label">NRIC / Passport Number :</label>
					<input class="form-control" name="identityNumber" placeholder="For example &quot;S1741772Z&quot; or &quot;A56015601&quot;" required>
					<div class="invalid-feedback">Please enter your NRIC or Passport Number.</div>
				</div>
				<div class="mb-3">
					<button type="submit" class="btn btn-danger px-5 py-2">Track</button>
				</div>
			</form>
		</div>
		<div class="col-md-6 p-0 track-app-bg"></div>
	</div>
</div>
<!-- Tracking Result Modal -->
<div class="modal fade" id="trackingModal" tabindex="-1" aria-labelledby="trackingModal" aria-hidden="true">
	<fmt:parseDate value="${application.applyDate}" var="applyDate" type="both" pattern="yyyy-MM-dd'T'HH:mm" />
	<div class="modal-dialog modal-lg modal-dialog-centered modal-confirm">
		<div class="modal-content p-4">
			<div class="d-flex justify-content-end">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-header flex-column">
				<c:choose>
					<c:when test="${fn:toLowerCase(application.status) == 'approved'}">
						<i class="fa-solid fa-circle-check fa-7x text-success"></i>
					</c:when>
					<c:when test="${fn:toLowerCase(application.status) == 'rejected'}">
						<i class="fa-solid fa-circle-xmark fa-7x text-danger"></i>
					</c:when>
					<c:when test="${fn:toLowerCase(application.status) == 'further action'}">
						<i class="fa-solid fa-circle-exclamation fa-7x text-warning"></i>
					</c:when>
					<c:otherwise>
						<i class="fa-solid fa-clock fa-7x text-secondary"></i>
					</c:otherwise>
				</c:choose>
				<i class="fa-solid fa-7x text-danger"></i>
				<h3 class="mt-4 text-capitalize">
					<c:choose>
						<c:when test="${fn:toLowerCase(type) == 'creditcard'}">
							Credit Card Application
						</c:when>
						<c:otherwise>
							<c:out value="${type}" />&nbsp;Application
						</c:otherwise>
					</c:choose>
				</h3>
			</div>
			<div class="modal-body w-75 m-auto px-5">
				<table class="table table-fit m-auto">
				<tr>
					<td>Reference Number</td>
					<td>
						<strong>
							<c:out value="${application.id}" />
						</strong>
					</td>
				<tr>
				<tr>
					<td>Application for</td>
					<td>
						<strong>
							<c:out value="${title}" />
						</strong>
					</td>
				</tr>
				<tr>
					<td>Application Date</td>
					<td>
						<strong>
							<fmt:formatDate type="both" pattern="dd-MMM-yyyy HH:mm" value="${applyDate}" />
						</strong>
					</td>
				</tr>
				<tr>
					<td>Status</td>
					<td>
						<strong class="text-capitalize">
							<c:out value="${application.status}" />
						</strong>
					</td>
				</tr>
				<c:if test="${not empty application.comments}">
					<tr>
						<td>Comments</td>
						<td>
							<strong>
								<c:out value="${application.comments}" />
							</strong>
						</td>
					</tr>
				</c:if>
				</table>
			</div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-danger mx-2 px-4 py-2" data-bs-dismiss="modal" onClick="closeModal()">Got it</button>
			</div>
		</div>
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
<c:if test="${not empty application}">
	<script>
		// Success Modal
		let trackingModal = new bootstrap.Modal('#trackingModal');
		trackingModal.show();
	</script>
</c:if>
<script>
(() => {
	  'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  const forms = document.querySelectorAll('.needs-validation')

	  // Loop over them and prevent submission
	  Array.from(forms).forEach(form => {
	    form.addEventListener('submit', event => {
	      if (!form.checkValidity()) {
	        event.preventDefault()
	        event.stopPropagation()
	      }
	      form.classList.add('was-validated')
	    }, false)
	  })
	})()
	
	function closeModal(){
		<c:remove var="application"/>
	}
</script>
