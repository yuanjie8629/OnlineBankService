<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Approve Modal -->
<form name="accAppFurtherAction" action="further-action" method="post" class="needs-validation" novalidate>
	<input type="hidden" name="id" value="${accApp.id}" />
	<div class="modal fade" id="furtherActionModal" tabindex="-1" aria-labelledby="furtherActionModal" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered modal-confirm">
			<div class="modal-content p-4">
				<div class="d-flex justify-content-end">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-header flex-column">
					<i class="fa-solid fa-circle-exclamation fa-7x text-warning"></i>
					<h3 class="mt-4 text-capitalize">Further Action on Account Application</h3>
				</div>
				<div class="modal-body px-5">
					<label class="form-label" for="comments">Comments on the further action required:</label>
					<input class="form-control" name="comments" placeholder="Enter your comments here" required/>
					<div class="invalid-feedback">
						Please enter the comments on the further action required
					</div>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-secondary mx-2" data-bs-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-warning text-white mx-2">Update</button>
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