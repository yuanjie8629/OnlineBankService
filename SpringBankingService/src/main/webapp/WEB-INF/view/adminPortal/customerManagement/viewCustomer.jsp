<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container my-4">
	<h3 class="mb-4">View Customer</h3>
	<div class="card card-shadow">
		<div class="card-body p-4">
			<div class="row">
				<div class="col-lg-7 py-4 px-5 cust-info">
					<h4 class="mb-4">Customer Information</h4>
					<div class="row g-4">
						<div class="col-12 col-md-6">
							<label class="form-label" for="username">Username</label>
							<c:choose>
								<c:when test="${not empty cust.username}">
									<input class="form-control" value="${cust.username}" readonly>
								</c:when>
								<c:otherwise>
									<input class="form-control" value="Not Set" readonly disabled>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-12 col-md-6">
							<label class="form-label" for="username">NRIC/Passport Number</label>
							<input class="form-control" value="${cust.identityNumber}" readonly>
						</div>
						<div class="col-5 col-md-2">
							<label class="form-label" for="salutation">Salutation</label>
							<input class="form-control text-capitalize" value="${cust.salutation}" readonly>
						</div>
						<div class="col-7 col-md-5">
							<label class="form-label" for="name">Name</label>
							<input class="form-control" value="${cust.name}" readonly>
						</div>
						<div class="col-12 col-md-5">
							<label class="form-label" for="email">Email</label>
							<input class="form-control" value="${cust.email}" readonly>
						</div>
						<div class="col-12 col-md-6">
							<label class="form-label" for="contactNum">Contact Number</label>
							<input class="form-control" value="${cust.contactNo}" readonly>
						</div>
						<div class="col-12 col-md-6">
							<label class="form-label" for="nationality">Nationality</label>
							<input class="form-control text-capitalize" value="${cust.nationality}" readonly>
						</div>
						<div class="col-12 col-md-4">
							<label class="form-label" for="gender">Status</label>
							<input class="form-control text-capitalize" value="${cust.status}" readonly>
						</div>
						<div class="col-12 col-md-4">
							<label class="form-label" for="gender">Gender</label>
							<input class="form-control" value="${cust.gender.toString() == 'm' ? 'Male' : 'Female'}" readonly>
						</div>
						<div class="col-12 col-md-4">
							<label class="form-label" for="maritalStatus">Marital Status</label>
							<input class="form-control text-capitalize" value="${cust.maritalStatus}" readonly>
						</div>
						<div class="col-12 col-md-6">
							<label class="form-label" for="birthdate">Date of Birth</label>
							<input class="form-control date" type="date" value="${cust.birthdate}" readonly>
						</div>
						<div class="col-12 col-md-6">
							<label class="form-label" for="race">Race</label>
							<input class="form-control text-capitalize" value="${cust.race}"readonly>
						</div>
						<div class="col-12 col-md-6">
							<label class="form-label" for="industry">Industry</label>
							<input class="form-control" value="${cust.industry}" readonly>
						</div>
						<div class="col-12 col-md-6">
							<label class="form-label" for="occupation">Occupation</label>
							<input class="form-control" value="${cust.occupation}" readonly>
						</div>
					</div>
				</div>
				<div class="col-lg-5 py-4 px-5">
					<h4 class="mb-4">Customer Address</h4>
					<div class="row g-4">
						<div class="col-12">
							<label class="form-label" for="addressLine1">Address Line 1</label>
							<input class="form-control" value="${cust.address.addressLine1}" readonly>
						</div>
						<div class="col-12">
							<label class="form-label" for="addressLine2">Address Line 2</label>
							<input class="form-control" value="${cust.address.addressLine2}" readonly>
						</div>
						<div class="col-12">
							<label class="form-label" for="addressLine3">Address Line 3</label>
							<input class="form-control" value="${cust.address.addressLine3}" readonly>
						</div>
						<div class="col-12">
							<label class="form-label" for="postalcode">Postal Code</label>
							<input class="form-control" value="${cust.address.postalCode}" readonly>
						</div>
						<div class="col-12">
							<label class="form-label" for="country">Country</label>
							<input class="form-control text-capitalize" value="${cust.address.country}" readonly>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
