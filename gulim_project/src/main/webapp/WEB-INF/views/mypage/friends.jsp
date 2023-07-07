<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구관리</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#friend_search_btn').click(function(){
		alert();
		})
});
</script>
</head>
<body>
<div class="mypagebackpage">
<jsp:include page="../../../header_after.jsp"></jsp:include>
<!-- ===================== START OF subnav =====================-->
	<div class="subnav">
		<div class="subnav_select_friends subnav_select"></div>
			<div class="subnav_menu">
					<a href ="/mypage/my_message">쪽지</a>
					<a href ="/mypage/calender">캘린더</a>
					<a href ="/mypage/game/my_game_list">나의 게임관리</a>
					<a href ="/mypage/user_info/info_modify">회원정보</a>
					<a href ="/mypage/my_post">나의 게시글</a>
					<a href ="/mypage/my_question">나의 문의사항</a>
					<a href ="/mypage/friends">친구관리</a>
					<a>결제내역</a>
					<a>공모전</a>
					<a>참여내역</a>
			</div>
	</div>
	
<!-- ===================== END OF subnav =====================-->
<!-- ===================== START OF SIDE BAR =====================-->
	<div style="width: 100px; height: 400px;background-color: black;border: 7px solid black;border-top-left-radius: 50px;border-top-right-radius: 50px;border-bottom-left-radius: 50px;border-bottom-right-radius: 50px;position: fixed;right: 3%;top: 30%">
	<a href="/main/login_main"><img src="/files/images/sideBar홈.png" style="width: 70px;margin: 15px;"></a>
  	<a href="/mypage/user_info/info_modify"><img src="/files/images/sideBar마이페이지.png" style="width: 70px;margin: 15px;"></a>
  	<a href="/sale/sale_main"><img src="/files/images/sideBar장바구니.png" style="width: 70px;margin: 15px;"></a>
  	<a href="/customer_service/main"><img src="/files/images/sideBar챗봇.png" style="width: 70px;margin: 15px;"></a>
	</div>
<!-- ===================== END OF SIDE BAR =====================-->		
	
	<div class ="game_back"></div>

	
<!-- =============START OF검색허용============================================ -->	
	<div class ="game_table">
		<div class="myfriend_pagename">친구관리</div>
			<hr class="friend_line1">
			<hr class="friend_line2">
		<div class="friend_search_check">	
		<span class="search_place">
			<span>근처 친구검색 허용</span> <input type="checkbox">
		</span>
		<span class="search_name">
			<span>이름으로 친구 검색 허용</span> <input type="checkbox">
		</span>
		</div>
<!-- =============END OF 검색허용============================================ -->		
<!-- =============START OF 친구목록============================================ -->	
	<span class="myfriend_back1"></span>
	<span class="myfriend_back2"></span>
	
		<span class="myfriend_list">
			<div class="myfriend_pagename">친구 목록</div>
			<hr class="friend_line3"/>
			<div class="myfriend_list_scroll">
			<table class="myfriend_list_table">
				<tr>
					<td>나한솔</td>
					<td><a href = "/mypage/playlist" onclick="window.open(this.href, '게임플레이리스트', 'width=420, height=520'); return false;">
					참여게임목록</a></td>
					<td><a href = "/mypage/send_message" onclick="window.open(this.href, '쪽지보내기', 'width=420, height=520'); return false;">
					쪽지보내기</a></td>
				</tr>
				<tr><td>나한솔</td></tr>
				<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	
			</table>
			</div>
		</span>
<!-- =============END OF 친구목록============================================ -->	
<!-- =============START OF ADD친구============================================ -->	

		<span class="myfriend_addlist">
			<div class="myfriend_pagename">친구 추가</div>
			<div class="searchimg">
				<input class="friend_search_input fs20" id="friend_search_input" placeholder="이름을 입력하세요"/> 
				<button class="friend_search_btn" id="friend_search_btn"></button>
			</div>
			<hr class="friend_line4"/>
			<div class="myfriend_addlist_scroll">
			<table class="myfriend_list_table">
				<tr>
					<td>나한솔</td>
					<td><a href = "/mypage/profile" onclick="window.open(this.href, '쪽지보내기', 'width=420, height=520'); return false;">
					프로필보기</a></td>
				</tr>
				<tr><td>나한솔</td></tr>
				<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	<tr><td>나한솔</td></tr>	
			</table>
			</div>
		</span>
<!-- =============END OF ADD친구============================================ -->	

	</div>
</div>
<jsp:include page="../../../footer.jsp"></jsp:include>

</body>
</html>