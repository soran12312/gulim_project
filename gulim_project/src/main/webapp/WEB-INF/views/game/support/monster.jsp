<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>몬스터</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#monster').click(function(){
		$('#support_iframe').attr("src","https://localhost:3000/support/data/moster");
	});
	$('#item').click(function(){
		$('#support_iframe').attr("src","https://localhost:3000/support/data/item");
	});
	$('#etc').click(function(){
		$('#support_iframe').attr("src","https://localhost:3000/support/data/etc");
	});

});

</script>
</head>
<body>
<div class="mypagebackpage">
<jsp:include page="../../../../header_after.jsp"></jsp:include>

	<table class="game_roomlist_nav">
		<tr>
			<td><a class="no_a_st2 game_roomlist_nav_a1" href = "/game/support/galme_reccommend ">게임 추천</a></td>
			<td><a class="no_a_st2 game_roomlist_nav_a1" href = "/game/support/room_list">생성된 방</a></td>
			<td><a class="no_a_st2 game_roomlist_nav_a1" href = "/game/support/map_create">게임 지원</a></td>
		</tr>
		<tr><td colspan="3"><hr/></td></tr>
		</table>
		
		<table class="game_roomlist_nav2">
		<tr>
			<td><a class="no_a_st2 fs15 " id="map">맵지도 만들기</a></td>
			<td><a class="no_a_st2 fs15 " id="monster">몬스터</a></td>
			<td><a class="no_a_st2 fs15 " id="item">아이템</a></td>
			<td><a class="no_a_st2 fs15 " id="etc">기타</a></td>
		</tr>
	</table>

	<div class= "ifram_size2" >
		<iframe id= "support_iframe"  style="width: 100%; height:700px; border: none;"></iframe>
	</div>

</div>
<jsp:include page="../../../../footer.jsp"></jsp:include>
</body>
</html>