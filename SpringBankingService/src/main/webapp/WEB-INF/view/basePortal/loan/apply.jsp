<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container w-75 p-2">
	<h3 class="mt-3">Loan Application</h3>
	<div class="bs-stepper py-3">
		<div class="bs-stepper-header m-auto mb-3" role="tablist">
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
			<div class="step" data-target="#loanDetails">
				<button type="button" class="step-trigger" role="tab" aria-controls="address" id="loanDetailsTrigger">
					<span class="bs-stepper-circle">3</span><span class="bs-stepper-label">Loan Details</span>
				</button>
			</div>
			<div class="line"></div>
			<div class="step" data-target="#uploadDocs">
				<button type="button" class="step-trigger" role="tab" aria-controls="uploadDocs" id="uploadDocsTrigger">
					<span class="bs-stepper-circle">4</span><span class="bs-stepper-label">Upload Documents</span>
				</button>
			</div>
			<div class="line"></div>
			<div class="step" data-target="#submit">
				<button type="button" class="step-trigger" role="tab" aria-controls="uploadDocs" id="submitTrigger">
					<span class="bs-stepper-circle">5</span><span class="bs-stepper-label">Submit</span>
				</button>
			</div>
		</div>
		<div class="bs-stepper-content p-0">
			<form:form name="applyLoan" modelAttribute="application" action="" method="post" enctype="multipart/form-data">
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
										<label class="form-label" for="gender">Gender</label><br>
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
										<label class="form-label" for="maritalStatus">Marital Status</label><br>
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
										<label class="form-label" for="race">Race</label><br>
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
						<div id="loanDetails" class="content" role="tabpanel" aria-labelledby="loanDetailsTrigger">
							<h4 class="mb-4">Loan Details</h4>
							<div class="row g-4">
								<spring:bind path="income">
									<div class="col-12 col-lg-6">
										<label class="form-label" for="income">Monthly Income</label>
										<div class="input-group">
											<form:input class="form-control ${status.error ? 'is-invalid' : ''}" path="income" type="number" min="0"
												step="0.01" placeholder="Enter your monthly income" />
											<span class="input-group-text">SGD</span>
										</div>
										<div class="invalid-feedback">
											<form:errors path="income" />
										</div>
									</div>
								</spring:bind>
								
								<spring:bind path="loanAmount">
									<div class="col-12 col-lg-6">
										<label class="form-label" for="loanAmount">Desired Loan Amount</label>
										<div class="input-group">
											<form:input class="form-control ${status.error ? 'is-invalid' : ''}" path="loanAmount" type="number" min="0"
												step="0.01" placeholder="Enter your desired loan amount" />
											<span class="input-group-text">SGD</span>
										</div>
										<div class="invalid-feedback">
											<form:errors path="loanAmount" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="repaymentPeriod">
									<div class="col-12 col-lg-6">
										<label class="form-label" for="repaymentPeriod">Repayment Period</label>
										<form:select class="form-select ${status.error ? 'is-invalid' : ''}" path="repaymentPeriod">
											<option value="24">24 months</option>
											<option value="36">36 months</option>
											<option value="48">48 months</option>
											<option value="60">60 months</option>
										</form:select>
										<div class="invalid-feedback">
											<form:errors path="repaymentPeriod" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="disbursementBank">
									<div class="col-12 col-lg-6">
										<label class="form-label" for="disbursementBank">Disbursement Bank</label>
										<form:select class="form-select ${status.error ? 'is-invalid' : ''}" path="disbursementBank">
											<option value="DBS">DBS</option>
											<option value="UOB">UOB</option>
											<option value="OCBC">OCBC</option>
											<option value="HSBC">HSBC</option>
											<option value="Citybank">Citybank</option>
											<option value="Maybank">Maybank</option>
											<option value="Standard Chartered">Standard Chartered</option>
											<option value="CIMB">CIMB</option>
										</form:select>
										<div class="invalid-feedback">
											<form:errors path="disbursementBank" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="disbursementAccType">
									<div class="col-12 col-lg-6">
										<label class="form-label" for="disbursementAccType">Disbursement Bank</label>
										<form:select class="form-select ${status.error ? 'is-invalid' : ''}" path="disbursementAccType">
											<option value="saving">Saving Account</option>
											<option value="current">Current Account</option>
										</form:select>
										<div class="invalid-feedback">
											<form:errors path="disbursementAccType" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="disbursementAccNum">
									<div class="col-12 col-lg-6">
										<label class="form-label" for="disbursementAccNum">Disbursement Account Number</label>
										<form:input class="form-control ${status.error ? 'is-invalid' : ''}" path="disbursementAccNum" />
										<div class="invalid-feedback">
											<form:errors path="disbursementAccNum" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="totalInstallment">
									<div class="col-12">
										<div class="row mb-2">
											<div class="col-auto">
												<label class="form-check-label" for="totalInstallment">Do you have any financial commitments (e.g.
													private money lenders)?</label>
											</div>
											<div class="col-auto">
												<div class="form-check">
													<input class="form-check-input" type="checkbox" name="totalInstallmentTrigger"
														onchange="triggerTotalInstallment(this)"> <label class="form-check-label"
														for="totalInstallmentTrigger">Yes</label>
												</div>
											</div>
										</div>
										<div id="totalInstallmentInput" class="input-group d-none">
											<form:input class="form-control ${status.error ? 'is-invalid' : ''}" path="totalInstallment" type="number"
												min="0" step="0.01" placeholder="Enter your preffered credit limit" />
											<span class="input-group-text">SGD</span>
										</div>
										<div class="invalid-feedback">
											<form:errors path="totalInstallment" />
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
								<spring:bind path="payslipDoc">
									<div class="col-12">
										<label class="form-label" for="payslipDoc">Please upload your latest payslip within 3 months (in pdf format)</label>
										<form:input class="form-control ${status.error ? 'is-invalid' : ''}" type="file" path="payslipDoc" accept="application/pdf" onchange="getPayslipDocLink(this)" />
										<a id="payslipDocLink" target="_blank"></a>
										<div class="invalid-feedback">
											<form:errors path="payslipDoc" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="supportDoc">
									<div class="col-12">
										<label class="form-label" for="supportDoc">Please upload any other support documents (in pdf format)</label>
										<form:input class="form-control ${status.error ? 'is-invalid' : ''}" type="file" path="supportDoc"
											accept="application/pdf" onchange="getSupportDocLink(this)" />
										<a id="supportDocLink" target="_blank"></a>
										<div class="invalid-feedback">
											<form:errors path="supportDoc" />
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
								<span class="fs-6">Please confirm if you are applying the following Loan:</span>
								<div class="col-6 col-xl-4">
									<div class="card card-hover h-100">
										<div class="card-thumbnail-img">
											<img src="data:image/png;base64,${loan.getBase64Thumbnail()}" class="card-img-top img-fluid"
												alt="${loan.getTitle()}">
										</div>
										<div class="card-body pb-0">
											<h5 class="card-title">
												<c:out value="${loan.getTitle()}" />
											</h5>
											<p class="card-text text-justify">
												<c:out value="${loan.getDescription()}" />
											</p>
											<table class="table text-justify">
												<tr>
													<td>Interest Rate</td>
													<td><span> <fmt:formatNumber value="${loan.getInterestRate()}" type="percent"
																minFractionDigits="2" />
													</span> p.a.</td>
												</tr>
												<tr>
													<td>Down Payment</td>
													<td><span> <fmt:formatNumber value="${loan.getDownpayment()}" type="percent"
																minFractionDigits="2" />
													</span> from total</td>
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

	// Script to trigger total installment input
	function triggerTotalInstallment(checkbox) {
		let totalInstallmentInput = document
				.getElementById("totalInstallmentInput");
		if (checkbox.checked) {
			totalInstallmentInput.classList.remove("d-none");
		} else {
			totalInstallmentInput.classList.add("d-none")
		}
	}

	// Script to display link for uploaded identity doc
	function getIdentityDocLink(fileInput) {
		let file = fileInput.files[0];
		let objectURL = URL.createObjectURL(file);
		let identityDocLink = document.getElementById("identityDocLink");
		identityDocLink.href = objectURL;
		identityDocLink.innerHTML = file.name;
	}

	// Script to display link for uploaded payslip doc
	function getPayslipDocLink(fileInput) {
		let file = fileInput.files[0];
		let objectURL = URL.createObjectURL(file);
		let payslipDocLink = document.getElementById("payslipDocLink");
		payslipDocLink.href = objectURL;
		payslipDocLink.innerHTML = file.name;
	}
	
	// Script to display link for uploaded support doc
	function getSupportDocLink(fileInput) {
		let file = fileInput.files[0];
		let objectURL = URL.createObjectURL(file);
		let supportDocLink = document.getElementById("supportDocLink");
		supportDocLink.href = objectURL;
		supportDocLink.innerHTML = file.name;
	}
</script>