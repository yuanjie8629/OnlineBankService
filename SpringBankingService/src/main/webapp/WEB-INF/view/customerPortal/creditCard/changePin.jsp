<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cardPinMsg" value="${empty isPin ? 'Set' : 'Change'}" />
<div class="modal fade" id="changePinModal" tabindex="-1" aria-labelledby="changePinModal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><c:out value="${cardPinMsg}" /> Card Pin</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form name="changePin" class="needs-validation" action="update-pin" method="post" novalidate>
				<input type="hidden" name="id" value="${custCreditCard.id}">
				<div class="modal-body">
					<c:if test="${not empty changePinMsg}">
						<div class="alert alert-danger" role="alert">
							<c:out value="${changePinMsg}" />
						</div>
					</c:if>
					<div class="mb-3">
						<label class="form-label" for="password">Card Number</label>
						<input id="cardNum" class="form-control" name="cardNum" type="text" placeholder="0000 0000 0000 0000" minlength="19" maxlength="19" required/>
						<div class="invalid-feedback">Please enter your card number.</div>
					</div>
					<div class="mb-3">
						<label class="form-label" for="password">Password</label> <input name="password" type="password" class="form-control" required>
						<div class="invalid-feedback">Please enter your password.</div>
					</div>
					<div class="mb-3">
						<label class="form-label" for="password">Card Pin Number</label>
						<input id="pin" class="form-control" type="password" name="pin" minlength="6" maxlength="6" onkeyup="pinChange()" required>
						<div id="pinErr" class="invalid-feedback">Please enter new card pin number.</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-danger"><c:out value="${cardPinMsg}" /></button>
				</div>
			</form>
		</div>
	</div>
</div>
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
	
	// Card Pin Validation
	function pinChange() {
		let pin = document.getElementById("pin");
		let pinErr = document.getElementById("pinErr");
		if (pin.value == "") {
			pinErr.innerHTML = "Please enter your 6 digits card pin.";
			pin.classList.add("is-invalid");
		} else if (pin.value.length != 6) {
			pinErr.innerHTML = "The card pin must be 6 digits.";
			pin.classList.add("is-invalid");
		} else {
			pinErr.innerHTML = "";
			pin.classList.remove("is-invalid");
		}
	}
</script>