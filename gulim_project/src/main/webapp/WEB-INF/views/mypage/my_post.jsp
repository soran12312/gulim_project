<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 게시글</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
</head>
<body>	
<div class="mypagebackpage">
<jsp:include page="../../../header_after.jsp"></jsp:include>
<!-- ===================== START OF subnav =====================-->
	<div class="subnav">
		<div class="subnav_select_post subnav_select"></div>
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
	
<!-- ===================== END OF subnav =====================-->
<!-- ===================== START OF SIDE BAR =====================-->
	<div style="width: 100px; height: 400px;background-color: black;border: 7px solid black;border-top-left-radius: 50px;border-top-right-radius: 50px;border-bottom-left-radius: 50px;border-bottom-right-radius: 50px;position: fixed;right: 3%;top: 30%">
	<a href="/main/login_main"><img src="/files/images/sideBar홈.png" style="width: 70px;margin: 15px;"></a>
  	<a href="/mypage/user_info/info_modify"><img src="/files/images/sideBar마이페이지.png" style="width: 70px;margin: 15px;"></a>
  	<a href="/sale/sale_main"><img src="/files/images/sideBar장바구니.png" style="width: 70px;margin: 15px;"></a>
  	<a href="/customer_service/main"><img src="/files/images/sideBar챗봇.png" style="width: 70px;margin: 15px;"></a>
	</div>
<!-- ===================== END OF SIDE BAR =====================-->		
	
<div class="message_back"></div>
<span class="page_name">나의 게시글</span>
<div class=" post_back_table">
	<div class="back_heiget_90per">
	<table class="my_post_table">
		<tr>
			<td class="my_post_td1"></td>
			<td class="my_post_td2">
				<select>
					<option value="all">전체보기</option>
					<option value="game">게임개설요청</option>
					<option value="master">게임마스터모집</option>
					<option value="useer">중간파티원모집</option>
					<option value="other">잡담</option>
					<option value="review">게임리뷰</option>
					<option value="gameother">게임기타</option>
					<option value="character">캐릭터설정</option>
				</select>
			</td>
			<td class="my_post_td3">게시글 제목</td>
			<td class="my_post_td4">날짜</td>
		</tr>
		<tr>
			<td><input type="checkbox"></td>
			<td>말머리</td>
			<td>게시글제목표시</td>
			<td>23.06.27 10:08</td>			
		</tr>		
	</table>
	</div>
	<input type="button" class="my_post_delete" id='my_post_delete' value="글삭제"/>
	<input type="button" class="my_post_modify" id='my_post_modify' value="글수정"/>
</div>		
</div>
<jsp:include page="../../../footer.jsp"></jsp:include>
</body>
</html>