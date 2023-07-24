<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Additional CSS Files -->

<style>
.start-stream .item {
	padding: 30px;
	border: 1px solid #444;
	border-radius: 23px;
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 50vh;
}

a {
	text-decoration: none;
	color: black;
}

body {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

.start-stream {
	flex: 1;
}

footer {
	flex-shrink: 0;
}

.cartbtn{
	position: relative;
	top:-550px;
	left:500px;
}

</style>

</head>



<body class="d-flex flex-column min-vh-100">
	<header>
		<jsp:include page="../../../header_after.jsp"></jsp:include>
	</header>


	<div
		class="start-stream d-flex align-items-center justify-content-center">
		<div
			class="col-lg-12 d-flex align-items-center justify-content-center">
			<div class="heading-section">
				<!-- <h4><em>How To Start Your</em> Live Stream</h4> -->
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="item">
						<a href="./book">
							<div class="icon">
								<img src="assets/images/service-01.jpg" alt=""
									style="max-width: 60px; border-radius: 50%;">
							</div>
							<h4>설정집 구매</h4>
						</a>
						<!-- <p>Cyborg Gaming is free HTML CSS website template provided by TemplateMo. This is Bootstrap v5.2.0 layout.</p> -->
					</div>
				</div>
				<div class="col-lg-6">
					<div class="item">
						<a href="./subscribe">
							<div class="icon">
								<img src="/assets/images/service-02.jpg" alt=""
									style="max-width: 60px; border-radius: 50%;">
							</div>
							<h4>구독권</h4>
						</a>
						<!-- <p>If you wish to support us, you can make a <a href="https://paypal.me/templatemo" target="_blank">small contribution via PayPal</a> to info [at] templatemo.com</p> -->
					</div>
				</div>
				
				<div class="cartbtn">
					<button class="btn" >장바구니</button>
				</div>

			</div>
		</div>
	</div>



</body>
<footer>
	<jsp:include page="../../../footer.jsp"></jsp:include>
</footer>
</html>