<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="/resources/assets/img/favicon.ico" type="image/ico">
<!--         Box Icons -->
        <link rel="stylesheet" href="/resources/assets/fonts/boxicons/css/boxicons.min.css">

<!--         AOS Animations -->
        <link rel="stylesheet" href="/resources/assets/vendor/node_modules/css/aos.css">

<!--         Iconsmind Icons -->
        <link rel="stylesheet" href="/resources/assets/fonts/iconsmind/iconsmind.css">

<!--         Google fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,400&family=Source+Serif+Pro:ital@0;1&display=swap" rel="stylesheet">
<!--         Main CSS -->
        <link href="/resources/assets/css/theme.min.css" rel="stylesheet">
   		
   		<!-- JS -->
   	    <script src="/resources/plugins/jquery/jquery.min.js"></script>	 
   	    
		<!-- sweet alert style -->
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<title>Insert title here</title>
</head>
<body>
<!-- 메세지가 비어있지 않다면 실행go -->
<c:if test="${not empty message }"> 
<script type="text/javascript">
//console.log("이것이 작동한다면 메세지가 떠야 정상입니다");
//alert("${message}"); // 회원가입시, 로긴시 넘겨받은 메세지 있는경우 출력
// alert("${message}");
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


	<!-- header -->
	<tiles:insertAttribute name="header"/>
	
	
	
	<!-- content -->
	<tiles:insertAttribute name="content"/>
	
	
	
</body>


<script src="/resources/assets/js/theme.bundle.min.js"></script>
</html>
