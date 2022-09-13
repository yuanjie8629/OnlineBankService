<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Activate Modal -->
<div class="modal fade" id="completeCustLoanModal" tabindex="-1" aria-labelledby="completeCustLoanModal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-confirm">
		<div class="modal-content p-3 text-center">
			<div class="d-flex justify-content-end">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-header flex-column">
				<i class="fa-regular fa-circle-check fa-7x text-success"></i>
				<h3 class="mt-4">Are you sure?</h3>
			</div>
			<div class="modal-body p-0">
				<p>
					Do you really want to complete the loan?
				</p>
			</div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-secondary mx-2" data-bs-dismiss="modal">Cancel</button>
				<a id="completeBtn" role="button" class="btn btn-success mx-2">Confirm</a>
			</div>
		</div>
	</div>
</div>

<script>
let completeCustLoanModal = document.getElementById('completeCustLoanModal')
completeCustLoanModal.addEventListener('show.bs.modal', event => {
  // Button that triggered the modal
  let button = event.relatedTarget
  // Extract info from data-bs-id attributes
  let id = button.getAttribute('data-bs-id');
  // update input id value
  let completeBtn = document.getElementById("completeBtn");
  completeBtn.href = "<c:url value="/admin/customer-management/loan/complete/" />" + id;
})
</script>