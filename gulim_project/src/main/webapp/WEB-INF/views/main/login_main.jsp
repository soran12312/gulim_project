<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굴림</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
<script type="text/javascript">
const goAdminPage = () => {
	location.href='/admin/question';
}
</script>
</head>
<body>
<!-- START전체 div -->
<div class="loginmain_wallpaper">
<jsp:include page="../../../header_after.jsp"></jsp:include>
<jsp:include page="../../../sidebar.jsp"></jsp:include>
	<!-- 페이지 상단 ZEP연결+마케팅 메세지 -->
	<div class="loginmain1">
		<div class="loginmain1_back"></div>
		<c:if test="${manager eq 1}">
			<button class="go_zep" onclick="goAdminPage()">Gulim<br/>!!Go!!</button>
		</c:if>
		<c:if test="${manager eq 0}">
			<button class="go_zep">Gulim<br/>!!Go!!</button>
		</c:if>
		
		<div class="loginmain1_message">굴림 세상으로 떠나지 않아도 웹으로도 접속할 수 있어요.<br/>
			하지만 굴림세상에서 즐겨보시는 건 어떨까요?</div>
		
	</div>
	<!-- 페이지 하단 기능 소개 + 링크 -->
	<div class="loginmain2">
		
		<div class="loginmain_name">굴림에서 지원하는 기능<hr/></div>
		<div class="loginmain_table_back">
		<table class="loginmain_table">
			<tr>
				<td><a class="no_a_st2" href="/game/play/room_list">화상채팅</a></td>
				<td><a class="no_a_st2" href="/offline/map">오프라인 <br/>모임장소 찾기</a></td>
				<td><a class="no_a_st2" href="/community/free_board_list">커뮤니티</a></td>
			</tr>
			<tr>
				<td><a href="/game/play/room_list"><img src="/files/images/화상채팅.jpg"/></a></td>
				<td><a href="/offline/map"><img src="/files/images/모임장소 찾기.jpg"/></a></td>
				<td><a href="/community/free_board_list"><img src="/files/images/커뮤니티.jpg"/></a></td>
			</tr>
			<tr>
				<td><a class="no_a_st2" href="/sale/book/book_list">설정집 추천</a></td>
				<td><a class="no_a_st2" href="/game/support/map_create">지도 만들기</a></td>
				<td><a class="no_a_st2" href="/sale/sale_main">설정집&구독권 구매</a></td>
			</tr>
			<tr>
				<td><a  href="/sale/book/book_list"><img src="/files/images/초보자가이드.jpg"/></a></td>
				<td><a href="/game/support/map_create"><img src="/files/images/지도.jpg"/></a></td>
				<td><a href="/sale/sale_main"><img src="/files/images/게임정보.jpg"/></a></td>
			</tr>
		</table>
		</div>
	</div>	
</div>
<jsp:include page="../../../footer.jsp"></jsp:include>
</body>
</html>