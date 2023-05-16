<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
	<meta content="Themesdesign" name="author" />
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- App favicon -->
	<link rel="shortcut icon" href="/assets/images/favicon.ico">
	<!-- Bootstrap Css -->
	<link href="/resources/assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
	<!-- Icons Css -->
	<link href="/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
	<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
	<!-- App Css-->
	<link href="/resources/assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
	
	<!-- ===============================================-->
	<!--    Template Css   -->
	<!-- ===============================================-->
	<!--:Quill editor css:-->
	<link href="/resources/assets/vendor/node_modules/css/quill.snow.css" rel="stylesheet">
	<!--Box Icons-->
	<link rel="stylesheet" href="/resources/assets/fonts/boxicons/css/boxicons.min.css">
	<!--Bootstrap icons-->
	<link href="/resources/assets/fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<!--Iconsmind Icons-->
	<link rel="stylesheet" href="/resources/assets/fonts/iconsmind/iconsmind.css">
	<!--Choices select-->
	<link rel="stylesheet" href="/resources/assets/vendor/node_modules/css/choices.min.css">
	<!-- Aos Animations CSS -->
	<link href="/resources/assets/vendor/node_modules/css/aos.css" rel="stylesheet">
	<!-- Google fonts CSS -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=PT+Serif:ital@0;1&family=Rubik:wght@300..900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@48,400,0,0">
	<!--Aos Animations-->
    <link href="/resources/assets/vendor/node_modules/css/aos.css" rel="stylesheet">
	<!-- Main CSS -->
	<link href="/resources/assets/css/theme-green.min.css" rel="stylesheet">
	<!--Simplebar css-->
	<link rel="stylesheet" href="/resources/assets/vendor/css/simplebar.min.css">
	<!--Choices css-->
	<link rel="stylesheet" href="/resources/assets/vendor/css/choices.min.css">
	<!--Calendar app style-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.css">
	<!--Main style-->
<!-- <link rel="stylesheet" href="/resources/assets/css/style.min.css"> -->
	<!-- 템플릿 제공은 풀캘린더 오류가 나서 다른 테마를 사용중 -->
	<link href="/resources/ex/assets/css/theme.css" rel="stylesheet" />
	
	<!-- ===============================================-->
	<!--    Favicons-->
	<!-- ===============================================-->
	<link rel="apple-touch-icon" sizes="180x180" href="/resources/ex/assets/img/favicons/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/resources/ex/assets/img/favicons/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/resources/ex/assets/img/favicons/favicon-16x16.png">
	<link rel="shortcut icon" type="image/x-icon" href="/resources/ex/assets/img/favicons/favicon.ico">
	<link rel="manifest" href="/assets/img/favicons/manifest.json">
	<link href="/resources/assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
	<meta name="msapplication-TileImage" content="/assets/img/favicons/mstile-150x150.png">
	<meta name="theme-color" content="#ffffff">
	
	<!-- ===============================================-->
	<!--    Stylesheets-->
	<!-- ===============================================-->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<style>
	#logoName {
		padding-top: 10px;
		padding-left: 40px;
		color: #0138B7;
		font-size: 50px;
		font-weight: bold;
	}
	
	#sidebar {
		background-color: white;
		width: 20%;
		float: left;
		padding: 0.5%;
		height: auto;
		/* 	position: fixed; */
/* 		margin-top: 68px; */
	}
	
	#blogContents {
		background-color: white;
		width: 80%;
		float: right;
		overflow: scroll;
		height: 870px;
		overflow-x: hidden;
		padding-top: 30px;
		/* 	margin-top: 75px; */
		-ms-overflow-style: none; /* IE and Edge */
		scrollbar-width: none; /* Firefox */
	}
	
	#blogContents::-webkit-scrollbar {
		display: none; /* Chrome, Safari, Opera*/
	}
	
	.blog {
		min-height: 800px;
	}
	
	#wirting {
		background-color: white;
		width: 80%;
		padding: 10px;
		margin-left: 3%;
		margin-top: 1%;
		float: left;
	}
	
	#logoName {
		padding-top: 10px;
		padding-left: 40px;
		color: #717CFF;
		font-size: 30px;
		font-weight: bold;
	}
	
	#blogHeader {
		position: fixed;
		width: 100%;
		margin: 0;
		background-color: white;
		clear: both;
		box-shadow: 0px 7px 29px 0px rgba(100, 100, 180, 0.1);
	}
	
	#sidebar-menu {
		width: 300px;
		float: right;
	}
	
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	
	.notosanskr * {
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	#sidebar-menu ul li a i {
		background-color: white;
		color: black;
	}
	
	#sidebar-menu ul li a i:hover {
		background-color: white;
	}
</style>

<title>Insert title here</title>
</head>
<body>

	<div id="body" style="z-index: 5; background-color: white;">
		<tiles:insertAttribute name="header"/>
	</div>
	<div class="pt-8">
		<div class="blog" id="sidebar">
			<tiles:insertAttribute name="blogList" />
		</div>
		<div class="blog" id="blogContents">
			<div id="wirting">
				<tiles:insertAttribute name="content" />
			</div>
		</div>
	</div>

</body>
<script src="/resources/ex/vendors/@popperjs/popper.min.js"></script>
<script src="/resources/ex/vendors/bootstrap/bootstrap.min.js"></script>
<script src="/resources/ex/vendors/is/is.min.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
<script src="/resources/ex/assets/js/theme.js"></script>
<script src="/resources/assets/js/theme.bundle.min.js"></script>
</html>
