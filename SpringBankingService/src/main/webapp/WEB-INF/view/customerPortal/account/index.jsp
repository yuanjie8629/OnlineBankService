<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto my-auto">
			<h3>All Accounts</h3>
		</div>
	</div>
	<div class="row">
		<c:choose>
			<c:when test="${not empty custAccList}">
				<c:forEach var="custAcc" items="${custAccList}">
					<div class="col-12 col-md-6 col-lg-4">
						<div class="card card-btn bg-light my-4">
							<div class="card-body p-4">
								<div class="text-secondary mb-2 text-capitalize"><c:out value="${custAcc.account.type}" /></div>
								<h5 class="mb-3"><c:out value="${custAcc.account.title}" /></h5>
								<div class="mb-2"><c:out value="${custAcc.accNum}" /></div>
								<div>Available Balance</div>
								<div class="row">
									<div class="col-auto">SGD</div>
									<div class="col">
										<h2><fmt:formatNumber value="${custAcc.availBal}" type="currency" currencySymbol=""/></h2>
									</div>
								</div>
								<div class="w-50">
									<hr>
								</div>
								<div class="row">
									<div class="col-auto">Current Balance</div>
									<div class="col fw-bold"><fmt:formatNumber value="${custAcc.curBal}" type="currency" currencyCode="SGD"/></div>
								</div>
								<div>
									<a href="<c:url value="/customer/account/summary/${custAcc.accNum}" />" role="button"
										class="btn btn-danger stretched-link float-end">View More</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="alert alert-danger my-3 mx-auto w-50 text-center" role="alert">
				  You don't have any account with us...
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