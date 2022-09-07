<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Carousel -->
<div class="row m-0">
	<div class="carousel p-0">
		<div class="carousel-item active" style="height: 300px;">
			<div class="container">
				<div class="carousel-caption carousel-caption-middle" style="width: 40%;">
					<h1>Loans</h1>
				</div>
			</div>
			<img src="resources/images/basePortal/loan/LoanBackground.jpg" alt="loan" height="300">
		</div>
	</div>
</div>
<div class="container my-5">
	<!-- Loan Type Tabs -->
	<nav id="loan-type" class="nav nav-pills nav-tab-category fw-bold fs-5">
		<a id="personal" class="nav-link px-5 py-4 mx-4 active" href="loan?type=personal">Personal Loan</a>
		<a id="home" class="nav-link px-5 py-4 mx-3" href="loan?type=home">Home Loan</a>
		<a id="car" class="nav-link px-5 py-4 mx-3" href="loan?type=car">Car Loan</a>
		<a id="education" class="nav-link px-5 py-4 mx-3" href="loan?type=education">Education Loan</a>
	</nav>
	<!-- List of Loans Available -->
	<c:choose>
		<c:when test="${not empty loanList}">
			<div class="my-5">
				<div class="row g-4">
					<c:forEach var="loan" items="${loanList}">
						<div class="col-3">
							<div class="card card-hover h-100">
								<div class="card-thumbnail-img">
									<img src="data:image/png;base64,${loan.getBase64Thumbnail()}" class="card-img-top img-fluid"
										alt="${loan.getTitle()}">
								</div>
								<div class="card-body pb-0">
									<h5 class="card-title">
										<c:out value="${loan.getTitle()}" />
									</h5>
									<p class="card-text text-justify">
										<c:out value="${loan.getDescription()}" />
									</p>
									<table class="table text-justify">
										<tr>
											<td>Interest Rate</td>
											<td><span> <fmt:formatNumber value="${loan.getInterestRate() / 100}" type="percent"
														minFractionDigits="2" />
											</span> p.a.</td>
										</tr>
										<tr>
											<td>Down Payment</td>
											<td><span> <fmt:formatNumber value="${loan.getDownpayment() / 100}" type="percent"
														minFractionDigits="2" />
											</span> from total</td>
										</tr>
									</table>
								</div>
								<div class="card-footer">
									<a class="btn btn-danger stretched-link w-100 mb-2">Apply Now</a>
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
<!-- Script to make tab active based on url params -->
<script>
	let searchParams = new URLSearchParams(window.location.search);
	let loanType = searchParams.get("type");
	if (loanType != null) {
		let loanTypeList = document.getElementById("loan-type").children;
		for (var i = 0; i < loanTypeList.length; i++) {
			if (loanTypeList[i].id.toLowerCase() == loanType.toLowerCase())
				loanTypeList[i].className += " active";
			else
				loanTypeList[i].className = loanTypeList[i].className.replace(
						" active", "");
		}
	}
</script>