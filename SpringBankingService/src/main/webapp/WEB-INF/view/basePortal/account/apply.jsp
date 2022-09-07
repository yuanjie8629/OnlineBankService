<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container w-75">
	<div class="bs-stepper">
		<div class="bs-stepper-header w-75 m-auto" role="tablist">
			<!-- your steps here -->
			<div class="step" data-target="#">
				<button type="button" class="step-trigger" role="tab" aria-controls="logins-part" id="logins-part-trigger">
					<span class="bs-stepper-circle">1</span>
				</button>
			</div>
			<div class="line"></div>
			<div class="step" data-target="#information-part">
				<button type="button" class="step-trigger" role="tab" aria-controls="information-part" id="information-part-trigger">
					<span class="bs-stepper-circle">2</span>
				</button>
			</div>
		</div>
		<div class="bs-stepper-content">
			<!-- your steps content here -->
			<div id="logins-part" class="content" role="tabpanel" aria-labelledby="logins-part-trigger"></div>
			<div id="information-part" class="content" role="tabpanel" aria-labelledby="information-part-trigger"></div>
		</div>
	</div>
</div>