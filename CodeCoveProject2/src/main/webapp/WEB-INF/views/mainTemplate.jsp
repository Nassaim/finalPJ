<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--Box Icons-->
	<link rel="stylesheet" href="/resources/assets/fonts/boxicons/css/boxicons.min.css">
	<!--Iconsmind Icons-->
	<link rel="stylesheet" href="/resources/assets/fonts/iconsmind/iconsmind.css">
	<!--Choices select-->
	<link rel="stylesheet" href="/resources/assets/vendor/node_modules/css/choices.min.css">
	
	<!--Swiper-->
	<link rel="stylesheet" href="/resources/assets/vendor/node_modules/css/swiper-bundle.min.css">
	
	<!-- Aos Animations CSS -->
	<link href="/resources/assets/vendor/node_modules/css/aos.css" rel="stylesheet">
	
	<!-- Google fonts CSS -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=PT+Serif:ital@0;1&family=Rubik:wght@300..900&display=swap" rel="stylesheet">
	<!-- Main CSS -->
	<link href="/resources/assets/css/theme-green.min.css" rel="stylesheet">
	<!--Prism css snippets-->
	
	<!-- sweet alert style -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	<!-- jquery -->
	<script src="/resources/plugins/jquery/jquery.min.js"></script>


<title>Insert title here</title>
</head>
<body class="pt-7">
<c:if test="${not empty message }"> 
<script>
alert("${message}");
<c:remove var="message" scope="request"/>
<c:remove var="message" scope="session"/>
</script>
</c:if>

	<!-- header -->
	<tiles:insertAttribute name="header"/>
	
	<!-- content -->
	<tiles:insertAttribute name="content" ignore="true"/>
	
</body>
</html>

