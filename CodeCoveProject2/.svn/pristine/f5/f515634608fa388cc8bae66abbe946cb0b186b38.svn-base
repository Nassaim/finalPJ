<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--Main Search Modal-->
<!-- Modal -->
<div class="modal" id="modal_search" tabindex="-1"
	aria-labelledby="modal_searchLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<!--Search inner-->
				<div class="">

					<!--Search form-->
					<form>
						<div class="position-relative mb-4">
							<div class="text-body-secondary">
								<span
									class="material-symbols-rounded position-absolute start-0 top-50 translate-middle-y ms-3">
									search </span>
							</div>
							<input type="text" autofocus
								class="form-control form-control-lg border-2 border-primary border ps-8"
								placeholder="Search App...">
						</div>
					</form>

					<!--Recently searched-->
					<div class="d-flex mb-2 align-items-center">
						<h6 class="d-block mb-0 me-3 flex-grow-1">
							<span
								class="material-symbols-rounded align-middle me-1 fs-5 opacity-50">
								history </span> Recent
						</h6>
						<a href="#!" class="small flex-shrink-0 d-block">Clear All</a>
					</div>
					<div class="list-group">
						<!--Recently searched item-->
						<a href="#"
							class="list-group-item px-3 d-flex overflow-hidden align-items-center list-group-item-action">
							<div class="flex-grow-1 overflow-hidden">
								<span class="text-truncate">Campaign reports</span>
							</div>
						</a>
						<!--Recently searched item-->
						<a href="#"
							class="list-group-item px-3 d-flex overflow-hidden align-items-center list-group-item-action">
							<div class="flex-grow-1 overflow-hidden">
								<span class="text-truncate">Funnel reports</span>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="pt-0 border-top-0 modal-footer">
				<span class="small">Press ESC or <span
					class="badge bg-secondary" role="button" data-bs-dismiss="modal">Click
						me</span> to close
				</span>
			</div>
		</div>
	</div>
</div>

<!--//Page Toolbar//-->
<div class="toolbar px-3 px-lg-6 py-3">
	<div class="position-relative container-fluid px-0">
		<div class="row align-items-center position-relative">
			<div class="col-md-8 mb-4 mb-md-0">
				<h3 class="mb-2">공통코드 관리</h3>

				<nav aria-label="breadcrumb">
					<ol class="breadcrumb mb-0">
						<li class="breadcrumb-item"><a href="index.html">메인화면</a></li>
						<li class="breadcrumb-item active">공통코드 관리</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!--//Page Toolbar End//-->

<!--//Page content//-->
<div class="content pt-3 px-3 px-lg-6 d-flex flex-column-fluid">
	<div class="container-fluid px-0">
		<div class="row">
			<div class="col-12 mb-3 mb-lg-5">
				<div class="card">
					<div class="table-responsive">
						<div id="datatable_wrapper" class="dataTables_wrapper dt-bootstrap5 no-footer">
							<div class="row">
								<div class="col-sm-12">
									<table id="datatable" class="table mt-0 table-striped table-card table-nowrap">
										<thead class="text-uppercase small text-body-secondary">
											<tr>
												<th >관리코드ID</th>
												<th >관리코드내용</th>
												<th >관리코드그룹</th>
												<th >관리코드그룹이름</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${codeList }" var="code">
												<tr>
													<td>
														<a href="/coco/admin/codeDetail?comCode=${code.comCode }">
															${code.comCode } 
														</a>
													</td>
													<td>${code.comCodeNm } </td>
													<td>${code.comCodeGrp } </td>
													<td>${code.comCodeGrpNm } </td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12 col-md-5">
									<div class="dataTables_info" id="datatable_info" role="status" aria-live="polite">
										<a href="/coco/admin/codeGroupList">관리코드그룹 관리</a>
										<a href="/coco/admin/codeForm">관리코드 등록</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--//Page content End//-->

		

<script type="text/javascript">

</script>
