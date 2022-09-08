<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Apply Success Modal -->
<div class="modal fade" id="applySuccessModal" tabindex="-1" aria-labelledby="applySuccessModal" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-confirm">
		<div class="modal-content p-4 text-center">
			<div class="d-flex justify-content-end">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-header flex-column">
				<i class="fa-solid fa-circle-check fa-7x text-success"></i>
				<h3 class="mt-4">${appType}&nbsp;Application</h3>
			</div>
			<div class="modal-body w-75 m-auto">
				<p class="fw-semibold">
					You have successfully apply for the <strong><c:out value="${title}" /></strong>
				</p>
				<p>
					Please refer to the following reference number for your tracking purpose. <br>
				</p>
				<p>
					Reference Number: <strong><c:out value="${refNum}" /></strong>
				</p>
			</div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-success mx-2" data-bs-dismiss="modal">Got it</button>
			</div>
		</div>
	</div>
</div>