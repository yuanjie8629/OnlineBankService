<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OBS Connect Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous"
>
<link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/basePortal.css" />" rel="stylesheet">
<script src="https://kit.fontawesome.com/4715c71a30.js" crossorigin="anonymous"></script>
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
										<img src="resources/images/logo.png" alt="logo" width="150">
									</div>
									<!-- Login Form -->
									<form>
										<div class="form-floating mb-4">
											<input class="form-control" name="username" placeholder="Username" /> <label for="username">Username</label>
										</div>

										<div class="form-floating mb-4">
											<input type="password" class="form-control" name="password" placeholder="Password" /> <label for="password">Password</label>
										</div>
										<div class="pt-1 mb-4">
											<button class="btn btn-danger btn-lg btn-block w-100" type="button">Login</button>
										</div>
										<div class="pt-1 mb-4">
											<button class="btn btn-outline-secondary btn-lg btn-block w-100" type="button">Register</button>
										</div>

										<a class="small text-muted" href="#!">Forgot password?</a>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>

