<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/resources/assets/img/favicon.ico" type="image/ico">
<link href="/resources/assets/vendor/node_modules/css/swiper-bundle.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="/resources/assets/fonts/boxicons/css/boxicons.min.css">

<link rel="stylesheet"
	href="/resources/assets/vendor/node_modules/css/aos.css">

<link rel="stylesheet"
	href="/resources/assets/fonts/iconsmind/iconsmind.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,400&family=Source+Serif+Pro:ital@0;1&display=swap" rel="stylesheet">
<link href="/resources/assets/css/theme.min.css" rel="stylesheet">
</head>
<body>
	<main>
		<section class="position-relative overflow-hidden">
			<div>
				<div class="swiper swiper-fade position-relative overflow-visible">
					<div class="swiper-wrapper">

						<!--Slide item-->
						<!--Slide item-->
						<div class="swiper-slide">
							<div
								class="position-relative vh-100 d-flex align-items-center justify-content-center">
								<img alt="" src="/resources/images/t01.jpg"
									class="position-absolute h-100 w-100">
							</div>
						</div>
						<div class="swiper-slide">
							<div
								class="position-relative vh-100 d-flex align-items-center justify-content-center">
								<img alt="" src="/resources/images/t02.jpg"
									class="position-absolute h-100 w-100">
							</div>
						</div>
						<div class="swiper-slide">
							<div
								class="position-relative vh-100 d-flex align-items-center justify-content-center">
								<img alt="" src="/resources/images/t03.jpg"
									class="position-absolute h-100 w-100">
							</div>
						</div>
						<div class="swiper-slide">
							<div
								class="position-relative vh-100 d-flex align-items-center justify-content-center">
								<img alt="" src="/resources/images/t04.jpg"
									class="position-absolute h-100 w-100">
							</div>
						</div>
						<div class="swiper-slide">
							<div
								class="position-relative vh-100 d-flex align-items-center justify-content-center">
								<img alt="" src="/resources/images/t05.jpg"
									class="position-absolute h-100 w-100">
							</div>
						</div>
						<div class="swiper-slide">
							<div
								class="position-relative vh-100 d-flex align-items-center justify-content-center">
								<img alt="" src="/resources/images/t06.jpg"
									class="position-absolute h-100 w-100">
							</div>
						</div>
						<div class="swiper-slide">
							<div
								class="position-relative vh-100 d-flex align-items-center justify-content-center">
								<img alt="" src="/resources/images/t07.jpg"
									class="position-absolute h-100 w-100">
							</div>
						</div>


					</div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
			</div>
		</section>
	</main>
	<!-- begin Back to Top button -->
	<a href="#" class="toTop"> <i class="bx bxs-up-arrow"></i>
	</a>
	<!-- scripts -->
	<script src="/resources/assets/js/theme.bundle.min.js"></script>

	<!--swiper script-->
	<script
		src="/resources/assets/vendor/node_modules/js/swiper-bundle.min.js"></script>

	<script>
		var swiper = new Swiper(".swiper-1", {
			slidesPerView : 1,
			spaceBetween : 16,
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
		});

		var swiper2 = new Swiper(".swiper-2", {
			slidesPerView : 2,
			spaceBetween : 8,
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
		});
		var swiper2 = new Swiper(".swiper-3", {
			slidesPerView : 1,
			spaceBetween : 8,
			centerSlides : true,
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
			breakpoints : {
				640 : {
					slidesPerView : 2,
					spaceBetween : 20,
				},
				768 : {
					slidesPerView : 3,
					spaceBetween : 40,
				}
			},
		});
		var swiperFade = new Swiper('.swiper-fade', {
			effect : 'fade',
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
			fadeEffect : {
				crossFade : true
			},
			 on: {
			        reachEnd: function () {
			            window.location.href = "/coco/project/register";
			        }
			    }
		});
		var swiperFade = new Swiper('.swiper-cards', {
			effect : "cards",
			grabCursor : true,
			cardsEffect : {
				slideShadows : false,
			},
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			}
		});
	</script>
</body>

</html>
