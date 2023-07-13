<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 다음 주소검색 script -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<!-- sweet alert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('#mypage_info').hide();
	$('#addr_search').hide();
	$('#img_modify').hide();
	$('#img_modify_real').hide();

//아이디와 비밀번호 가져와서 DB저장된 비밀번호 토큰값과 비교하는 함수
	$('#password_check_btn').click(function(){
		
		$.ajax({
			 type 		: 'post'
			,data 		: {password: $('#password_check_input').val(), id: "ekqls1102"}
			,url 		: '/mypage/user_info/mypage_password_check'

			//비밀번호 일치 시 result값 true 불일치 시 false
			,success 	: function(result){
 							$('#password_check_input').val('');

							if (result){
								$('#password_check').hide();
								$('#mypage_info').show();
								find_info();
							}
							else {
								Swal.fire({
										icon: 'error',                     
  										title: '비밀번호가 틀렸습니다(T^T)',    
  										html: '다시 확인해주시고 문제가 지속되면 <br/> 고객센터로 문의해주세요.', 
});
							}
						}
						
			//END of success
			,error 		: function(err){console.log(err);}//END of error
		});//END of ajax
	});

//info리스트 result로 가져와서 벨류에 넣는 함수
	function find_info(){
		$.ajax({
			 type 		: 'post'
			,data 		: {id: "ekqls1102"}
			,url 		: '/mypage/user_info/find_info'
			,success 	: function(result){
							$('#name').val(result.name);
							$('#nickname').val(result.nickname);
							$('#address').val(result.address);
							$('#email').val(result.email);
							$('#tel').val(result.tel);
							$('#introduce').html(result.introduce);
						}
						
			//END of success
			,error 		: function(err){console.log(err);}//END of error
		});//END of ajax
	}
//info 수정시 DB보내서 수정한 info저장하는 함수
	function modify_info(){
		$.ajax({
			 type 		: 'post'
			 				//변경할 데이터
			,data 		: 	{id:		"ekqls1102"   // ★★★★★★★★★★★★★★★★★★★★★★★★아이디 따올 수 있게되면 바꾸기
							,name: 		$('#name').val()
							,nickname:	$('#nickname').val()
							,address:	$('#address').val()
							,tel:		$('#tel').val()
							,introduce:	$('#introduce').val()
						}
			,url 		: '/mypage/user_info/modify_info'
			,success 	: function(){
							find_info();
						}			
			//END of success
			,error 		: function(err){console.log(err);}//END of error
		});//END of ajax
	}




	
	$('#info_modi').click(function(){
		//버튼이 회원정보수정일 경우 수정완료버튼으로 변경
			if(this.value === '회원정보수정'){
				this.value = "수정완료"
	
			//주소검색&이미지버튼 보이게
				$('#addr_search').show();
				$('#img_modify').show();
			
			//입력창 수정가능하게 변경
				$('#name').attr("disabled", false);
				$('#nickname').attr("disabled", false);
				$('#address').attr("disabled", false);
				$('#tel').attr("disabled", false);
				$('#introduce').attr("disabled", false);
			}
			else {
			//버튼이 수정완료일 경우 회원정보수정으로 버튼을 변경
				this.value = "회원정보수정"

			
				$('#addr_search').hide();
				$('#img_modify').hide();
			//변경가능한 input창 수정 못하게 변경
				$('#name').attr("disabled", true);
				$('#nickname').attr("disabled", true);
				$('#address').attr("disabled", true);
				$('#tel').attr("disabled", true);
				$('#introduce').attr("disabled", true);
			
			//input 벨류값 수정되며 DB에 저장
				modify_info();
			//수정된 info값 DB에서 불러서 출력
				find_info();
				}
	})

//#addr_search(주소검색Btn) 클릭 시 카카오 주소검색창 띄우기
	$('#addr_search').click(function(){
		new daum.Postcode({
        oncomplete: function(data) {
			//주소 input에 주소값 입력
			$('#address').val(data.address);
        }
    }).open();
	});

	//이미지 수정버튼 클릭 시 함수
	$('#img_modify').click(function(){
		if(this.value === "사진수정"){
		$('#img_modify_real').show();
		$('#img_modify_real').trigger('click');
		this.value = "수정완료"
		}
		else{
			this.value = "사진수정"
		}	
	});//END of img_modify .click

	$('#img_modift_real').click(
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
				document.getElementById('img_modify_img').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
			} else {
				document.getElementById('img_modify_img').src = "";
			}
		}
	);

});//END of Open
</script>
</head>
<body>
<div class="mypagebackpage">
<jsp:include page="../../../../header_after.jsp"></jsp:include>
<!-- ===================== START OF subnav =====================-->
	<div class="subnav">
		<div class="subnav_select_info subnav_select"></div>
			<div class="subnav_menu">
				<a href ="/mypage/my_message">쪽지</a>
				<a href ="/mypage/calender">캘린더</a>
				<a href ="/mypage/game/my_game_list">나의 게임관리</a>
				<a href ="/mypage/user_info/info_modify">회원정보</a>
				<a href ="/mypage/my_post">나의 게시글</a>
				<a href ="/mypage/my_question">나의 문의사항</a>
				<a href ="/mypage/friends">친구관리</a>
				<a href ="/mypage/my_purchase">결제내역</a>
				<a href ="/mypage/my_contest">공모전</a>
			</div>
	</div>

	
<!-- ===================== START OF SIDE BAR =====================-->
	<div style="width: 100px; height: 400px;background-color: black;border: 7px solid black;border-top-left-radius: 50px;border-top-right-radius: 50px;border-bottom-left-radius: 50px;border-bottom-right-radius: 50px;position: fixed;right: 3%;top: 30%"><a href="/main/login_main"><img src="/files/images/sideBar홈.png" style="width: 70px;margin: 15px;"></a><a href="/mypage/game/mygame_list"><img src="/files/images/sideBar마이페이지.png" style="width: 70px;margin: 15px;"></a><a href="/sale/sale_main"><img src="/files/images/sideBar장바구니.png" style="width: 70px;margin: 15px;"></a><a href="/customer_service/main"><img src="/files/images/sideBar챗봇.png" style="width: 70px;margin: 15px;"></a></div>
<!-- ===================== END OF SIDE BAR =====================-->	


<!-- ===================== START OF PASSWORD CHECK =====================-->	
	<div class="password_backpage" id="password_check">
		<p class="password_check_name">비밀번호 확인</p>
		<div class ="password_check_form">
			<div>
				<input type="password" name="password" id="password_check_input" placeholder="비밀번호를 입력하세요">
			</div>
				<button  class="password_check_btn" id="password_check_btn">확인</button>
		</div>
	</div>
<!-- ===================== END OF PASSWORD CHECK =====================-->	
<!-- ===================== START OF IMG =====================-->
<input type="file" class="img_modify_real" id='img_modify_real' onchange="readURL(this);"/> <!-- 안에 두니까 CSS움직여서 밖으로 뺌 -->
	<div id="mypage_info">
		<div class ="game_back"></div>
			<div class ="game_table">
				<div class="my_img">
					<img src="/files/images/no_image.jpg" id="img_modify_img">
					<input type="button" class="img_modify" id='img_modify' value="사진수정"/>
				</div>
				
	<!-- ===================== END OF IMG =====================-->
	<!-- ===================== START OF INFO =====================-->
				<form action="">
				<div class="my_info">
					<div>이름</div>
					<input name ="name" id="name" class="info_input" disabled/>
					<div>닉네임</div>
					<input name="nickname" id="nickname" disabled class="info_input"/>
					<div>주소</div>
					<input name="address" id="address" disabled class="info_input2"/>
					<input type="button" class="addr_search" id="addr_search" value="주소검색"/>
					<div>이메일</div>
					<input name="email" id="email" disabled class="info_input"/>
					<div>전화번호</div>
					<input name ="tel" id ="tel" disabled class="info_input"/>
					<div>자기소개</div>
					<textarea name ="introduce" id ="introduce" disabled class="info_area"></textarea>
					<input type="button" class="info_modi" id='info_modi' value="회원정보수정"/>
				</div>
				</form>
	<!-- ===================== END OF INFO =====================-->
			<div class="myinfo_play_list">
				<div class="fs20 fs_bord">플레이리스트</div>
				<div class="myinfo_play_list_scroll">
					<table class="myinfo_play_list_table">
						<tr>
							<td class="myinfo_play_list_td w30per">게임명</td>
							<td class="myinfo_play_list_td w70per">게임설명</td>
						</tr>
						<tr>
							<td >게임이름알엉러아밍</td>
							<td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td>
						</tr>

					</table>
				</div>
			</div>
			</div>
			</div>
</div>
<jsp:include page="../../../../footer.jsp"></jsp:include>
</body>
</html>