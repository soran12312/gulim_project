<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굴림</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){

	// Model에 id가 있으면(구글 또는 카카오 로그인확인하여 db에 데이터가 있을 경우) /main/login 으로 이동
	if(${not empty id}) location.href="/main/login?id=${id}";
	
	// 구글 로그인 버튼 클릭 시 함수
	const getGoogleLoginUri = ()=>{
		$.ajax({
			url		: '/main/getGoogleLoginUri'
			,success	: function(result){
				location.href=result;
			}
			,error	: function(err){
				alert('error');
				console.log(err);
			}
		}); // end of ajax
	} // end of getGoogleLoginUri

	// 카카오 로그인 버튼 클릭 시 함수
	const getKakaoLoginUri = ()=>{
		$.ajax({
			url		: '/main/getKakaoLoginUri'
			,success	: function(result){
				location.href=result;
			}
			,error	: function(err){
				alert('error');
				console.log(err);
			}
		}); // end of ajax
	} // end of getKakaoLoginUri

	// 회원가입 버튼 클릭 시 함수
	const linkToRegist = () => location.href="/main/regist_form";

	// 로그인 버튼 클릭 시 이벤트
	const loginCheck = (event) => {
		event.preventDefault();
		var params = { id : $("#id").val() 
				, password: $("#password").val() };
		$.ajax({
			type	: 'post'
			,data	: params
			,url	: '/main/loginCheck'
			,success	: function(result){
				if(result != "") location.href="/main/login?id="+result;
				else alert("로그인 실패");
			}
			,error	: function(err){
				alert('error');
				console.log(err);
			}
		}); // end of ajax
	} // end of loginCheck

	// 구글 로그인 버튼 클릭 시
	$("#g_login_btn").click(getGoogleLoginUri);
	// 카카오 로그인 버튼 클릭 시
	$("#k_login_btn").click(getKakaoLoginUri);
	// 회원가입 버튼 클릭 시
	$("#regist").click(linkToRegist);
	// 로그인 버튼 클릭 시
	$("#loginform_submit").click(loginCheck);

}); // end of $
</script>
</head>
<body>
<jsp:include page="../../../header_before.jsp"></jsp:include>

<!-- START전체 div -->
<div class="mainbackpage">


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
		<form action="/main/loginCheck" method="post">
			<!-- ===== 로그인폼 상단 LOGIN 글자 ===== -->
			<span class="loginform_login">Login</span>
			
			<!-- ===== ID ===== -->
			<span class="loginform_id">ID</span>
			<input class="id_input" name = "id" id="id"></input>
			
			<!-- ===== PassWord ===== -->
			<span class="loginform_password">Password</span>
			<input type="password" class="password_input" name = "password" id ="password"></input>
			
			
			<button type = "submit" class="loginform_submit" id="loginform_submit">LOGIN</button>
		</form>
		
		<button id="k_login_btn" class="kakaologin_Btn"></button>
		<button id="g_login_btn" class="googlelogin_Btn" ></button>
		<button id="regist" class="go_regist"></button>
	
<!-- ================END OF 로그인폼==================== -->


	</div>
	<!-- END 전체 div -->
	
<jsp:include page="../../../footer.jsp"></jsp:include>
</body>
</html>