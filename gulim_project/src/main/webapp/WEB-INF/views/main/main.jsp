<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../../../header_before.jsp"></jsp:include>

<!-- START전체 div -->
<div class="backpage">


<!-- ================START OF 좌측 마케팅 메세지==================== -->
			<span class="marketing_messge1">
				준비는 “굴림”이 할게요.<br/>게임하기도 바쁘니까! 
			</span>
			<span class="marketing_messge2">
				함께할 친구를 찾거나 게임을 준비하고 시나리오를 우리 모임에 딱 맞게 설정하는 것,
				모두 다 “굴림”에게 맡겨주세요! 모든것이 “굴림” 속에서!
			</span>
<!-- ================END OF 좌측 마케팅 메세지==================== -->



<!-- ================START OF 로그인폼==================== -->
		<!-- ===== 로그인폼 배경 ===== -->
		<div class="loginform_back"></div>
		<form action="" method="post">
			<!-- ===== 로그인폼 상단 LOGIN 글자 ===== -->
			<span class="loginform_login">Login</span>
			
			<!-- ===== ID ===== -->
			<span class="loginform_id">ID</span>
			<input class="id_input" name = "id" id="id"></input>
			
			<!-- ===== PassWord ===== -->
			<span class="loginform_password">Password</span>
			<input class="password_input" name = "password" id ="password"></input>
			
			
			<button type = "submit" class="loginform_submit">LOGIN</button>
		</form>
		
		<button class="kakaologin_Btn">카카오로 로그인</button>
		<button class="v15_6 v15_5 googlelogin_Btn" >구글아이디로 로그인</button>
		<button class="go_regist">회원가입하러 가기</button>
	
<!-- ================END OF 로그인폼==================== -->


	</div>
	<!-- END 전체 div -->
</body>
</html>