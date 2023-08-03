<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임지원</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.ifram_size2').hide();

	$('#map').click(function(){
		$('.ifram_size2').hide();
		$('.ifram_size').show();
	});
	$('#monster').click(function(){
		$('.ifram_size2').show();
		$('.ifram_size').hide();
		$('#support_iframe').attr("src","https://localhost:3000/support/data/monster");
	});
	$('#item').click(function(){
		$('.ifram_size2').show();
		$('.ifram_size').hide();
		$('#support_iframe').attr("src","https://localhost:3000/support/data/item");
	});
	$('#etc').click(function(){
		$('.ifram_size2').show();
		$('.ifram_size').hide();
		$('#support_iframe').attr("src","https://localhost:3000/support/data/etc");
	});

});
</script>
</head>
<body>s
<div class="gamebackpage">
<jsp:include page="../../../../header_after.jsp"></jsp:include>
<jsp:include page="../../../../sidebar.jsp"></jsp:include>
<a href = "/game/support/etc"> ㆍ</a>
	<table class="game_roomlist_nav">
		<tr>
			<td><a class="no_a_st2 game_roomlist_nav_a1" href = "/game/reccommend/game_reccommend ">게임 추천</a></td>
			<td><a class="no_a_st2 game_roomlist_nav_a1" href = "/game/play/room_list">생성된 방</a></td>
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

	<div class= "ifram_size" >
	<iframe src="https://azgaar.github.io/Fantasy-Map-Generator/" style="width: 100%; height:700px; border: none;"></iframe>
	</div>
	<div class= "ifram_size2" >
		<iframe id= "support_iframe"  style="width: 100%; height:600px; border: none;"></iframe>
	</div>
</div>
<jsp:include page="../../../../footer.jsp"></jsp:include>
</body>
</html>