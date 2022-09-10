<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto my-auto">
			<h3>All Accounts</h3>
		</div>
	</div>
	<div class="row">
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
							<a href="<c:url value="/customer/account/6445533431/summary" />" role="button"
								class="btn btn-danger stretched-link float-end">View More</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>