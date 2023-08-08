<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맵지도 만들기</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
</head>
<body>
<div class="gamebackpage">
<jsp:include page="../../../../header_after.jsp"></jsp:include>
<jsp:include page="../../../../sidebar.jsp"></jsp:include>

	<table class="game_roomlist_nav">
		<tr>
			<td><a class="no_a_st2" href = "/game/support/galme_reccommend ">게임 추천</a></td>
			<td><a class="no_a_st2" href = "#">생성된 방</a></td>
			<td><a class="no_a_st2" href = "/game/support/map_create">게임 지원</a></td>
		</tr>
		<tr><td colspan="3"><hr/></td></tr>
	</table>
	
	<div class= "ifram_size" >
	<iframe src="https://192.168.0.68:3000/roomList" style="width: 100%; height:700px; border: none;"></iframe>
	</div>
</div>
<jsp:include page="../../../../footer.jsp"></jsp:include>
</body>
</html>