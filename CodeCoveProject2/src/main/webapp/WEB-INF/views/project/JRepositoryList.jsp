<!doctype html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="assets/img/favicon.ico" type="image/ico">
<!--Box Icons-->
<link rel="stylesheet" href="assets/fonts/boxicons/css/boxicons.min.css">

<!--AOS Animations-->
<link rel="stylesheet" href="assets/vendor/node_modules/css/aos.css">

<!--Iconsmind Icons-->
<link rel="stylesheet" href="assets/fonts/iconsmind/iconsmind.css">

<!--Google fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,400&family=Source+Serif+Pro:ital@0;1&display=swap"
	rel="stylesheet">
<!-- Main CSS -->
<link href="assets/css/theme.min.css" rel="stylesheet">

<title>JRepository</title>
</head>

<body>


	<div class="row">
		<div style="margin-top: 50px; margin-left: 25px;">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a
						href="/coco/project/jRepositoryList">프로젝트</a></li>
				</ol>
			</nav>
		</div>
	</div>


	<main>
		<section class="position-relative">
			<c:choose>
				<c:when test="${empty projectAllList}">
					<tr>
						<td colspan="4">조회하실 게시물이 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<div class="container py-9 py-lg-11 position-relative z-1">
						<div id="projects" data-isotope='{"layoutMode": "masonry"}' class="row">
							<c:forEach items="${projectAllList}" var="projectAllList">
								<div class="col-md-6 col-lg-4 mb-4 bootstrap grid-item" style="text-align: center;">
									<a href="/coco/project/JRepoWorkList?pjId=${projectAllList.pjId}" class="card-hover"> 
									<img src="/resources/assets/img/projects/2.png" alt=""
										class="img-zoom img-fluid" style="width: 50%; height: 78%;">
										<h5 class="mb-1" style="margin-top: 10px; margin-bottom: 10px;">${projectAllList.pjName}</h5>
										<c:set var="pjStartDateStr" value="${projectAllList.pjStartDate}" /> 
										<c:set var="pjEndDate" value="${projectAllList.pjEndDate}" /> 
										<fmt:parseDate value="${pjStartDateStr}" pattern="yyyy-MM-dd" var="pjStartDate" /> 
										<fmt:parseDate value="${pjEndDate}" pattern="yyyy-MM-dd" var="pjEndDate" />
										<div style="font-size: 1.1em;">
											<span>(</span>
											<fmt:formatDate value="${pjStartDate}" pattern="yyyy/MM/dd" />
											<span>~</span>
											<fmt:formatDate value="${pjEndDate}" pattern="yyyy/MM/dd" />
											<span>)</span>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</section>
	</main>

	<!-- scripts -->
	<script src="assets/js/theme.bundle.min.js"></script>
</body>

</html>
