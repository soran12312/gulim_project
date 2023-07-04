<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굴림</title>
<link href="/css/main.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){

	var authNumber; // 인증번호
	var check = false; // 인증여부
	// 본인인증 버튼 클릭시 이벤트
	$("#mail_check").click(function(event){
		event.preventDefault();
		var email = $("#email").val();
		//alert(email);
		var pass_num = $("#pass_num");

		$.ajax({
			type : 'get',
			url : "/main/mailCheck?email="+email, // 이메일 발송
			success : function (data) {
				console.log("data : " +  data);
				pass_num.attr('disabled',false);
				authNumber = data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); // end ajax
		
	});

	// 인증번호 확인버튼 클릭 시 이벤트
	$("#num_check").click(function(event){
		event.preventDefault();
		var inputNumber = $("#pass_num").val();
		var resultMsg = $('#mail-check-warn');

		if(authNumber == inputNumber){
			resultMsg.html('인증번호가 일치합니다.');
			resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$("#email").attr('readonly',true);
			check=true;
		}else{
			resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요.');
			resultMsg.css('color','red');
		}
	});

	// 완료버튼(submit) 클릭 시 이메일인증 안되면 안넘어가게 하는 이벤트
	$("#form_submit").click(function(){
		if(check){
			return true;
		}else {
			alert("이메일인증을 완료해주세요");
			return false;
		}
	});
	   
}); // end of $
</script>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../../../header_before.jsp"></jsp:include>

<div class="all_body pl_20">
	<div class="fs_30 pt_30">굴림세상으로 떠나기 전 마지막 준비에요!</div>
	<div class="fs_20 pt_30">이메일 주소를 입력한 후 받은 메일함에서 인증번호를 입력해주세요!</div>
	<div class="fs_20 pt_10">혹시, 이메일이 오지 않았다면 스펨메일함을 확인해주세요</div>
	
	<form action="" class="fs_25 pt_30" method="post" id="regist_form">
			<input type="hidden" name="id" id="id" value="${member.id}">
			<input type="hidden" name="password" id="password" value="${member.password}">
			<input type="hidden" name="name" id="name" value="${member.name}">
			<input type="hidden" name="address" id="address" value="${member.address}">
			<input type="hidden" name="tel" id="tel" value="${member.tel}">
			<input type="hidden" name="nickname" id="nickname" value="${member.nickname}">
			<input type="hidden" name="birthday" id="birthday" value="${member.birthday}">
			<input type="hidden" name="regist_type" id="regist_type" value="${member.regist_type}">
			
			<table class="regist_form">
				<tr class="h_50">
					<td class="ta_c">
						<label for="name">이메일주소 입력</label>
					</td>
					<td class="ta_l">
						<input type="email" id="email" name="email" class="fill" placeholder="이메일을 입력해주세요" required>
					</td>
					<td class="ta_l w_190">
						<button id="mail_check">본인인증</button><span class="fs_15" id="checkResult"></span>
					</td>
					<td class="w_190"/>
				</tr>
				<tr class="h_50">
					<td class="ta_c">
						<label for="id">인증번호 입력</label>
					</td>
					<td class="ta_l">
						<input type="text" id="pass_num" class="fill" disabled="disabled" placeholder="인증번호 6자리를 입력해주세요" required>
					</td>
					<td class="ta_l w_190">
						<button id="num_check">확인</button><span class="fs_15" id="checkResult"></span>
					</td>
					<td class="w_190" id="mail-check-warn"/>
				</tr>
				<tr>
					<td colspan="4" class="ta_r">
						<button type="submit" id="form_submit">완료</button>
					</td>
				</tr>
			</table>
		</form>

</div>
<jsp:include page="../../../footer.jsp"></jsp:include>
</body>
</html>