<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container my-4">
	<div class="my-auto">
		<h3>Manage Profile</h3>
	</div>
	<div class="card card-shadow my-5">
		<div class="card-body p-4">
			<c:url var="url" value="/customer/profile-management/save" />
			<form:form name="profile" modelAttribute="user" action="${url}" method="post">
				<form:input type="hidden" path="id" />
				<form:input type="hidden" path="password" />
				<form:input type="hidden" path="status" />
				<ul class="list-group list-group-flush">
					<li class="list-group-item px-4 py-3"><spring:bind path="username">
							<div class="row align-items-center">
								<div class="col-3 text-secondary">
									<i class="fa-solid fa-user fa-xl fa-fw"></i> <span class="fw-bold mx-2">Username</span>
								</div>
								<div class="col-auto">
									<form:input path="username" class="form-control border-0 ps-0" readonly="true" />
								</div>
							</div>
						</spring:bind>
					</li>
					<li class="list-group-item px-4 py-3">
						<spring:bind path="name">
							<div class="row align-items-center">
								<div class="col-3 text-secondary">
									<i class="fa-solid fa-signature fa-xl fa-fw"></i> <span class="fw-bold mx-2">Name</span>
								</div>
								<div class="col-auto">
									<form:input path="name" class="form-control ${status.error ? 'is-invalid' : ''}" />
									<div class="invalid-feedback">
										<form:errors path="name" />
									</div>
								</div>
							</div>
						</spring:bind>
					</li>
					<li class="list-group-item px-4 py-3">
						<spring:bind path="email">
							<div class="row align-items-center">
								<div class="col-3 text-secondary">
									<i class="fa-solid fa-envelope fa-xl fa-fw"></i> <span class="fw-bold mx-2">Email</span>
								</div>
								<div class="col-auto">
									<form:input type="email" path="email" class="form-control ${status.error ? 'is-invalid' : ''}" />
									<div class="invalid-feedback">
										<form:errors path="email" />
									</div>
								</div>
							</div>
						</spring:bind>
					</li>
					<li class="list-group-item px-4 py-3">
						<spring:bind path="contactNo">
							<div class="row align-items-center">
								<div class="col-3 text-secondary">
									<i class="fa-solid fa-phone fa-xl fa-fw"></i> <span class="fw-bold mx-2">Contact Number</span>
								</div>
								<div class="col-auto">
									<form:input path="contactNo" class="form-control ${status.error ? 'is-invalid' : ''}" />
									<div class="invalid-feedback">
									<form:errors path="contactNo" />
									</div>
								</div>
							</div>
						</spring:bind>
					</li>
					<li class="list-group-item px-4 py-3">
						<spring:bind path="gender">
							<div class="row align-items-center">
								<div class="col-3 text-secondary">
									<i class="fa-solid fa-venus-mars fa-xl fa-fw"></i> <span class="fw-bold mx-2">Gender</span>
								</div>
								<div class="col-auto">
									<form:select path="gender" class="form-select ${status.error ? 'is-invalid' : ''}">
										<form:option value="m">Male</form:option>
										<form:option value="f">Female</form:option>
									</form:select>
									<div class="invalid-feedback">
										<form:errors path="gender" />
									</div>
								</div>
							</div>
						</spring:bind>
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
<jsp:include page="./changePassword.jsp" />
<c:if test="${not empty msg}">
	<script>
		// Message Toast
		let msgToast = document.getElementById("msgToast");
		let msgBsToast = new bootstrap.Toast(msgToast);
		msgBsToast.show();
	</script>
	<c:remove var="msg"/>
</c:if>
<c:if test="${not empty changePassMsg}">
	<script>
		let changePassModal = new bootstrap.Modal('#changePassModal');
		changePassModal.show();
	</script>
	<c:remove var="changePassMsg"/>
</c:if>