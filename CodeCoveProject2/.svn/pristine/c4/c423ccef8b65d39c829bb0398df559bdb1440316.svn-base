<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<main>
	<section class="position-relative">
		<div class="container py-9 py-lg-2 position-relative z-1">
			<h3 class="display-4 mb-4">블로그 게시판</h3>
			<!--//////검색 시작 /////////// -->
			<div class="row">
				<div class="col-sm-12 me-15">
					<form class="mb-4" method="post" action="/coco/blogBoard/list"
						id="searchForm" name="searchForm">
						<div class="row mx-n2 align-items-center">
							<div class="col-12 px-2 mb-md-0 col-md mb-3">
								<div class="position-relative" style="float: right;">
									<!--Input icon-->
									<span class="position-absolute z-1 start-0 top-50 translate-middle-y d-flex width-3x justify-content-end align-items-center">
										<i class="bx bx-search"></i>
									</span> 
									<input type="hidden" id="page" name="page"> 
									<input type="text" id="searchWord" name="searchWord"
										class="form-control py-2 ps-6" placeholder="검색어를 입력해주세요."
										value="${searchWord }">
								</div>
							</div>
<!-- 							<div class="col-12 col-md-auto px-2"> -->
<!-- 								<div class="col-12 px-2 col-sm-12 mb-md-0 col-md mb-3"> -->
<!-- 									<button type="submit" class="btn btn-primary py-2 w-50"> -->
<!-- 										<i class="bx bx-search"></i> <span class="ms-2"></span> -->
<!-- 									</button> -->
<!-- 									<div class="position-relative"></div> -->
<!-- 								</div> -->
<!-- 							</div> -->
						</div>
					</form>
				</div>
			</div>
			<!--/////////검색 끝 //////////-->
			<div id="projects" data-isotope='{"layoutMode": "masonry"}'
				class="row">
				<c:set value="${pagingVO.dataList }" var="blboList" />
				<c:set value="${start }" var="num" />
				<c:choose>
					<c:when test="${empty blboList }">
						<tr>
							<td colspan="4">게시글이 존재하지 않습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${blboList }" var="list" varStatus="loop">
							<div class="col-md-4 col-lg-4 mb-4 bootstrap grid-item">
								<a href="/coco/blogBoard/read/${list.bloggerId}/${list.postNum}"
									class="card-hover">
									<div class="overflow-hidden position-relative mb-4">
										<img src="${list.thumbnail}" alt="" class="img-zoom img-fluid"
											style="width: 280px; height: 280px">
									</div>
									<h5 class="mb-1">${list.postTitle }</h5>by ${list.memNick}
									<p>${list.postDate}&nbsp;&nbsp;조회수:${list.postView }</p>
								</a>
							</div>
							<c:if test="${loop.index % 3 == 2}">
								<div class="w-100"></div>
							</c:if>
							<c:set value="${num - 1 }" var="num" />
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- 페이징 page시작 -->
			<div class="card-footer clearfix mt-2" id="pagingArea">
				${pagingVO.pagingHTML }</div>
		</div>
	</section>
</main>
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

