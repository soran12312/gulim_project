<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 게임관리</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">

<!--BX슬라이더  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script type="text/javascript">
$(function(){
	$.noConflict();
    
	$(".bxslider").bxSlider({
	touchEnabled : (navigator.maxTouchPoints > 0),
	minSlides : 1,
	maxSlides : 3,
	slideWidth : 300
	
	});

});

//입장하기 버튼 클릭 시
const chatRoomJoin = (event,room_num) => {
	event.preventDefault();

	$.ajax({
		type	: 'post'
		,url	: '/mypage/game/get_id'
		,success	: function(result){
			//alert(result);
			var url = "https://192.168.0.68:3000/"+room_num+"/"+result;
			window.open(url, 'Chatting Room','width=1300,height=900');
		}
		,error	: function(err){
			alert('error');
			console.log(err);
		}
	}); // end of ajax

} // end of func chatRoomJoin()

// 참가취소 버튼 클릭 시
const joinCancle = (event, join_num, room_num) => {
	event.preventDefault();

	location.href = "/mypage/game/join_cancle?join_num="+join_num+"&room_num="+room_num;
}

// 방 수정하기 버튼 클릭 시
const roomModify = (event,room_num) => {
	location.href = "/mypage/game/my_game_modify?room_num="+room_num;
}

// 방 삭제하기 버튼 클릭 시
const roomDelete = (event,room_num) => {
	location.href = "/mypage/game/room_delete?room_num="+room_num;
}

</script>

</head>
<body>
<div class="mypagebackpage">
<jsp:include page="../../../../header_after.jsp"></jsp:include>
<!-- ===================== START OF subnav =====================-->
	<div class="subnav">
		<div class="subnav_select_mygame subnav_select"></div>
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
	<div class ="game_back"></div>
		<div class ="game_table">
<!-- ===================== END OF subnav =====================-->
<!-- ===================== START OF SIDE BAR =====================-->
	<div style="width: 100px; height: 400px;background-color: black;border: 7px solid black;border-top-left-radius: 50px;border-top-right-radius: 50px;border-bottom-left-radius: 50px;border-bottom-right-radius: 50px;position: fixed;right: 3%;top: 30%">
	<a href="/main/login_main"><img src="/files/images/sideBar홈.png" style="width: 70px;margin: 15px;"></a>
  	<a href="/mypage/user_info/info_modify"><img src="/files/images/sideBar마이페이지.png" style="width: 70px;margin: 15px;"></a>
  	<a href="/sale/sale_main"><img src="/files/images/sideBar장바구니.png" style="width: 70px;margin: 15px;"></a>
  	<a href="/customer_service/main"><img src="/files/images/sideBar챗봇.png" style="width: 70px;margin: 15px;"></a>
	</div>
<!-- ===================== END OF SIDE BAR =====================-->		
		
<!-- ==========요청=============================================================================================== -->
		
			<p class="my_game_title1 ">들어온 요청</p>
			<hr class="game_line1">
			<div class="bxslider_size">
				<ul class="bxslider">
					<c:if test="${empty room_info.master}">
						<li class="no_respon1">
							들어온 요청이 없습니다.
						</li>
					</c:if>
					<c:forEach items="${room_info.master}" var="room">
						<c:if test="${room.containsKey('num_of_join') && room.room_state==0}">
							<li>
							<table class ="mygame_entry_request">
									<tr>
										<td>
										<c:if test="${room.containsKey('img_path')}">
											<img src="${room.img_path}" />
										</c:if>
										<c:if test="${not room.containsKey('img_path')}">
											<img src="/files/images/no_image.jpg" />
										</c:if>
										</td>
										<td class="fs15 fs_light"><p class="fs17">${room.room_name}</p>들어온 요청 <a href="/mypage/game/char_sheet_list?room_num=${room.room_num}">${room.num_of_join}건</a></td>
									</tr>
							</table>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			
<!-- ==========마스터=============================================================================================== -->
			
			<p class="my_game_title2">게임마스터 <span class ="fs15 l_margin20">규칙 수정, 게임방 삭제는 방을 선택해주세요.</span></p>
			<hr class="game_line2">
			<div class="bxslider_size2">
				<ul class="bxslider mygame_master">
					<c:if test="${empty room_info.master}">
						<li class="no_respon2">
							생성한 게임이 없습니다.
						</li>
					</c:if>
					<c:forEach items="${room_info.master}" var="room">
						<li>
						<table class ="mygame_entry_request">
								<tr>
									<td colspan="2"><button class="mygame_go_game cursor" id = "mygame_go_game" onclick="chatRoomJoin(event,${room.room_num})">입장하기</button></td>
								</tr>
								<tr>
									<td colspan="2">
									<c:if test="${room.containsKey('img_path')}">
										<img src="https://192.168.0.68:8080${room.img_path}" />
									</c:if>
									<c:if test="${not room.containsKey('img_path')}">
										<img src="/files/images/no_image.jpg" />
									</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="mygame_master_title"><p class="fs17 height1">${room.room_name}</p></td>
								</tr>
								<tr>
									<td colspan="2">
									<c:if test="${room.room_state == 0}">
										<div class ="mygame_tag backfround_blue">플레이중</div>
									</c:if>
									<c:if test="${room.room_state != 0}">
										<div class ="mygame_tag backfround_black color_white">종료된방</div>
									</c:if>
									</td>
								</tr>
								<tr>
									<td>
										<button class="mygame_go_game cursor" id = "mygame_go_game" onclick="roomModify(event,${room.room_num})">수정하기</button>
									</td>
									<td><button class="mygame_go_game cursor" id = "mygame_go_game" onclick="roomDelete(event,${room.room_num})">삭제하기</button></td>
								</tr>
						</table>
						</li>
					</c:forEach>
				</ul>
			</div>
			
<!-- ==========플레이어=============================================================================================== -->

			<p class="my_game_title3">게임플레이어<span class ="fs15 l_margin20">게임방 탈퇴는 방을 선택해 주세요. 게임 중 탈퇴는 게임원들과 상의 후 신중히 결정해주세요.</span></p>
			<hr class="game_line3">
						<div class="bxslider_size3">
				<ul class="bxslider mygame_master">
					<c:if test="${empty room_info.player}">
						<li class="no_respon3">
							참여중인 게임이 없습니다.
						</li>
					</c:if>
					<c:forEach items="${room_info.player}" var="room">
						<li>
						<table class ="mygame_entry_request">
								<tr>
									<td>
										<c:if test="${room.join_state == 1}">
											<button class="mygame_go_game" id = "mygame_go_game cursor" onclick="chatRoomJoin(event,${room.room_num})">입장하기</button>
										</c:if>
									</td>
								</tr>
								<tr>
									<td>
									<c:if test="${room.containsKey('img_path')}">
										<img src="${room.img_path}" />
									</c:if>
									<c:if test="${not room.containsKey('img_path')}">
										<img src="/files/images/no_image.jpg" />
									</c:if>
									</td>
								</tr>
								<tr>
									<td class="mygame_master_title"><p class="fs17 height1">${room.room_name}</p></td>
								</tr>
								<tr>
									<td>
										<c:if test="${room.join_state == 1}">
											<div class ="mygame_tag backfround_blue">참가완료</div>
										</c:if>
										<c:if test="${room.join_state == 0}">
											<div class ="mygame_tag backfround_black color_white">참가대기중</div>
										</c:if>
									</td>
								</tr>
								<tr>
									<td>
										<button class="mygame_go_game cursor" onclick="joinCancle(event,${room.join_num},${room.room_num})">참가 취소</button>
									</td>
								</tr>
						</table>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	
</div>	
<jsp:include page="../../../../footer.jsp"></jsp:include>
</body>
</html>