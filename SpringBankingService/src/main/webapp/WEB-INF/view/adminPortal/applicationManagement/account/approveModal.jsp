<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Approve Modal -->
<form name="accAppApprove" action="approve" method="post" class="needs-validation" novalidate>
	<input type="hidden" name="id" value="${accApp.id}"/>
	<div class="modal fade" id="approveModal" tabindex="-1" aria-labelledby="approveModal" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered modal-confirm">
			<div class="modal-content p-4">
				<div class="d-flex justify-content-end">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-header flex-column">
					<i class="fa-solid fa-thumbs-up fa-7x text-success"></i>
					<h3 class="mt-4 text-capitalize">Account Application Approval</h3>
				</div>
				<div class="modal-body px-5">
					<p class="text-center">Please enter the following details to approve the account application</p>
					<table class="table table-borderless table-fit m-auto">
						<tr>
							<td class="align-middle"><label class="form-label m-0" for="initialBal">Initial Balance</label></td>
							<td>
								<div class="input-group has-validation">
									<input class="form-control" name="initialBal" type="number" min="${accApp.account.minAmount}"
										value="${accApp.account.minAmount}" step="0.01" required /> <span class="input-group-text">SGD</span>
									<div class="invalid-feedback">Please enter initial balance for the account.</div>
								</div>
							</td>
						<tr>
					</table>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-secondary mx-2" data-bs-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-success mx-2">Approve</button>
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
</script>