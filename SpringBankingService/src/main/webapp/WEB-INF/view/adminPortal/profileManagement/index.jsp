<div class="container my-4">
	<div class="my-auto">
		<h3>Manage Profile</h3>
	</div>
	<div class="card card-shadow my-5">
		<div class="card-body p-4">
			<form>
				<ul class="list-group list-group-flush">
					<li class="list-group-item px-4 py-3">
						<div class="row align-items-center">
							<div class="col-3 text-secondary">
								<i class="fa-solid fa-user fa-xl fa-fw"></i> <span class="fw-bold mx-2">Username</span>
							</div>
							<div class="col-auto">yj8629</div>
						</div>
					</li>
					<li class="list-group-item px-4 py-3">
						<div class="row align-items-center">
							<div class="col-3 text-secondary">
								<i class="fa-solid fa-signature fa-xl fa-fw"></i> <span class="fw-bold mx-2">Name</span>
							</div>
							<div class="col-auto">
								<input class="form-control" value="Tan Yuan Jie">
							</div>
						</div>
					</li>
					<li class="list-group-item px-4 py-3">
						<div class="row align-items-center">
							<div class="col-3 text-secondary">
								<i class="fa-solid fa-envelope fa-xl fa-fw"></i> <span class="fw-bold mx-2">Email</span>
							</div>
							<div class="col-auto">
								<input type="email" class="form-control" value="yuanjie8629@gmail.com">
							</div>
						</div>
					</li>
					<li class="list-group-item px-4 py-3">
						<div class="row align-items-center">
							<div class="col-3 text-secondary">
								<i class="fa-solid fa-phone fa-xl fa-fw"></i> <span class="fw-bold mx-2">Contact Number</span>
							</div>
							<div class="col-auto">
								<input type="email" class="form-control" value="+65 9876 5432">
							</div>
						</div>
					</li>
					<li class="list-group-item px-4 py-3">
						<div class="row align-items-center">
							<div class="col-3 text-secondary">
								<i class="fa-solid fa-venus-mars fa-xl fa-fw"></i> <span class="fw-bold mx-2">Gender</span>
							</div>
							<div class="col-auto">
								<select class="form-select">
									<option value="m">Male</option>
									<option value="f">Female</option>
								</select>
							</div>
						</div>
					</li>
					<li class="list-group-item px-4 py-3">
						<div class="row align-items-center">
							<div class="col-3 text-secondary">
								<i class="fa-solid fa-briefcase fa-xl fa-fw"></i> <span class="fw-bold mx-2">Role</span>
							</div>
							<div class="col-auto">
								Bank Manager
							</div>
						</div>
					</li>
					<li class="list-group-item px-4 py-3">
						<div class="row align-items-center">
							<div class="col-3 text-secondary">
								<i class="fa-solid fa-lock fa-xl fa-fw"></i> <span class="fw-bold mx-2">Password</span>
							</div>
							<div class="col-auto">
								<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#changePassModal">Change</button>
							</div>
						</div>
					</li>
					<li class="list-group-item px-4 py-3">
						<button type="submit" class="btn btn-danger float-end">Save Profile</button>
					</li>
				</ul>
			</form>
		</div>
	</div>
</div>
<jsp:include page="./changePassword.jsp" />