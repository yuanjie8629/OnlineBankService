<%@ page import="com.utils.URLUtils"%>
<div class="container my-4">
	<h3 class="mb-4">Update Customer</h3>
	<div class="card card-shadow">
		<div class="card-body p-4">
			<form>
				<div class="row">
					<div class="col-lg-7 py-4 px-5 cust-info">
						<h4 class="mb-4">Customer Information</h4>
						<div class="row g-4">
							<div class="col-12 col-md-6">
								<label for="username">Username</label> <input class="form-control" readonly>
							</div>
							<div class="col-12 col-md-6">
								<label for="username">NRIC/Passport Number</label> <input class="form-control">
							</div>
							<div class="col-5 col-md-2">
								<label for="salutation">Salutation</label> <select class="form-select">
									<option value="Mr">Dr.</option>
									<option value="Mr.">Mr.</option>
									<option value="Mrs.">Mrs.</option>
									<option value="Ms.">Ms.</option>
									<option value="Madam.">Madam.</option>
								</select>
							</div>
							<div class="col-7 col-md-5">
								<label for="name">Name</label> <input class="form-control">
							</div>
							<div class="col-12 col-md-5">
								<label for="email">Email</label> <input class="form-control">
							</div>
							<div class="col-12 col-md-6">
								<label for="contactNum">Contact Number</label> <input class="form-control">
							</div>
							<div class="col-12 col-md-6">
								<label for="nationality">Nationality</label> <select class="form-select">
									<jsp:include page="../../selection/nationalitySelection.jsp" />
								</select>
							</div>
							<div class="col-12 col-md-6">
								<label for="gender">Gender</label><br> <select class="form-select">
									<option value="m">Male</option>
									<option value="f">Female</option>
								</select>
							</div>
							<div class="col-12 col-md-6">
								<label for="maritalStatus">Marital Status</label><br> <select class="form-select">
									<jsp:include page="../../selection/maritalStatusSelection.jsp" />
								</select>
							</div>
							<div class="col-12 col-md-6">
								<label for="birthdate">Date of Birth</label> <input class="form-control date" type="date">
							</div>
							<div class="col-12 col-md-6">
								<label for="race">Race</label><br> <select class="form-select">
									<jsp:include page="../../selection/raceSelection.jsp" />
								</select>
							</div>
							<div class="col-12 col-md-6">
								<label for="industry">Industry</label><br> <select class="form-select">
									<jsp:include page="../../selection/industrySelection.jsp" />
								</select>
							</div>
							<div class="col-12 col-md-6">
								<label for="occupation">Occupation</label> <input class="form-control">
							</div>
						</div>
					</div>
					<div class="col-lg-5 py-4 px-5">
						<h4 class="mb-4">Customer Address</h4>
						<div class="row g-4">
							<div class="col-12">
								<label for="addressLine1">Address Line 1</label> <input class="form-control">
							</div>
							<div class="col-12">
								<label for="addressLine2">Address Line 2</label> <input class="form-control">
							</div>
							<div class="col-12">
								<label for="addressLine3">Address Line 3</label> <input class="form-control">
							</div>
							<div class="col-12">
								<label for="postalcode">Postal Code</label> <input class="form-control">
							</div>
							<div class="col-12">
								<label for="country">Country</label> <select class="form-select">
									<jsp:include page="../../selection/countrySelection.jsp" />
								</select>
							</div>
						</div>
					</div>
					<div class="col-12 px-5">
						<button type="submit" class="btn btn-danger float-end px-3 py-2">Update</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
