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
			<form action="send_message">
				<div>
					<p class="sendmessage_menu">제목</p>
					<input name="message_title" id="message_title" class="message_title"
						value="제목임">
				</div>
				<div>
					<p class="sendmessage_menu">보낸사람</p>
					<input name="send_id" id="send_id" class="send_id"
						value="아이디">
				</div>
				<div>
					<p class="sendmessage_menu">내용</p>
					<textarea name="message_content" id="message_content" class="message_content"
						value="내용"></textarea> 
				</div>
				<div class = "sendmessage_btn cursor">
				<button type="submit" class="cursor" >답장하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>