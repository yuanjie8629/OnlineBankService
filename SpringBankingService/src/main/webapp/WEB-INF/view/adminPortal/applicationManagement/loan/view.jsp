<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:choose>
	<c:when test="${fn:toLowerCase(loanApp.status) == 'approved'}">
		<c:set var="status" value="success" />
	</c:when>
	<c:when test="${fn:toLowerCase(loanApp.status) == 'rejected'}">
		<c:set var="status" value="danger" />
	</c:when>
	<c:when test="${fn:toLowerCase(loanApp.status) == 'further action'}">
		<c:set var="status" value="warning" />
	</c:when>
	<c:otherwise>
		<c:set var="status" value="secondary" />
	</c:otherwise>
</c:choose>
<fmt:parseDate value="${loanApp.lastUpdate}" var="lastUpdate" type="both" pattern="yyyy-MM-dd'T'HH:mm" />
<fmt:parseDate value="${accApp.applyDate}" var="applyDate" type="both" pattern="yyyy-MM-dd'T'HH:mm" />
<div class="container w-75 p-2">
	<div class="row justify-content-between">
		<div class="col-auto">
			<h3 class="mt-3">View Loan Application</h3>
		</div>
		<div class="col-auto">
			<div class="row justify-content-end align-items-center mb-2">
				<div class="col-auto">
					Application Date:
					<fmt:formatDate type="both" pattern="dd-MMM-yyyy HH:mm" value="${applyDate}" />
				</div>
				<div class="col-auto">
					Last Update:
					<fmt:formatDate type="both" pattern="dd-MMM-yyyy HH:mm" value="${lastUpdate}" />
				</div>
			</div>
			<div class="row justify-content-end align-items-center mb-2">
				<div class="col-auto">
					Status: <span class="badge text-bg-${status} text-white text-capitalize"> <c:out value="${loanApp.status}" />
					</span>
				</div>
				<c:if test="${not empty loanApp.comments}">
					<div class="col-auto">
						<button id="commentsPopover" class="badge border-0 text-bg-secondary" data-bs-toggle="popover"
							data-bs-content="${loanApp.comments}">Click to view comments</button>
					</div>
				</c:if>
			</div>
			<c:if test="${fn:toLowerCase(loanApp.status) != 'approved' and fn:toLowerCase(loanApp.status) != 'rejected'}">
				<div class="row g-3 justify-content-end">
					<div class="col-auto">
						<button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#approveModal">
							<i class="fa-solid fa-thumbs-up fa-fw me-2"></i>Approve
						</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#rejectModal">
							<i class="fa-solid fa-thumbs-down fa-fw me-2"></i>Reject
						</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-warning text-white" data-bs-toggle="modal" data-bs-target="#furtherActionModal">
							<i class="fa-solid fa-circle-exclamation fa-fw me-2"></i>Further Action
						</button>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<div class="bs-stepper py-3">
		<div class="bs-stepper-header m-auto mb-3" role="tablist">
			<!-- Steps -->
			<div class="step" data-target="#selectedLoan">
				<button type="button" class="step-trigger" role="tab" aria-controls="selectedLoan" id="selectedLoanTrigger">
					<span class="bs-stepper-circle">1</span><span class="bs-stepper-label">Selected Loan</span>
				</button>
			</div>
			<div class="line"></div>
			<div class="step" data-target="#applicantInfo">
				<button type="button" class="step-trigger" role="tab" aria-controls="applicantInfo" id="applicantInfoTrigger">
					<span class="bs-stepper-circle">2</span><span class="bs-stepper-label">Applicant Information</span>
				</button>
			</div>
			<div class="line"></div>
			<div class="step" data-target="#address">
				<button type="button" class="step-trigger" role="tab" aria-controls="address" id="addressTrigger">
					<span class="bs-stepper-circle">3</span><span class="bs-stepper-label">Residential Details</span>
				</button>
			</div>
			<div class="line"></div>
			<div class="step" data-target="#loanDetails">
				<button type="button" class="step-trigger" role="tab" aria-controls="address" id="loanDetailsTrigger">
					<span class="bs-stepper-circle">4</span><span class="bs-stepper-label">Loan Details</span>
				</button>
			</div>
			<div class="line"></div>
			<div class="step" data-target="#uploadDocs">
				<button type="button" class="step-trigger" role="tab" aria-controls="uploadDocs" id="uploadDocsTrigger">
					<span class="bs-stepper-circle">5</span><span class="bs-stepper-label">Uploaded Documents</span>
				</button>
			</div>
		</div>
		<div class="bs-stepper-content p-0">
			<form:form name="viewLoanApp" modelAttribute="loanApp">
				<div class="card card-shadow">
					<div class="card-body p-4">
						<!-- Contents -->
							<div id="selectedLoan" class="content" role="tabpanel" aria-labelledby="selectedLoanTrigger">
							<h4 class="mb-4">Selected Loan</h4>
							<div class="row g-4 justify-content-center">
								<div class="col-6 col-xl-4">
									<div class="card card-hover h-100">
										<div class="card-thumbnail-img">
											<img src="data:image/png;base64,${loanApp.loan.getBase64Thumbnail()}" class="card-img-top img-fluid"
												alt="${loanApp.loan.title}">
										</div>
										<div class="card-body pb-0">
											<h5 class="card-title">
												<c:out value="${loanApp.loan.title}" />
											</h5>
											<p class="card-text text-justify">
												<c:out value="${loanApp.loan.description}" />
											</p>
											<table class="table text-justify">
												<tr>
													<td>Interest Rate</td>
													<td><span> <fmt:formatNumber value="${loanApp.loan.interestRate}" type="percent" minFractionDigits="2" />
													</span> p.a.</td>
												</tr>
												<tr>
													<td>Down Payment</td>
													<td><span> <fmt:formatNumber value="${loanApp.loan.downpayment}" type="percent" minFractionDigits="2" />
													</span> from total</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
								<div class="col-12">
									<div class="row justify-content-end">
										<div class="col-auto">
											<button type="button" class="btn btn-danger float-end px-4 py-2" onclick="stepper.next()">Next</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="applicantInfo" class="content" role="tabpanel" aria-labelledby="applicantInfoTrigger">
							<h4 class="mb-4">Applicant Information</h4>
							<div class="row g-4">
								<div class="form-group col-12">
									<label class="form-label" for="username">NRIC/Passport Number</label>
									<form:input class="form-control" path="identityNumber" readonly="true" />
								</div>
								<div class="form-group col-5 col-md-2">
									<label class="form-label" for="salutation">Salutation</label>
									<form:input class="form-control" path="salutation" readonly="true" />
								</div>
								<div class="col-7 col-md-5">
									<label class="form-label" for="name">Name</label>
									<form:input class="form-control" path="name" readonly="true" />
								</div>
								<div class="col-12 col-md-5">
									<label class="form-label" for="email">Email</label>
									<form:input class="form-control" path="email" readonly="true" />
								</div>
								<div class="col-12 col-md-6">
									<label class="form-label" for="contactNo">Contact Number</label>
									<form:input class="form-control" path="contactNo" readonly="true" />
								</div>
								<div class="col-12 col-md-6">
									<label class="form-label" for="nationality">Nationality</label>
									<form:input class="form-control text-capitalize" path="nationality" readonly="true" />
								</div>
								<div class="col-12 col-md-6">
									<label class="form-label" for="gender">Gender</label><br> <input class="form-control text-capitalize"
										value="${loanApp.gender.toString() == 'm' ? 'Male' : 'Female'}" readonly />
								</div>
								<div class="col-12 col-md-6">
									<label class="form-label" for="maritalStatus">Marital Status</label>
									<form:input class="form-control text-capitalize" path="maritalStatus" readonly="true" />
								</div>
								<div class="col-12 col-md-6">
									<label class="form-label" for="birthdate">Date of Birth</label>
									<form:input class="form-control date" type="date" path="birthdate" readonly="true" />
								</div>
								<div class="col-12 col-md-6">
									<label class="form-label" for="race">Race</label>
									<form:input class="form-control text-capitalize" path="race" readonly="true" />
								</div>
								<div class="col-12 col-md-6">
									<label class="form-label" for="industry">Industry</label>
									<form:input class="form-control text-capitalize" path="industry" readonly="true" />
								</div>
								<div class="col-12 col-md-6">
									<label class="form-label" for="occupation">Occupation</label>
									<form:input class="form-control text-capitalize" path="occupation" readonly="true" />
								</div>
								<div class="col-12">
									<button type="button" class="btn btn-danger btn-next-form float-end px-4 py-2" onclick="stepper.next()">Next</button>
								</div>
							</div>
						</div>
						<div id="address" class="content" role="tabpanel" aria-labelledby="addressTrigger">
							<h4 class="mb-4">Residential Details</h4>
							<div class="row g-4">
								<div class="col-12">
									<label class="form-label" for="addressLine1">Address Line 1</label>
									<form:input class="form-control" path="addressLine1" readonly="true" />
								</div>
								<div class="col-12">
									<label class="form-label" for="addressLine2">Address Line 2</label>
									<form:input class="form-control" path="addressLine2" readonly="true" />
								</div>
								<div class="col-12">
									<label class="form-label" for="addressLine3">Address Line 3</label>
									<form:input class="form-control" path="addressLine3" readonly="true" />
								</div>
								<div class="col-12 col-md-6">
									<label class="form-label" for="postalcode">Postal Code</label>
									<form:input class="form-control" path="postalCode" readonly="true" />
								</div>
								<div class="col-12 col-md-6">
									<label class="form-label" for="country">Country</label>
									<form:input class="form-control text-capitalize" path="country" readonly="true" />
								</div>
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
								<div class="col-12 col-lg-6">
									<label class="form-label" for="income">Monthly Income</label>
									<div class="input-group">
										<form:input class="form-control" path="income" readonly="true"/>
										<span class="input-group-text">SGD</span>
									</div>
								</div>
								<div class="col-12 col-lg-6">
									<label class="form-label" for="loanAmount">Desired Loan Amount</label>
									<div class="input-group">
										<form:input class="form-control" path="loanAmount" readonly="true" />
										<span class="input-group-text">SGD</span>
									</div>
									<div class="invalid-feedback">
										<form:errors path="loanAmount" />
									</div>
								</div>
								<div class="col-12 col-lg-6">
									<label class="form-label" for="repaymentPeriod">Repayment Period</label>
									<form:input class="form-control" path="repaymentPeriod" readonly="true"/>
								</div>
								<div class="col-12 col-lg-6">
									<label class="form-label" for="disbursementBank">Disbursement Bank</label>
									<form:input class="form-control" path="disbursementBank" readonly="true"/>
								</div>
								<div class="col-12 col-lg-6">
									<label class="form-label" for="disbursementAccType">Disbursement Bank</label>
									<input class="form-control text-capitalize" name="disbursementAccType" value="${loanApp.disbursementAccType} Account" readonly/>
								</div>
								<div class="col-12 col-lg-6">
									<label class="form-label" for="disbursementAccNum">Disbursement Account Number</label>
									<form:input class="form-control" path="disbursementAccNum" readonly="true" />
								</div>
								<div class="col-12">
									<label class="form-label" for="totalInstallment">Financial commitments</label>
									<c:choose>
										<c:when test="${not empty loanApp.totalInstallment}">
											<div id="totalInstallmentInput" class="input-group">
												<form:input class="form-control" type="number" path="totalInstallment" readonly="true" />
												<span class="input-group-text">SGD</span>
											</div>
										</c:when>
										<c:otherwise>
											<input class="form-control" value="None" readonly />
										</c:otherwise>
									</c:choose>
								</div>
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
							<h4 class="mb-4">Uploaded Documents</h4>
							<div class="row g-4">
								<div class="col-12">
									<label class="form-label" for="identityDoc">Identity Card / Passport</label> <a
										class="form-control border-0 p-0 text-primary" href="${loanApp.id}/identity-doc" target="_blank">Download</a>
								</div>
								<div class="col-12">
									<label class="form-label" for="payslipDoc">Payslip</label> <a class="form-control border-0 p-0 text-primary"
										href="${loanApp.id}/payslip-doc" target="_blank">Download</a>
								</div>
								<c:if test="${not empty supportDoc}">
									<div class="col-12">
										<label class="form-label" for="supportDoc">Supporting Document</label> <a class="form-control border-0 p-0 text-primary"
											href="${loanApp.id}/support-doc" target="_blank">Download</a>
									</div>
								</c:if>
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
					</div>
				</div>
			</form:form>
		</div>
	</div>
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
<c:if test="${fn:toLowerCase(loanApp.status) == 'rejected' or fn:toLowerCase(loanApp.status) == 'further action'}">
	<script>
		/* Popover */
		let popover = new bootstrap.Popover('#commentsPopover', {
			trigger : 'focus'
		})
	</script>
</c:if>
<c:if test="${not empty msg}">
	<script>
		// Message Toast
		let msgToast = document.getElementById("msgToast");
		let msgBsToast = new bootstrap.Toast(msgToast);
		msgBsToast.show();
	</script>
	<c:remove var="msg"/>
</c:if>
<c:if test="${not empty approveErr}">
	<script>
		// Approve Modal
		let approveModal = new bootstrap.Modal('#approveModal');
		approveModal.show();
	</script>
	<c:remove var="approveErr"/>
</c:if>
<script>
	// Script to initialize the stepper
	var stepper;
	document.addEventListener('DOMContentLoaded', function() {
		stepper = new Stepper(document.querySelector('.bs-stepper'), {
			linear : false
		})
	})
</script>