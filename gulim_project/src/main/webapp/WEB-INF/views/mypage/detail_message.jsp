<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
</head>
<body>



	<div class="send_message_backpage">
		<div class="send_message_name">쪽지</div>
		<div class = "sendmessage_form">
			<form action="/mypage/send_message">
				<div><input type="hidden" value="${message.send_id}" name="send_id" />
					<p class="sendmessage_menu">제목</p>
					<input id="message_title" class="message_title"
						value="${message.message_title}" disabled>
				</div>
				<div>
					<p class="sendmessage_menu">보낸사람</p>
					<input class="send_id"
						value="${message.send_id}" disabled>
				</div>
				<div>
					<p class="sendmessage_menu">내용</p>
					<textarea class="message_content"
						 disabled>${message.message_content}</textarea> 
				</div>
				<div class = "sendmessage_btn cursor">
				<button type="submit" class="cursor" >답장하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>