<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--Main content-->
<main>
	<section>
		<div class="container pt-2 pb-2 position-relative">
			<h3 class="display-4">협업 게시판</h3>
			<!--//////검색 시작 /////////// -->
			<div class="row">
				<div class="col-sm-10">
					<form class="mb-2" method="post" action="/coco/cooBoard/list"
						id="searchForm" name="searchForm">
						<div class="row mx-n2 align-items-center">
							<div class="col-12 px-2 col-sm-12 mb-md-0 col-md mb-3">
								<div class="position-relative" style="float: right;">
									<!--Input icon-->
									<span
										class="position-absolute z-1 start-0 top-50 translate-middle-y d-flex width-3x justify-content-end align-items-center">
										<i class="bx bx-search"></i>
									</span> <input type="hidden" id="page" name="page"> <input
										type="text" id="searchWord" name="searchWord"
										class="form-control py-2 ps-6" placeholder="검색어를 입력해주세요."
										value="${searchWord }">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!--/////////검색 끝 //////////-->
	</section>
	<section class="overflow-hidden position-relative">
		<div class="container py-9 py-lg-0 position-relative">
			<div class="row">
				<div class="col-lg-8 mb-5 mb-lg-0 mx-auto">
					<div class="row mb-4 align-items-center">

						<div class="col-md-auto">
							<div class="d-flex"></div>
						</div>
					</div>
					<c:set value="${pagingVO.dataList }" var="pjboList" />
					<c:set value="${start }" var="num" />
					<c:choose>
						<c:when test="${empty pjboList}">
							<tr class="text-center">
								<td colspan="5" class="text-dark font-weight-bolder">조회하신
									게시글이 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${pjboList}" var="list">
								<!--Job card-->
								<div class="mb-4 card hover-shadow-xl">
									<!--Card-body-->
									<div class="card-body p-4">
										<div class="d-flex align-items-start">
											<!--company-->
											<!--Job details-->
											<div class="flex-grow-1">
												<div class="d-flex flex-column flex-md-row">
													<div class="flex-grow-1">
														<h4 class="mb-3">
															<a href="/coco/cooBoard/read?cooNm=${list.cooNm}">${list.cooTitle}</a>
														</h4>
														<ul class="d-flex small flex-wrap list-unstyled mb-2">
															<li class="me-3 mb-2" data-bs-toggle="tooltip" data-bs-placement="top" title="작성자"><i class='bx bxs-user-circle'></i>&nbsp;${list.memNick }</li>
															<li class="me-3 mb-2 text-body-secondary d-flex align-items-center" data-bs-toggle="tooltip" data-bs-placement="top" title="참가인원/최대인원">
															<i class='bx bx-group'></i>&nbsp;${list.memCount }/${list.cooPeopleNum}명</li>
															<li class="me-3 mb-2 text-body-secondary d-flex align-items-center">
															<i class='bx bx-calendar'></i>
															프로젝트 기간 : ${list.cooStartDate} ~ ${list.cooEndDate}</li>
														</ul>
														<div class="d-flex align-items-center">
															<c:if test="${list.cooDoneYn eq 'Y'}">
																<span
																	class="badge py-1 lh-base position-relative z-2 bg-danger text-white me-2 px-3">종료된
																	프로젝트</span>
															</c:if>
															<c:if test="${list.cooDoneYn eq 'N'}">
																<span
																	class="badge py-1 lh-base position-relative z-2 bg-primary-subtle text-primary me-2 px-3">진행중</span>
															</c:if>

														</div>
													</div>
													<!--Date-->
													<div class="flex-shrink-0 d-md-block d-none">
														<small class="text-body-secondary">작성일:${list.cooDate}</small>
														<br>
														<small class="text-body-secondary">조회수:${list.viewNum}</small>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<c:set value="${num - 1 }" var="num" />
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-12">
					<button type="button" class="btn btn-primary"
						onclick="javascript:location.href='/coco/cooBoard/form'"
						style="float: right;">글쓰기</button>
				</div>
				<div class="card-footer clearfix mt-2" id="pagingArea">
					${pagingVO.pagingHTML }</div>
			</div>
		</div>
		<!--Link-->
	</section>
</main>
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