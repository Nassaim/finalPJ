<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <!doctype html> -->
<!-- <html lang="en"> -->
<head>
<!--         Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/resources/assets/img/favicon.ico"
	type="image/ico">
<!--         Box Icons -->
<link rel="stylesheet"
	href="/resources/assets/fonts/boxicons/css/boxicons.min.css">

<!--         AOS Animations -->
<link rel="stylesheet"
	href="/resources/assets/vendor/node_modules/css/aos.css">

<!--         Iconsmind Icons -->
<link rel="stylesheet"
	href="/resources/assets/fonts/iconsmind/iconsmind.css">

<!--         Google fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,400&family=Source+Serif+Pro:ital@0;1&display=swap"
	rel="stylesheet">
<!--         Main CSS -->
<link href="/resources/assets/css/theme.min.css" rel="stylesheet">

<title>Assan 4</title>
</head>

<body>


	<main class="main-content" id="main-content">
		<section class="position-relative">
			<div class="container pt-14 pb-9 pb-lg-11">
				<div class="row pt-lg-7 justify-content-center text-center">
					<div class="col-xl-8">
						<div
							class="width-8x height-8x rounded-circle position-relative bg-success text-white flex-center mb-4">
							<i class="bx bx-check lh-1 display-4 fw-normal"></i>
						</div>
						<h1 class="display-4 mb-3">결제가 완료되었습니다</h1>
						<section class="position-relative">
							<div class="container py-9 py-lg-11">
								<div class="row justify-content-center">
									<div class="col-12">
										<table class="table mb-9 table-bordered">
											<thead>
												<tr>
													<th scope="col">결제번호</th>
													<th scope="col">상품번호</th>
													<th scope="col">상품명</th>
													<th scope="col" class="col-1">가격</th>
													<th scope="col">결제일시</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>${myExpertVO.epayNum}</td>
													<td>${myExpertVO.eprodNum}</td>
													<td>${myExpertVO.eprodName}</td>
													<td>${myExpertVO.amount}</td>
													<td><fmt:formatDate value="${myExpertVO.epayDate}"
															pattern="yyyy/M/d" /></td>
												</tr>
											</tbody>
										</table>
						</section>
						<a href="/coco/solution/category"
							class="btn btn-outline-primary btn-lg px-4 px-lg-5"> 템플릿리스트 </a>
						<a style="width: 30px"> </a> <a
							href="/coco/solution/templateDetail?eprodNum=${myExpertVO.eprodNum}"
							class="btn btn-outline-primary btn-lg px-4 px-lg-5"> 템플릿다운로드</a>

					</div>
				</div>
			</div>
		</section>
	</main>

	<script src="/resources/assets/js/theme.bundle.min.js"></script>
</body>

</html>
