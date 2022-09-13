<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- No Account Modal -->
<div class="modal fade" id="noAccModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="noAccModal" aria-hidden="true">
	<fmt:parseDate value="${transaction.date}" var="date" type="both" pattern="yyyy-MM-dd'T'HH:mm" />
	<div class="modal-dialog modal-lg modal-dialog-centered modal-confirm">
		<div class="modal-content p-4">
			<div class="d-flex justify-content-end">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-header flex-column">
				<i class="fa-solid fa-circle-exclamation fa-7x text-danger"></i>
				<h3 class="mt-4 text-capitalize">
					No Account for Loan Payment.
				</h3>
			</div>
			<div class="modal-body m-auto px-5 text-center">
				<p>Sorry, you don't have any account to pay for the loan.</p>
				<p>Kindly approach to the nearest OBS Bank for the loan payment.</p>
			</div>
			<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-danger mx-2" data-bs-dismiss="modal">Got it</button>
			</div>
		</div>
	</div>
</div>