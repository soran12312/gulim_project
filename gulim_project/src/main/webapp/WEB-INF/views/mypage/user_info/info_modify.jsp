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
//※ event title :	Open hide
//※ event info  :	페이지이동 시 마이페이지, 주소검색Btn, 사진수정Btn, 사진선택 버튼 숨김 (비밀번호체크 시 해제)
	$('#mypage_info').hide();
	$('#addr_search').hide();
	$('#img_modify').hide();
	$('#img_modify_real').hide();
	const my_id ='${memberDTO.id}';
//※ END event title :	Open hide ===============================================



//※ event title :	$('#password_check_btn').click (패스워드확인창의 확인 버튼 클릭)
//※ event info  :	아이디와 비밀번호 가져와서 DB저장된 비밀번호 토큰값과 비교하는 함수
	$('#password_check_btn').click(function(){
		
		//aiax로 입력한 패스워드와 아이디값 /mypage/user_info/mypage_password_check으로 보내기
		$.ajax({
			 type 		: 'post'
			,data 		: {password: $('#password_check_input').val(), id: my_id}		
			,url 		: '/mypage/user_info/mypage_password_check'

			//비밀번호 일치 시 result값 true 불일치 시 false
			,success 	: function(result){
 							$('#password_check_input').val('');
						
							//비밀번호가 맞을때(result값이 true일때) 
							//패스워드체크div 숨기고 회원정보창출력
							if (result){
								$('#password_check').hide();
								$('#mypage_info').show();
								//회원정보리스트 불러오기
								find_info();
								//프로필이미지 불러오기
								find_info_img();
							}

							//비밀번호가 틀렸을때 (result값이 false일때)
							else {
								//스윗Alert로 안내문구
								Swal.fire({
										icon: 'error',                     
  										title: '비밀번호가 틀렸습니다(T^T)',    
  										html: '다시 확인해주시고 문제가 지속되면 <br/> 고객센터로 문의해주세요.', 
								});//END of swal.fire
							}
						}//END of success
			,error 		: function(err){console.log(err);}//END of error
		});//END of ajax
	});//END of password_check_btn .click
//※ END event title :	$('#password_check_btn').click ===============================================



//※ event title :	$('#password_check_input').keypress (패스워드확인창에서 Enter)
//※ event info  :	확인버튼이랑 연동
$('#password_check_input').keypress(function(keyNum){
	if(keyNum.keyCode == 13){
		$('#password_check_btn').trigger('click');
	}
});
//※ END event title :	$('#password_check_btn').click ===============================================




//※ event title :	$('#info_modi').click (회원정보 수정 버튼 클릭)
//※ event info  :	1. value가 회원정보수정 일때	->	수정완료 버튼으로 변경하고 입력창을 수정가능하게 변경
//					 2.	value가 수정완료일때		->	회원정보수정 버튼으로 변경하고 입력창의 value값을 DB저장
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


		//버튼이 수정완료일 경우 회원정보수정으로 버튼을 변경
			else {
				this.value = "회원정보수정"

				//주소검색Btn / 이미지수정Btn 숨김
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
//※ END event title :	$('#info_modi').click ===============================================



//※ event title :	#addr_search.click (주소검색Btn)
//※ event info  :	#addr_search(주소검색Btn) 클릭 시 카카오 주소검색창 띄우기
	$('#addr_search').click(function(){
	
		//카카오 주소검색창 출력
		new daum.Postcode({
        oncomplete: function(data) {
		
			//주소 input에 주소값 입력
			$('#address').val(data.address);
        }
    }).open();
	});
//※ END event title :	#addr_search.click 	===============================================



//※ event title :	$('#img_modify').click (이미지 수정Btn)
//※ event info  :	1. 버튼의 value가 사진 수정일때	->	클릭과 동시에 사진선택버튼 클릭되고 수정완료로 value변경
//					 2. 버튼의 value가 수정 완료일때 ->	 이미지를 저장하고 사진선택버튼 & 본임 숨겨짐
$('#img_modify').click(function(){

	//버튼이 사진수정일때
	if(this.value === "사진수정"){

		//이미지선택버튼 보이게 & 이미지선택버튼 클릭
		$('#img_modify_real').show();
		$('#img_modify_real').trigger('click');

		//사진수정버튼을 수정완료버튼으로 변경
		this.value = "수정완료"
		}

	//버튼이 수정완료일때
	else{

		//바뀐 사진 저장
		modify_info_img();

		//사진수정버튼으로 변경 & 이미지선택버튼 & 사진수정버튼 숨김
		this.value = "사진수정"
		$('#img_modify_real').hide();
		$('#img_modify').hide();
	}	
});//END of img_modify .click
//※ END event title :	$('#img_modify').click	===============================================



//※ event title :	$('#img_modify_real').on("change" (파일창에서 파일 선택 시)
//※ event info  :	이미지 선택 했을때 미리보기
$('#img_modify_real').on("change",function(event){

	//선택된 파일 읽어오기
	var file = event.target.files[0];
	var reader = new FileReader(); 
	reader.onload = function(e) {

	//프로필 이미지태그의 src에 선택된이미지 입력 
	$("#img_modify_img").attr("src", e.target.result);}
	reader.readAsDataURL(file);
	});//END of img_modify_real .change
//※ event title :	$('#img_modify_real').on("change" 	===============================================



//※ function title	:	find_info 
//※ function info	:	회원정보리스트를 result로 가져와서 회원정보란의 value에 넣는 함수
function find_info(){

	// /mypage/user_info/find_info에 id 보내기
	$.ajax({
		 type 		: 'post'
		,data 		: {id: my_id}                
		,url 		: '/mypage/user_info/find_info'
		//가져온 회원정보(result)값을 회원정보 input태그에 value에 입력
		,success 	: function(result){
						$('#name').val(result.name);
						$('#nickname').val(result.nickname);
						$('#address').val(result.address);
						$('#email').val(result.email);
						$('#tel').val(result.tel);
						$('#introduce').html(result.introduce);
						find_playlist();
					}
					
		//END of success
		,error 		: function(err){console.log(err);}//END of error
	});//END of ajax
}
//※ END function title	:	find_info	================================================= 



//※ function title	:	find_playlist 
//※ function info	:	플레이리스트를 result로 가져와서 플레이리스트란의 value에 넣는 함수
function find_playlist(){
	
	// /mypage/user_info/find_playlist id 보내기
	$.ajax({
			type 		: 'post'
			,data 		: {id: my_id}                
			,url 		: '/mypage/user_info/find_playlist'
			//가져온 플레이리스트(result)값을 플레이리스트 input태그에 value에 입력
			,success 	: function(result){
							var table = $('#playlist');
							// 이전 검색 결과를 지우고 새로운 결과를 출력하기 위해 테이블을 비움
							table.empty();
							for (var i = 0; i < result.length; i++) {
								var room_name		= result[i].room_name
								if (result[i].next_play_date == null){
									var next_play_date = "다음일정이 없어요"
								}
								else{
									var next_play_date	= result[i].next_play_date
								}						
								// 검색 결과를 테이블에 추가
								var row = '<tr><td>' + room_name + '</td><td>'+next_play_date+'</td></tr>';
								table.append(row);
							
						}
						
					}//END of success
			,error 		: function(err){console.log(err);}//END of error
		});//END of ajax
}
//※ END function title	:	find_info	================================================= 


//※ function title	:	find_info_img 
//※ function info	:	회원정보란의 프로필이미지를 불러와 프로필이미지태그에 출력하는 함수
function find_info_img(){

	// /mypage/user_info/find_info_img에 아이디를 보내고 이미지의 위치값 가져오기
	$.ajax({
		type		:'post'
		,data		:{id: my_id}
		,url		:'/mypage/user_info/find_info_img'
		//프로필 이미지의 src속성값으로 이미지의 위치값(result)입력
		,success	: function(result){
			$("#img_modify_img").attr("src",result);
		}
		,error		: function(err){console.log(err);}//END of error
	});
}
//※ END function title	:	find_info_img	================================================= 




//※ function title	:	modify_info 
//※ function info	:	회원정보 수정 시 DB에 수정된 회원정보를 저장하는 함수
function modify_info(){

	// mypage/user_info/modify_info으로 아이디를 보내고 회원정보input태그의 값을 가져와 DB에 저장
	$.ajax({
		 type 		: 'post'
						 //변경할 데이터
		,data 		: 	{id:		my_id
						,name: 		$('#name').val()
						,nickname:	$('#nickname').val()
						,address:	$('#address').val()
						,tel:		$('#tel').val()
						,introduce:	$('#introduce').val()
					}
		,url 		: '/mypage/user_info/modify_info'
		//성공 시 회원정보를 다시 가져와 회원정보input태그에 출력
		,success 	: function(){find_info();}			
		,error 		: function(err){console.log(err);}//END of error
	});//END of ajax
}
//※ END function title	:	modify_info	================================================= 



//※ function title	:	modify_info_img  
//※ function info	:	이미지 저장하는 함수
	function modify_info_img(){

	//form에 이미지넣고 form을 formData에 넣기
	var form = $("#infoimg_upload_form")[0];
	var formData = new FormData(form);

	//이미지 & id 를 formData에 넣기
	formData.append("id", my_id);
	formData.append("file", $('#img_modify_real')[0].files[0])

	//mypage/user_info/modify_info_img로 formData보내기
	 $.ajax({
		 url : '/mypage/user_info/modify_info_img'
	   , type : "POST"
	   , processData : false
	   , contentType : false
	   , data : formData
	   , success:function(response) {
			//성공 시 스윗alert
			 if(response){
		   		swal.fire("프로필사진이 변경되었습니다!"); 
			 } 
			 else{
				swal.fire("오류입니다T^T 다시 시도하시고 지속될 경우 문의해주세요!"); 
			 }
	   }
	   ,error: function(err){console.log(err);}//END of error
   });
}
//※ END function title	:	modify_info_img	================================================= 



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
<form id="infoimg_upload_form" method="post" enctype="multipart/form-data">
	<input type="file" class="img_modify_real" id='img_modify_real' name="img_modify_real" accept="image/*"/> <!-- 안에 두니까 CSS움직여서 밖으로 뺌 -->
</form>

	<div id="mypage_info">
		<div class ="game_back"></div>
			<div class ="game_table">
				<div class="my_img">
					<img  id="img_modify_img" src="">
					<input type="button" class="img_modify" id='img_modify' value="사진수정"/>
				</div>
				
	<!-- ===================== END OF IMG =====================-->
	<!-- ===================== START OF INFO =====================-->
				
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
				
	<!-- ===================== END OF INFO =====================-->
			<div class="myinfo_play_list">
				<div class="fs20 fs_bord">플레이리스트</div>
				<div class="myinfo_play_list_scroll">
					<table class="myinfo_play_list_table">
						<thead>
						<tr>
							<td class="myinfo_play_list_td w30per">게임명</td>
							<td class="myinfo_play_list_td w70per">다음게임일시</td>
						</tr>
						</thead>
					<tbody id = "playlist">
					</tbody>
					</table>
				</div>
			</div>
			</div>
			</div>
</div>
<jsp:include page="../../../../footer.jsp"></jsp:include>
</body>
</html>