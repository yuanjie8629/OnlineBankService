<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Deposit Modal -->
<form name="deposit" action="<c:url value="/admin/customer-management/account/deposit" />" method="post" class="needs-validation" novalidate>
	<div class="modal fade" id="depositModal" tabindex="-1" aria-labelledby="depositModal" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered modal-confirm">
			<div class="modal-content p-4">
				<div class="d-flex justify-content-end">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-header flex-column">
					<i class="fa-solid fa-circle-dollar-to-slot fa-7x text-success"></i>
					<h3 class="mt-4 text-capitalize">Deposit Money into Account</h3>
				</div>
				<div class="modal-body px-5">
					<p class="text-center">Please enter and confirm the following details to deposit the money into the account</p>
					<table class="table table-borderless table-fit m-auto">
						<tr>
							<td class="align-middle"><label class="form-label m-0" for="accNum">Account Number</label></td>
							<td>
								<div class="input-group has-validation">
									<input id="depositAccNum" class="form-control" name="accNum" readonly disabled/>
								</div>
							</td>
						</tr>
						<tr>
							<td class="align-middle"><label class="form-label m-0" for="amount">Deposit Amount</label></td>
							<td>
								<div class="input-group has-validation">
									<input class="form-control" name="amount" type="number" min="0" step="0.01" required /> <span
										class="input-group-text">SGD</span>
									<div class="invalid-feedback">Please enter deposit amount.</div>
								</div>
							</td>
						<tr>
						<tr>
							<td class="align-middle"><label class="form-label m-0" for="description">Description</label></td>
							<td>
								<input class="form-control" name="description" />
								<div class="invalid-feedback">Please enter transaction description.</div>
							</td>
						<tr>
					</table>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-secondary mx-2" data-bs-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-success mx-2">Deposit</button>
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
	
	let depositModal = document.getElementById('depositModal')
	depositModal.addEventListener('show.bs.modal', event => {
	// Button that triggered the modal
	let button = event.relatedTarget
	// Extract info from data-bs-id attributes
	let id = button.getAttribute('data-bs-id');
	// update input id value
	let depositAccNum = document.getElementById("depositAccNum");
	depositAccNum.value = id;
})
</script>