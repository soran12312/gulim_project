<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/imsi.css" rel="stylesheet">
</head>
<body>



	<div class="send_post_backpage">
		<div class="send_post_name">쪽지 보내기</div>
		<div class = "sendpost_form">
			<form action="">
				<div>
					<p class="sendpost_menu">제목</p>
					<input name="post_title" id="post_title" class="post_title"
						value="제목?">
				</div>
				<div>
					<p class="sendpost_menu">받을 아이디</p>
					<input name="post_f_id" id="post_f_id" class="post_f_id"
						value="친구 아이디?">
				</div>
				<div>
					<p class="sendpost_menu">내용</p>
					<textarea name="post_content" id="post_content" class="post_content"
						value="이거던가"></textarea> 
				</div>
				<div class = "sendpost_btn">
				<button type="submit" >쪽지 보내기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>