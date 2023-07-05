<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css"
	integrity="sha256-46qynGAkLSFpVbEBog43gvNhfrOj+BmwXdxFgVK/Kvc="
	crossorigin="anonymous" />

<style>
#product_area {
	position: relative;
	padding-top: 0;
}

.mix {
	display: none;
}

.product_item .mix {
	display: none;
}

.product_filter {
	margin-bottom: 10px;
}

.product_filter ul {
	margin: 0px 0 40px;
	padding: 0;
	list-style: none;
}

.product_filter ul li {
	font-weight: 400;
	text-transform: uppercase;
	display: inline-block;
	cursor: pointer;
	padding: 12px 22px;
	font-size: 13px;
	border: 1px solid transparent;
	transition: .5s;
	letter-spacing: 1px;
	border-radius: 20px;
	margin: 0px;
	color: #777;
	line-height: 1;
}

.product_filter .filter.active {
	color: #33d286;
	border-color: #33d286;
}

.single_product {
	text-align: center;
	overflow: hidden;
	margin-bottom: 30px;
	border: 1px solid rgba(0, 0, 0, 0.02);
	padding-bottom: 20px;
	background: #fff;
	transition: .5s;
}

.product_image {
	overflow: hidden;
	position: relative;
}

.product_image img {
	width: 100%;
	height: auto;
	transition: all 1.5s ease 0s;
}

.single_product .box-content {
	width: 100%;
	padding: 17px 10px;
	background: #fff;
	position: absolute;
	bottom: -100px;
	left: 0;
	z-index: 1;
	transition: all 0.6s ease 0s;
	overflow: hidden;
	opacity: 0;
	background: rgba(51, 210, 134, .9);
}

.box-content a {
	display: inline-block;
	color: #333;
	font-size: 14px;
	width: 35px;
	height: 35px;
	line-height: 35px;
	background: #fff;
	border: 1px solid #fff;
	border-radius: 50%;
	margin: 0 7px;
	transition: .5s;
}

.product_btm_text p {
	color: #8E8E8E;
	text-transform: uppercase;
	font-size: 13px;
}

.product_btm_text h4 {
	text-transform: capitalize;
	margin-top: 17px;
	margin-bottom: 6px;
	font-size: 17px;
}

.product_btm_text h4, .product_btm_text h4 a {
	color: #333;
}

.new_badge {
	display: inline-block;
	background: #33d286;
	color: #fff;
	padding: 3px 12px;
	font-size: 14px;
	position: absolute;
	top: 15px;
	right: 15px;
	border-radius: 2px;
}

.single_product span.price {
	color: #33d286;
	font-size: 16px;
}

.no-padding {
	padding: 0;
}

.p_rating {
	color: #fec42d;
	cursor: pointer;
}

.single_product.completed img{
		filter: grayscale(100%);
	}
</style>

</head>
<body>
	<header>
		<jsp:include page="../../../../header_before.jsp"></jsp:include>
	</header>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/freelist">자유게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/event">이벤트게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/contest">공모전게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/announce">공지사항</a>
                </li>
            </ul>
        </div>
    </nav>

	<div class="product_item">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6 mix sale"
				style="display: inline-block;" data-bound="">
				<div class="single_product">
					<div class="product_image">
						<img
							src="https://www.karosearch.com/images/categories/medical-hospitals.jpg"
							alt="">
						<div class="box-content">
							<a href="#"><i class="fa fa-heart-o"></i></a> <a href="#"><i
								class="fa fa-cart-plus"></i></a> <a href="#"><i
								class="fa fa-search"></i></a>
						</div>
					</div>
					<div class="product_btm_text">
						<h4>
							<a href="#">이벤트1</a>
						</h4>
					</div>
				</div>
			</div>
			<!-- Add more product items here -->
			<div class="col-lg-4 col-md-4 col-sm-6 mix sale"
				style="display: inline-block;" data-bound="">
				<div class="single_product">
					<div class="product_image">
						<img
							src="https://www.karosearch.com/images/categories/medical-hospitals.jpg"
							alt="">
						<div class="box-content">
							<a href="#"><i class="fa fa-heart-o"></i></a> <a href="#"><i
								class="fa fa-cart-plus"></i></a> <a href="#"><i
								class="fa fa-search"></i></a>
						</div>
					</div>
					<div class="product_btm_text">
						<h4>
							<a href="#">이벤트2</a>
						</h4>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-md-4 col-sm-6 mix sale"
				style="display: inline-block;" data-bound="">
				<div class="single_product">
					<div class="product_image">
						<img
							src="https://www.karosearch.com/images/categories/medical-hospitals.jpg"
							alt="">
						<div class="box-content">
							<a href="#"><i class="fa fa-heart-o"></i></a> <a href="#"><i
								class="fa fa-cart-plus"></i></a> <a href="#"><i
								class="fa fa-search"></i></a>
						</div>
					</div>
					<div class="product_btm_text">
						<h4>
							<a href="#">이벤트3</a>
						</h4>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6 mix sale"
				style="display: inline-block;" data-bound="">
				<div class="single_product completed">
					<div class="product_image ">
						<img
							src="https://www.karosearch.com/images/categories/medical-hospitals.jpg"
							alt="">
						<div class="box-content">
							<a href="#"><i class="fa fa-heart-o"></i></a> <a href="#"><i
								class="fa fa-cart-plus"></i></a> <a href="#"><i
								class="fa fa-search"></i></a>
						</div>
					</div>
					<div class="product_btm_text">
						<h4>
							<a href="#">이벤트4</a>
						</h4>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6 mix sale"
				style="display: inline-block;" data-bound="">
				<div class="single_product">
					<div class="product_image">
						<img
							src="https://www.karosearch.com/images/categories/medical-hospitals.jpg"
							alt="">
						<div class="box-content">
							<a href="#"><i class="fa fa-heart-o"></i></a> <a href="#"><i
								class="fa fa-cart-plus"></i></a> <a href="#"><i
								class="fa fa-search"></i></a>
						</div>
					</div>
					<div class="product_btm_text">
						<h4>
							<a href="#">이벤트5</a>
						</h4>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6 mix sale"
				style="display: inline-block;" data-bound="">
				<div class="single_product">
					<div class="product_image">
						<img
							src="https://www.karosearch.com/images/categories/medical-hospitals.jpg"
							alt="">
						<div class="box-content">
							<a href="#"><i class="fa fa-heart-o"></i></a> <a href="#"><i
								class="fa fa-cart-plus"></i></a> <a href="#"><i
								class="fa fa-search"></i></a>
						</div>
					</div>
					<div class="product_btm_text">
						<h4>
							<a href="#">이벤트6</a>
						</h4>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>

<footer>
	<jsp:include page="../../../../footer.jsp"></jsp:include>
</footer>

</html>