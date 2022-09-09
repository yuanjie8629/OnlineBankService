<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal fade" id="changePassModal" tabindex="-1" aria-labelledby="changePassModal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Change Password</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<c:url var="url" value="/admin/profile-management/changePass" />
			<form name="changePass" class="needs-validation" action="${url}" method="post" novalidate>
				<input type="hidden" name="id" value="${user.id}">
				<div class="modal-body">
					<c:if test="${not empty changePassMsg}">
						<div class="alert alert-danger" role="alert">
							<c:out value="${changePassMsg}" />
						</div>
					</c:if>
					<c:url var="url" value="/admin/profile-management/changePass" />
					<input type="hidden" value="${user.id}">
					<div class="mb-3">
						<label for="oldPass">Old Password</label> <input name="oldPass" type="password" class="form-control" required>
						<div class="invalid-feedback">Please enter old password.</div>
					</div>
					<div class="mb-3">
						<label for="newPass">New Password</label>
						<input name="newPass" type="password" class="form-control" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required onchange="validatePassword()">
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
					<div class="mb-3">
						<label for="confirmPass">Confirm New Password</label>
						<input name="confirmPass" type="password" class="form-control" required onkeyup="validatePassword()">
						<div id="confirmPassErr" class="invalid-feedback">Please enter confirm password.</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-danger">Change</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	let form = document.forms['changePass'];
	var newPass = form['newPass'];
	var confirmPass = form['confirmPass'];
	
	function validatePassword() {
		let confirmPassErr = document.getElementById("confirmPassErr");
		if(newPass.value != confirmPass.value) {
			confirmPass.setCustomValidity("Confirm Password must be matched with New Password");
			confirmPassErr.innerHTML = "Confirm Password must be matched with New Password";
		} else {
			confirmPass.setCustomValidity('');
			confirmPassErr.innerHTML = "Please enter confirm password.";
		}
	}

	// Bootstrap validation
	// Example starter JavaScript for disabling form submissions if there are invalid fields
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