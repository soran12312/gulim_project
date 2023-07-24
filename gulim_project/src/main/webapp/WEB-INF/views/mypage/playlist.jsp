<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플레이 리스트</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
</head>
<body>

<!-- 여기 친구목록에 게임플레이 리스트임 -->

	<div class="send_message_backpage">
		<div class="send_message_name_back">
			<div class="send_message_name">플레이리스트</div>
		</div>
		<div class="myfriend_play_list ">
			<div class="friend_play_list_scroll ">
				<table class="myfriend_play_list_table color_white">
					<tr>
						<td class="myinfo_play_list_td w30per ">게임명</td>
						<td class="myinfo_play_list_td w40per ">다음게임일시</td>
						<td class="myinfo_play_list_td w30per ">관전가기</td>
					</tr>
					<!-- 플레이 중인 게임이 없을 시  -->
					<c:if test="${empty gamelist}"> 
						<tr>
							<td colspan = '3'>플레이중인 게임이 없습니다.</td>
						</tr>
					</c:if>
					<!-- 플레이 중인 게임 있음 -->
					<c:forEach items="${gamelist}" var="game"> 				
						<tr>
							<td>${game.room_name}</td>
							<td>${game.next_play_date}</td>
							
							<!-- 관전가능 -->
							<c:if test="${game.room_state eq 0}">
								<td id="show_game">관전가기<input type ="hidden" value="${game.room_num}" /> </td>
							</c:if>
							
							<!-- 관전 불가 -->
							<c:if test="${game.room_state eq 1}">
								<td>관전불가</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		</div>
	</div>
</html>