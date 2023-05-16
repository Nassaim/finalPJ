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
<script src="/resources/plugins/jquery/jquery.min.js"></script>

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
					<div class="col-md-2" >
					<!--:Sidebar widget card-->
						<div class="mt-5">
							<!--:Title-->
							<div style="margin-top: 160px;">
								<h6 class="mb-3">
									<a href="/coco/solution/category" class="nav-link small">전체 템플릿</a>
								</h6>
								<hr/>
								<h6 class="mb-3">
									<a href="/coco/solution/category?eprodTag=multipurpose" class="nav-link small">다목적템플릿</a>
								</h6>
								<hr/>
								<h6 class="mb-3">
									<a href="/coco/solution/category?eprodTag=portfolio" class="nav-link small">포트폴리오&이력서</a>
								</h6>
								<hr/>
								<h6 class="mb-3">
									<a href="/coco/solution/category?eprodTag=shoppingmall" class="nav-link small">쇼핑몰템플릿</a>
								</h6>
								<hr/>
								<h6 class="mb-3">
									<a href="/coco/solution/category?eprodTag=blog" class="nav-link small">블로그템플릿</a>
								</h6>
								<hr/>
								<h6 class="mb-3">
									<a href="/coco/solution/category?eprodTag=landing" class="nav-link small">랜딩페이지</a>
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
								  <label for="email-input" style="font-size: 1.2rem; font-weight: bold;">템플릿</label>
								  <form style="display: inline-block;"method="post" id="searchForm" action="">
								    <div class="d-flex justify-content-end">
								  	  <input type="hidden" name="page" id="page">
								      <input type="text" class="email-input" name="searchWord" id="searchWord" placeholder="전체템플릿검색" required style="width: 200px; padding: 0.5rem; font-size: 1rem; line-height: 1.5; color: #495057; background-color: #fff; border: 1px solid #ced4da; border-radius: 0.25rem; transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;">
								      <button type="submit" class="btn btn-primary ml-2" style="color: white;">검색</button>
								    </div>
								  </form>
								</div>
								<!-- 서치 끝-->




								<br/>
								<div class="row align-items-center" style="margin-bottom: 15px;">
								
									<div class="col-lg mb-3 mb-lg-0">
										<div class="d-flex flex-wrap" >
											<a href="/coco/solution/category?eprodTag=${param.eprodTag }&eprodLangCode=bootstrap3"
												class="btn btn-sm rounded-pill btn-secondary me-2 mb-2">Bootstrap3</a>
											<a href="/coco/solution/category?eprodTag=${param.eprodTag }&eprodLangCode=bootstrap4"
												class="btn btn-sm rounded-pill btn-secondary me-2 mb-2">Bootstrap4</a>
											<a href="/coco/solution/category?eprodTag=${param.eprodTag }&eprodLangCode=bootstrap5"
												class="btn btn-sm rounded-pill btn-secondary me-2 mb-2">Bootstrap5</a>
										</div>
									</div>
								</div>
						<!--       태그서치끝 -->
<!-- 그리드출력-->
		<div class="row mb-5">
			<c:set value="${pagingVO.dataList }" var="templateCategory"/>
			<c:set value="${start }" var="num"/>
			<c:choose>
				<c:when test="${empty templateCategory }">
					<tr>
						<td colspan="4">조회하실 게시물이 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${templateCategory}" var="templateCategory" varStatus="stat">
							<div class="col-md-6 col-xl-4 mb-4">
								<!--:card-hover-expand-->
								<div class="card overflow-hidden hover-lift card-product">
									<div class="card-product-header p-3 d-block overflow-hidden position-relative">
										<a href="/coco/solution/templateDetail?eprodNum=${templateCategory.eprodNum}"> 
											<img src="/upload/${templateCategory.attatchList[0].saveNm}" width=227px; height=130px; alt="image222" />
										</a>
									</div>
									<div style="margin-left: 5%; font-size: 1.2em;">
									  <a href="#!" class="fs-6 fw-semibold d-block position-relative" style="margin-left: 5%; margin-right: 5%" >${templateCategory.eprodName}</a>
									</div>
									<div style="margin-left: 10%; font-size: 0.9em;">${templateCategory.memNick}</div>
									<c:set var="starAvg" value="${templateCategory.starAvg }"/>
										<c:if test="${templateCategory.countReview eq 0 }">
											<c:set var="starAvg" value="0.0"/>
										</c:if>			
									<div style="margin-left: 10%; font-size: 0.9em;">
									  <fmt:formatNumber value="${starAvg}" pattern="0.0" var="starAvg"/>
									  <span class="bi bi-star-fill"></span> <span>평점</span> <span>(</span>${starAvg}<span>) </span>
									 
									 
									  <span style="text-align: right; float: right; margin-right: 30%"><span>리뷰수</span><span>(</span> ${templateCategory.countReview}<span>)</span></span>
									</div>


									<c:set var="price" value="${templateCategory.eprodPrice}" />
									<fmt:formatNumber value="${price}" pattern="#,###" var="price"/>
									<div style="margin-left: 10%; color:#2f5087 ; font-weight: bold;"><span>₩</span> ${price}</div>
									

								</div>

							</div>
							<c:set value="${num - 1 }" var="num"/>
					</c:forEach>
				</c:otherwise>				
			</c:choose>							
						</div>
<!-- 		페이징 버튼이 생기는 부분 -->
			<div class="row">
				<div class="card-footer clearfix mt-2" id="pagingArea">
					${pagingVO.pagingHTML }
				</div>
			</div>
					</div>
				</div>
			</div>
		</section>


	</main>
<script type="text/javascript">
$(function(){
	const pagingArea = $("#pagingArea");
	const searchForm = $("#searchForm");
	
	//페이지네이션, 단어검색
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
})
</script>





</body>

