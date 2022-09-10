<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>OBS Connect Login</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
		<link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
		<link href="<c:url value="/resources/css/basePortal.css" />" rel="stylesheet">
		<script src="https://kit.fontawesome.com/4715c71a30.js" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	</head>
	<body>
		<section class="vh-100" style="background-color: #f0f0f0;">
			<div class="container py-5 h-100">
				<div class="row d-flex justify-content-center align-items-center h-100">
					<div class="col col-xl-10">
						<div class="card card-shadow" style="border-radius: 12px;">
							<div class="row g-0">
								<div class="col-md-6 col-lg-5 d-none d-md-block" style="box-shadow: 4px 0px 10px -1px rgba(0,0,0,0.2);">
									<!-- Carousel Scam Alert -->
									<div id="loginCarousel" class="carousel slide" data-bs-ride="carousel">
										<div class="carousel-inner">
											<div class="carousel-item active">
												<img src="resources/images/basePortal/login/ScamAlert1.png" alt="scamAlert1" class="img-fluid" style="border-radius: 12px 0 0 12px;" />
											</div>
											<div class="carousel-item">
												<img src="resources/images/basePortal/login/ScamAlert2.png" alt="scamAlert2" class="img-fluid" style="border-radius: 12px 0 0 12px;" />
											</div>
											<div class="carousel-item">
												<img src="resources/images/basePortal/login/ScamAlert3.png" alt="scamAlert3" class="img-fluid" style="border-radius: 12px 0 0 12px;" />
											</div>
										</div>
										<button class="carousel-control-prev" type="button" data-bs-target="#loginCarousel" data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
										</button>
										<button class="carousel-control-next" type="button" data-bs-target="#loginCarousel" data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
										</button>
									</div>
								</div>
								<div class="col-md-6 col-lg-7 d-flex align-items-center">
									<div class="card-body px-5 py-4 text-black">
										<!-- Logo -->
										<div class="d-flex align-items-center mb-5 pb-1">
											<a href="<c:url value="/home" />">
												<img src="resources/images/logo.png" alt="logo" width="150">
											</a>
										</div>
										<c:if test="${not empty loginMsg}">
											<div class="alert alert-danger" role="alert">
												<c:out value="${loginMsg}" />
											</div>
										</c:if>
										<!-- Login Form -->
										<form name="login" action="login" method="post" class="needs-validation" novalidate>
											<div class="form-floating mb-4">
												<input class="form-control" name="username" placeholder="Username" required/>
												<label for="username">Username</label>
												<div class="invalid-feedback">
													Please enter your username.
												</div>
											</div>
											<div class="form-floating mb-4">
												<input type="password" class="form-control" name="password" placeholder="Password" required/> <label for="password">Password</label>
												<div class="invalid-feedback">
													Please enter your password.
												</div>
											</div>
											<div class="pt-1 mb-4">
												<button class="btn btn-danger btn-lg btn-block w-100" type="submit">Login</button>
											</div>
											<div class="pt-1 mb-4">
												<a href="<c:url value="/register" />" role="button" class="btn btn-outline-secondary btn-lg btn-block w-100">Register</a>
											</div>
											<a href="<c:url value="/forgot-password" />" class="small text-muted">Forgot password?</a>
											<p class="mt-3 text-secondary" style="font-size:14px;">*Please register if you are using the OBS Connect for the first time.</p>
										</form>
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
	</script>
</html>

