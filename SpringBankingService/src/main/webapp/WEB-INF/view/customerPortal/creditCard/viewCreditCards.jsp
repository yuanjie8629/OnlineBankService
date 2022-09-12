<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto my-auto">
			<h3>All Credit Cards</h3>
		</div>
	</div>
	<div class="row">
		<c:choose>
			<c:when test="${not empty custCreditCardList}">
				<c:forEach var="custCreditCard" items="${custCreditCardList}">
					<div class="col-12 col-md-6 col-lg-4">
						<div class="card card-btn bg-light my-4">
							<div class="card-body p-4">
								<div class="text-secondary mb-2 text-capitalize"><c:out value="${custCreditCard.brand}" /></div>
								<h5 class="mb-3"><c:out value="${custCreditCard.creditCard.title}" /></h5>
								<div class="mb-2"><c:out value="${custCreditCard.cardNum}" /></div>
								<div>Display Name</div>
								<div class="row">
									<div class="col">
										<h2><c:out value="${custCreditCard.cardDisplayName}" /></h2>
									</div>
								</div>
								<div class="w-50">
									<hr>
								</div>
								<div class="row">
									<div class="col-auto">Status</div>
									<div class="col fw-bold text-capitalize"><c:out value="${custCreditCard.status}" /></div>
								</div>
								<div>
									<a href="<c:url value="/customer/credit-card/summary/${custCreditCard.id}" />" role="button"
										class="btn btn-danger stretched-link float-end">View More</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="alert alert-danger my-3 mx-auto w-50 text-center" role="alert">
				  You don't have any credit card with us...
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<div class="toast-container position-fixed bottom-0 end-0 p-3">
	<div id="msgToast" class="toast text-bg-danger" role="alert" aria-live="assertive" aria-atomic="true">
		<div class="d-flex align-items-center p-2">
			<div class="toast-body">
				<c:out value="${msg}" />
			</div>
		</div>
	</div>
</div>
<c:if test="${not empty msg}">
	<script>
		// Message Toast
		let msgToast = document.getElementById("msgToast");
		let msgBsToast = new bootstrap.Toast(msgToast);
		msgBsToast.show();
	</script>
	<c:remove var="msg"/>
</c:if>