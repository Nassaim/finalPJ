<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Assan-Admin</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<!--Bootstrap icons-->
<link href="/resources/assets/fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

<!--Google web fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@100..900&family=IBM+Plex+Mono:ital@0;1&display=swap" rel="stylesheet">
<link rel="stylesheet" 	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0" />

<!--Simplebar css-->
<link rel="stylesheet" 	href="/resources/assets/vendor/css/simplebar.min.css">

<!--Choices css-->
<link rel="stylesheet" 	href="/resources/assets/vendor/css/choices.min.css">

<!--Date range picker-->
<link rel="stylesheet" 	href="/resources/assets/vendor/css/daterangepicker.css">

<!--Main style-->
<link rel="stylesheet" href="/resources/assets/css/style.min.css">

<!-- jquery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>

<!-- chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- sweet alert style -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>

<body>

<%-- 	<tiles:insertAttribute name="mainHeader" /> --%>
	
	<div class="d-flex flex-column flex-root">
		<!--Page-->
		<div class="page d-flex flex-row flex-column-fluid">

			<!-- sidebar -->
			<tiles:insertAttribute name="sidebar" />

			<!--///////////Page content wrapper///////////////-->
			<main class="page-content d-flex flex-column flex-row-fluid">

				<!-- header -->
				<tiles:insertAttribute name="header" />

				<!-- content -->
				<tiles:insertAttribute name="content" />

				<!-- footer -->
				<tiles:insertAttribute name="footer" />
			</main>
			<!--///////////Page content wrapper End///////////////-->
		</div>
	</div>

	<!--Dashboard duration calendar-->
	<script>
		$(function() {

			var start = moment().subtract(30, 'days');
			var end = moment();

			function cb(start, end) {
				$('#reportrange span').html(
						start.format('D MMM') + ' - ' + end.format('D MMM'));
			}

			$('#reportrange').daterangepicker(
					{
						startDate : start,
						endDate : end,
						ranges : {
							'Today' : [ moment(), moment() ],
							'Yesterday' : [ moment().subtract(1, 'days'),
									moment().subtract(1, 'days') ],
							'Last 7 Days' : [ moment().subtract(6, 'days'),
									moment() ],
							'Last 30 Days' : [ moment().subtract(29, 'days'),
									moment() ],
							'This Month' : [ moment().startOf('month'),
									moment().endOf('month') ],
							'Last Month' : [
									moment().subtract(1, 'month').startOf(
											'month'),
									moment().subtract(1, 'month')
											.endOf('month') ]
						}
					}, cb);

			cb(start, end);

		});
		
		
	</script>

</body>
<script src="/resources/assets/js/theme.bundle.min.dash.js"></script>
<script src="/resources/assets/vendor/moment.min.js"></script>
<script src="/resources/assets/vendor/daterangepicker.js"></script>

</html>

