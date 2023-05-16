<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<body>

		<!--//Page Toolbar//-->
		<div class="toolbar py-2">
			<div class="position-relative container-fluid">
				<div class="row align-items-center position-relative">
					<div class="col-md-8 mb-4 mb-md-0">
						<h3 class="display-4 mb-4">자유 게시판</h3>
					</div>
					<div class="col-md-4 text-md-end">
						<a href="https://datatables.net/" target="_blank"
							class="text-body"> <span
							class="material-symbols-rounded align-middle ms-1 fs-5"> </span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!--//Page Toolbar End//-->
		<!--//////검색 시작 /////////// -->
		<div class="row">
				<form class="mb-4" method="post" action="/freeBoard/list"
					id="searchForm" name="searchForm">
					<div class="row mx-n2 align-items-center">
						<div class="col-12 px-2 col-sm-12 mb-md-0 col-md mb-3">
							<div class="position-relative d-flex justify-content-end me-6">
								<!--Input icon-->
								<div class="d-flex col-sm-3 align-middle">
									<div class="col">
										<span class="z-1 mt-3 d-flex width-3x justify-content-center align-middle">
											<i class="bx bx-search"></i>
										</span> <input type="hidden" id="page" name="page">
									</div>
									<input type="text" id="searchWord" name="searchWord" class="form-control py-2 ps-6" placeholder="검색어를 입력해주세요." value="${searchWord }">
								</div> 
							</div>
						</div>
<!-- 						<div class="col-12 col-md-auto px-2"> -->
<!-- 								<button type="submit" class="btn btn-primary py-2 w-60"> -->
<!-- 									<i class="bx bx-search"></i> -->
<!-- 								</button> -->
<!-- 							<div class="col-12 px-2 col-sm-12 mb-md-0 col-md mb-3"> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
				</form>
		</div>
		<!--/////////검색 끝 //////////-->

		<!--//Page content//-->
		<div class="content pt-3 px-3 px-lg-6 d-flex flex-column-fluid">
			<div class="container-fluid px-0">
				<div class="row">
					<div class="col-12 mb-3 mb-lg-5">
						<div class="card">
							<div class="table-responsive">
								<table id="datatable"
									class="table mt-0 table-striped table-card table-nowrap">
									<thead class="text-uppercase small text-body-secondary">
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody id="tbody">
										<c:set value="${pagingVO.dataList }" var="boardList" />
										<c:set value="${start }" var="num" />
										<c:choose>
											<c:when test="${empty boardList }">
												<tr class="text-center">
													<td colspan="5" class="text-dark font-weight-bolder">조회하신
														게시글이 존재하지 않습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${boardList }" var="board"
													varStatus="stat">
													<tr>
														<td>${boardList.size()-stat.index}</td>
														<td><a
															href="/freeBoard/read?freeNum=${board.freeNum}">
																${board.freeTitle } </a></td>
														<td>${board.memNick }</td>
														<td>${board.freeDate }</td>
														<td>${board.viewNum }</td>
													</tr>
													<c:set value="${num - 1 }" var="num" />
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
								<div class="card-footer clearfix mt-2" id="pagingArea">
									${pagingVO.pagingHTML }</div>
				<div class="col-md-12">
					<button type="button" class="btn btn-primary"
						onclick="javascript:location.href='/freeBoard/form'"
						style="float: right;">등록</button>
				</div>
			</div>
		</div>
		<!--//Page content End//-->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(function() {
			const pagingArea = $("#pagingArea");
			const searchForm = $("#searchForm");
			//페이지네이션, 단어검색
			pagingArea.on("click", "a", function(event) {
				event.preventDefault();
				var pageNo = $(this).data("page");
				searchForm.find("#page").val(pageNo);
				searchForm.submit();
			});
		});
	</script>
</html>
