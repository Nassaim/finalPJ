<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assan-Admin</title>

    <!--Bootstrap icons-->
    <link href="/resources/assets/fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <!--Google web fonts-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@100..900&family=IBM+Plex+Mono:ital@0;1&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0" />
    
    <!--Simplebar css-->
	<link rel="stylesheet" href="/resources/assets/vendor/css/simplebar.min.css">

	<!--Choices css-->
	<link rel="stylesheet" href="/resources/assets/vendor/css/choices.min.css">
    
    <!--Main style-->
    <link rel="stylesheet" href="/resources/assets/css/style.min.css">
  </head>

<body>

	<div class="d-flex flex-column flex-root">
		<!--Page-->
		<div class="page d-flex flex-row flex-column-fluid">

			<!-- sidebar -->
			<tiles:insertAttribute name="sidebar" />


			<!--///////////Page content wrapper///////////////-->
			<main class="page-content d-flex flex-column flex-row-fluid">
				<!-- mheader -->
				<%--       <tiles:insertAttribute name="mainHeader"/> --%>

				<!-- header -->
				<tiles:insertAttribute name="header" />

				<!-- content -->
				<tiles:insertAttribute name="content" />

			</main>
			<!--///////////Page content wrapper End///////////////-->
		</div>
	</div>


</body>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/resources/assets/js/theme.bundle.min.dash.js"></script>
</html>
