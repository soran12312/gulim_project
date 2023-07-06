<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#img_modify').click(function(){
			if(this.value === '사진수정'){
				this.value = "수정완료"}
			else {this.value = "사진수정"}
	})
	
	$('#info_modi').click(function(){
			if(this.value === '회원정보수정'){
				this.value = "수정완료"}
			else {this.value = "회원정보수정"}
	})
});
</script>
</head>
<body>
<div class="mypagebackpage">
<jsp:include page="../../../../header_after.jsp"></jsp:include>
<!-- ===================== START OF subnav =====================-->
	<div class="subnav">
		<div class="subnav_select_info"></div>
			<div class="subnav_menu">
					<a href ="../my_message">쪽지</a>
					<a href ="../calender">캘린더</a>
					<a href ="../game/my_game_list">나의 게임관리</a>
					<a href ="info_modify">회원정보</a>
					<a>나의 게시글</a>
					<a>나의 문의사항</a>
					<a>친구관리</a>
					<a>결제내역</a>
					<a>공모전</a>
					<a>참여내역</a>
			</div>
	</div>
<!-- ===================== START OF SIDE BAR =====================-->
	<div style="width: 100px; height: 400px;background-color: black;border: 7px solid black;border-top-left-radius: 50px;border-top-right-radius: 50px;border-bottom-left-radius: 50px;border-bottom-right-radius: 50px;position: fixed;right: 3%;top: 30%">
	<a href="../../main/login_main"><img src="/files/images/sideBar홈.png" style="width: 70px;margin: 15px;"></a>
  	<a href="info_modify"><img src="/files/images/sideBar마이페이지.png" style="width: 70px;margin: 15px;"></a>
  	<a href="../../sale/sale_main"><img src="/files/images/sideBar장바구니.png" style="width: 70px;margin: 15px;"></a>
  	<a href="../../customer_service/main"><img src="/files/images/sideBar챗봇.png" style="width: 70px;margin: 15px;"></a>
	</div>
<!-- ===================== END OF SIDE BAR =====================-->
<!-- ===================== START OF IMG =====================-->
	<div class ="game_back"></div>
		<div class ="game_table">
			<div class="my_img">
				<img src="/files/images/no_image.jpg">
				<input type="button" class="img_modify" id='img_modify' value="사진수정"/>
			</div>
		
<!-- ===================== END OF IMG =====================-->
<!-- ===================== START OF INFO =====================-->
			<form action="">
			<div class="my_info">
				<div>이름</div>
				<input name ="name" value="최다빈" disabled class="info_input"/>
				<div>닉네임</div>
				<input name="nickname" value="최큐티~" disabled class="info_input"/>
				<div>주소</div>
				<input name="address" value="서울시 금천구 가산 1로" disabled class="info_input2"/>
				<input type="button" class="addr_search" id="addr_search" value="주소검색"/>
				<div>이메일</div>
				<input name="email" value="ch_db@naver.com" disabled class="info_input"/>
				<div>전화번호</div>
				<input name ="tel" value="010-6767-0795" disabled class="info_input"/>
				<div>자기소개</div>
				<textarea name ="introduce" disabled class="info_area">저는 최큐티에요~</textarea>
				<input type="button" class="info_modi" id='info_modi' value="회원정보수정"/>
			</div>
			</form>
<!-- ===================== END OF INFO =====================-->
		<div class="myinfo_play_list">
			<div class="fs20 fs_bord">플레이리스트</div>
			<div class="fs15">공개여부는 체크 시 공개입니다.</div>
			<div class="myinfo_play_list_scroll">
				<table class="myinfo_play_list_table">
					<tr>
						<td class="myinfo_play_list_td w30per">게임명</td>
						<td class="myinfo_play_list_td w70per">게임설명</td>
					</tr>
					<tr>
						<td >게임이름알엉러아밍</td>
						<td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td>
					</tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
					<tr><td>게임이름알엉러아밍</td><td>오러오ㅓㅏㅁ리ㅗ아ㅓㅁ</td></tr>
				</table>
			</div>
		</div>
		</div>
</div>
<jsp:include page="../../../../footer.jsp"></jsp:include>
</body>
</html>