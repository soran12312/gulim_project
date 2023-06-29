<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); //한글처리 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굴림</title>
<link href="/css/main.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	// 아이디 중복확인 버튼 클릭 이벤트
	$("#idCheck").click(function(event){
		event.preventDefault();
		$.ajax({
			type		: 'post'
			,data		: $("#id").val()
			,url		: '/idCheck'
			,success	: function(result){
				alert(result);
			}
			,error	: function(err){
				alert('error');
				console.log(err);
			}
		}); // end of ajax
	}); // end of click evt

	// 화면 로딩 시 메시지 가림
	$("#message").hide();
	
	// 비밀번호 확인 input태그 포커스 벗어날 시 이벤트
	// 비밀번호와 비교해서 다르면 메시지 출력
	$("#pass_check").blur(function(){
		var pass = $("#password").val();
		var pass_check = $("#pass_check").val();
		if(pass != pass_check){
			$("#message").show();
		}else{
			$("#message").hide();
		}
	}); // end of blur evt

	// 주소검색 버튼 클릭 시 카카오api로 주소 검색하여 주소 input의 value로 검색결과 set
	$("#postcodeSearch").click(function(event){
		event.preventDefault();
		new daum.Postcode({oncomplete: function(data) {
				$("#addr1").val(data.address);
			}
        }).open();
	}); // end of click evt

	// form submit 시 주소, 상세주소내용 합해서 address의 value로 setting
	$("#regist_form").submit(function(){
		var addr1 = $("#addr1").val();
		var addr2 = $("#addr2").val();

		$("#address").val(addr1+" "+addr2);
	}); // end of submit evt
	
}); // end of $
</script>
</head>
<body>
<jsp:include page="../../../header_before.jsp"></jsp:include>
<div class="all_body pl_20">
	<div class="fs_30 pt_30">굴림세상으로 떠나기 전 준비해주세요!</div>
	<div class="fs_20 pt_10">소중한 개인정보는 굴림에서 게임용도로만 사용되며 마케팅용으로는 사용되지 않아요!</div>
	
	<div class="pt_30">
		<form action="/main/email_confirm" class="fs_25" method="post" id="regist_form">
		
			<input type="hidden" name="address" id="address">
			<input type="hidden" name="email" id="email">
			
			<table class="regist_form">
				<tr class="h_50">
					<td class="ta_c">
						<label for="name">이름</label>
					</td>
					<td class="ta_l">
						<input type="text" id="name" name="name" class="fill" required>
					</td>
					<td class="w_190"/>
					<td class="ta_c">
						<label for="nickname">닉네임</label>
					</td>
					<td class="ta_l">
						<input type="text" id="nickname" name="nickname" class="fill" required>
					</td>
				</tr>
				<tr class="h_50">
					<td class="ta_c">
						<label for="id">아이디</label>
					</td>
					<td class="ta_l">
						<input type="text" name="id" id="id" class="fill" required>
					</td>
					<td class="ta_l w_190">
						<button id="idCheck">중복확인</button>
					</td>
					<td class="ta_c">
						<label for="birthday">생년월일</label>
					</td>
					<td class="ta_l">
						<input type="date" class="fill" id="birthday" name="birthday" required>
					</td>
				</tr>
				<tr class="h_50">
					<td class="ta_c">
						<label for="password">비밀번호</label>
					</td>
					<td class="ta_l">
						<input type="password" class="fill" name="password" id="password" placeholder="8~16자리 숫자, 영문, 특수문자 각 1개 이상 포함" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" required>
					</td>
					<td class="w_190"/>
					<td class="ta_c">
						<label for="tel">전화번호</label>
					</td>
					<td class="ta_l">
						<input type="text" class="fill" id="tel" name="tel" placeholder="- 없이 숫자만 적어주세요" pattern="[0-9]{10,}" required>
					</td>
				</tr>
				<tr class="h_50">
					<td class="ta_c">
						<label for="pass_check">비밀번호 확인</label>
					</td>
					<td class="ta_l">
						<input type="password" class="fill" id="pass_check" required>
					</td>
					<td><span id="message" class="col_r fs_13 w_190">비밀번호가 일치하지 않습니다.</span></td>
					<td class="ta_c">
						<label for="addr1">주소</label>
					</td>
					<td class="ta_l">
						<input type="text" class="fill" id="addr1" required>
					</td>
					<td><input class="postcodeSearch" type="button" id="postcodeSearch" name="postcodeSearch" value="주소검색"></td>
				</tr>
				<tr class="h_50 ta_r">
					<td colspan="3"/>
					<td class="ta_c">
						<label for="addr2">상세주소</label>
					</td>
					<td class="ta_l">
						<input type="text" class="fill" id="addr2">
					</td>
				</tr>
				<tr>
					<td colspan="5" class="ta_r">
						<button type="submit">완료</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	
</div>
</body>
</html>