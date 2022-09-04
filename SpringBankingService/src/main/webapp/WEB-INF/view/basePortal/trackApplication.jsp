<div class="container my-5">
	<div class="row card-shadow">
		<div class="col-md-6 p-5">
			<h3>Check Your Application Status</h3>
			<form class="my-4">
				<fieldset class="row mb-3">
					<legend class="col-form-label col-md-4 pt-0">Application Type :</legend>
					<div class="col-md-8">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="type" value="account"> <label class="form-check-label" for="account">Account</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="type" value="creditCard"> <label class="form-check-label" for="credit card">Credit Card</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="type" value="loan"> <label class="form-check-label" for="loan">Loan</label>

						</div>
					</div>
				</fieldset>
				<div class="mb-3">
				  <label for="refNum" class="form-label">Reference Number / ID :</label>
				  <input class="form-control" placeholder="Enter the reference number or ID for your application">
				</div>
				<div class="mb-3">
					<button type="submit" class="btn btn-danger px-5 py-2">Track</button>
				</div>
			</form>
		</div>
		<div class="col-md-6 p-0 track-app-bg">
		</div>
	</div>
</div>
