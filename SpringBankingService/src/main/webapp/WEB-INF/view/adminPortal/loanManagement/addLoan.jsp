<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container my-4">
	<h3 class="mb-4">Add Loan</h3>
	<div class="container">
		<div class="row card-shadow border">
			<div class="col-md-6 p-4 border-end">
				<form:form name="addLoan" action="add" modelAttribute="loan" method="post" enctype="multipart/form-data">
					<spring:bind path="type">
						<fieldset class="row mb-3">
							<legend class="col-form-label col-md-3 pt-0">Loan Type :</legend>
							<div class="col-md-9">
								<div class="form-check form-check-inline${status.error ? ' is-invalid' : ''}">
									<form:radiobutton class="form-check-input" path="type" value="personal" />
									<label class="form-check-label" for="creditLoan">Personal</label>
								</div>
								<div class="form-check form-check-inline">
									<form:radiobutton class="form-check-input" path="type" value="home" />
									<label class="form-check-label" for="debitLoan">Home</label>
								</div>
								<div class="form-check form-check-inline">
									<form:radiobutton class="form-check-input" path="type" value="home" />
									<label class="form-check-label" for="debitLoan">Car</label>
								</div>
								<div class="form-check form-check-inline">
									<form:radiobutton class="form-check-input" path="type" value="home" />
									<label class="form-check-label" for="debitLoan">Education</label>
								</div>
								<div class="invalid-feedback">
									<form:errors path="type" />
								</div>
							</div>
						</fieldset>
					</spring:bind>
					<spring:bind path="title">
						<div class="mb-3">
							<label for="title" class="form-label">Title</label>
							<form:input class="form-control${status.error ? ' is-invalid' : ''}" path="title"
								placeholder="Enter Loan Title" />
							<div class="invalid-feedback">
								<form:errors path="title" />
							</div>
						</div>
					</spring:bind>
					<spring:bind path="description">
						<div class="mb-3">
							<label for="description" class="form-label">Description</label>
							<form:textarea class="form-control${status.error ? ' is-invalid' : ''}" path="description" rows="3"
								placeholder="Enter Description" />
							<div class="invalid-feedback">
								<form:errors path="description" />
							</div>
						</div>
					</spring:bind>
					<spring:bind path="interestRate">
						<div class="mb-3">
							<label for="interestRate" class="form-label">Interest Rate</label>
							<div class="input-group has-validation">
								<form:input class="form-control${status.error ? ' is-invalid' : ''}" type="number" path="interestRate"
									placeholder="Enter Interest Rate" step="0.01" />
								<span class="input-group-text">%</span>
								<div class="invalid-feedback">
									<form:errors path="interestRate" />
								</div>
							</div>
						</div>
					</spring:bind>
					<spring:bind path="downpayment">
						<div class="mb-3">
							<label for="downpayment" class="form-label">Down Payment</label>
							<div class="input-group has-validation">
								<form:input class="form-control${status.error ? ' is-invalid' : ''}" type="number" path="downpayment"
									placeholder="Enter how many % of down payment to pay" step="0.01" />
								<span class="input-group-text">%</span>
								<div class="invalid-feedback">
									<form:errors path="downpayment" />
								</div>
							</div>
						</div>
					</spring:bind>
					<spring:bind path="thumbnail">
						<div class="mb-3">
							<label for="thumbnail" class="form-label">Thumbnail (Image)</label>
							<form:input class="form-control${status.error ? ' is-invalid' : ''}" path="thumbnail" type="file"
								accept="image/*" />
							<div class="invalid-feedback">
								<form:errors path="thumbnail" />
							</div>
						</div>
						<div class="mb-3">
							<button type="submit" class="btn btn-danger px-5 py-2">Add</button>
						</div>
					</spring:bind>
				</form:form>
			</div>
			<div class="col-md-6 p-4">
				<h4>Preview</h4>
				<div class="row g-4 justify-content-center align-items-center h-100">
					<div class="col-10 col-lg-7">
						<div class="card card-hover h-100">
							<div class="card-thumbnail-img">
								<img id="thumbnailPrev" src="<c:url value="/resources/images/PreviewImage.png" />"
									class="card-img-top img-fluid" alt="prevImg">
							</div>
							<div class="card-body pb-0">
								<h5 id="titlePrev" class="card-title">Loan Title</h5>
								<p id="descriptionPrev" class="card-text text-justify">Loan Description</p>
								<table class="table text-justify">
									<tr>
										<td>Interest Rate</td>
										<td><span id="interestRatePrev">0</span>% p.a.</td>
									</tr>
									<tr>
										<td>Down Payment</td>
										<td><span id="downpaymentPrev">0</span>% from total</td>
									</tr>
								</table>
							</div>
							<div class="card-footer">
								<a class="btn btn-danger stretched-link w-100 mb-2">Apply Now</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- JavaScript to update preview -->
<script>
let form = document.forms['addLoan'];
form['title'].onchange = (event) => {
	let title = document.getElementById("titlePrev");
	title.innerHTML = event.target.value;
}

form['description'].onchange = (event) => {
	let description = document.getElementById("descriptionPrev");
	description.innerHTML = event.target.value;
}

form['interestRate'].onchange = (event) => {
	let interestRate = document.getElementById("interestRatePrev");
	interestRate.innerHTML = event.target.value;
}

form['downpayment'].onchange = (event) => {
	let downpayment = document.getElementById("downpaymentPrev");
	downpayment.innerHTML = event.target.value;
}

form['thumbnail'].onchange = (event) => {
	let file = form['thumbnail'].files[0];
	let thumbnail = document.getElementById("thumbnailPrev");
	thumbnail.src = URL.createObjectURL(file);
}
</script>
