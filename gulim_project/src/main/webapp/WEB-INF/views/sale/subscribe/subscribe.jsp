<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="initial-scale=1, width=device-width" />
<title>구독제</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400&display=swap" />
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Popper.js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>

<!-- Bootstrap -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<style>
body {
	padding-top: 20px;
}

footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
}

.carousel {
	margin-bottom: 0;
	padding: 0 40px 30px 40px;
}

/* The controls */
.carousel-control {
	left: -12px;
	height: 40px;
	width: 40px;
	background: none repeat scroll 0 0 #222222;
	border: 4px solid #FFFFFF;
	border-radius: 23px 23px 23px 23px;
	margin-top: 90px;
}

.carousel-control.right {
	right: -12px;
}

/* The indicators */
.carousel-indicators {
	right: 50%;
	top: auto;
	bottom: -10px;
	margin-right: -19px;
}

/* The color of the indicators */
.carousel-indicators li {
	background: #cecece;
}

.carousel-indicators .active {
	background: #428bca;
}

.div1 {
	position: absolute;
}

.div1 {
	top: 173px;
	left: 247px;
	font-size: var(--font-size-13xl);
	text-align: left;
}

/* Center content vertically */
.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.image-container {
	top: -150px;
	position: relative;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../../../../header_before.jsp"></jsp:include>
	</header>

	<div class="container">

		<div id="selected-image-container" class="image-container"
			style="display: none;">
			<img id="selected-image" />
		</div>

		<div class="row">
			<div class="col-md-12 d-flex justify-content-center">
				<div id="Carousel" class="carousel slide" data-ride="carousel">

					<ol class="carousel-indicators">
						<li data-target="#Carousel" data-slide-to="0" class="active"></li>
						<li data-target="#Carousel" data-slide-to="1"></li>
						<li data-target="#Carousel" data-slide-to="2"></li>
					</ol>

					<!-- Carousel items -->
					<div class="carousel-inner">

						<div class="carousel-item active">
							<div class="row">
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"
										onclick="showImage('http://placehold.it/250x250')"></a>

									
								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
								</div>
							</div>
							<!--.row-->
						</div>
						<!--.item-->

						<div class="carousel-item">
							<div class="row">
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
								</div>
							</div>
							<!--.row-->
						</div>
						<!--.item-->

						<div class="carousel-item">
							<div class="row">
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
								</div>
							</div>
							<!--.row-->
						</div>
						<!--.item-->

					</div>
					<!--.carousel-inner-->
					<a class="carousel-control-prev" href="#Carousel" role="button"
						data-slide="prev"> <span class="carousel-control-prev-icon"
						aria-hidden="true"></span> <span class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#Carousel" role="button"
						data-slide="next"> <span class="carousel-control-next-icon"
						aria-hidden="true"></span> <span class="sr-only">Next</span>
					</a>
				</div>
				<!--.Carousel-->





			</div>
		</div>
	</div>
	<!--.container-->


	<script>
		$(document).ready(function() {
		    $('#Carousel').carousel({
		        interval: 5000
		    })
		});

		function showImage(imageUrl) {
		      let selectedImage = document.getElementById("selected-image");
		      selectedImage.src = imageUrl;

		      let selectedImageContainer = document.getElementById("selected-image-container");
		      selectedImageContainer.style.display = "block";
		}
	</script>

	<footer>
		<jsp:include page="../../../../footer.jsp"></jsp:include>
	</footer>
</body>
</html>
