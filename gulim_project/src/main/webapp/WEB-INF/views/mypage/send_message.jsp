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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){


	//※ event title :	$('#send_message_submit').click
	//※ event info :	폼으로 쪽지 보내기
		$('#send_message_submit').click(function(){
			 $( '#sendmessage_form' ).submit();
			 setTimeout(function() {   
             window.close();
			// window.opener.parent.location.reload();}, 10);
        // 부모 창에서 특정 페이지인지 확인
        if (window.opener && window.opener.location.href.includes('/mypage/game/char_sheet_confirm')) {
            console.log(window.opener.location.href);
            alert('이 페이지는 특정 페이지입니다.');
            window.opener.location.href = '/mypage/game/my_game_list';
        } else {
            // 부모 창이 없거나 특정 페이지가 아닌 경우, 부모 창 새로고침
            if (window.opener) {
                window.opener.location.reload();
            }
        }
    }, 10);
			
	});
});
</script>
</head>
<body>
	<div class="send_message_backpage">
		<div class="send_message_name_back">
			<div class="send_message_name">쪽지보내기</div>
		</div>
		<div class = "sendmessage_form">
			<form action="save_message" id="sendmessage_form">
				<div>
					<p class="sendmessage_menu">제목</p>
					<input name="message_title" id="message_title" class="message_title" placeholder="쪽지제목을 입력하세요" onblur="this.placeholder='쪽지제목을 입력하세요'">
				</div>
				<div>
					<p class="sendmessage_menu">받을 아이디</p>
					<input name="receive_id" id="receive_id" class="receive_id" placeholder="받을 친구의 아이디를 입력하세요" onblur="this.placeholder='받을 친구의 아이디를 입력하세요'" value="${send_id}">
				</div>
				<div>
					<p class="sendmessage_menu">내용</p>
					<textarea name="message_content" id="message_content" class="message_content" placeholder="쪽지 내용을 입력하세요" onblur="this.placeholder='쪽지 내용을 입력하세요'"></textarea> 
				</div>
				<div class = "sendmessage_btn cursor">
				<button type="button" class="cursor" id="send_message_submit">쪽지 보내기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>