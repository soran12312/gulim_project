<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플레이 리스트</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript"> 
	$(document).ready(function(){



	//※ function title : 	$('#make_friend').click
	//※ function info  :	친구아이디값을 가지고 가서 친구추가 후 프로필창을 닫고 친구관리창 새로고침
		$('#make_friend').click(function(){
			location.href="/mypage/make_friend?friend_id=${friend.getId()}"
			setTimeout(function() {   
			window.close();
			window.opener.parent.location.reload();}, 10);
		});
	});
	//※ END of function title : 	$('#make_friend').click
	
</script>
</head>
<body>
<!-- 친구관리에 친구 프로필 창 -->


<div class="friends_profile_back">
	<div class="send_message_name">프로필</div>


	<div class=" friends_profile_size">
		<table class="friends_profile_table">
			<tr>
				<td class="friends_profile_img"><img src="${friend_img}"></td>
			</tr>
			<tr>
				<td>${friend.getNickname()} (${friend.getId()})</td>
			</tr>
			<tr>
				<td class="introduce_friend">${friend.getIntroduce()}</td>
			</tr>
		</table>
	</div>

	<button type="button" id = "make_friend" class="make_friend">친구추가</button>
</div>

</html>

