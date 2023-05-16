<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">

<head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="/resources/assets/img/favicon.ico" type="image/ico">

        <!--Box Icons-->
        <link rel="stylesheet" href="/resources/assets/fonts/boxicons/css/boxicons.min.css">

        <!--Iconsmind Icons-->
        <link rel="stylesheet" href="/resources/assets/fonts/iconsmind/iconsmind.css">

        <!-- Aos Animations CSS -->
        <link href="/resources/assets/vendor/node_modules/css/aos.css" rel="stylesheet">

        <!--Select css-->
        <link rel="stylesheet" href="/resources/assets/vendor/node_modules/css/choices.min.css">

        <!-- Google fonts CSS -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=PT+Serif:ital@0;1&family=Rubik:wght@300..900&display=swap" rel="stylesheet">
        <!-- Main CSS -->
        <link href="/resources/assets/css/theme-green.min.css" rel="stylesheet">
        <script src="/resources/plugins/jquery/jquery.min.js"></script>

        <title>Assan 4</title>

</head>
<body class="pt-12">


	<!-- header -->
	<tiles:insertAttribute name="header" />

	<!-- content -->
	<tiles:insertAttribute name="content" />
	
	
<a href="#" class="toTop mb-5 me-5">
            <i class="bx bxs-up-arrow"></i>
        </a>
        <!-- scripts -->
        <script src="/resources/assets/js/theme.bundle.min.main.js"></script>

    <!--////////////Theme Core scripts End/////////////////-->
  
</html>

