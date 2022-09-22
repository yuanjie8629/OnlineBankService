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
				<button type="button" class="step-trigger" role="tab" aria-controls="submit" id="submitTrigger">
					<span class="bs-stepper-circle">5</span><span class="bs-stepper-label">Submit</span>
				</button>
			</div>
		</div>
		<div class="bs-stepper-content p-0">
			<form:form name="applyLoan" modelAttribute="application" action="" method="post" enctype="multipart/form-data" onsubmit="submitForm()">
				<div class="card card-shadow">
					<div class="card-body p-4">
						<!-- Contents -->
						<div id="basicInfo" class="content" role="tabpanel" aria-labelledby="basicInfoTrigger">
							<h4 class="mb-4">Basic Information</h4>
							<div class="row g-4">
								<spring:bind path="identityNumber">
									<div class="form-group col-12">
										<label class="form-label" for="username">NRIC/Passport Number</label>
										<form:input class="step-1 form-control${status.error ? ' is-invalid' : ''}" path="identityNumber" required="required"/>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="identityNumber" />
												</c:when>
												<c:otherwise>
													Please enter your identity Number.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="salutation">
									<div class="form-group col-5 col-md-2">
										<label class="form-label" for="salutation">Salutation</label>
										<form:select items="${salutationList}" class="step-1 form-select${status.error ? ' is-invalid' : ''}" path="salutation" required="required"/>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="salutation" />
												</c:when>
												<c:otherwise>
													Please select your salutation.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="name">
									<div class="col-7 col-md-5">
										<label class="form-label" for="name">Name</label>
										<form:input class="step-1 form-control${status.error ? ' is-invalid' : ''}" path="name" required="required" />
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="name" />
												</c:when>
												<c:otherwise>
													Please enter your name.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="email">
									<div class="col-12 col-md-5">
										<label class="form-label" for="email">Email</label>
										<form:input class="step-1 form-control${status.error ? ' is-invalid' : ''}" type="email" path="email" required="required" />
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="email" />
												</c:when>
												<c:otherwise>
													Please enter valid email.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="contactNo">
									<div class="col-12 col-md-6">
										<label class="form-label" for="contactNum">Contact Number</label>
										<form:input id="phone" class="step-1 form-control${status.error ? ' is-invalid' : ''}" type="tel" path="contactNo" required="required" />
										<div id="phoneNumInvalid" class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="contactNo" />
												</c:when>
												<c:otherwise>
													Please enter valid phone number.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="nationality">
									<div class="col-12 col-md-6">
										<label class="form-label" for="nationality">Nationality</label>
										<form:select items="${nationalityList}" class="step-1 form-select${status.error ? ' is-invalid' : ''}" path="nationality" required="required" />
										<div class="invalid-feedback">
											<form:errors path="nationality" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="gender">
									<div class="col-12 col-md-6">
										<label class="form-label" for="gender">Gender</label>
										<form:select class="step-1 form-select${status.error ? ' is-invalid' : ''}" path="gender" required="required" >
											<option value="m">Male</option>
											<option value="f">Female</option>
										</form:select>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="gender" />
												</c:when>
												<c:otherwise>
													Please select your gender.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="maritalStatus">
									<div class="col-12 col-md-6">
										<label class="form-label" for="maritalStatus">Marital Status</label>
										<form:select items="${maritalStatusList}" class="step-1 form-select${status.error ? ' is-invalid' : ''}" path="maritalStatus" required="required"/>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="maritalStatus" />
												</c:when>
												<c:otherwise>
													Please select your marital status.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="birthdate">
									<div class="col-12 col-md-6">
										<label class="form-label" for="birthdate">Date of Birth</label>
										<form:input class="step-1 form-control date${status.error ? ' is-invalid' : ''}" type="date" path="birthdate" required="required"/>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="birthdate" />
												</c:when>
												<c:otherwise>
													Please enter your date of birth.
												</c:otherwise>
											</c:choose>			
										</div>
									</div>
								</spring:bind>
								<spring:bind path="race">
									<div class="col-12 col-md-6">
										<label class="form-label" for="race">Race</label>
										<form:select items="${raceList}" class="step-1 form-select${status.error ? ' is-invalid' : ''}" path="race" required="required"/>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="race" />
												</c:when>
												<c:otherwise>
													Please select your race.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="industry">
									<div class="col-12 col-md-6">
										<label class="form-label" for="industry">Industry</label>
										<form:select items="${industryList}" class="step-1 form-select${status.error ? ' is-invalid' : ''}" path="industry" required="required"/>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="industry" />
												</c:when>
												<c:otherwise>
													Please select your working industry.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="occupation">
									<div class="col-12 col-md-6">
										<label class="form-label" for="occupation">Occupation</label>
										<form:input class="step-1 form-control${status.error ? ' is-invalid' : ''}" path="occupation" required="required"/>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="occupation" />
												</c:when>
												<c:otherwise>
													Please enter your occupation.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<div class="col-12">
									<button class="btn btn-danger btn-next-form float-end px-4 py-2" onclick="return nextStep()">Next</button>
								</div>
							</div>
						</div>
						<div id="address" class="content" role="tabpanel" aria-labelledby="addressTrigger">
							<h4 class="mb-4">Residential Details</h4>
							<div class="row g-4">
								<spring:bind path="addressLine1">
									<div class="col-12">
										<label class="form-label" for="addressLine1">Address Line 1</label>
										<form:input class="step-2 form-control${status.error ? ' is-invalid' : ''}" path="addressLine1" required="required" />
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="addressLine1" />
												</c:when>
												<c:otherwise>
													Please enter your address line 1.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="addressLine2">
									<div class="col-12">
										<label class="form-label" for="addressLine2">Address Line 2</label>
										<form:input class="step-2 form-control${status.error ? ' is-invalid' : ''}" path="addressLine2" />
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="addressLine2" />
												</c:when>
												<c:otherwise>
													Please enter your address line 2.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="addressLine3">
									<div class="col-12">
										<label class="form-label" for="addressLine3">Address Line 3</label>
										<form:input class="step-2 form-control${status.error ? ' is-invalid' : ''}" path="addressLine3" />
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="addressLine3" />
												</c:when>
												<c:otherwise>
													Please enter your address line 3.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="postalCode">
									<div class="col-12 col-md-6">
										<label class="form-label" for="postalcode">Postal Code</label>
										<form:input class="step-2 form-control${status.error ? ' is-invalid' : ''}" path="postalCode"  required="required" />
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="postalCode" />
												</c:when>
												<c:otherwise>
													Please enter your postal code.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="country">
									<div class="col-12 col-md-6">
										<label class="form-label" for="country">Country</label>
										<form:select items="${countryList}" class="step-2 form-select${status.error ? ' is-invalid' : ''}" path="country"  required="required" />
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="country" />
												</c:when>
												<c:otherwise>
													Please select your country.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<div class="col-12">
									<div class="row justify-content-end">
										<div class="col-auto">
											<button type="button" class="btn btn-danger float-end px-4 py-2" onclick="previousStep()">Previous</button>
										</div>
										<div class="col-auto">
											<button class="btn btn-danger btn-next-form float-end px-4 py-2" onclick="return nextStep()">Next</button>
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
										<div class="input-group has-validation">
											<form:input class="step-3 form-control ${status.error ? 'is-invalid' : ''}" path="income" type="number" min="0"
												step="0.01" placeholder="Enter your monthly income" required="required" />
											<span class="input-group-text">SGD</span>
											<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="income" />
												</c:when>
												<c:otherwise>
													Please enter your income.
												</c:otherwise>
											</c:choose>
										</div>
										</div>
									</div>
								</spring:bind>
								
								<spring:bind path="loanAmount">
									<div class="col-12 col-lg-6">
										<label class="form-label" for="loanAmount">Desired Loan Amount</label>
										<div class="input-group has-validation">
											<form:input class="step-3 form-control ${status.error ? 'is-invalid' : ''}" path="loanAmount" type="number" min="1000"
												step="0.01" placeholder="Enter your desired loan amount"  required="required" />
											<span class="input-group-text">SGD</span>
											<div class="invalid-feedback">
												<c:choose>
													<c:when test="${status.error}">
														<form:errors path="loanAmount" />
													</c:when>
													<c:otherwise>
														Loan amount must be greater than 1000 SGD.
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="repaymentPeriod">
									<div class="col-12 col-lg-6">
										<label class="form-label" for="repaymentPeriod">Repayment Period</label>
										<form:select class="step-3 form-select ${status.error ? 'is-invalid' : ''}" path="repaymentPeriod"  required="required">
											<c:choose>
												<c:when test="${loan.type == 'personal'}">
												<option value="1">1 years</option>
												<option value="2">2 years</option>
												<option value="3">3 years</option>
												<option value="4">4 years</option>
												<option value="5">5 years</option>
											</c:when>
											<c:when test="${loan.type == 'home'}">
												<option value="5">5 years</option>
												<option value="10">10 years</option>
												<option value="15">15 years</option>
												<option value="20">20 years</option>
												<option value="25">25 years</option>
												<option value="30">30 years</option>
											</c:when>
											<c:otherwise>
												<option value="1">1 years</option>
												<option value="2">2 years</option>
												<option value="3">3 years</option>
												<option value="4">4 years</option>
												<option value="5">5 years</option>
												<option value="6">6 years</option>
												<option value="7">7 years</option>
												<option value="8">8 years</option>
												<option value="9">9 years</option>
											</c:otherwise>
											</c:choose>
										</form:select>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="repaymentPeriod" />
												</c:when>
												<c:otherwise>
													Please select the repayment period.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="disbursementBank">
									<div class="col-12 col-lg-6">
										<label class="step-3form-label" for="disbursementBank">Disbursement Bank</label>
										<form:select class="step-3 form-select ${status.error ? 'is-invalid' : ''}" path="disbursementBank"  required="required">
											<option value="OBS">OBS</option>
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
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="disbursementBank" />
												</c:when>
												<c:otherwise>
													Please enter the disbursement bank for the loan.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="disbursementAccType">
									<div class="col-12 col-lg-6">
										<label class="form-label" for="disbursementAccType">Disbursement Account Type</label>
										<form:select class="step-3 form-select ${status.error ? 'is-invalid' : ''}" path="disbursementAccType"  required="required">
											<option value="saving">Saving Account</option>
											<option value="current">Current Account</option>
										</form:select>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="disbursementAccType" />
												</c:when>
												<c:otherwise>
													Please select the disbursement account type for the loan.
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="disbursementAccNum">
									<div class="col-12 col-lg-6">
										<label class="form-label" for="disbursementAccNum">Disbursement Account Number</label>
										<form:input class="step-3 form-control ${status.error ? 'is-invalid' : ''}" path="disbursementAccNum" required="required" />
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="disbursementAccNum" />
												</c:when>
												<c:otherwise>
													Please select the disbursement account number for the loan.
												</c:otherwise>
											</c:choose>
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
													<input class="step-3 form-check-input" type="checkbox" name="totalInstallmentTrigger"
														onchange="triggerTotalInstallment(this)"> <label class="form-check-label"
														for="totalInstallmentTrigger">Yes</label>
												</div>
											</div>
										</div>
										<div id="totalInstallmentInput" class="input-group has-validation d-none">
											<form:input class="step-3 form-control ${status.error ? 'is-invalid' : ''}" path="totalInstallment" type="number"
												min="0" step="0.01" placeholder="Enter your preffered credit limit"  required="required"/>
											<span class="input-group-text">SGD</span>
											<div class="invalid-feedback">
												<c:choose>
													<c:when test="${status.error}">
														<form:errors path="totalInstallment" />
													</c:when>
													<c:otherwise>
														Please enter your total installment.
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</spring:bind>
								<div class="col-12">
									<div class="row justify-content-end">
										<div class="col-auto">
											<button type="button" class="btn btn-danger float-end px-4 py-2" onclick="previousStep()">Previous</button>
										</div>
										<div class="col-auto">
											<button type="button" class="btn btn-danger float-end px-4 py-2" onclick="nextStep()">Next</button>
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
										<form:input class="step-4 form-control ${status.error ? 'is-invalid' : ''}" type="file" path="identityDoc" accept="application/pdf" onchange="getIdentityDocLink(this)" required="required" />
										<a id="identityDocLink" target="_blank"></a>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="identityDoc" />
												</c:when>
												<c:otherwise>
													Please upload your identity card or passport (front and back) in pdf format. (Max 5MB)
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="payslipDoc">
									<div class="col-12">
										<label class="form-label" for="payslipDoc">Please upload your latest payslip within 3 months (in pdf format)</label>
										<form:input class="step-4 form-control ${status.error ? 'is-invalid' : ''}" type="file" path="payslipDoc" accept="application/pdf" onchange="getPayslipDocLink(this)" required="required" />
										<a id="payslipDocLink" target="_blank"></a>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="payslipDoc" />
												</c:when>
												<c:otherwise>
													Please upload payslip in pdf format. (Max 5MB)
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<spring:bind path="supportDoc">
									<div class="col-12">
										<label class="form-label" for="supportDoc">Please upload your support document in pdf format (if any)</label>
										<form:input class="step-4 form-control ${status.error ? 'is-invalid' : ''}" type="file" path="supportDoc" accept="application/pdf" onchange="getSupportDocLink(this)" />
										<a id="supportDocLink" target="_blank"></a>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="supportDoc" />
												</c:when>
												<c:otherwise>
													Please upload your support document in pdf format. (Max 5MB)
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</spring:bind>
								<div class="col-12">
									<div class="row justify-content-end">
										<div class="col-auto">
											<button type="button" class="btn btn-danger float-end px-4 py-2" onclick="previousStep()">Previous</button>
										</div>
										<div class="col-auto">
											<button type="button" class="btn btn-danger float-end px-4 py-2" onclick="nextStep()">Next</button>
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
												alt="${loan.title}">
										</div>
										<div class="card-body pb-0">
											<h5 class="card-title">
												<c:out value="${loan.title}" />
											</h5>
											<p class="card-text text-justify">
												<c:out value="${loan.description}" />
											</p>
											<table class="table text-justify">
												<tr>
													<td>Interest Rate</td>
													<td><span> <fmt:formatNumber value="${loan.interestRate}" type="percent"
																minFractionDigits="2" />
													</span> p.a.</td>
												</tr>
												<tr>
													<td>Down Payment</td>
													<td><span> <fmt:formatNumber value="${loan.downpayment}" type="percent"
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
											<button type="button" class="btn btn-danger float-end px-4 py-2" onclick="previousStep()">Previous</button>
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
<c:if test="${not empty msg}">
	<script>
		// Message Toast
		let msgToast = document.getElementById("msgToast");
		let msgBsToast = new bootstrap.Toast(msgToast);
		msgBsToast.show();
	</script>
	<c:remove scope="session" var="msg"/>
</c:if>
<script>
	// Script to initialize the stepper
	var stepper;
	document.addEventListener('DOMContentLoaded', function() {
		stepper = new Stepper(document.querySelector('.bs-stepper'))
	});
	
	// Script to initialize international phone input
	let phoneInput = document.getElementById("phone");
	let phoneInputErr = document.getElementById("phoneNumInvalid");
	let intlPhoneInput = intlTelInput(phoneInput, {
		utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
		initialCountry: "auto",
		// Check user's ip location
		geoIpLookup: function(success, failure) {
		    $.get("https://ipinfo.io?token=e8f08eaac8b60c", function() {}, "jsonp").always(function(resp) {
		      var countryCode = (resp && resp.country) ? resp.country : "sg";
		      success(countryCode);
		    });
		},
   	});
	
	// Phone Number Validation
	function reset() {
		phoneInput.classList.remove("is-invalid");
		phoneInputErr.classList.remove("d-block");
	};
	
	function validatePhoneNum() {
		reset();
		if (phoneInput.value.trim() && intlPhoneInput.isValidNumber()) {
			phoneInput.classList.remove("is-invalid");
			phoneInput.setCustomValidity("");
			phoneInputErr.classList.remove("d-block");
			return true;
		}
		phoneInput.classList.add("is-invalid");
    	phoneInput.setCustomValidity("invalidPhoneNum");
    	phoneInputErr.classList.add("d-block");
		return false;
	}
	
	phoneInput.addEventListener('blur', validatePhoneNum);
	phoneInput.addEventListener('change', reset);
	phoneInput.addEventListener('keyup', reset);
	
	let form = document.forms['applyLoan'];
	// Script to trigger total installment input
	function triggerTotalInstallment(checkbox) {
		let totalInstallmentInput = document
				.getElementById("totalInstallmentInput");
		if (checkbox.checked) {
			totalInstallmentInput.classList.remove("d-none");
		} else {
			totalInstallmentInput.classList.add("d-none");
			form['totalInstallment'].value = 0;
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
	
	function nextStep() {
		// Get all inputs by step (specified with class step-{currentIndex})
		let inputsByStep = document.querySelectorAll(".step-" + (stepper._currentIndex + 1));
		let valid = true;
		// Validate each input
		for (var i = 0; i < inputsByStep.length; i++) {
			if (!inputsByStep[i].checkValidity()) {
				valid = false;
				break;
			}
		}
		if (!valid || (stepper._currentIndex + 1) == 1 && !validatePhoneNum()) {
			// Display Err Msg if invalid inputs
			event.preventDefault();
			event.stopPropagation();
			form.classList.add('was-validated');
			validatePhoneNum();
		} else {
			// Next step if valid inputs
			stepper.next();
			form.classList.remove('was-validated');
		}
		return false;
	}
	
	function previousStep() {
		form.classList.remove('was-validated');
		stepper.previous();
	}
	
	function submitForm() {
		// Add country code before the phone number
		phoneInput.value = intlPhoneInput.getNumber();
		return true;
	}
</script>