<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>


<title>장바구니</title>


<style>
.cart-wrap {
	padding: 40px 0;
	font-family: 'Open Sans', sans-serif;
}

.main-heading {
	font-size: 19px;
	margin-bottom: 20px;
}

.table-cart table {
	width: 100%;
}

.table-cart thead {
	border-bottom: 1px solid #e5e5e5;
	margin-bottom: 5px;
}

.table-cart thead tr th {
	padding: 8px 0 18px;
	color: #484848;
	font-size: 15px;
	font-weight: 400;
}

.table-cart tr td {
	padding: 40px 0 27px;
	vertical-align: middle;
}

.table-cart tr td:nth-child(1) {
	width: 52%;
}

.table-cart tr td:nth-child(2) {
	width: 26%;
}

.table-cart tr td:nth-child(3) {
	width: 13.333%;
}

.table-cart tr td:nth-child(4) {
	width: 8.667%;
	text-align: right;
}

.table-cart tr td .img-product {
	width: 72px;
	float: left;
	margin-left: 8px;
	margin-right: 31px;
	line-height: 63px;
}

.table-cart tr td .img-product img {
	width: 100%;
}

.table-cart tr td .name-product {
	font-size: 15px;
	color: #484848;
	padding-top: 8px;
	line-height: 24px;
	width: 50%;
}

.table-cart tr td .price {
	text-align: right;
	line-height: 64px;
	margin-right: 40px;
	color: #989898;
	font-size: 16px;
	font-family: 'Nunito';
}

.table-cart tr td .quanlity {
	position: relative;
}

.product-count .qtyminus, .product-count .qtyplus {
	width: 34px;
	height: 34px;
	background: transparent;
	text-align: center;
	font-size: 19px;
	line-height: 34px;
	color: #000;
	cursor: pointer;
	font-weight: 600;
}

.product-count .qtyminus {
	line-height: 32px;
}

.product-count .qtyminus {
	border-radius: 3px 0 0 3px;
}

.product-count .qtyplus {
	border-radius: 0 3px 3px 0;
}

.product-count .qty {
	width: 60px;
	text-align: center;
	border: none;
}

.count-inlineflex {
	display: inline-flex;
	border: solid 2px #ccc;
	border-radius: 20px;
}

.total {
	font-size: 24px;
	font-weight: 600;
	color: #8660e9;
}

.display-flex {
	display: flex;
}

.align-center {
	align-items: center;
}

.coupon-box {
	padding: 63px 0 58px;
	text-align: center;
	border: 2px dotted #e5e5e5;
	border-radius: 10px;
	margin-top: 55px;
}

.coupon-box form input {
	display: inline-block;
	width: 264px;
	margin-right: 13px;
	height: 44px;
	border-radius: 25px;
	border: solid 2px #cccccc;
	padding: 5px 15px;
	font-size: 14px;
}

input:focus {
	outline: none;
	box-shadow: none;
}

.round-black-btn {
	border-radius: 25px;
	background: #212529;
	color: #fff;
	padding: 8px 35px;
	display: inline-block;
	border: solid 2px #212529;
	transition: all 0.5s ease-in-out 0s;
	cursor: pointer;
}

.round-black-btn:hover, .round-black-btn:focus {
	background: transparent;
	color: #212529;
	text-decoration: none;
}

.cart-totals {
	border-radius: 3px;
	background: #e7e7e7;
	padding: 25px;
}

.cart-totals h3 {
	font-size: 19px;
	color: #3c3c3c;
	letter-spacing: 1px;
	font-weight: 500;
}

.cart-totals table {
	width: 100%;
}

.cart-totals table tr th, .cart-totals table tr td {
	width: 50%;
	padding: 3px 0;
	vertical-align: middle;
}

.cart-totals table tr td:last-child {
	text-align: right;
}

.cart-totals table tr td.subtotal {
	font-size: 20px;
	color: #6f6f6f;
}

.cart-totals table tr td.free-shipping {
	font-size: 14px;
	color: #6f6f6f;
}

.cart-totals table tr.total-row td {
	padding-top: 25px;
}

.cart-totals table tr td.price-total {
	font-size: 24px;
	font-weight: 600;
	color: #8660e9;
}

.btn-cart-totals {
	text-align: center;
	margin-top: 60px;
	margin-bottom: 20px;
}

.btn-cart-totals .round-black-btn {
	margin: 10px 0;
}
</style>


</head>
<body>

	<header>
		<jsp:include page="../../../../header_after.jsp"></jsp:include>
	</header>
<div class="mainbackpage">
	<div class="cart-wrap margindiv">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="main-heading">Shopping Cart</div>
					<div class="table-cart">
						<table>
							<thead>
								<tr>
									<th>제품</th>
									<th>수량</th>
									<th>금액</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${subscription == null}">
										<tr>
											<td colspan="4">장바구니에 상품이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${subscription}" var="subscription">
											<tr>
											
												<td>
													<div class="display-flex align-center">
														<div class="img-product">
															<!-- <img
																src="https://www.91-img.com/pictures/laptops/asus/asus-x552cl-sx019d-core-i3-3rd-gen-4-gb-500-gb-dos-1-gb-61721-large-1.jpg"
																alt="" class="mCS_img_loaded"> -->
															
															
															<c:choose>
																<c:when test="${subscription.price == 9900}">
							                                        <img src="/files/images/mypage/1.png" alt="" class="mCS_img_loaded">
							                                    </c:when>
																<c:when test="${subscription.price == 15000}">
							                                        <img src="/files/images/mypage/3.png" alt="" class="mCS_img_loaded">
							                                    </c:when>
																<c:when test="${subscription.price == 29900}">
							                                        <img src="/files/images/mypage/6.png" alt="" class="mCS_img_loaded">
							                                    </c:when>
																<c:when test="${subscription.price == 55000}">
							                                        <img src="/files/images/mypage/12.png" alt="" class="mCS_img_loaded">
							                                    </c:when>
																<%-- <c:otherwise>
							                                        기타
							                                    </c:otherwise> --%>
															</c:choose>
															
																
														</div>
													
														<div class="name-product">
															<input type="hidden" name="product-id" value="${subscription.sub_num}" class="product-id">
															<c:choose>
																<c:when test="${subscription.price == 9900}">
							                                        1개월
							                                    </c:when>
																<c:when test="${subscription.price == 15000}">
							                                        3개월
							                                    </c:when>
																<c:when test="${subscription.price == 29900}">
							                                        6개월
							                                    </c:when>
																<c:when test="${subscription.price == 55000}">
							                                        12개월
							                                    </c:when>
																<%-- <c:otherwise>
							                                        기타
							                                    </c:otherwise> --%>
															</c:choose>
														</div>
														
													</div>
												</td>
												<td class="product-count">
													<form action="#" class="count-inlineflex">
														<div class="qtyminus" >-</div>
														
														<input type="text" name="quantity" value="${subscription.amount}" class="qty">
														<div class="qtyplus" >+</div>
													</form>
												</td>
												<td>
													<div class="total">
														<div class="price" data-price="${subscription.price * subscription.amount}">
															${subscription.price * subscription.amount} 
														</div>
													</div>
												</td>
												<td>
													<a href="" title="" > 
														<span class="pull-right" id="slide-submenu" onclick="showConfirmationPopup(${subscription.sub_num})">
												                <i class="fa fa-times"></i>
												         </span>
													</a>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>

					</div>
					<!-- /.table-cart -->
				</div>
				<!-- /.col-lg-8 -->
				<div class="col-lg-4">
					<div class="cart-totals">
						<h3>Cart Totals</h3>
						<form action="#" method="get" accept-charset="utf-8">
							<table>
								<tbody>
									<tr>
										<td>Subtotal</td>
										<td class="subtotal"></td>
									</tr>
									<tr>
										<td>배송비</td>
										<td class="free-shipping">2500원</td>
									</tr>
									<tr class="total-row">
										<td>총금액</td>
										<td class="price-total"></td>
									</tr>
								</tbody>
							</table>
							<div class="btn-cart-totals">
								<a href="#" id="payment" class="update round-black-btn" title="">결제하기</a>
								<!-- <a href="#" class="checkout round-black-btn" title="">Proceed to Checkout</a> -->
							</div>
							<!-- /.btn-cart-totals -->
						</form>
						<!-- /form -->
					</div>
					<!-- /.cart-totals -->
				</div>
				<!-- /.col-lg-4 -->
			</div>
		</div>
	</div>
</div>
<jsp:include page="../../../../footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
		
		
		
		
	<script type="text/javascript">
	 $(document).ready(function () {
	        // (minus) button
	        $(".qtyminus").on("click", function () {
	            const qtyInput = $(this).siblings(".qty");
	            let currentQty = parseInt(qtyInput.val());
	            if (currentQty > 1) {
	                currentQty -= 1;
	                qtyInput.val(currentQty);
	                updateCartItem(qtyInput);
	                updateTotalPrice(qtyInput);
	            }
	        });

	        // + (plus) button
	        $(".qtyplus").on("click", function () {
	            const qtyInput = $(this).siblings(".qty");
	            const currentQty = parseInt(qtyInput.val());
	            const newQty = currentQty + 1;
	            qtyInput.val(newQty);
	            updateCartItem(qtyInput);
	            updateTotalPrice(qtyInput);
	        });

	        function updateCartItem(qtyInput) {
	        	const productId = qtyInput.closest("tr").find(".product-id").val();
	            const newQty = parseInt(qtyInput.val());
	            const jsonData= { sub_num: productId, amount: newQty };
	            // console.log(jsonData);
	            // console.log(productId);
	            // console.log(newQty);

	            $.ajax({
	                type: "POST",
	                url: "/api/update-quantity", 
	                contentType: "application/json",
	                data: JSON.stringify(jsonData), // json데이터로 변환
	                success: function (response) {
	                    // 성공
						// alert("수량이 업데이트되었습니다.");
						// console.log(response);
                    	console.log("Updated quantity in the database.");
			             
	                    	
	                },
	                error: function (xhr, status, error) {
	                    // Handle errors here (if needed)
	                    console.error("Error updating quantity: " + error);
	                }
	            });
	        }
	    });


	 

		// X버튼 클릭시
	   function showConfirmationPopup(subscriptionId) {
	        if (confirm("정말로 삭제하시겠습니까?")) {
	            deleteCartItem(subscriptionId);
	        } 
	    }

		// 장바구니 삭제
	    function deleteCartItem(subscriptionId) {

	    	console.log("Deleting Subscription ID:"+ subscriptionId); 
		    
	        $.ajax({
	            type: "POST",
	            url: "/api/delete-subscription", // 서버의 컨트롤러 URL
	            contentType: "application/json",
	            data: JSON.stringify({ sub_num: subscriptionId }),     // 요청하면서 준 데이터
	            success: function (response) {
	                alert("삭제되었습니다.");
	                // 삭제가 성공하면 해당 구독권의 행을 화면에서 삭제
	                console.log(response);
	                
	            },
	            error: function (xhr, status, error) {
	                console.error("Error deleting subscription: " + error);
	                //alert('error');
	            }
	        });
	    }



	     // +, - 클릭시 가격 변경
		 function updateTotalPrice(qtyInput) {
	         const priceCell = qtyInput.closest("tr").find(".price");
	         const pricePerItem = parseInt(priceCell.attr("data-price")); // "데이터 가격" 속성에서 품목당 가격 가져오기
	         const newQty = parseInt(qtyInput.val());
	         const totalPrice = pricePerItem * newQty;
	         priceCell.text(totalPrice); // 총 가격 업데이트

	         updateCartTotal();
	     }

		 // 배송비 포함된 가격
	     function updateCartTotal() {
	         let cartTotal = 0;
	         $(".price").each(function () {
	             cartTotal += parseInt($(this).text());
	         });

	         const shippingCost = 2500; // 배송비 2500원
	         const subTotal = cartTotal;
	         const total = cartTotal + shippingCost;

	         $(".subtotal").text(subTotal);
	         $(".price-total").text(total);
	     }

	     // 페이지 로드 시 카트 합계
	     updateCartTotal();
		    




	  // 결제하기 버튼 클릭 시
	    $("#payment").on("click", function () {
		    // 카트에서 모든 구독 ID 및 수량 수집
		    const cartItems = [];
		    
	        $("tr").each(function () {
	            const productId = $(this).find(".product-id").val();
	            const quantity = parseInt($(this).find(".qty").val());
	            const cartItem = {
	                sub_num: productId, // sub_num 속성 추가
	                amount: quantity    // amount 속성은 이미 정의되어 있음
	            };
	            cartItems.push(cartItem);
	        });
		
		    // 결제 및 데이터베이스 업데이트를 위해 카트 항목을 서버로 보냄
		    $.ajax({
		        type: "POST",
		        url: "/api/checkout",
		        contentType: "application/json",
		        data: JSON.stringify(cartItems),
		        success: function (response) {
		            alert("결제가 완료되었습니다."); //성공
		            // 장바구니 삭제
		           location.reload(); // 결제 후 카트를 삭제하기 위해 페이지 다시 로드
		        },
		        error: function (xhr, status, error) {
		            alert("결제 오류가 발생했습니다. 다시 시도해주세요.");
		        },
		    });
		});

	</script>	
		
		
		
		
		
		

</body>
<footer>
	<jsp:include page="../../../../footer.jsp"></jsp:include>
</footer>


</html>