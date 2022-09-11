<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- Success Fund Transfer Modal -->
<div class="modal fade" id="successModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="successModal" aria-hidden="true">
	<fmt:parseDate value="${transaction.date}" var="date" type="both" pattern="yyyy-MM-dd'T'HH:mm" />
	<div class="modal-dialog modal-lg modal-dialog-centered modal-confirm">
		<div class="modal-content p-4">
			<div class="d-flex justify-content-end">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-header flex-column">
				<i class="fa-solid fa-circle-check fa-7x text-success"></i>
				<h3 class="mt-4 text-capitalize">
					Success Fund Transfer.
				</h3>
			</div>
			<div class="modal-body w-75 m-auto px-5">
				<p> You have successfully completed the fund transfer.
				<table class="table table-fit m-auto">
					<tr>
						<td>Transaction Date</td>
						<td><strong> <fmt:formatDate type="both" pattern="dd-MMM-yyyy HH:mm" value="${date}" />
						</strong></td>
					</tr>
					<tr>
						<td>Transaction Reference</td>
						<td><strong> <c:out value="${transaction.reference}" />
						</strong></td>
					</tr>
					<tr>
						<td>From</td>
						<td><strong> <c:out value="${accFrom}" />
						</strong></td>
					</tr>
					<tr>
						<td>To</td>
						<td><strong> <c:out value="${accTo}" />
						</strong></td>
					</tr>
					<tr>
						<td>Amount</td>
						<td><strong> <c:out value="${transaction.amount}" />
						</strong></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer justify-content-center">
				<a role="button" class="btn btn-success mx-2 px-4 py-2" href="<c:url value="/home" />" >Got it</a>
			</div>
		</div>
	</div>
</div>