<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container my-4">
	<h3 class="mb-4">Update Account</h3>
	<div class="container">
		<div class="row card-shadow border">
			<div class="col-md-6 p-4 border-end">
				<form:form name="updateAccount" modelAttribute="account" action="save" method="post" enctype="multipart/form-data" onsubmit="submitForm(this)">
					<form:hidden path="id" />
					<spring:bind path="type">
						<fieldset class="row mb-3">
							<legend class="col-form-label col-md-3 pt-0">Account Type :</legend>
							<div class="col-md-9">
								<div class="form-check form-check-inline is-invalid">
									<form:radiobutton class="form-check-input" path="type" value="saving" />
									<label class="form-check-label" for="saving">Saving</label>
								</div>
								<div class="form-check form-check-inline">
									<form:radiobutton class="form-check-input" path="type" value="current" />
									<label class="form-check-label" for="current">Current</label>
								</div>
							</div>
							<div class="invalid-feedback">
								<form:errors path="type" />
							</div>
						</fieldset>
					</spring:bind>
					<spring:bind path="title">
						<div class="mb-3">
							<label for="title" class="form-label">Title</label>
							<form:input class="form-control ${status.error ? 'is-invalid' : ''}" path="title"
								placeholder="Enter Account Title" />
						</div>
						<div class="invalid-feedback">
							<form:errors path="title" />
						</div>
					</spring:bind>
					<spring:bind path="description">
						<div class="mb-3">
							<label for="description" class="form-label">Description</label>
							<form:textarea class="form-control ${status.error ? 'is-invalid' : ''}" path="description" rows="3"
								placeholder="Enter Description" />
							<div class="invalid-feedback">
								<form:errors path="description" />
							</div>
						</div>
					</spring:bind>
					<spring:bind path="interestRate">
						<div class="mb-3">
							<label for="interestRate" class="form-label">Interest Rate</label>
							<div class="input-group">
								<form:input class="form-control ${status.error ? 'is-invalid' : ''}" type="number" path="interestRate"
									placeholder="Enter Interest Rate" min="0" max="100" step="0.01" />
								<span class="input-group-text">%</span>
							</div>
							<div class="invalid-feedback">
								<form:errors path="interestRate" />
							</div>
						</div>
					</spring:bind>
					<spring:bind path="minAmount">
						<div class="mb-3">
							<label for="minAmount" class="form-label">Min Deposit Amount</label>
							<div class="input-group">
								<form:input class="form-control ${status.error ? 'is-invalid' : ''}" type="number" path="minAmount"
									placeholder="Enter Mininum Deposit Amount" min="0" step="0.01" />
								<span class="input-group-text">SGD</span>
							</div>
							<div class="invalid-feedback">
								<form:errors path="minAmount" />
							</div>
						</div>
					</spring:bind>
					<spring:bind path="thumbnail">
						<div class="mb-3">
							<label for="thumbnail" class="form-label">Thumbnail (Image)</label>
							<form:input class="form-control ${status.error ? 'is-invalid' : ''}" path="thumbnail" type="file"
								accept="image/*" />
							<div class="invalid-feedback">
								<form:errors path="thumbnail" />
							</div>
						</div>
					</spring:bind>
					<div class="mb-3">
						<button type="submit" class="btn btn-danger px-5 py-2">Update</button>
					</div>
				</form:form>
			</div>
			<div class="col-md-6 p-4">
				<h4>Preview</h4>
				<div class="row g-4 justify-content-center align-items-center h-100">
					<div class="col-10 col-lg-6">
						<div class="card card-hover">
							<img id="thumbnail" src="data:image/png;base64,${account.getBase64Thumbnail()}" class="card-img-top"
								alt="savingAcc">
							<div class="card-body">
								<h5 id="title" class="card-title">
									<c:out value="${account.getTitle()}" />
								</h5>
								<p id="description" class="card-text text-justify">
									<c:out value="${account.getDescription()}" />
								</p>
								<table class=" table text-justify">
									<tr>
										<td>Interest Rate</td>
										<td><span id="interestRate"><c:out value="${account.getInterestRate()}" /></span>% p.a.</td>
									</tr>
									<tr>
										<td>Min Deposit Amount</td>
										<td><span id="minAmount"><c:out value="${account.getMinAmount()}" /></span> SGD</td>
									</tr>
								</table>
								<button class="btn btn-danger w-100">Apply Now</button>
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
let form = document.forms['updateAccount'];
form['title'].onchange = (event) => {
	let title = document.getElementById("title");
	title.innerHTML = event.target.value;
}

form['description'].onchange = (event) => {
	let description = document.getElementById("description");
	description.innerHTML = event.target.value;
}

form['interestRate'].onchange = (event) => {
	let interestRate = document.getElementById("interestRate");
	interestRate.innerHTML = event.target.value;
}

form['minAmount'].onchange = (event) => {
	let minAmount = document.getElementById("minAmount");
	minAmount.innerHTML = event.target.value;
}

form['thumbnail'].onchange = (event) => {
	console.log(form['thumbnail'].files);
	let file = form['thumbnail'].files[0];
	let thumbnail = document.getElementById("thumbnail");
	thumbnail.src = URL.createObjectURL(file);
}

function submitForm(form) {
	form['thumbnail'].
}
</script>
