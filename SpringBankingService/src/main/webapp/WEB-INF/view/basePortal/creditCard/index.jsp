<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Carousel -->
<div class="row m-0">
	<div class="carousel p-0">
		<div class="carousel-item active" style="height: 300px;">
			<div class="container">
				<div class="carousel-caption carousel-caption-middle">
					<h1>Credit Cards</h1>
				</div>
			</div>
			<img src="resources/images/basePortal/creditCard/CreditCardBackground.jpg" alt="creditCard" height="300">
		</div>
	</div>
</div>
<div class="container my-5">
	<!-- List of Credit Cards Available -->
	<c:choose>
		<c:when test="${not empty cardList}">
			<div class="my-5">
				<div class="row g-4">
					<div class="col-3">
						<c:forEach var="card" items="${cardList}">
							<div class="card card-hover h-100">
								<div class="card-thumbnail-img p-1">
									<img id="thumbnailPrev" src="data:image/png;base64,${card.getBase64Thumbnail()}" class="card-img-top img-fluid"
										style="object-fit: contain;" alt="${card.getTitle()}">
								</div>
								<div class="card-body pb-0">
									<h5 id="titlePrev" class="card-title">
										<c:out value="${card.getTitle()}" />
									</h5>
									<p id="descriptionPrev" class="card-text text-justify">
										<c:out value="${card.getDescription()}" />
									</p>
									<table class="table text-justify">
										<tr>
											<td>Min Income</td>
											<td><span id="minIncomePrev"> <fmt:formatNumber value="${card.getMinIncome()}" type="currency"
														currencyCode="SGD" />
											</span></td>
										</tr>
										<tr>
											<td>Interest Rate</td>
											<td><span id="interestRatePrev"> <fmt:formatNumber value="${card.getInterestRate() / 100}"
														type="percent" minFractionDigits="2" />
											</span> p.a.</td>
										</tr>
										<tr>
											<td>Annual Fee</td>
											<td><span id="annualFeePrev"> <fmt:formatNumber value="${card.getAnnualFee()}" type="currency"
														currencyCode="SGD" />
											</span></td>
										</tr>
									</table>
								</div>
								<div class="card-footer">
								<a class="btn btn-danger stretched-link w-100 mb-2">Apply Now</a>
							</div>
							</div>
						</c:forEach>
					</div>
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
