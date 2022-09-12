<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="container my-4">
	<h3 class="mb-4">Update Customer</h3>
	<div class="card card-shadow">
		<div class="card-body p-4">
			<form:form name="viewCustomer" modelAttribute="cust" action="" method="post">
				<div class="row">
					<div class="col-lg-7 py-4 px-5 cust-info">
						<h4 class="mb-4">Customer Information</h4>
						<div class="row g-4">
							<div class="col-12 col-md-6">
								<label class="form-label" for="username">Username</label>
								<form:input class="form-control" path="username" disabled="true" />
							</div>
							<spring:bind path="identityNumber">
								<div class="form-group col-12 col-md-6">
									<label class="form-label" for="username">NRIC/Passport Number</label>
									<form:input class="form-control${status.error ? ' is-invalid' : ''}" path="identityNumber" />
									<div class="invalid-feedback">
										<form:errors path="identityNumber" />
									</div>
								</div>
							</spring:bind>
							<spring:bind path="salutation">
								<div class="form-group col-5 col-md-2">
									<label class="form-label" for="salutation">Salutation</label>
									<form:select items="${salutationList}" class="form-select${status.error ? ' is-invalid' : ''}" path="salutation"/>
									<div class="invalid-feedback">
										<form:errors path="salutation" />
									</div>
								</div>
							</spring:bind>
							<spring:bind path="name">
								<div class="col-7 col-md-5">
									<label class="form-label" for="name">Name</label>
									<form:input class="form-control${status.error ? ' is-invalid' : ''}" path="name" />
									<div class="invalid-feedback">
										<form:errors path="name" />
									</div>
								</div>
							</spring:bind>
							<spring:bind path="email">
								<div class="col-12 col-md-5">
									<label class="form-label" for="email">Email</label>
									<form:input class="form-control${status.error ? ' is-invalid' : ''}" path="email" />
									<div class="invalid-feedback">
										<form:errors path="email" />
									</div>
								</div>
							</spring:bind>
							<spring:bind path="contactNo">
								<div class="col-12 col-md-6">
									<label class="form-label" for="contactNum">Contact Number</label>
									<form:input class="form-control${status.error ? ' is-invalid' : ''}" path="contactNo" />
									<div class="invalid-feedback">
										<form:errors path="contactNo" />
									</div>
								</div>
							</spring:bind>
							<spring:bind path="nationality">
								<div class="col-12 col-md-6">
									<label class="form-label" for="nationality">Nationality</label>
									<form:select items="${nationalityList}" class="form-select${status.error ? ' is-invalid' : ''}" path="nationality" />
									<div class="invalid-feedback">
										<form:errors path="nationality" />
									</div>
								</div>
							</spring:bind>
							<spring:bind path="status">
								<div class="col-12 col-md-4">
									<label class="form-label" for="gender">Status</label><br>
									<form:select class="form-select${status.error ? ' is-invalid' : ''}" path="status">
										<form:option value="active">Active</form:option>
										<form:option value="inactive">Inactive</form:option>
									</form:select>
									<div class="invalid-feedback">
										<form:errors path="status" />
									</div>
								</div>
							</spring:bind>
							<spring:bind path="gender">
								<div class="col-12 col-md-4">
									<label class="form-label" for="gender">Gender</label><br>
									<form:select class="form-select${status.error ? ' is-invalid' : ''}" path="gender">
										<form:option value="m">Male</form:option>
										<form:option value="f">Female</form:option>
									</form:select>
									<div class="invalid-feedback">
										<form:errors path="gender" />
									</div>
								</div>
							</spring:bind>
							<spring:bind path="maritalStatus">
								<div class="col-12 col-md-4">
									<label class="form-label" for="maritalStatus">Marital Status</label><br>
									<form:select items="${maritalStatusList}" class="form-select${status.error ? ' is-invalid' : ''}" path="maritalStatus" />
									<div class="invalid-feedback">
										<form:errors path="maritalStatus" />
									</div>
								</div>
							</spring:bind>
							<spring:bind path="birthdate">
								<div class="col-12 col-md-6">
									<label class="form-label" for="birthdate">Date of Birth</label>
									<form:input class="form-control date${status.error ? ' is-invalid' : ''}" type="date" path="birthdate" />
									<div class="invalid-feedback">
										<form:errors path="birthdate" />
									</div>
								</div>
							</spring:bind>
							<spring:bind path="race">
								<div class="col-12 col-md-6">
									<label class="form-label" for="race">Race</label><br>
									<form:select items="${raceList}" class="form-select${status.error ? ' is-invalid' : ''}" path="race" />
									<div class="invalid-feedback">
										<form:errors path="race" />
									</div>
								</div>
							</spring:bind>
							<spring:bind path="industry">
								<div class="col-12 col-md-6">
									<label class="form-label" for="industry">Industry</label>
									<form:select items="${industryList}" class="form-select${status.error ? ' is-invalid' : ''}" path="industry" />
									<div class="invalid-feedback">
										<form:errors path="industry" />
									</div>
								</div>
							</spring:bind>
							<spring:bind path="occupation">
								<div class="col-12 col-md-6">
									<label class="form-label" for="occupation">Occupation</label>
									<form:input class="form-control${status.error ? ' is-invalid' : ''}" path="occupation" />
									<div class="invalid-feedback">
										<form:errors path="occupation" />
									</div>
								</div>
							</spring:bind>
						</div>
					</div>
					<div class="col-lg-5 py-4 px-5">
						<h4 class="mb-4">Customer Address</h4>
						<div class="row g-4">
							<spring:bind path="address.addressLine1">
									<div class="col-12">
										<label class="form-label" for="addressLine1">Address Line 1</label>
										<form:input class="form-control${status.error ? ' is-invalid' : ''}" path="address.addressLine1" />
										<div class="invalid-feedback">
											<form:errors path="address.addressLine1" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="address.addressLine2">
									<div class="col-12">
										<label class="form-label" for="addressLine2">Address Line 2</label>
										<form:input class="form-control${status.error ? ' is-invalid' : ''}" path="address.addressLine2" />
										<div class="invalid-feedback">
											<form:errors path="address.addressLine2" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="address.addressLine3">
									<div class="col-12">
										<label class="form-label" for="addressLine3">Address Line 3</label>
										<form:input class="form-control${status.error ? ' is-invalid' : ''}" path="address.addressLine3" />
										<div class="invalid-feedback">
											<form:errors path="address.addressLine3" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="address.postalCode">
									<div class="col-12 col-md-6">
										<label class="form-label" for="postalcode">Postal Code</label>
										<form:input class="form-control${status.error ? ' is-invalid' : ''}" path="address.postalCode" />
										<div class="invalid-feedback">
											<form:errors path="address.postalCode" />
										</div>
									</div>
								</spring:bind>
								<spring:bind path="address.country">
									<div class="col-12 col-md-6">
										<label class="form-label" for="country">Country</label>
										<form:select items="${countryList}" class="form-select${status.error ? ' is-invalid' : ''}" path="address.country" />
										<div class="invalid-feedback">
											<form:errors path="address.country" />
										</div>
									</div>
								</spring:bind>
						</div>
					</div>
					<div class="col-12 px-5">
						<button type="submit" class="btn btn-danger float-end px-3 py-2">Update</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>
