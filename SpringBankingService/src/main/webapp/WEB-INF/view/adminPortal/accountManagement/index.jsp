<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.utils.StringUtils"%>
<div class="container my-4">
	<div class="row justify-content-between">
		<div class="col-auto my-auto">
			<h3>Manage Accounts</h3>
		</div>
		<div class="col-auto my-auto">
			<a href="<c:url value="/admin/account-management/add" />" role="button" class="btn btn-danger"
				style="padding: 12px 36px;"> <strong>Add Account</strong></a>
		</div>
	</div>
	<form name="filterAcc" method="get" action="<c:url value="/admin/account-management" />" onsubmit="validateForm(this)">
		<input type="hidden" name="type">
		<input type="hidden" name="page" value="1">
		<div class="card card-shadow my-4">
			<div class="card-body p-4">
				<div class="row justify-content-between">
					<div class="col-auto">
						<h4 class="mb-3">Account List</h4>
					</div>
					<div class="col-auto">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="showDeleted" onchange="submitForm()" />
							<label class="form-check-label" for="showDeleted">Show Deleted Accounts</label>
						</div>
					</div>
				</div>
				<div class="row justify-content-between align-items-center g-3 my-4">
					<div class="col-auto">
						<!-- Account Type Tabs -->
						<nav id="account-type" class="nav nav-pills nav-tab-category fw-bold">
							<a id="all" class="nav-link px-3 py-2 me-4 active" href="javascript:showAccType('all');">All</a> 
							<a id="saving" class="nav-link px-3 py-2 me-4" href="javascript:showAccType('saving');">Saving Account</a>
							<a id="current" class="nav-link px-3 py-2" href="javascript:showAccType('current');">Current Account</a>
						</nav>
					</div>
					<div class="col-4">
						<div class="input-group">
							<input type="search" class="form-control" name="title" placeholder="Search Account Title" />
							<button type="submit" class="btn btn-danger">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</div>
				</div>
				<!-- Account List -->
				<c:choose>
					<c:when test="${not empty accList}">
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col" style="width: 15%;">Thumbnail</th>
									<th scope="col">Title</th>
									<th scope="col">Type</th>
									<th scope="col" style="width: 20%;">Description</th>
									<th scope="col">Interest Rate</th>
									<th scope="col">Min Deposit Amount</th>
									<th scope="col" style="width: 10%;"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="acc" items="${accList}">
									<tr>
										<th scope="row"><c:out value="${acc.getId()}" /></th>
										<td style="max-height: 50px;"><img src="data:image/png;base64,${acc.getBase64Thumbnail()}"
											alt="accthumbnail-${acc.getId()}" class="img-fluid" /></td>
										<td><c:out value="${acc.getTitle()}" /></td>
										<td><c:out value="${StringUtils.capitalize(acc.getType())}" /></td>
										<td><c:out value="${acc.getDescription()}" /></td>
										<td><fmt:formatNumber value="${acc.getInterestRate()}" type="percent" minFractionDigits="2" /> p.a.</td>
										<td><fmt:formatNumber value="${acc.getMinAmount()}" type="currency" currencyCode="SGD" /></td>
										<td>
											<div class="row g-3">
												<div class="col-12">
													<a href="<c:url value="/admin/account-management/update/${acc.getId()}" />" role="button"
														class="btn btn-outline-primary btn-sm w-100"> <i class="fa-solid fa-pen-to-square me-2"></i> Update
													</a>
												</div>
												<div class="col-12">
													<button type="button" class="btn btn-outline-danger btn-sm w-100" data-bs-toggle="modal" data-bs-target="#deleteAccModal">
														<i class="fa-solid fa-trash me-2"></i>Delete
													</button>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- Pagination -->
						<nav aria-label="AccMgmtPagination">
							<ul class="pagination float-end mt-2 mb-0">
								<li class="page-item">
									<a id="prevPage" class="page-link" href="javascript:movePage(-1)" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<c:forEach var="page" begin="1" end="${totalPage}">
									<li class="page-item">
										<a id="page-${page}" class="page-link" href="javascript:showPage(${page})"><c:out value="${page}" /></a>
									</li>
								</c:forEach>
								<li class="page-item">
									<a id="nextPage" class="page-link" href="javascript:movePage(1)" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</ul>
						</nav>
					</c:when>
					<c:otherwise>
						<div class="m-auto" style="max-width: 400px;">
							<img src="<c:url value="/resources/images/Empty.png" />" class="img-fluid">
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</form>
</div>
<jsp:include page="./deleteAccount.jsp" />
<script>
	/* Script to make tab active based on url params */
	let queryParams = new URLSearchParams(window.location.search);
	let accType = queryParams.get("type");
	let filterAccForm = document.forms["filterAcc"];
	if (accType != null) {
		filterAccForm['type'].value = accType;
		let accTypeList = document.getElementById("account-type").children;
		for (var i = 0; i < accTypeList.length; i++) {
			if (accTypeList[i].id.toLowerCase() == accType.toLowerCase())
				accTypeList[i].className += " active";
			else
				accTypeList[i].className = accTypeList[i].className.replace(
						" active", "");
		}
	}

	/* Script to add current search value to the search input according to url query */
	let search = queryParams.get("title");
	if (search != null) {
		filterAccForm['title'].value = search;
	}
	
	/* Script to tick the showDeleted checkbox according to url query*/
	let showDeleted = queryParams.get("showDeleted");
	if (showDeleted != null) {
		filterAccForm['showDeleted'].checked = true;
	}
	
	/* Script to make page active depending on the url query */
	let page = queryParams.get("page")
	if (page != null) {
		filterAccForm['page'].value = page;
		let selectedPage = document.getElementById("page-" + page);
		let pageItemList = document.getElementsByClassName("page-item");
		for (var pageItem of pageItemList) {
			pageItem.className = pageItem.className.replace(" active", "");
		}
		selectedPage.className += " active";
	}
	let prevPage = document.getElementById("prevPage");
	if (page == null || page == 1) {
		prevPage.className += " disabled";
		let selectedPage = document.getElementById("page-1");
		selectedPage.className += " active";
	} else {
		prevPage.className = prevPage.className.replace(" disabled", "");
	}
	
	let nextPage = document.getElementById("nextPage");
	if (page == ${totalPage}) {
		nextPage.className += " disabled";
	} else {
		nextPage.className = nextPage.className.replace(" disabled", "");
	}
	
	/* Function to append accType to search query */
	function showAccType(type) {
		let filterAccForm = document.forms["filterAcc"];
		if (type != "all") {
		filterAccForm['type'].value = type;
		} else {
			filterAccForm['type'].disabled = true;
		}
		submitForm();
	}
	
	function movePage(num) {
		let filterAccForm = document.forms["filterAcc"];
		filterAccForm['page'].value = parseInt(filterAccForm['page'].value) + parseInt(num);
		submitForm();
	}
	
	function showPage(page) {
		let filterAccForm = document.forms["filterAcc"];
		filterAccForm['page'].value = page;
		submitForm();
	}
	
	
	/* Function to remove empty query from the search form  */
	function validateForm(form) {
		for (var element of form.elements){
			if (element.value == "") {
				element.disabled = true;
			}
		}
	}
	
	function submitForm() {
		let form = document.forms["filterAcc"];
		validateForm(form);
		form.submit();
	}
	
	
</script>