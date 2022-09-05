<%@ page import="com.utils.URLUtils"%>
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto my-auto">
			<h3>Manage Cards</h3>
		</div>
		<div class="col-auto my-auto">
			<a href="${URLUtils.getBasePath()}/admin/card-management/add" role="button" class="btn btn-danger"
				style="padding: 12px 36px;"> <strong>Add Card</strong>
			</a>
		</div>
	</div>
	<div class="card card-shadow my-4">
		<div class="card-body p-4">
			<h4 class="mb-3">Card List</h4>
			<div class="row justify-content-between align-items-center g-3 my-4">
				<div class="col-auto">
					<!-- Card Type Tabs -->
					<nav id="card-type" class="nav nav-pills nav-tab-category fw-bold">
						<a class="nav-link px-3 py-2 me-4 active" href="${URLUtils.getBasePath()}/admin/card-management">All</a> 
						<a class="nav-link px-3 py-2 me-4" href="${URLUtils.getBasePath()}/admin/card-management?type=creditCard">Credit Card</a> 
						<a class="nav-link px-3 py-2" href="${URLUtils.getBasePath()}/admin/card-management?type=debitCard">Debit Card</a>
					</nav>
				</div>
				<div class="col-4">
					<form>
						<div class="input-group">
							<input type="search" class="form-control" name="searchParam" placeholder="Search Card Title" />
							<button type="button" class="btn btn-danger">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</form>
				</div>
			</div>
			<!-- Card List -->
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col" style="width: 15%;">Thumbnail</th>
						<th scope="col">Title</th>
						<th scope="col">Type</th>
						<th scope="col" style="width: 20%;">Description</th>
						<th scope="col">Min Income</th>
						<th scope="col">Interest Rate</th>
						<th scope="col">Annual Fee</th>
						<th scope="col" style="width: 10%;"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td style="max-height: 50px;"><img
							src="${URLUtils.getBasePath()}/resources/images/basePortal/creditCard/OBS_signature.png" alt="test"
							class="img-fluid" /></td>
						<td>OBS Signaure Credit Card</td>
						<td>Credit Card</td>
						<td>Up to 5% cashback on online & Visa contactless spend</td>
						<td>38000 SGD p.a.</td>
						<td>18% p.a.</td>
						<td>180 SGD</td>
						<td>
							<div class="row g-3">
								<div class="col-12">
									<a href="${URLUtils.getBasePath()}/admin/card-management/update/1" role="button"
										class="btn btn-outline-primary btn-sm w-100"> <i class="fa-solid fa-pen-to-square me-2"></i> Update
									</a>
								</div>
								<div class="col-12">
									<button class="btn btn-outline-danger btn-sm w-100" data-bs-toggle="modal" data-bs-target="#deleteCardModal">
										<i class="fa-solid fa-trash me-2"></i>Delete
									</button>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- Pagination -->
			<nav aria-label="CardMgmtPagination">
				<ul class="pagination float-end mt-2 mb-0">
					<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>
<jsp:include page="./deleteCard.jsp" />
<!-- Script to make tab active based on url params -->
<script>
	let searchParams = new URLSearchParams(window.location.search);
	let cardType = searchParams.get("type");
	if (cardType != null) {
		let cardTypeList = document.getElementById("card-type").children;
		for (var i = 0; i < cardTypeList.length; i++) {
			if (cardTypeList[i].innerHTML.toLowerCase().replace(" ", "") == cardType.toLowerCase())
				cardTypeList[i].className += " active";
			else
				cardTypeList[i].className = cardTypeList[i].className.replace(
						" active", "");
		}
	}
</script>