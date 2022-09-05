<%@ page import="com.utils.URLUtils"%>
<div class="container my-4">
	<h3 class="mb-4">Add Account</h3>
	<div class="container">
		<div class="row card-shadow border">
			<div class="col-md-6 p-4 border-end">
				<form name="addAccount">
					<fieldset class="row mb-3">
						<legend class="col-form-label col-md-3 pt-0">Account Type :</legend>
						<div class="col-md-9">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="type" value="saving"> <label class="form-check-label"
									for="saving">Saving</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="type" value="current"> <label
									class="form-check-label" for="current">Current</label>
							</div>
						</div>
					</fieldset>
					<div class="mb-3">
						<label for="title" class="form-label">Title</label> <input class="form-control" name="title"
							placeholder="Enter Account Title">
					</div>
					<div class="mb-3">
						<label for="description" class="form-label">Description</label>
						<textarea class="form-control" name="description" rows="3" placeholder="Enter Description"></textarea>
					</div>
					<div class="mb-3">
						<label for="interestRate" class="form-label">Interest Rate</label>
						<div class="input-group">
							<input class="form-control" type="number" name="interestRate" placeholder="Enter Interest Rate" min="0" max="100"
								step="0.01"> <span class="input-group-text">%</span>
						</div>
					</div>
					<div class="mb-3">
						<label for="minAmount" class="form-label">Min Deposit Amount</label>
						<div class="input-group">
							<input class="form-control" type="number" name="minAmount" placeholder="Enter Mininum Deposit Amount" min="0"
								step="0.01"> <span class="input-group-text">SGD</span>
						</div>
					</div>
					<div class="mb-3">
						<label for="thumbnail" class="form-label">Thumbnail (Image)</label> <input class="form-control" name="thumbnail"
							type="file" accept="image/*">
					</div>
					<div class="mb-3">
						<button type="submit" class="btn btn-danger px-5 py-2">Add</button>
					</div>
				</form>
			</div>
			<div class="col-md-6 p-4">
				<h4>Preview</h4>
				<div class="row g-4 justify-content-center align-items-center h-100">
					<div class="col-10 col-lg-6">
						<div class="card card-hover">
							<img id="thumbnail" src="${URLUtils.getBasePath()}/resources/images/PreviewImage.png" class="card-img-top"
								alt="savingAcc">
							<div class="card-body">
								<h5 id="title" class="card-title">Account Title</h5>
								<p id="description" class="card-text text-justify">Account Description</p>
								<table class=" table text-justify">
									<tr>
										<td>Interest Rate</td>
										<td><span id="interestRate">0</span>% p.a.</td>
									</tr>
									<tr>
										<td>Min Deposit Amount</td>
										<td><span id="minAmount">0</span> SGD</td>
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
let form = document.forms['addAccount'];
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
</script>
