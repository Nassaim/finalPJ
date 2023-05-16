<!-- <!doctype html> -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> --%>
<!-- <html lang="en"> -->
<head>
<!--Bootstrap icons-->
<link href="/resources/assets/fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/resources/assets/img/favicon.ico" type="image/ico">
<link rel="stylesheet" href="/resources/assets/vendor/node_modules/css/choices.min.css">
<link rel="stylesheet" href="/resources/assets/vendor/node_modules/css/simplebar.min.css">
<link rel="stylesheet" href="/resources/assets/vendor/node_modules/css/nouislider.min.css">
<!--Icons-->
<link href="/resources/assets/fonts/boxicons/css/boxicons.min.css" rel="stylesheet">
<!--Google fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gloock&family=Montserrat:wght@100..900&display=swap" rel="stylesheet">
<!-- Main CSS -->
<link href="/resources/assets/css/theme-shop.min.css" rel="stylesheet">

<!--:Simplebar css ()-->
<style type="text/css">
.simplebar-track.simplebar-vertical {
	width: 7px;
}

.simplebar-scrollbar:before {
	background: currentColor;
}

/* 태그버튼 */
 .btn-secondary { 
     --bs-btn-color: black; 
     --bs-btn-bg: white; 
     --bs-btn-border-color: lightgray; 
     --bs-btn-hover-bg: lightgray; 
     --bs-btn-hover-border-color: lightgray; 
 } 
 
/*  별 색 바꾸기 css */
 .bi-star-fill{
 	color: #ffd700;
 }
 


.bg-primary-subtle {
    background-color: #a9ded7 !important;
}

.text-primary {
    --bs-text-opacity: 1;
    color: black!important;
}

</style>
<title>템플릿 리스트</title>
</head>

<body>


<!--Main content-->
	<main>
		<!--Page header start-->
		<section class="position-relative">

			<div class="container py-9 py-lg-11 position-relative">
				<div class="row justify-content-between">
					<div class="col-md-2" style="margin-top: 80px;">
					<!--:Sidebar widget card-->
						<div class="mt-5">
							<!--:Title-->
							<div>
								<h6 class="mb-3">
									<a href="/coco/mentoring/category" class="nav-link small">전체 멘토링</a>
								</h6>
								<hr/>
								<h6 class="mb-3">
									<a href="/coco/mentoring/category?eprodTag=programming" class="nav-link small">개발·프로그래밍</a>
								</h6>
								<hr/>
								<h6 class="mb-3">
									<a href="/coco/mentoring/category?eprodTag=security" class="nav-link small">보안·네트워크</a>
								</h6>
								<hr/>
								<h6 class="mb-3">
									<a href="/coco/mentoring/category?eprodTag=datascience" class="nav-link small">데이터사이언스</a>
								</h6>
								<hr/>
								<h6 class="mb-3">
									<a href="/coco/mentoring/category?eprodTag=game" class="nav-link small">게임개발</a>
								</h6>
								<hr/>
								<h6 class="mb-3">
									<a href="/coco/mentoring/category?eprodTag=hardware" class="nav-link small">하드웨어</a>
								</h6>
							</div>
						</div>
					</div>


					<!--Products column-->
					<div class="col-md-9 pt-5">
						<!--Products top bar-->
						<!--     태그서치 -->
								<a class="navbar-brand" href="index.html"> 
									<img src="/resources/assets/img/logo/logo-shop-white.svg" alt="" class="img-fluid navbar-brand-dark">
								</a>
								<!-- 서치 시작-->
								<div style="display: flex; justify-content: space-between; align-items: center;">
								  <label for="email-input" style="font-size: 1.2rem; font-weight: bold;">멘토링</label>
								  <form style="display: inline-block;"method="post" id="searchForm" action="/coco/mentoring/category">
								    <div class="d-flex justify-content-end">
								  	  <input type="hidden" name="page" id="page">
								      <input type="text" class="email-input" name="searchWord" id="searchWord" placeholder="전체템플릿검색" required style="width: 200px; padding: 0.5rem; font-size: 1rem; line-height: 1.5; color: #495057; background-color: #fff; border: 1px solid #ced4da; border-radius: 0.25rem; transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;">
								      <button type="submit" class="btn btn-primary ml-2" style="color: white;">검색</button>
								    </div>
								  </form>
								</div>
								<!-- 서치 끝-->





						<!--       태그서치끝 -->
						

<!-- 그리드 멘토링 출력	 -->
		<div class="row mb-5">
			<c:set value="${pagingVO.dataList }" var="mentoringCategory"/>
			<c:set value="${start }" var="num"/>
			<c:choose>
				<c:when test="${empty mentoringCategory }">
					<tr>
						<td colspan="4">조회하실 게시물이 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${mentoringCategory}" var="mentoringCategory" varStatus="stat">
<!-- 여기가 그리드 카드 바디입니다			 -->
                            <div class="mb-4 card hover-shadow-xl" style="margin-top: 30px;">
                                <!--Card-body-->
                                <div class="card-body p-4">
                                    <div class="d-flex align-items-start">
                                        <!--company-->
                                        <img src="/upload/${mentoringCategory.attatchList[0].saveNm}" width=100px; height=65px; alt="image222"  style="border-radius: 20px;"/>
                                        <!--Job details-->
                                        <div class="flex-grow-1" style="margin-left: 30px;">
                                            <div class="d-flex flex-column flex-md-row">
                                                <div class="flex-grow-1">
                                                <a href="/coco/mentoring/mentoringDetail?eprodNum=${mentoringCategory.eprodNum}"> 
                                                    <h4 class="mb-3">${mentoringCategory.eprodName}</h4></a>
                                                    <ul class="d-flex small flex-wrap list-unstyled mb-2">
                                                        <li class="me-3 mb-2">
                                                            <h6 class="mb-0">${mentoringCategory.memNick}</h6>
                                                        </li>
                                                        <li class="me-3 mb-2 text-body-secondary d-flex align-items-center">
					                                    <c:set var="price" value="${mentoringCategory.eprodPrice}" />
														<fmt:formatNumber value="${price}" pattern="#,###" var="price"/>
                                                        <i class='bx bx-won me-1'></i>${price}</li>
                                                        <li class="me-3 mb-2 text-body-secondary d-flex align-items-center">
                                                        <i class='bx bxs-edit me-1'></i><span>리뷰수</span><span>(</span> ${mentoringCategory.countReview}<span>)</span></li>
														<li>
															<span><c:set var="starAvg" value="${mentoringCategory.starAvg }" />
															<c:if test="${mentoringCategory.countReview eq 0 }">
															<c:set var="starAvg" value="0.0" />
															</c:if> <span style="color: #FFBF00;"><span
															class="bi bi-star-fill"></span></span></span><span> 평점 (</span><span id="starAvg">${starAvg}</span> <span>/5)</span>
														</li>
                                                    </ul>
                                                    <div class="d-flex align-items-center">
                                                        <span
                                                            class="badge py-1 lh-base position-relative z-2 bg-primary-subtle text-primary me-2 px-3">
                                                            # ${mentoringCategory.eprodTag}</span>
                                                        <!--Category-->
                                                    </div>
                                                </div>
                                                <!--Date-->
                                                <div class="flex-shrink-0 d-md-block d-none">
                                                    <fmt:formatDate value="${mentoringCategory.eprodDate}" pattern="yyyy/MM/dd" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>			
							</div>
							<c:set value="${num - 1 }" var="num"/>
					</c:forEach>
				</c:otherwise>				
			</c:choose>							
<!-- 			템플릿카드그리드 끝 -->
						</div>

<!-- 페이징 번호 출력부분 VO에 html 형식으로 적혀있어요 시작-->
			<div class="row">
				<div class="card-footer clearfix mt-2" id="pagingArea">
					${pagingVO.pagingHTML }
				</div>
			</div>
<!-- 페이징 번호 출력부분 VO에 html 형식으로 적혀있어요 끝-->


					</div>
				</div>
			</div>
		</section>


	</main>
	<script type="text/javascript">
		const pagingArea = $("#pagingArea");
		const searchForm = $("#searchForm");
		
		//페이지네이션, 단어검색
		pagingArea.on("click", "a", function(event){
			event.preventDefault();
			var pageNo = $(this).data("page");
			searchForm.find("#page").val(pageNo);
			searchForm.submit();
		});
	</script>





</body>

