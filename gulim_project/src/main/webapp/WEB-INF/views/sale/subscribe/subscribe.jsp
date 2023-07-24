<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
	
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

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


#selected-image{
	width: 300px; 
	height: 300px;

}

.image-container p.image-month
{

	position: relative;
	top: 10px;
	left: 50px;
	display: inline;

}


.image-container p.image-price
{

	position: relative;
	top: 10px;
	left: 70px;
	display: inline;

}


</style>
</head>
<body>
	<header>
		<jsp:include page="../../../../header_after.jsp"></jsp:include>
	</header>

	<div class="cartbtn">
		<button class="btn" id = "moveCart"  onclick="redirectToCartPage()">장바구니</button>
	</div>
	
	
	<div class="container">

		<div class="text">
			<h3>구독권</h3>
			<hr />
		</div>
	
		
		<div id="selected-image-container" class="image-container"
			style="display: none;">
			<img id="selected-image" />
			<p id="image-month" class="image-month"></p>
			<p id="image-price" class="image-price"></p>
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
									<a href="#" class="thumbnail"><img
										src="/files/images/mypage/1.png" alt="Image"
										style="max-width: 100%;"></a>
									<p class="month">1개월</p>
									<p class="price">9900원</p>
									<p>첫 가입 시 한달 무료</p>

								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="/files/images/mypage/3.png" alt="Image"
										style="max-width: 100%;"></a>

									<p class="month">3개월</p>
									<p class="price">15000원</p>

								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="/files/images/mypage/6.png" alt="Image"
										style="max-width: 100%;"></a>

									<p class="month">6개월</p>
									<p class="price">29900원</p>
									<p>6개월 권을 사면 1개월이 무료</p>
									<p>6+1</p>
								</div>
								
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="/files/images/mypage/12.png" alt="Image"
										style="max-width: 100%;"></a>
									<p class="month">12개월</p>
									<p class="price">55000원</p>
									<p>12개월 권을 사면 2개월이 무료</p>
									<p>12+2</p>
								</div>
							</div>
							<!--.row-->
						</div>
						<!--.item-->
						
						
						
						<div class="carousel-item">
							<div class="row">
								
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="/files/images/mypage/1.png" alt="Image"
										style="max-width: 100%;"></a>
									<p class="month">1개월</p>
									<p class="price">9900원</p>
									<p>첫 가입 시 한달 무료</p>

								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="/files/images/mypage/3.png" alt="Image"
										style="max-width: 100%;"></a>

									<p class="month">3개월</p>
									<p class="price">15000원</p>

								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="/files/images/mypage/6.png" alt="Image"
										style="max-width: 100%;"></a>

									<p class="month">6개월</p>
									<p class="price">29900원</p>
									<p>6개월 권을 사면 1개월이 무료</p>
									<p>6+1</p>
								</div>
								
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="/files/images/mypage/12.png" alt="Image"
										style="max-width: 100%;"></a>
									<p class="month">12개월</p>
									<p class="price">55000원</p>
									<p>12개월 권을 사면 2개월이 무료</p>
									<p>12+2</p>
								</div>
							</div>
							<!--.row-->
						</div>
						<!--.item-->

						<div class="carousel-item">
							<div class="row">
								
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="/files/images/mypage/1.png" alt="Image"
										style="max-width: 100%;"></a>
									<p class="month">1개월</p>
									<p class="price">9900원</p>
									<p>첫 가입 시 한달 무료</p>

								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="/files/images/mypage/3.png" alt="Image"
										style="max-width: 100%;"></a>

									<p class="month">3개월</p>
									<p class="price">15000원</p>

								</div>
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="/files/images/mypage/6.png" alt="Image"
										style="max-width: 100%;"></a>

									<p class="month">6개월</p>
									<p class="price">29900원</p>
									<p>6개월 권을 사면 1개월이 무료</p>
									<p>6+1</p>
								</div>
								
								<div class="col-md-3">
									<a href="#" class="thumbnail"><img
										src="/files/images/mypage/12.png" alt="Image"
										style="max-width: 100%;"></a>
									<p class="month">12개월</p>
									<p class="price">55000원</p>
									<p>12개월 권을 사면 2개월이 무료</p>
									<p>12+2</p>
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

			$.noConflict();
			
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
				shareButton.show()
			}

		}



		
		$('#cart').click(function(e) {
		    e.preventDefault();
		    const month = $('#image-month').text();
		    const price = $('#image-price').text();
		    //console.log(month, price);

		    // 월 및 가격 데이터를 사용하여 JSON 객체 생성
		    const subscriptionData = {
		        month: month,
		        price: price
		    };

		    addToCart(subscriptionData); 
		});

		function addToCart(subscriptionData) {
		    // AJAX 요청
		    $.ajax({
		        url: '/api/add-to-cart', 
		        method: 'POST',
		        data: JSON.stringify(subscriptionData), // 요청하면서 줄 데이터 
		        contentType: 'application/json', 
		        //dataType: 'json', 
		        success: function(response) {       // 서버에서 준 결과를 response라는 변수에 담음
		            // 성공
		            console.log('Added to cart successfully');
		            showModal();
		        },
		        error: function(xhr, status, error) {
		            console.error('Error adding to cart:', error);
		        }
		    });    
		}

		function showModal() {
		    const modalContent = `
		        <div class="modal fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="cartModalLabel" aria-hidden="true">
		            <div class="modal-dialog" role="document">
		                <div class="modal-content">
		                    <div class="modal-header">
		                        <h5 class="modal-title" id="cartModalLabel">Subscription Added to Cart</h5>
		                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                            <span aria-hidden="true">&times;</span>
		                        </button>
		                    </div>
		                    <div class="modal-body">
		                        선택하신 상품이 장바구니에 담겼습니다.
		                    </div>
		                    <div class="modal-footer">
		                        <button type="button" class="btn btn-secondary" data-dismiss="modal">계속 쇼핑하기</button>
		                        <button type="button" class="btn btn-primary" onclick="redirectToCart()">장바구니로 이동</button>
		                    </div>
		                </div>
		            </div>
		        </div>
		    `;

		    // Append the modal content to the body
		    $('body').append(modalContent);

		    // Show the modal
		    $('#cartModal').modal('show');
		}


		// 모달 장바구니페이지 이동
		function redirectToCart() {
		    // Redirect the user to the cart page
		    window.location.href = './basket'; // Replace '/cart' with the actual URL of your cart page
		}


		// 장바구니페이지 이동
		function redirectToCartPage() {
		  window.location.href = "./basket"; 
		}
		
	</script>

</body>
<footer>
	<jsp:include page="../../../../footer.jsp"></jsp:include>
</footer>
</html>
