<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
        
        <!-- 민수 -->
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" href="/resources/assets/img/favicon.ico" type="image/ico">
		
		<!-- Box Icons -->
		<link rel="stylesheet" href="/resources/assets/fonts/boxicons/css/boxicons.min.css">
		
		<!-- AOS Animations -->
		<link rel="stylesheet" href="/resources/assets/vendor/node_modules/css/aos.css">
		
		<!-- Iconsmind Icons -->
		<link rel="stylesheet" href="/resources/assets/fonts/iconsmind/iconsmind.css">
		
		<!-- Google fonts -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,400&family=Source+Serif+Pro:ital@0;1&display=swap" rel="stylesheet">
		
		<!-- select style -->
		<link rel="stylesheet" href="/resources/assets/vendor/node_modules/css/choices.min.css">
		
		<!-- Flatpickr -->
		<link rel="stylesheet" href="/resources/assets/vendor/node_modules/css/flatpickr.min.css">
		
		<!-- File uploader -->
		<link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet" />
		<link href="https://unpkg.com/filepond-plugin-file-poster/dist/filepond-plugin-file-poster.css" rel="stylesheet">
		<link href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css" rel="stylesheet">
		
		<!-- Main CSS -->
		<link href="/resources/assets/css/theme.min.css" rel="stylesheet">
		
		<!-- Bootstrap icons -->
		<link href="/resources/assets/fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
		
		<!-- Google web fonts -->
		<link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@100..900&family=IBM+Plex+Mono:ital@0;1&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0" />
		
		<!-- Simplebar css -->
		<link rel="stylesheet" href="/resources/assets/vendor/css/simplebar.min.css">
		
		<!-- Choices css -->
		<link rel="stylesheet" href="/resources/assets/vendor/css/choices.min.css">
		
		<!-- Date range picker -->
		<link rel="stylesheet" href="/resources/assets/vendor/css/daterangepicker.css">
		
		<!-- Main style -->
		<link rel="stylesheet" href="/resources/assets/css/style.min.css">
		
		<!-- JS -->
		<script src="/resources/plugins/jquery/jquery.min.js"></script>
		
		<!-- sweet alert style -->
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

		 <!--Upload file-->
        <script src="/resources/assets/vendor/node_modules/js/dropzone-min.js"></script>
       
		<!-- 차트.js -->
		<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<title>Insert title here</title>
</head>

<body>
<!-- 메세지가 비어있지 않다면 실행go -->
<c:if test="${not empty message }"> 
<script type="text/javascript">
//console.log("이것이 작동한다면 메세지가 떠야 정상입니다");
//alert("${message}"); // 회원가입시, 로긴시 넘겨받은 메세지 있는경우 출력

Swal.fire({
	  icon: 'success',
	  title: '${message}',
	  showConfirmButton: false,
	  timer: 1500
	})
	
<c:remove var="message" scope="request"/>
<c:remove var="message" scope="session"/>
</script>
</c:if>

	<div class="d-flex flex-column flex-root">
		<div class="page d-flex flex-row flex-column-fluid">
			<!-- sidebar -->
			<tiles:insertAttribute name="sidebar"/>
			
			<main class="page-content d-flex flex-column flex-row-fluid mx-auto py-0">
			
				<tiles:insertAttribute name="miniHeader"/>
				<!-- header -->
	<%-- 			<tiles:insertAttribute name="header"/> --%>
				<tiles:insertAttribute name="content"/>
				<!-- content -->
			
			</main>
		</div>
	</div>
	
	
	
</body>

<script src="/resources/assets/js/theme.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.12.0/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.0/js/dataTables.bootstrap5.min.js"></script>

</html>
