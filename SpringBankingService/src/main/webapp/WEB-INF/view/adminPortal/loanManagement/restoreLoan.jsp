<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Delete Modal -->
<div class="modal fade" id="restoreLoanModal" tabindex="-1" aria-labelledby="restoreLoanModal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-confirm">
		<div class="modal-content p-3 text-center">
			<div class="d-flex justify-content-end">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-header flex-column">
				<i class="fa-solid fa-trash-can-arrow-up fa-7x text-success"></i>
				<h3 class="mt-4">Are you sure?</h3>
			</div>
			<div class="modal-body p-0">
				<p>Do you really want to restore the loan?</p>
			</div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-secondary mx-2" data-bs-dismiss="modal">Cancel</button>
				<a id="restoreBtn" role="button" class="btn btn-success mx-2">Restore</a>
			</div>
		</div>
	</div>
</div>
<script>
let restoreModal = document.getElementById('restoreLoanModal')
restoreModal.addEventListener('show.bs.modal', event => {
  // Button that triggered the modal
  let button = event.relatedTarget
  // Extract info from data-bs-id attributes
  let id = button.getAttribute('data-bs-id');
  // update input id value
  let restoreBtn = document.getElementById("restoreBtn");
  restoreBtn.href = "<c:url value="/admin/loan-management/restore/" />" + id;
})
</script>