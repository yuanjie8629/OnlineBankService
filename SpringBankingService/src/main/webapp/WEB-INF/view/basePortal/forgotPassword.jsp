<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>OBS Connect - Forgot Password</title>
		<link href="https://cdn.jsdelivr.net/npm/bs-stepper/dist/css/bs-stepper.min.css" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
		<link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
		<link href="<c:url value="/resources/css/basePortal.css" />" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bs-stepper/dist/js/bs-stepper.min.js"></script>
		<script src="https://kit.fontawesome.com/4715c71a30.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<section class="vh-100" style="background-color: #f0f0f0;">
			<div class="container h-100">
				<div class="row justify-content-center align-items-center h-100">
					<div class="col-12">
						<div class="card card-shadow">
							<div class="card-body p-4 p-md-5">
								<div class="row g-5 align-items-center">
									<div class="col-auto">
										<a href="<c:url value="/home" />">
											<img src="<c:url value="/resources/images/logo.png" />" alt="logo" width="150">
										</a>
									</div>
								</div>
								<div class="bs-stepper py-3 w-50 mx-auto">
									<h2 class="text-center">Forgot Password</h2>
									<div class="bs-stepper-header m-auto mb-3" role="tablist">
										<!-- Steps -->
										<div class="step" data-target="#verification">
											<button type="button" class="step-trigger" role="tab" aria-controls="verification" id="verificationTrigger">
												<span class="bs-stepper-circle">1</span><span class="bs-stepper-label">Verification</span>
											</button>
										</div>
										<div class="line"></div>
										<div class="step" data-target="#forgotPass">
											<button type="button" class="step-trigger" role="tab" aria-controls="forgotPass" id="forgotPassTrigger">
												<span class="bs-stepper-circle">2</span><span class="bs-stepper-label">Change Password</span>
											</button>
										</div>
									</div>
									<div class="bs-stepper-content p-0">
										<!-- Contents -->
										<div id="verification" class="content" role="tabpanel" aria-labelledby="verificationTrigger">
											<div class="container">
												<h5 class="mb-4">Please fill out the form below so we can verify your identity.</h5>
												<form name="verifyForgotPass" action="forgot-password/verification" method="post" class="needs-validation"
													novalidate onsubmit="submitForm(this)">
													<div class="form-floating mb-3">
														<input class="form-control" name="identityNumber" placeholder="NRIC / Passport Number" required /> <label
															for="username">NRIC / Passport Number</label>
														<div class="invalid-feedback">Please enter your NRIC / Passport Number.</div>
													</div>
													<div class="form-floating mb-3">
														<input class="form-control" name="name" placeholder="Name" required /> <label for="name">Name</label>
														<div class="invalid-feedback">Please enter your Name.</div>
													</div>
													<div class="form-floating mb-3">
														<input class="form-control" name="email" placeholder="Name" required /> <label for="email">Email</label>
														<div class="invalid-feedback">Please enter your Email.</div>
													</div>
													<div class="float-end">
														<button class="btn btn-danger btn-lg px-4" type="submit">Verify</button>
													</div>
												</form>
											</div>
										</div>
										<div id="forgotPass" class="content" role="tabpanel" aria-labelledby="forgotPassTrigger">
											<div class="container">
												<h5 class="mb-4">Please enter your new password.</h5>
												<form name="forgotPass" action="forgot-password/save" method="post" class="needs-validation" novalidate
													onsubmit="submitForm(this)">
													<input type="hidden" name="identityNumber" value="${identityNumber}" />
													<input type="hidden" name="verification" value="${verification}" />
													<div class="form-floating mb-3">
														<input name="password" type="password" class="form-control" placeholder="New Password"
															pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required onchange="validatePassword()"> <label
															for="password">New Password</label>
														<div class="invalid-feedback">
															Password must match the following conditions:
															<ul>
																<li>Contains at least 1 number</li>
																<li>Contains at least 1 lowercase</li>
																<li>Contains at least 1 uppercase</li>
																<li>Contains at least 8 or more characters</li>
															</ul>
														</div>
													</div>
													<div class="form-floating mb-3">
														<input name="confirmPass" type="password" class="form-control" placeholder="Confirm Password" required
															onkeyup="validatePassword()"> <label for="confirmPass">Confirm Password</label>
														<div id="confirmPassErr" class="invalid-feedback">Please enter confirm password.</div>
													</div>
													<div class="float-end">
														<button class="btn btn-danger btn-lg px-4" type="submit">Change Password</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div class="toast-container position-fixed bottom-0 end-0 p-3">
			<div id="msgToast" class="toast text-bg-danger" role="alert" aria-live="assertive" aria-atomic="true">
				<div class="d-flex align-items-center p-2">
					<div class="toast-body">
						<c:out value="${msg}" />
					</div>
				</div>
			</div>
		</div>
	</body>
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
		// Script to initialize the stepper
		var stepper;
		document.addEventListener('DOMContentLoaded', function() {
			stepper = new Stepper(document.querySelector('.bs-stepper'));
			<c:choose>
				<c:when test="${verification == true}">
					stepper.to(2);
				</c:when>
				<c:otherwise>
					stepper.to(1);
				</c:otherwise>
			</c:choose>
		})
	
		// Script to validate password
		function validatePassword() {
			let form = document.forms['forgotPass'];
			let password = form['password'];
			let confirmPass = form['confirmPass'];
			let confirmPassErr = document.getElementById("confirmPassErr");
			if (password.value != confirmPass.value) {
				confirmPass.setCustomValidity("Confirm Password must be matched with New Password");
				confirmPassErr.innerHTML = "Confirm Password must be matched with New Password";
			} else {
				confirmPass.setCustomValidity('');
				confirmPassErr.innerHTML = "Please enter confirm password.";
			}
		}
	
		// Validate submit form
		function submitForm(form) {
			if (!form.checkValidity()) {
				event.preventDefault()
				event.stopPropagation()
			}
	
			form.classList.add('was-validated')
		}
	</script>
</html>
