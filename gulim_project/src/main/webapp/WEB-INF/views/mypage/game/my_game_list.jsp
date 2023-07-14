<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	const go_calendar = () => {
		location.href="/mypage/calender";
	}
	
	$('.mygame_entry_request').on("click",".mygame_go_calendar",go_calendar);
}); 
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
					<li><table class ="mygame_entry_request">
							<tr>
								<td><img src="/files/images/game_imsi.jpg" /></td>
								<td class="fs15 fs_light"><p class="fs17">최애의 굴림</p>들어온 요청 <a>1건</a></td>
							</tr>
							<tr>
							<td><div class ="mygame_tag ">플레이중</div></td>
							</tr>
					</table></li>
					<li><table class ="mygame_entry_request">
							<tr>
								<td><img src="/files/images/game_imsi.jpg" /></td>
								<td class="fs15 fs_light"><p class="fs17">최애의 굴림</p>들어온 요청 <a>1건</a></td>
							</tr>
							<tr>
							<td><div class ="mygame_tag ">플레이중</div></td>
							</tr>
					</table></li>
					<li><table class ="mygame_entry_request">
							<tr>
								<td><img src="/files/images/game_imsi.jpg" /></td>
								<td class="fs15 fs_light"><p class="fs17">최애의 굴림</p>들어온 요청 <a>1건</a></td>
							</tr>
							<tr>
							<td><div class ="mygame_tag ">플레이중</div></td>
							</tr>
					</table></li>
				</ul>
			</div>
			
<!-- ==========마스터=============================================================================================== -->
			
			<p class="my_game_title2">게임마스터 <span class ="fs15 l_margin20">규칙 수정, 게임방 삭제는 방을 선택해주세요.</span></p>
			<hr class="game_line2">
			<div class="bxslider_size2">
				<ul class="bxslider mygame_master">
					<li><table class ="mygame_entry_request">
							<tr>
								<td><button class="mygame_go_calendar" id = "mygame_go_calendar">다음일정잡기</button></td>
							</tr>
							<tr>
								<td><img src="/files/images/game_imsi.jpg" /></td>
							</tr>
							<tr>
								<td class="mygame_master_title"><p class="fs17 height1">최애의 굴림</p></td>
							</tr>
							<tr>
								<td><div class ="mygame_tag ">플레이중</div></td>
							</tr>
					</table></li>
										<li><table class ="mygame_entry_request">
							<tr>
								<td><button class="mygame_go_calendar" id = "mygame_go_calendar">다음일정잡기</button></td>
							</tr>
							<tr>
								<td><img src="/files/images/game_imsi.jpg" /></td>
							</tr>
							<tr>
								<td class="mygame_master_title"><p class="fs17 height1">최애의 굴림</p></td>
							</tr>
							<tr>
								<td><div class ="mygame_tag ">플레이중</div></td>
							</tr>
					</table></li>
										<li><table class ="mygame_entry_request">
							<tr>
								<td><button class="mygame_go_calendar" id = "mygame_go_calendar">다음일정잡기</button></td>
							</tr>
							<tr>
								<td><img src="/files/images/game_imsi.jpg" /></td>
							</tr>
							<tr>
								<td class="mygame_master_title"><p class="fs17 height1">최애의 굴림</p></td>
							</tr>
							<tr>
								<td><div class ="mygame_tag ">플레이중</div></td>
							</tr>
					</table></li>
				</ul>
			</div>
			
<!-- ==========플레이어=============================================================================================== -->

			<p class="my_game_title3">게임플레이어<span class ="fs15 l_margin20">게임방 탈퇴는 방을 선택해 주세요. 게임 중 탈퇴는 게임원들과 상의 후 신중히 결정해주세요.</span></p>
			<hr class="game_line3">
						<div class="bxslider_size3">
				<ul class="bxslider mygame_master">
					<li><table class ="mygame_entry_request">
							<tr>
								<td><img src="/files/images/game_imsi.jpg" /></td>
							</tr>
							<tr>
								<td class="mygame_master_title"><p class="fs17 height1">최애의 굴림</p></td>
							</tr>
							<tr>
								<td><div class ="mygame_tag ">플레이중</div></td>
							</tr>
					</table></li>
					<li><table class ="mygame_entry_request">
							<tr>
								<td><img src="/files/images/game_imsi.jpg" /></td>
							</tr>
							<tr>
								<td class="mygame_master_title"><p class="fs17 height1">최애의 굴림</p></td>
							</tr>
							<tr>
								<td><div class ="mygame_tag ">플레이중</div></td>
							</tr>
					</table></li>
					<li><table class ="mygame_entry_request">
							<tr>
								<td><img src="/files/images/game_imsi.jpg" /></td>
							</tr>
							<tr>
								<td class="mygame_master_title"><p class="fs17 height1">최애의 굴림</p></td>
							</tr>
							<tr>
								<td><div class ="mygame_tag ">플레이중</div></td>
							</tr>
					</table></li>
				</ul>
			</div>
		</div>
	
</div>	
<jsp:include page="../../../../footer.jsp"></jsp:include>
</body>
</html>