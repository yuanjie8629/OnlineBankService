<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Approve Modal -->
<form name="accAppReject" action="reject" method="post">
	<input type="hidden" name="id" value="${accApp.id}" />
	<div class="modal fade" id="rejectModal" tabindex="-1" aria-labelledby="rejectModal" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered modal-confirm">
			<div class="modal-content p-4">
				<div class="d-flex justify-content-end">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-header flex-column">
					<i class="fa-solid fa-thumbs-down fa-7x text-danger"></i>
					<h3 class="mt-4 text-capitalize">Account Application Rejection</h3>
				</div>
				<div class="modal-body px-5">
					<label class="form-label" for="comments">Any comments/reasons on the application rejection?</label>
					<input class="form-control" name="comments" placeholder="Enter any comments here"/>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-secondary mx-2" data-bs-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-danger mx-2">Reject</button>
				</div>
			</div>
		</div>
	</div>
</form>