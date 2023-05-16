<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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

<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="assets/js/theme.bundle.min.js"></script>

<title>JRepository</title>

</head>
<body>
	<main>

		<div class="row">
			<div style="margin-top: 50px; margin-left: 25px;">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a
							href="/coco/project/jRepositoryList">프로젝트</a></li>
						<li class="breadcrumb-item">업무</li>
					</ol>
				</nav>
			</div>
		</div>



		<section class="position-relative">
			<c:choose>
				<c:when test="${empty workList}">
					<tr>
						<td colspan="4">조회하실 게시물이 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<div class="container py-9 py-lg-11 position-relative z-1">
						<div class="row">
							<c:forEach items="${workList}" var="work">
								<div class="col-md-2 mb-4" style="text-align: center;">
									<a href="/coco/project/JRepoDownload?workNum=${work.workNum}" class="card-hover"> 
									<img src="/resources/assets/img/projects/1.png" alt=""
										class="img-zoom img-fluid" style="width: 50%; height: 50%;">
										<h5 class="mb-1" style="margin-top: 10px; margin-bottom: 10px;">${work.workTitle}</h5>
										<h5 class="mb-1 work-date" style="margin-top: 10px; margin-bottom: 10px;">
											<fmt:parseDate value="${fn:substring(work.workNum, 4, 10) }" pattern="yyMMdd" var="workDate" />
											<fmt:formatDate value="${workDate}" pattern="yy/MM/dd" />
										</h5>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</section>
	</main>
</body>
</html>
