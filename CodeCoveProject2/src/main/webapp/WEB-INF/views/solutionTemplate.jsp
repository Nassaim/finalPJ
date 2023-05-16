<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!------------------------------ 결제하기시작 ---------------------------->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/resources/assets/img/favicon.ico"
	type="image/ico">
<!--Box Icons-->
<link rel="stylesheet"
	href="/resources/assets/fonts/boxicons/css/boxicons.min.css">


<!--Bootstrap icons-->
<link href="/resources/assets/fonts/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">


<!--AOS Animations-->
<link rel="stylesheet"
	href="/resources/assets/vendor/node_modules/css/aos.css">

<!--Iconsmind Icons-->
<link rel="stylesheet"
	href="/resources/assets/fonts/iconsmind/iconsmind.css">

<!--Google fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,400&family=Source+Serif+Pro:ital@0;1&display=swap"
	rel="stylesheet">
<!--Prism css snippets-->
<link rel="stylesheet"
	href="/resources/assets/vendor/node_modules/css/prism-tomorrow.css">
<!-- Main CSS -->
<link href="/resources/assets/css/theme.min.css" rel="stylesheet">
<!------------------------------ 결제하기끝 ---------------------------->

<!------------------------------- 댓글시작 ----------------------------->
<!--FavIcon-->
<link rel="icon" type="image/x-icon"
	href="/resources/assets/img/favicon.ico">
<!--Google Fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Chivo:wght@100..900&family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@48,400,0,0">

<!--Aos Animations-->
<link href="/resources/assets/vendor/node_modules/css/aos.css"
	rel="stylesheet">

<!--Main Style-->
<link href="/resources/assets/css/theme.min.css" rel="stylesheet">
<!------------------------------- 댓글끝 ----------------------------->

<title>템플릿디테일</title>

<title>solutionTemplate 타일즈입니당</title>
</head>
<style type="text/css">
/*----------------------- 결제하기 스타일 시작------------------------------*/
.header {
	background-color: #f1f1f1;
	padding: 20px;
	height: 300px;
	text-align: center;
}

#top-left {
	height: 200px;
	width: 500px;
	border: solid;
	color: black;
}

#top- {
	height: 200px;
	width: 500px;
	border: solid;
	color: black;
}
/*----------------------- 결제하기 스타일 끝--------------------------------*/

/*별점인서트스타일 */
#myform fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#myform fieldset legend {
	text-align: right;
}

#myform input[type=radio] {
	display: none;
}

#myform label {
	font-size: 2em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#myform label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}


/* 별점 출력 스타일 */
.yellow-star {
	color: #FFCC00;
}

.bi-star-fill{
	color: #FFCC00;

}

/* 하트 색 채우기 스타일 */
.bi-heart-fill {
	color: red;
}

.bi-heart {
	color: white;
}

/* 신고하기 아이콘 색 바꾸기 */
.bi-exclamation-diamond {
	color: red;
}

/* 멘토소개 */
#introduce{

  height:240px;
}

#mentoProfile {
  border: 1px solid #ccc;
  border-radius: 10px;
  padding: 20px;
}

@media (max-width: 768px) {
  .col-md-5 {
    width: 100%;
  }
}


/* 구매하기 버튼 컬러 */
.btn-outline-primary{
	color: #00c7ae;
}

.btn-outline-primary:hover{
	background-color: #00c7ae;
}
.btn-outline-primary:{
	background-color: #00c7ae;
}



</style>
<script src="/resources/assets/js/theme.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 결제 script -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<!-- sweet alert style -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<body>
	<!-- header -->
	<tiles:insertAttribute name="header"/>
	
	
	
	<!-- content -->
	<tiles:insertAttribute name="content"/>


<script type="text/javascript">
console.log("솔루션템플릿타일즈통과했나요 넹넹")
</script>
</body>
</html>