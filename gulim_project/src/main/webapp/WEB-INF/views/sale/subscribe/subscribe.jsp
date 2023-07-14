<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="initial-scale=1, width=device-width" />
<title>구독</title>

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
	display: flex;
	min-height: 130vh;
	flex-direction: column;
}

.container {
	flex: 1;
	display: flex;
	align-items: center;
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
	position: relative;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.image-container {
	top: -20px;
	position: relative;
}

#cart {
	display: none; /* 버튼 초기에는 숨김 처리 */
	top: -120px;
	left: 300px;
	position: relative;
}

#share {
	display: none; /* 버튼 초기에는 숨김 처리 */
	top: -158px;
	left: 450px;
	position: relative;
}

.cartbtn{
	position: relative;
	top: 70px;
	left: 1500px;
}


</style>
</head>
<body>
	<header>
		<jsp:include page="../../../../header_before.jsp"></jsp:include>
	</header>

	<div class="cartbtn">
		<button class="btn" >장바구니</button>
	</div>
	
	
	<div class="container">

		<div class="text">
			<h3>구독권</h3>
			<hr />
		</div>
	
		
		<div id="selected-image-container" class="image-container"
			style="display: none;">
			<img id="selected-image" />
			<p id="image-month"></p>
			<p id="image-price"></p>
			<button class="btn btn-danger" id="cart">장바구니</button>
			<button class="btn btn-danger" id="share">친구에게 보내기</button>
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
									<a href="#" class="thumbnail">
										<img  src="http://placehold.it/250x250" alt="Image" style="max-width: 100%;">
									</a>
									<p class="month">일회권</p>
									<p class="price">5000원</p>

								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
									<p class="month">1개월</p>
									<p class="price">9900원</p>
									<p>첫 가입 시 한달 무료</p>

								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>

									<p class="month">3개월</p>
									<p class="price">15000원</p>

								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>

									<p class="month">6개월</p>
									<p class="price">9900원</p>
									<p>6개월 권을 사면 1개월이 무료</p>
									<p>6+1</p>
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
									<p class="month">12개월</p>
									<p class="price">55000원</p>
									<p>12개월 권을 사면 2개월이 무료</p>
									<p>12+2</p>
								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
										
									<p class="month">6개월</p>
									<p class="price">9900원</p>
									<p>6개월 권을 사면 1개월이 무료</p>
									<p>6+1</p>	

								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
										
									<p class="month">3개월</p>
									<p class="price">15000원</p>
								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
										
									<p class="month">1개월</p>
									<p class="price">9900원</p>
									<p>첫 가입 시 한달 무료</p>	
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
									<p class="month">일회권</p>
									<p class="price">5000원</p>	
								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
									
									<p class="month">1개월</p>
									<p class="price">9900원</p>
									<p>첫 가입 시 한달 무료</p>
								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
										
									<p class="month">3개월</p>
									<p class="price">15000원</p>
								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="http://placehold.it/250x250" alt="Image"
										style="max-width: 100%;"></a>
									<p class="month">6개월</p>
									<p class="price">9900원</p>
									<p>6개월 권을 사면 1개월이 무료</p>
									<p>6+1</p>	
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
				interval : 5000
			})
		});

		$(function() {
			$('.thumbnail').on('click', showImageInfo);

		});
		
		function showImageInfo(event) {
			const clickedImage = $(this).find('img');
			const month = $(this).parent().find('p.month').text();
			
			const price = $(this).parent().find('p.price').text();
			
			const cartButton = $('#cart');
			const shareButton = $('#share');

			const selectedImage = $('#selected-image');
			
			if (clickedImage && clickedImage.attr('src')) {
				selectedImage.attr('src', clickedImage.attr('src'));
			}

			const imageMonth = $('#image-month');
			imageMonth.text(month);

			const imagePrice = $('#image-price');
			imagePrice.text(price);

			const selectedImageContainer = $('#selected-image-container');
			selectedImageContainer.show();

			if (cartButton && shareButton) {
				cartButton.show();
				shareButton.show();
			}
		}
	</script>

</body>
<footer>
	<jsp:include page="../../../../footer.jsp"></jsp:include>
</footer>
</html>
