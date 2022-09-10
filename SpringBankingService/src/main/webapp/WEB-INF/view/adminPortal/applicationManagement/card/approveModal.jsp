<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Approve Modal -->
<form:form name="cardAppApprove" modelAttribute="custCard" action="approve" method="post" class="needs-validation"
	novalidate="true">
	<input type="hidden" name="appId" value="${cardApp.id}" />
	<div class="modal fade" id="approveModal" tabindex="-1" aria-labelledby="approveModal" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered modal-confirm">
			<div class="modal-content p-4">
				<div class="d-flex justify-content-end">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-header flex-column">
					<i class="fa-solid fa-thumbs-up fa-7x text-success"></i>
					<h3 class="mt-4 text-capitalize">Card Application Approval</h3>
				</div>
				<div class="modal-body px-5">
					<p class="text-center">Please enter the following details to approve the card application</p>
					<table class="table table-borderless table-fit m-auto">
						<tr>
							<spring:bind path="creditLimit">
								<td class="align-middle"><label class="form-label m-0" for="creditLimit">Credit Limit</label></td>
								<td>
									<div class="input-group has-validation">
										<form:input class="form-control${status.error ? ' is-invalid' : ''}" path="creditLimit" type="number"
											step="0.01" required="required" />
										<span class="input-group-text">SGD</span>
										<div class="invalid-feedback">
											<c:choose>
												<c:when test="${status.error}">
													<form:errors path="creditLimit" />
												</c:when>
												<c:otherwise>
												Please enter the credit limit for the credit card.
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</td>
							</spring:bind>
						<tr>
						<tr>
							<spring:bind path="cardNum">
								<td class="align-middle"><label class="form-label m-0" for="cardNum">Card Number</label></td>
								<td><form:input id="cardNum" class="form-control${status.error ? ' is-invalid' : ''}" path="cardNum"
										type="text" placeholder="0000 0000 0000 0000" minlength="19" maxlength="19" required="required" />
									<div class="invalid-feedback">
										<c:choose>
											<c:when test="${status.error}">
												<form:errors path="cardNum" />
											</c:when>
											<c:otherwise>
												Please enter the card number.
											</c:otherwise>
										</c:choose>
									</div></td>
							</spring:bind>
						<tr>
						<tr>
							<spring:bind path="brand">
								<td><label class="form-label m-0" for="brand">Card Brand</label></td>
								<td><form:select class="form-select${status.error ? ' is-invalid' : ''}" path="brand">
										<option value="Visa">Visa</option>
										<option value="Mastercard">Mastercard</option>
										<option value="UnionPay">UnionPay</option>
										<option value="JCB">JCB</option>
										<option value="American Express">American Express</option>
									</form:select>
									<div class="invalid-feedback">
										<c:choose>
											<c:when test="${status.error}">
												<form:errors path="brand" />
											</c:when>
											<c:otherwise>
												Please select the card brand.
											</c:otherwise>
										</c:choose>
									</div></td>
							</spring:bind>
						</tr>
						<tr>
							<spring:bind path="expirationDate">
								<td class="align-middle"><label class="form-label m-0" for="expiratioNDate">Expiration Date</label></td>
								<td><input class="form-control${status.error ? ' is-invalid' : ''}" type="text" name="expDate" id="expDate"
									placeholder="MM/YY" minlength="5" maxlength="5" required="required" />
									<div class="invalid-feedback">
										<c:choose>
											<c:when test="${status.error}">
												<form:errors path="cvv" />
											</c:when>
											<c:otherwise>
												Please enter the card expiration date.
											</c:otherwise>
										</c:choose>
									</div></td>
							</spring:bind>
						<tr>
						<tr>
							<spring:bind path="cvv">
								<td class="align-middle"><label class="form-label m-0" for="cvv">Card CVV</label></td>
								<td><form:input class="form-control${status.error ? ' is-invalid' : ''}" path="cvv"
										placeholder="Enter the card cvv number" minlength="3" maxlength="3" pattern="^\d{3}$" required="required " />
									<div class="invalid-feedback">
										<c:choose>
											<c:when test="${status.error}">
												<form:errors path="cvv" />
											</c:when>
											<c:otherwise>
												Please enter the 3 digits cvv number.
											</c:otherwise>
										</c:choose>
									</div></td>
							</spring:bind>
						<tr>
					</table>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-secondary mx-2" data-bs-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-success mx-2">Approve</button>
				</div>
			</div>
		</div>
	</div>
</form:form>
<script>
(() => {
	  'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  const forms = document.querySelectorAll('.needs-validation')

	  // Loop over them and prevent submission
	  Array.from(forms).forEach(form => {
	    form.addEventListener('submit', event => {
	      if (!form.checkValidity()) {
	        event.preventDefault()
	        event.stopPropagation()
	      }

	      form.classList.add('was-validated')
	    }, false)
	  })
	})()
	
	//For Card Number Input Formatting
	var cardNum = document.getElementById('cardNum');
	cardNum.onkeyup = function (e) {
	    if (this.value == this.lastValue) return;
	    var caretPosition = this.selectionStart;
	    
	 	// Remove any characters other than digits
	    var sanitizedValue = this.value.replace(/[^0-9]/gi, '');
	    var parts = [];
	    
	    for (var i = 0, len = sanitizedValue.length; i < len; i += 4) {
	        parts.push(sanitizedValue.substring(i, i + 4));
	    }
	    
	    for (var i = caretPosition - 1; i >= 0; i--) {
	        var c = this.value[i];
	        if (c < '0' || c > '9') {
	            caretPosition--;
	        }
	    }
	    caretPosition += Math.floor(caretPosition / 4);
	    
	    this.value = this.lastValue = parts.join(' ');
	    this.selectionStart = this.selectionEnd = caretPosition;
	}
	
	var expDate = document.getElementById('expDate');
	expDate.onkeyup = function (e) {
	    if (this.value == this.lastValue) return;
	    var caretPosition = this.selectionStart;
	    
	    // Remove any characters other than digits
	    var sanitizedValue = this.value.replace(/[^0-9]/gi, '');
	    var parts = [];
	    
	    for (var i = 0, len = sanitizedValue.length; i < len; i += 2) {
	        parts.push(sanitizedValue.substring(i, i + 2));
	    }
	    
	    for (var i = caretPosition - 1; i >= 0; i--) {
	        var c = this.value[i];
	        if (c < '0' || c > '9') {
	            caretPosition--;
	        }
	    }
	    caretPosition += Math.floor(caretPosition / 2);
	    
	    this.value = this.lastValue = parts.join('/');
	    this.selectionStart = this.selectionEnd = caretPosition;
	}
</script>