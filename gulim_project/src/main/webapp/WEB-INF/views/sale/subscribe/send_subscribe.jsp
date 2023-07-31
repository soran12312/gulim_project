<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독권 보내기</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

</head>
<body>
	<div class="send_message_backpage">
		<div class="send_message_name_back">
			<div class="send_message_name">구독권</div>
		</div>
		<div class = "sendmessage_form">
			<form action="" id="sendmessage_form">
				
				<div>
					<p class="sendmessage_menu">친구 아이디</p>
					<input name="receive_id" id="receive_id" class="receive_id" placeholder="받을 친구의 아이디를 입력하세요" onblur="this.placeholder='받을 친구의 아이디를 입력하세요'" value="${send_id}">
				</div>
			
				<div class = "sendmessage_btn cursor">
					<button type="button" class="cursor" id="send_subscription">구매하기</button>
					<!-- <button type="button" class="cursor" id="send_message_submit">장바구니</button> -->
				</div>
			</form>
		</div>
	</div>
	
	
	
	<script>





	</script>
	
	
	
	
	
	
</body>
</html>