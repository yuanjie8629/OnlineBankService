<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="url" value="/credit-card/apply/" />
<div class="modal fade" id="applyModal" aria-hidden="true" aria-labelledby="applyModal" tabindex="-1">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-confirm">
		<div class="modal-content  p-3">
			<div class="d-flex justify-content-end">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-header flex-column">
				<h3 class="mt-2">Are you an existing customer?</h3>
			</div>
			<div class="modal-body px-5 py-4">
				<div class="row g-3">
					<div class="col-12">
						<a id="newCustBtn" class="btn btn-lg btn-outline-danger w-100" role="button">New Customer</a>
					</div>
					<div class="col-12">
						<button class="btn btn-lg btn-outline-danger w-100" data-bs-target="#existCustModal" data-bs-toggle="modal">Existing Customer</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<form name="existCustForm" action="<c:url value="/credit-card/checkCust" />" method="post" class="needs-validation"
	novalidate>
	<div class="modal fade" id="existCustModal" tabindex="-1" aria-labelledby="existCustModal" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered modal-confirm">
			<div class="modal-content p-3">
				<div class="d-flex justify-content-end">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-header flex-column">
					<h3 class="mt-2">Let's Check if We Have Your Information</h3>
				</div>
				<div class="modal-body px-5">
					<input id="id" type="hidden" name="id">
					<div class="mb-3">
						<label for='username'>Username</label> <input class="form-control" name="username" placeholder="Please enter your username" required>
						<div class="invalid-feedback">Please enter your username.</div>
					</div>
					<div class="mb-3">
						<label for='name'>Password</label> <input class="form-control" type="password" name="password"
							placeholder="Please enter your password" required>
						<div class="invalid-feedback">Please enter your password.</div>
					</div>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-secondary mx-2" data-bs-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-danger mx-2">Continue</button>
				</div>
			</div>
		</div>
	</div>
</form>
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
	
let applyModal = document.getElementById('applyModal')
applyModal.addEventListener('show.bs.modal', event => {
  // Button that triggered the modal
  let button = event.relatedTarget;
  // Extract info from data-bs-id attributes
  let id = button.getAttribute('data-bs-id');
  // update input id value
  let inputId = document.getElementById("id");
  inputId.value = id;
  let newCustBtn = document.getElementById("newCustBtn");
  console.log("${url}" + id);
  newCustBtn.href = "${url}" + id;
})
</script>