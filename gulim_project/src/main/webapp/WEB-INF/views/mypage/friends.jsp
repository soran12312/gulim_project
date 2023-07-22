<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구관리</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- sweet alert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
$(document).ready(function(){


//※ event title : 	windows open prop.check	
//※ event info  :	검색허용 값따라서 체크여부설정
	var distSearchValue = ${member.dist_search};
	
	//0이면 체크 1이면 체크해제
	if (distSearchValue === 0) {
    	$('#chek1').prop('checked',true); 
  	}
	else{
		$('#chek1').prop('checked',false);
	}

	var name_searchValue = ${member.name_search};
	if (name_searchValue === 0) {
    	$('#chek2').prop('checked',true); 
  	}
	else{
		$('#chek2').prop('checked',false);
	}
//※ END of event title : windows open prop.check	


//※ event title : 	$("#chek1").change  ,$("#chek2").change
//※ event info  :	검색허용 값변경 시 DB 검색 허용여부 저장
	
	//근처친구검색허용여부
	$("#chek1").change(function(){

		//체크 시
        if($("#chek1").is(":checked")){
			Swal.fire({
				icon: 'success',
				title: '근처에 있는 친구가 나를 찾을 수 있어요!',	
			}).then(function(){
				location.href="/mypage/dist_search0"
				})

        //체크해제   
        }else{
			Swal.fire({
				icon: 'success',
				title: '근처에 있는 친구가 나를 찾을 수 없어요!',	
			}).then(function(){
				location.href="/mypage/dist_search1";
				})
        }
    });

	//회원검색허용여부
	$("#chek2").change(function(){

		//체크 시
        if($("#chek2").is(":checked")){
			Swal.fire({
				icon: 'success',
				title: "친구가 나를 검색할 수 있어요!",	
			}).then(function(){
				location.href="/mypage/name_search0";
				})

		//체크해제
        }else{
			Swal.fire({
				icon: 'success',
				title: "친구가 나를 검색할 수 없어요!",	
			}).then(function(){
				location.href="/mypage/name_search1";
				})
        }
    });
//※ END of event title : $("#chek1").change  ,$("#chek2").change



//※ event title : 	$('#friend_search_btn').click
//※ event info  :	검색버튼 클릭 시 id 리스트 가져오기
	$('#friend_search_btn').click(function(){

		//검색창에 입력된 값 가져와서 search_id에 할당하고 성공 시 검색리스트 가져온 후 displaySearchResults함수실행
		var search_id = $('#friend_search_input').val();
		$.ajax({
			 type 		: 'post'
			,data 		:  {"id" : search_id}
			,url 		: '/mypage/search_friend_id'
			,success 	: function(result){
					displaySearchResults(result);

			}//END of success
			,error 		: function(err){console.log(err);}//END of error
		});//END of ajax
		})
//※ event title : 	$('#friend_search_btn').click



//※ function title : 	function displaySearchResults
//※ function info  :	id리스트 가져올 경우 검색결과를 지우고 새로운 결과값을 테이블에 출력   
	function displaySearchResults(searchResults) {
		var searchResultTable = $('#search_friend_list');
		// 이전 검색 결과를 지우고 새로운 결과를 출력하기 위해 테이블을 비움
		searchResultTable.empty(); 

		for (var i = 0; i < searchResults.length; i++) {
		var id = searchResults[i].id;

		// 검색 결과를 테이블에 추가
		var row = '<tr><td>' + id + '</td><td><a href="/mypage/friend_profile?id=' + id +'">프로필보기</a></td></tr>';
		searchResultTable.append(row);
		$("#search_friend_list a").attr("onclick",'window.open(this.href, "친구 프로필", "width=420, height=520"); return false;');
 		}
	}
//※ END of function title : 	function displaySearchResults



});
</script>
</head>
<body>
<div class="mypagebackpage">
<jsp:include page="../../../header_after.jsp"></jsp:include>
<!-- ===================== START OF subnav =====================-->
	<div class="subnav">
		<div class="subnav_select_friends subnav_select"></div>
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
	
	<div class ="game_back"></div>

	
<!-- =============START OF검색허용============================================ -->	
	<div class ="game_table">
		<div class="myfriend_pagename">친구관리</div>
			<hr class="friend_line1">
			<hr class="friend_line2">
		<div class="friend_search_check">	
		<span class="search_place">
			<span>근처 친구검색 허용</span> <input type="checkbox" id="chek1">
		</span>
		<span class="search_name">
			<span>이름으로 친구 검색 허용</span> <input type="checkbox" id="chek2">
		</span>
		</div>
<!-- =============END OF 검색허용============================================ -->		
<!-- =============START OF 친구목록============================================ -->	
<span class="myfriend_back1"></span>
<span class="myfriend_back2"></span>

<span class="myfriend_list">
    <div class="myfriend_pagename">친구 목록</div>
    <hr class="friend_line3"/>
    <div class="myfriend_list_scroll">
        <table class="myfriend_list_table">
            <c:forEach items="${list}" var="friend">
                <tr>
                    <td>${friend.friend_id}</td>
                    <td><a href="/mypage/friend_playlist?id=${friend.friend_id}" onclick="window.open(this.href, '게임플레이리스트', 'width=420, height=520'); return false;">참여게임목록</a></td>
                    <td><a href="/mypage/send_message?send_id=${friend.friend_id}" onclick="window.open(this.href, '쪽지보내기', 'width=420, height=520'); return false;">쪽지보내기</a></td>
					<td><a href="/mypage/no_friend?friend_id=${friend.friend_id}">삭제</a></td>
				</tr>
            </c:forEach>
        </table>
    </div>
</span>
<!-- =============END OF 친구목록============================================ -->	
<!-- =============START OF ADD친구============================================ -->	

		<span class="myfriend_addlist">
			<div class="myfriend_pagename">친구 추가</div>
			<div class="searchimg">
				<input class="friend_search_input fs20" id="friend_search_input" placeholder="아이디를 입력하세요"/> 
				<button class="friend_search_btn" id="friend_search_btn"></button>
			</div>
			<hr class="friend_line4"/>
			<div class="myfriend_addlist_scroll">
			<table class="myfriend_list_table" id="search_friend_list">
			</table>
			</div>
		</span>
<!-- =============END OF ADD친구============================================ -->	

	</div>
</div>
<jsp:include page="../../../footer.jsp"></jsp:include>

</body>
</html>
