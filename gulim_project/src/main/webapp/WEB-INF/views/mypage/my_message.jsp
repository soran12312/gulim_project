<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
<link href="/css/place.css" rel="stylesheet">
<script type="text/javascript"></script>
</head>
<body>


	
<div class="mypagebackpage">
<jsp:include page="../../../header_after.jsp"></jsp:include>
<!-- ===================== START OF subnav =====================-->
	<div class="subnav">
		<div class="subnav_select_message subnav_select"></div>
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
<jsp:include page="../../../sidebar.jsp"></jsp:include>
<!-- ===================== END OF SIDE BAR =====================-->
	
<!-- ===================== START OF 쪽지함list =====================-->
		<span class="page_name">쪽지함</span>
		<div class="message_back"></div>
		
		<div class= message_table>
			<div class= message_table_size>
				<table>
					<tr>
						<td class= table_menu1>날짜</td>
						<td class= table_menu2>이름</td>
						<td class= table_menu3>내용</td>
						<td></td>					
					</tr>
					<c:forEach items="${allmessage}" var="message">
						<tr><input type ="hidden" value="${message.message_num}">
							<td class= "message_td "> ${message.send_date} </td>
							<td class= "message_td cursor"><a href = "/mypage/send_message?send_id=${message.send_id}" onclick="window.open(this.href, '쪽지보내기', 'width=420, height=520'); return false;">${nickname[message.send_id]} (${message.send_id})</a></td>
							<td class= "message_td cursor display_block"><a href = "/mypage/detail_message?num=${message.message_num}" onclick="window.open(this.href, '쪽지보기', 'width=420, height=520'); return false;">${message.message_content}</a></td>
							<td class= "message_td cursor" ><a href = "/mypage/message_delete">삭제</a></td>					
						</tr>
					</c:forEach>
				</table>
		</div>
		<a class="send_message" id="send_message" href = "/mypage/send_message" onclick="window.open(this.href, '쪽지보내기', 'width=420, height=520'); return false;">쪽지 보내기</a>
		</div>
		
		
<!-- ===================== END OF 쪽지함list =====================-->			
		
</div>
<jsp:include page="../../../footer.jsp"></jsp:include>
</body>
</html>