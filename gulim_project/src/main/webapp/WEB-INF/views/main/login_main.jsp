<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굴림</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
</head>
<body>
<!-- START전체 div -->
<div class="loginmain_wallpaper">
<jsp:include page="../../../header_after.jsp"></jsp:include>
	<!-- 페이지 상단 ZEP연결+마케팅 메세지 -->
	<div class="loginmain1">
		<div class="loginmain1_back"></div>
		<button class="go_zep">Gulim<br/>!!Go!!</button>
		<div class="loginmain1_message">굴림 세상으로 떠나지 않아도 웹으로도 접속할 수 있어요.<br/>
			하지만 굴림세상에서 즐겨보시는 건 어떨까요?</div>
		
	</div>
	<!-- 페이지 하단 기능 소개 + 링크 -->
	<div class="loginmain2">
		
		<div class="loginmain_name">굴림에서 지원하는 기능<hr/></div>
		<div class="loginmain_table_back">
		<table class="loginmain_table">
			<tr>
				<td>화상채팅</td>
				<td>오프라인 <br/>모임장소 찾기</td>
				<td>커뮤니티</td>
			</tr>
			<tr>
				<td><img src="/files/images/화상채팅.jpg"/></td>
				<td><img src="/files/images/모임장소 찾기.jpg"/></td>
				<td><img src="/files/images/커뮤니티.jpg"/></td>
			</tr>
			<tr>
				<td>초보자를 위한 <br/>역할 추천</td>
				<td>근처 게이머 찾기</td>
				<td>다양한 게임정보</td>
			</tr>
			<tr>
				<td><img src="/files/images/초보자가이드.jpg"/></td>
				<td><img src="/files/images/지도.jpg"/></td>
				<td><img src="/files/images/게임정보.jpg"/></td>
			</tr>
		</table>
		</div>
	</div>	
</div>
<jsp:include page="../../../footer.jsp"></jsp:include>
</body>
</html>