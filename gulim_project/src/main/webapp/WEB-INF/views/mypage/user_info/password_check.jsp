%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 체크</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
</head>
<body>



	<div class="password_backpage">
			<form action="">
				<div>
					<p class="send_message_name">비밀번호 확인</p>
					<input name="password" id="password_check" class="message_title" placeholder="비밀번호를 입력하세요" onblur="this.placeholder='쪽지제목을 입력하세요'">
				</div>
					<button type="submit" class="password_check_btn cursor ">확인</button>
			</form>
	</div>

</body>
</html>