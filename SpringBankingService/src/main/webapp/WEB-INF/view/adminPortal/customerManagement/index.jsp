<%@ page import="com.utils.URLUtils"%>
<div class="container my-4">
	<div class="my-auto">
		<h3>Manage Customers</h3>
	</div>
	<div class="card card-shadow my-5">
		<div class="card-body p-4">
			<h4 class="mb-3">Customer List</h4>
			<div class="row justify-content-between align-items-center g-3 my-4">
				<div class="col-4">
					<form>
						<div class="input-group">
							<input type="search" class="form-control" name="searchParam" placeholder="Search Customer" />
							<button type="button" class="btn btn-danger">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</form>
				</div>
			</div>
			<!-- Customer List -->
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Contact No.</th>
						<th scope="col">Identity No.</th>
						<th scope="col">Birthdate</th>
						<th scope="col">Occupation</th>
						<th scope="col">Status</th>
						<th scope="col" style="width: 10%;"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Tan Yuan Jie</td>
						<td>yuan@gmail.com</td>
						<td>+65 1234 5678</td>
						<td>M12345678X</td>
						<td>17-08-2000</td>
						<td>Java Developer</td>
						<td>
							<div class="row align-items-center">
								<div class="col-auto">
									<span class="dot bg-success"></span>
								</div>
								<div class="col-auto p-0">Active</div>
							</div>
						</td>
						<td class="text-center">
							<div class="dropdown-center">
								<i class="fa-solid fa-ellipsis fa-xl menu-ellipsis" data-bs-toggle="dropdown" aria-expanded="false"></i>
								<ul class="dropdown-menu">
									<li><a href="${URLUtils.getBasePath()}/admin/customer-management/view/1" class="dropdown-item" style="cursor: pointer;"><i class="fa-solid fa-eye fa-fw me-2"></i>View</a></li>
									<li><a href="${URLUtils.getBasePath()}/admin/customer-management/update/1" class="dropdown-item" style="cursor: pointer;"><i class="fa-solid fa-pen-to-square fa-fw me-2"></i>Update</a></li>
									<li><a class="dropdown-item" style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#deactivateCustModal"><i class="fa-solid fa-circle-xmark fa-fw me-2"></i>Deactivate</a></li>
								</ul>
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
<jsp:include page="./deactivateCustomer.jsp" />