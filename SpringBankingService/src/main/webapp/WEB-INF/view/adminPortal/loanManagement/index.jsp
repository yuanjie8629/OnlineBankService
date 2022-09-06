<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto my-auto">
			<h3>Manage Loans</h3>
		</div>
		<div class="col-auto my-auto">
			<a href="<c:url value="/admin/loan-management/add" />" role="button" class="btn btn-danger"
				style="padding: 12px 36px;"> <strong>Add Loan</strong>
			</a>
		</div>
	</div>
	<div class="card card-shadow my-4">
		<div class="card-body p-4">
			<h4 class="mb-3">Loan List</h4>
			<div class="row justify-content-between align-items-center g-3 my-4">
				<div class="col-auto">
					<!-- Loan Type Tabs -->
					<nav id="loan-type" class="nav nav-pills nav-tab-category fw-bold">
						<a class="nav-link px-3 py-2 me-4 active" href="<c:url value="/admin/loan-management" />" > All </a>
						<a class="nav-link px-3 py-2 me-4" href="<c:url value="/admin/loan-management?type=personal" />">Personal Loan</a>
						<a class="nav-link px-3 py-2 me-4" href="<c:url value="/admin/loan-management?type=home" />" >Home Loan</a>
						<a class="nav-link px-3 py-2 me-4" href="<c:url value="/admin/loan-management?type=car" />" >Car Loan</a>
						<a class="nav-link px-3 py-2" href="<c:url value="/admin/loan-management?type=education" />" >Education Loan</a>
					</nav>
				</div>
				<div class="col-4">
					<form>
						<div class="input-group">
							<input type="search" class="form-control" name="searchParam" placeholder="Search Loan Title" />
							<button type="button" class="btn btn-danger">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</form>
				</div>
			</div>
			<!-- Loan List -->
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col" style="width: 15%;">Thumbnail</th>
						<th scope="col">Title</th>
						<th scope="col">Type</th>
						<th scope="col" style="width: 20%;">Description</th>
						<th scope="col">Interest Rate</th>
						<th scope="col">Down Payment</th>
						<th scope="col" style="width: 10%;"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td style="max-height: 50px;"><img
							src="<c:url value="/resources/images/basePortal/loan/OBS_PersonalLoan.jpg" />" alt="test"
							class="img-fluid" /></td>
						<td>OBS Personal Loan</td>
						<td>Personal</td>
						<td>Get a OBS Bank Personal Loan now with affordable monthly installments.</td>
						<td>5.88% p.a.</td>
						<td>5% from total</td>
						<td>
							<div class="row g-3">
								<div class="col-12">
									<a href="<c:url value="/admin/loan-management/update/1" />" role="button"
										class="btn btn-outline-primary btn-sm w-100"> <i class="fa-solid fa-pen-to-square me-2"></i> Update
									</a>
								</div>
								<div class="col-12">
									<button class="btn btn-outline-danger btn-sm w-100" data-bs-toggle="modal" data-bs-target="#deleteLoanModal">
										<i class="fa-solid fa-trash me-2"></i>Delete
									</button>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- Pagination -->
			<nav aria-label="AccMgmtPagination">
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
<jsp:include page="./deleteLoan.jsp" />
<!-- Script to make tab active based on url params -->
<script>
	let searchParams = new URLSearchParams(window.location.search);
	let loanType = searchParams.get("type");
	if (loanType != null) {
		let loanTypeList = document.getElementById("loan-type").children;
		for (var i = 0; i < loanTypeList.length; i++) {
			if (loanTypeList[i].innerHTML.toLowerCase().replace(" loan","") == loanType.toLowerCase()
					.toLowerCase())
				loanTypeList[i].className += " active";
			else
				loanTypeList[i].className = loanTypeList[i].className.replace(
						" active", "");
		}
	}
</script>
