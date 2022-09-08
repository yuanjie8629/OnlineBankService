<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container w-75 p-2">
	<h3 class="mt-3">Account Application</h3>
	<div class="bs-stepper py-3">
		<div class="bs-stepper-header w-75 m-auto mb-3" role="tablist">
			<!-- Steps -->
			<div class="step" data-target="#basicInfo">
				<button type="button" class="step-trigger" role="tab" aria-controls="basicInfo" id="basicInfoTrigger">
					<span class="bs-stepper-circle">1</span><span class="bs-stepper-label">Basic Information</span>
				</button>
			</div>
			<div class="line"></div>
			<div class="step" data-target="#address">
				<button type="button" class="step-trigger" role="tab" aria-controls="address" id="addressTrigger">
					<span class="bs-stepper-circle">2</span><span class="bs-stepper-label">Residential Details</span>
				</button>
			</div>
			<div class="line"></div>
			<div class="step" data-target="#uploadDocs">
				<button type="button" class="step-trigger" role="tab" aria-controls="uploadDocs" id="uploadDocsTrigger">
					<span class="bs-stepper-circle">3</span><span class="bs-stepper-label">Upload Documents</span>
				</button>
			</div>
			<div class="line"></div>
			<div class="step" data-target="#submit">
				<button type="button" class="step-trigger" role="tab" aria-controls="uploadDocs" id="submitTrigger">
					<span class="bs-stepper-circle">4</span><span class="bs-stepper-label">Submit</span>
				</button>
			</div>
		</div>
		<div class="bs-stepper-content p-0">
			<form:form name="applyAccount" modelAttribute="application" action="" method="post" enctype="multipart/form-data">
				<div class="card card-shadow">
					<div class="card-body p-4">
						<!-- Contents -->
						<div id="basicInfo" class="content" role="tabpanel" aria-labelledby="basicInfoTrigger">
							<h4 class="mb-4">Basic Information</h4>
							<div class="row g-4">
								<spring:bind path="identityNumber">
									<div class="form-group col-12">
										<label class="form-label" for="username">NRIC/Passport Number</label>
										<form:input class="form-control ${status.error ? 'is-invalid' : ''}" path="identityNumber" />
										<div class="invalid-feedback">
											<form:errors path="identityNumber" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="salutation">
									<div class="form-group col-5 col-md-2">
										<label class="form-label" for="salutation">Salutation</label>
										<form:select class="form-select ${status.error ? 'is-invalid' : ''}" path="salutation">
											<option value="Mr">Dr.</option>
											<option value="Mr.">Mr.</option>
											<option value="Mrs.">Mrs.</option>
											<option value="Ms.">Ms.</option>
											<option value="Madam.">Madam.</option>
										</form:select>
										<div class="invalid-feedback">
											<form:errors path="salutation" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="name">
									<div class="col-7 col-md-5">
										<label class="form-label" for="name">Name</label>
										<form:input class="form-control ${status.error ? 'is-invalid' : ''}" path="name" />
										<div class="invalid-feedback">
											<form:errors path="name" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="email">
									<div class="col-12 col-md-5">
										<label class="form-label" for="email">Email</label>
										<form:input class="form-control ${status.error ? 'is-invalid' : ''}" path="email" />
										<div class="invalid-feedback">
											<form:errors path="email" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="contactNo">
									<div class="col-12 col-md-6">
										<label class="form-label" for="contactNum">Contact Number</label>
										<form:input class="form-control ${status.error ? 'is-invalid' : ''}" path="contactNo" />
										<div class="invalid-feedback">
											<form:errors path="contactNo" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="nationality">
									<div class="col-12 col-md-6">
										<label class="form-label" for="nationality">Nationality</label>
										<form:select class="form-select ${status.error ? 'is-invalid' : ''}" path="nationality">
											<jsp:include page="../../selection/nationalitySelection.jsp" />
										</form:select>
										<div class="invalid-feedback">
											<form:errors path="nationality" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="gender">
									<div class="col-12 col-md-6">
										<label class="form-label" for="gender">Gender</label>
										<form:select class="form-select ${status.error ? 'is-invalid' : ''}" path="gender">
											<option value="m">Male</option>
											<option value="f">Female</option>
										</form:select>
										<div class="invalid-feedback">
											<form:errors path="gender" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="maritalStatus">
									<div class="col-12 col-md-6">
										<label class="form-label" for="maritalStatus">Marital Status</label>
										<form:select class="form-select ${status.error ? 'is-invalid' : ''}" path="maritalStatus">
											<jsp:include page="../../selection/maritalStatusSelection.jsp" />
										</form:select>
										<div class="invalid-feedback">
											<form:errors path="maritalStatus" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="birthdate">
									<div class="col-12 col-md-6">
										<label class="form-label" for="birthdate">Date of Birth</label>
										<form:input class="form-control date ${status.error ? 'is-invalid' : ''}" type="date" path="birthdate" />
										<div class="invalid-feedback">
											<form:errors path="birthdate" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="race">
									<div class="col-12 col-md-6">
										<label class="form-label" for="race">Race</label>
										<form:select class="form-select ${status.error ? 'is-invalid' : ''}" path="race">
											<jsp:include page="../../selection/raceSelection.jsp" />
										</form:select>
										<div class="invalid-feedback">
											<form:errors path="race" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="industry">
									<div class="col-12 col-md-6">
										<label class="form-label" for="industry">Industry</label>
										<form:select class="form-select ${status.error ? 'is-invalid' : ''}" path="industry">
											<jsp:include page="../../selection/industrySelection.jsp" />
										</form:select>
										<div class="invalid-feedback">
											<form:errors path="industry" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="occupation">
									<div class="col-12 col-md-6">
										<label class="form-label" for="occupation">Occupation</label>
										<form:input class="form-control ${status.error ? 'is-invalid' : ''}" path="occupation" />
										<div class="invalid-feedback">
											<form:errors path="occupation" />
										</div>
									</div>
								</spring:bind>
								<div class="col-12">
									<button type="button" class="btn btn-danger btn-next-form float-end px-4 py-2" onclick="stepper.next()">Next</button>
								</div>
							</div>
						</div>
						<div id="address" class="content" role="tabpanel" aria-labelledby="addressTrigger">
							<h4 class="mb-4">Residential Details</h4>
							<div class="row g-4">
								<spring:bind path="addressLine1">
									<div class="col-12">
										<label class="form-label" for="addressLine1">Address Line 1</label>
										<form:input class="form-control ${status.error ? 'is-invalid' : ''}" path="addressLine1" />
										<div class="invalid-feedback">
											<form:errors path="addressLine1" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="addressLine2">
									<div class="col-12">
										<label class="form-label" for="addressLine2">Address Line 2</label>
										<form:input class="form-control ${status.error ? 'is-invalid' : ''}" path="addressLine2" />
										<div class="invalid-feedback">
											<form:errors path="addressLine2" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="addressLine3">
									<div class="col-12">
										<label class="form-label" for="addressLine3">Address Line 3</label>
										<form:input class="form-control ${status.error ? 'is-invalid' : ''}" path="addressLine3" />
										<div class="invalid-feedback">
											<form:errors path="addressLine3" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="postalCode">
									<div class="col-12 col-md-6">
										<label class="form-label" for="postalcode">Postal Code</label>
										<form:input class="form-control ${status.error ? 'is-invalid' : ''}" path="postalCode" />
										<div class="invalid-feedback">
											<form:errors path="postalCode" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="country">
									<div class="col-12 col-md-6">
										<label class="form-label" for="country">Country</label>
										<form:select class="form-select ${status.error ? 'is-invalid' : ''}" path="country">
											<jsp:include page="../../selection/countrySelection.jsp" />
										</form:select>
										<div class="invalid-feedback">
											<form:errors path="country" />
										</div>
									</div>
								</spring:bind>
								<div class="col-12">
									<div class="row justify-content-end">
										<div class="col-auto">
											<button type="button" class="btn btn-danger float-end px-4 py-2" onclick="stepper.previous()">Previous</button>
										</div>
										<div class="col-auto">
											<button type="button" class="btn btn-danger float-end px-4 py-2" onclick="stepper.next()">Next</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="uploadDocs" class="content" role="tabpanel" aria-labelledby="uploadDocsTrigger">
							<h4 class="mb-4">Upload Documents</h4>
							<div class="row g-4">
								<spring:bind path="identityDoc">
									<div class="col-12">
										<label class="form-label" for="identityDoc">Please upload your Identity Card / Passport (Front and
											Back) in pdf format</label>
										<form:input class="form-control ${status.error ? 'is-invalid' : ''}" type="file" path="identityDoc"
											accept="application/pdf" onchange="getIdentityDocLink(this)" />
										<a id="identityDocLink" target="_blank"></a>
										<div class="invalid-feedback">
											<form:errors path="identityDoc" />
										</div>
									</div>
								</spring:bind>
								<div class="col-12">
									<div class="row justify-content-end">
										<div class="col-auto">
											<button type="button" class="btn btn-danger float-end px-4 py-2" onclick="stepper.previous()">Previous</button>
										</div>
										<div class="col-auto">
											<button type="button" class="btn btn-danger float-end px-4 py-2" onclick="stepper.next()">Next</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="submit" class="content" role="tabpanel" aria-labelledby="submitTrigger">
							<h4 class="mb-4">Preview</h4>
							<div class="row g-4 justify-content-center">
								<span class="fs-6">Please confirm if you are applying the following account:</span>
								<div class="col-6 col-xl-4">
									<div class="card card-hover h-100">
										<div class="card-thumbnail-img">
											<img src="data:image/png;base64,${account.getBase64Thumbnail()}" alt="${account.getTitle()}"
												class="card-img-top img-fluid">
										</div>
										<div class="card-body pb-0">
											<h5 class="card-title">
												<c:out value="${account.getTitle()}" />
											</h5>
											<p class="card-text text-justify">
												<c:out value="${account.getDescription()}" />
											</p>
											<table class=" table text-justify">
												<tr>
													<td>Interest Rate</td>
													<td><fmt:formatNumber value="${account.getInterestRate()}" type="percent" minFractionDigits="2" />
														p.a.</td>
												</tr>
												<tr>
													<td>Min Deposit Amount</td>
													<td><fmt:formatNumber value="${account.getMinAmount()}" type="currency" currencyCode="SGD" /></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
								<div class="col-12">
									<div class="row justify-content-end">
										<div class="col-auto">
											<button type="button" class="btn btn-danger float-end px-4 py-2" onclick="stepper.previous()">Previous</button>
										</div>
										<div class="col-auto">
											<button type="submit" class="btn btn-danger float-end px-4 py-2">Submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form:form>
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
<script>
	/* Message Toast */
	<%if (request.getAttribute("msg") != null) {%>
		let msgToast = document.getElementById("msgToast");
		let msgBsToast = new bootstrap.Toast(msgToast);
		msgBsToast.show();
	<%}%>
	// Script to initialize the stepper
	var stepper;
	document.addEventListener('DOMContentLoaded', function() {
		stepper = new Stepper(document.querySelector('.bs-stepper'), {
			linear : false
		})
	})

	// Script to display link for uploaded identity doc
	function getIdentityDocLink(fileInput) {
		let file = fileInput.files[0];
		let objectURL = URL.createObjectURL(file);
		let identityDocLink = document.getElementById("identityDocLink");
		identityDocLink.href = objectURL;
		identityDocLink.innerHTML = file.name;
	}
</script>