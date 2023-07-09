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
<link href="/css/place.css" rel="stylesheet">
<!--BX슬라이더  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript">
    $(function(){
        
        
        $(".bxslider").bxSlider({
        touchEnabled : (navigator.maxTouchPoints > 0),
        minSlides : 1,
        maxSlides : 3,
        slideWidth : 300
        
        });
    });
</script>
</head>
<body>


	
<div class="mypagebackpage">
<jsp:include page="../../../header_after.jsp"></jsp:include>
<!-- ===================== START OF subnav =====================-->
	<div class="subnav">
		<div class="subnav_select_contest subnav_select"></div>
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
	<div style="width: 100px; height: 400px;background-color: black;border: 7px solid black;border-top-left-radius: 50px;border-top-right-radius: 50px;border-bottom-left-radius: 50px;border-bottom-right-radius: 50px;position: fixed;right: 3%;top: 30%">
	<a href="/main/login_main"><img src="/files/images/sideBar홈.png" style="width: 70px;margin: 15px;"></a>
  	<a href="/mypage/user_info/info_modify"><img src="/files/images/sideBar마이페이지.png" style="width: 70px;margin: 15px;"></a>
  	<a href="/sale/sale_main"><img src="/files/images/sideBar장바구니.png" style="width: 70px;margin: 15px;"></a>
  	<a href="/customer_service/main"><img src="/files/images/sideBar챗봇.png" style="width: 70px;margin: 15px;"></a>
	</div>
<!-- ===================== END OF SIDE BAR =====================-->


	
<!-- =============START OF 공모전참여내역============================================ -->	
<div class="message_back"></div>
<span class="page_name">공모전 참여내역</span>
<div class=" post_back_table">
    <div class="myfriend_pagename">내가 참여한 공모전</div>
    <div class="mycontest_all">
        <table>
            <tr class ="mycontest_img">
                <td><img src="/files/images/wallpaper/배경4.jpg"></td>
            </tr>
            <tr class ="mycontest_name">
                <td>콘테스트명</td>
            </tr>
            <tr class ="mycontest_date">
                <td>2023-07-09 결과발표</td>
            </tr>
        </table>
        <table>
            <tr class ="mycontest_img">
                <td><img src="/files/images/wallpaper/배경4.jpg"></td>
            </tr>
            <tr class ="mycontest_name">
                <td>콘테스트명</td>
            </tr>
            <tr class ="mycontest_date">
                <td>2023-07-09 결과발표</td>
            </tr>
        </table>
        <table>
            <tr class ="mycontest_img">
                <td><img src="/files/images/wallpaper/배경4.jpg"></td>
            </tr>
            <tr class ="mycontest_name">
                <td>콘테스트명</td>
            </tr>
            <tr class ="mycontest_date">
                <td>2023-07-09 결과발표</td>
            </tr>
        </table>
    </div>
 
<!-- =============END OF 공모전참여내역============================================ -->
</div>		
</div>
<jsp:include page="../../../footer.jsp"></jsp:include>
</body>
</html>