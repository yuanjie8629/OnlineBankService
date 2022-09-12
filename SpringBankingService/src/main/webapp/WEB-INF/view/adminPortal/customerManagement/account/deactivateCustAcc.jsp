<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Deactivate Modal -->
<div class="modal fade" id="deactivateCustAccModal" tabindex="-1" aria-labelledby="deactivateCustAccModal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-confirm">
		<div class="modal-content p-3 text-center">
			<div class="d-flex justify-content-end">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-header flex-column">
				<i class="fa-regular fa-circle-xmark fa-7x text-danger"></i>
				<h3 class="mt-4">Are you sure?</h3>
			</div>
			<div class="modal-body p-0">
				<p>
					Do you really want to deactivate the account? <br>The customer will not be able to transfer money after deactivation.
				</p>
			</div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-secondary mx-2" data-bs-dismiss="modal">Cancel</button>
				<a id="deactivateBtn" role="button" class="btn btn-danger mx-2">Deactivate</a>
			</div>
		</div>
	</div>
</div>
<script>
let deactivateCustAccModal = document.getElementById('deactivateCustAccModal')
deactivateCustAccModal.addEventListener('show.bs.modal', event => {
  // Button that triggered the modal
  let button = event.relatedTarget
  // Extract info from data-bs-id attributes
  let id = button.getAttribute('data-bs-id');
  // update input id value
  let deactivateBtn = document.getElementById("deactivateBtn");
  deactivateBtn.href = "<c:url value="/admin/customer-management/account/deactivate/" />" + id;
})
</script>