<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Delete Modal -->
<div class="modal fade" id="deleteCardModal" tabindex="-1" aria-labelledby="deleteCardModal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-confirm">
		<div class="modal-content p-3 text-center">
			<div class="d-flex justify-content-end">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-header flex-column">
				<i class="fa-solid fa-trash fa-7x text-danger"></i>
				<h3 class="mt-4">Are you sure?</h3>
			</div>
			<div class="modal-body p-0">
				<p>Do you really want to delete the card?</p>
			</div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-secondary mx-2" data-bs-dismiss="modal">Cancel</button>
				<a id="deleteBtn" role="button" class="btn btn-danger mx-2">Delete</a>
			</div>
		</div>
	</div>
</div>
<script>
let deleteModal = document.getElementById('deleteCardModal')
deleteModal.addEventListener('show.bs.modal', event => {
  // Button that triggered the modal
  let button = event.relatedTarget
  // Extract info from data-bs-id attributes
  let id = button.getAttribute('data-bs-id');
  // update input id value
  let deleteBtn = document.getElementById("deleteBtn");
  deleteBtn.href = "<c:url value="/admin/card-management/delete/" />" + id;
})
</script>