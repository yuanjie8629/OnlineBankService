<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Carousel -->
<div class="row m-0">
	<div class="carousel p-0">
		<div class="carousel-item active" style="height: 300px;">
			<div class="container">
				<div class="carousel-caption carousel-caption-middle">
					<h1>Accounts</h1>
				</div>
			</div>
			<img src="resources/images/basePortal/account/AccountBackground.jpg" alt="account" height="300">
		</div>
	</div>
</div>
<div class="container my-5">
	<!-- Account Type Tabs -->
	<nav id="account-type" class="nav nav-pills nav-tab-category fw-bold fs-5">
		<a id="saving" class="nav-link px-5 py-4 mx-4 active" href="account?type=saving">Saving Account</a>
		<a id="current" class="nav-link px-5 py-4 mx-3" href="account?type=current">Current Account</a>
	</nav>
	<!-- List of Accounts Available -->
	<c:choose>
		<c:when test="${not empty accList}">
			<div class="my-5">
				<div class="row g-4">
					<c:forEach var="acc" items="${accList}">
						<div class="col-3">
							<div class="card card-hover h-100">
								<div class="card-thumbnail-img">
									<img src="data:image/png;base64,${acc.getBase64Thumbnail()}" alt="${acc.getTitle()}"
										class="card-img-top img-fluid">
								</div>
								<div class="card-body pb-0">
									<h5 class="card-title">
										<c:out value="${acc.getTitle()}" />
									</h5>
									<p class="card-text text-justify">
										<c:out value="${acc.getDescription()}" />
									</p>
									<table class=" table text-justify">
										<tr>
											<td>Interest Rate</td>
											<td><fmt:formatNumber value="${acc.getInterestRate()}" type="percent" minFractionDigits="2" /> p.a.</td>
										</tr>
										<tr>
											<td>Min Deposit Amount</td>
											<td><fmt:formatNumber value="${acc.getMinAmount()}" type="currency" currencyCode="SGD" /></td>
										</tr>
									</table>
								</div>
								<div class="card-footer">
									<button type="button" class="btn btn-danger stretched-link w-100 mb-2" data-bs-toggle="modal" data-bs-target="#existCustModal" data-bs-id="${acc.getId()}">Apply Now</button>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="p-3 m-auto" style="max-width: 400px;">
				<img src="<c:url value="/resources/images/Empty.png" />" class="img-fluid">
			</div>
		</c:otherwise>
	</c:choose>
</div>
<jsp:include page="existCustModal.jsp" />
<!-- Script to make tab active based on url params -->
<script>
	let searchParams = new URLSearchParams(window.location.search);
	let accType = searchParams.get("type");
	if (accType != null) {
		let accTypeList = document.getElementById("account-type").children;
		for (var i = 0; i < accTypeList.length; i++) {
			if (accTypeList[i].id.toLowerCase() == accType.toLowerCase())
				accTypeList[i].className += " active";
			else
				accTypeList[i].className = accTypeList[i].className.replace(
						" active", "");
		}
	}
</script>