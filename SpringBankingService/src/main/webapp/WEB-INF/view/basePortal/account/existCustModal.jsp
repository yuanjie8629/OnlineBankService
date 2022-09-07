<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form name="existCustForm" action="checkCust" method="post">
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
						<label for='identityNum'>Please key in your NRIC or Passport Number</label> <input class="form-control"
							name="identityNum" placeholder="For example &quot;S1680944F&quot; or &quot;A12345678&quot;">
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
let existCustModal = document.getElementById('existCustModal')
existCustModal.addEventListener('show.bs.modal', event => {
  // Button that triggered the modal
  let button = event.relatedTarget;
  // Extract info from data-bs-id attributes
  let id = button.getAttribute('data-bs-id');
  // update input id value
  let inputId = document.getElementById("id");
  inputId.value = id;
})
</script>