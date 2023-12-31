<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="../../css/place.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</head>

<body>
	<div>
		<h1 class="book_text">많이 보는 설정집</h1>
		<div class="book_hr">
			<hr />
		</div>

		<div >
			<div>
				<c:forEach items="${result}" var="book">
					<div class="book_item">
						<input type="hidden" name="book_num" value="${book.book_num}" />
						<img src="${book.path}" class="book_image" />
						<div class="book_title">${book.book_title}</div>
						<div class="book_simple_info">${book.simple_info}</div>

						<div class="book_view_container">
							<div class="book_view">
								<h1>상 세 보 기</h1>
							</div>
						</div>
						<div class="book_views_container">
							<div class="book_views">
								<hr />
							</div>
						</div>
						<div class="book_detail">${book.book_detail}</div>
						<div class="book_price">${book.price}원</div>
						<div class="book_writer">${book.writer}</div>
					</div>

				</c:forEach>
			</div>
		</div>

		<button class="pocket book_btn" id="cart">장바구니</button>
		<button class="purchase book_btns" id="purchase">구매하기</button>
	</div>

</body>
	
<script type="text/javascript">



$('#cart').click(function() {
    const bookData = {
        book_num: $('input[name="book_num"]').val(),
    };

    console.log(bookData);

    addToCart(bookData); 
});

function addToCart(bookData) {
    // AJAX 요청
    $.ajax({
        url: '/api/add-to-cart2', 
        method: 'POST',
        data: JSON.stringify(bookData), // 요청하면서 줄 데이터 
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
    	<div id="modal">
	        <div class="modal-dialog">
	          <div class="modal-content">
	            <div class="modal-header">
	              <h4 class="modal-title">book Added to Cart</h4>
	              <button type="button" class="close" id="close-modal">&times;</button>
	            </div>
	            <div class="modal-body">
	              <p>선택하신 상품이 장바구니에 담겼습니다.</p>
	            </div>
	            <div class="modal-footer">
	              <button type="button" class="btn btn-secondary" id="close-modal">계속 쇼핑하기</button>
	              <button type="button" class="btn btn-primary" onclick="redirectToCart()">장바구니로 이동</button>
	            </div>
	          </div>
	        </div>
	     </div>
    `;

    // Append the modal content to the body
    $('body').append(modalContent);

    // Show the modal
    $('#modal').modal('show');
}


function closeModal() {
    // Hide the modal
    $('#modal').modal('hide');

    // Remove the modal from the DOM after it's hidden
    $('#modal').remove();
  }


// 모달 장바구니페이지 이동
function redirectToCart() {
    // Redirect the user to the cart page
    window.parent.location.href = '/sale/basket2'; 
}



$('#purchase').click(function() {
    const bookData = {
        book_num: $('input[name="book_num"]').val(),
    };

    //console.log(bookData);

    completePurchase(bookData); 
});

function completePurchase(bookData) {
    // AJAX 요청
    $.ajax({
        url: '/api/complete-purchase', 
        method: 'POST',
        data: JSON.stringify(bookData), // 요청하면서 줄 데이터 
        contentType: 'application/json', 
        //dataType: 'json', 
        success: function(response) {       // 서버에서 준 결과를 response라는 변수에 담음
            // 성공
            //console.log('Purchase completed successfully');
            alert('구매가 완료되었습니다.'); // Display a modal with a message
        },
        error: function(xhr, status, error) {
            console.error('Error completing the purchase:', error);
        }
    });    
}



    
    </script>

</html>
