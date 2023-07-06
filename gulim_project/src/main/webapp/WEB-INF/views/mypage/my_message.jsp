<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
<link href="/css/place.css" rel="stylesheet">
</head>
<body>


	
<div class="mypagebackpage">
<jsp:include page="../../../header_after.jsp"></jsp:include>
<!-- ===================== START OF subnav =====================-->
	<div class="subnav">
		<div class="subnav_select_message"></div>
			<div class="subnav_menu">
					<a href="../../my_message">쪽지</a>
					<a href ="../../calender">캘린더</a>
					<a href ="../../game/my_game_list">나의 게임관리</a>
					<a href ="user_info/info_modify">회원정보</a>
					<a>나의 게시글</a>
					<a>나의 문의사항</a>
					<a>친구관리</a>
					<a>결제내역</a>
					<a>공모전</a>
					<a>참여내역</a>
			</div>
	</div>
	
<!-- ===================== END OF subnav =====================-->
	
<!-- ===================== START OF 쪽지함list =====================-->
		<span class="page_name">쪽지함</span>
		<div class="message_back">
		<a class="send_message" id="send_message" href = "send_message" onclick="window.open(this.href, '쪽지보내기', 'width=420, height=520'); return false;">쪽지 보내기</a></div>
		<div class= message_table>
			<table >
				<tr>
					<td class= table_menu1>날짜</td>
					<td class= table_menu2>이름</td>
					<td class= table_menu3>내용</td>
					<td></td>					
				</tr>
				<tr>
					<td class= "message_td ">23.06.30 15:10</td>
					<td class= "message_td cursor"><a href = "send_message" onclick="window.open(this.href, '쪽지보내기', 'width=420, height=520'); return false;">나한솔</a></td>
					<td class= "message_td cursor"><a href = "detail_message" onclick="window.open(this.href, '쪽지보기', 'width=420, height=520'); return false;">☆★갸꿀잼☆★온라인☆★ㅂrㅋ「ㄹr☆★돈먹기</a></td>
					<td class= "message_td cursor" ><a>삭제</a></td>					
				</tr>
			</table>
		</div>
		
		
<!-- ===================== END OF 쪽지함list =====================-->			
		
</div>
<jsp:include page="../../../footer.jsp"></jsp:include>
</body>
</html>