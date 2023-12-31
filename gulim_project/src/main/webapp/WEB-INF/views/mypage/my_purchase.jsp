<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        $.noConflict();
        
        $(".bxslider").bxSlider({
        touchEnabled : (navigator.maxTouchPoints > 0),
        minSlides : 1,
        maxSlides : 3,
        slideWidth : 300,
        pager:false
        
        });
    });
</script>
</head>
<body>


	
<div class="mypagebackpage">
<jsp:include page="../../../header_after.jsp"></jsp:include>
<!-- ===================== START OF subnav =====================-->
	<div class="subnav">
		<div class="subnav_select_purchase subnav_select"></div>
			<div class="subnav_menu">
                <a href ="/mypage/my_message">쪽지</a>
                <a href ="/mypage/calender">캘린더</a>
                <a href ="/mypage/game/my_game_list">나의 게임관리</a>s
                <a href ="/mypage/user_info/info_modify">회원정보</a>
                <a href ="/mypage/my_post">나의 게시글</a>
                <a href ="/mypage/my_question">나의 문의사항</a>
                <a href ="/mypage/friends">친구관리</a>
                <a href ="/mypage/my_purchase">결제내역</a>
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


	
<!-- =============START OF 결제내역============================================ -->	
<div class="message_back"></div>
<span class="page_name">결제내역</span>
<div class=" post_back_table">
    <div class="myfriend_pagename">구독권구매</div>
    <c:if test="${end != '0'}">
        <div class="purchase_div">현재 구독은 [ ${end} ]일 만료됩니다. </div>
    </c:if>
    <c:if test="${end eq '0'}">
        <div class="purchase_div">구독이 만료되었습니다. </div>
    </c:if>
   
    
    <div class="purchase_goods" >
        <table>
            <tr class="purchase_goods_tr1">
                <td><img src="/files/images/mypage/1.png"></td>
                <td><img src="/files/images/mypage/3.png"></td>
                <td><img src="/files/images/mypage/6.png"></td>
                <td><img src="/files/images/mypage/12.png"></td>
            </tr>
            <tr class="purchase_goods_tr2 cursor">
                <td><a href="/sale/subscribe"  class="no_a_st">1개월 연장</a></td>
                <td><a href="/sale/subscribe"  class="no_a_st">3개월 연장</a></td>
                <td><a href="/sale/subscribe"  class="no_a_st">6개월 연장</a></td>
                <td><a href="/sale/subscribe" class="no_a_st">12개월 연장</a></td>
            </tr>
        </table>
    </div>
<!-- =============END OF 결제내역============================================ -->	
<!-- =============START OF 설정집 구매============================================ -->	
    <div class ="purchase_book">
        <div class="purchase_pagename">구매한 설정집</div>
        <div class="bxslider_size_purchase_book">
            <ul class="bxslider">
                
                    <c:forEach items="${list}" var="book">
                    <li class="purchase_li">
                    <table class="purchase_table">
                        <tr>
                            <td class="purchase_bookimg"><img src=${book.path}></td>
                            
                        </tr>
                        <tr>
                            <td class="purchase_bookname">${book.title}</td>
                        </tr>
                        <tr>
                            <td><div class = "purchase_tag">${book.state}</div></td>
                            
                        </tr>
                    </table>
                    </li>
                    </c:forEach>
        
            </ul>
        </div>
    </div>
<!-- =============END OF 설정집 구매============================================ -->
</div>		
</div>
<jsp:include page="../../../footer.jsp"></jsp:include>
</body>
</html>