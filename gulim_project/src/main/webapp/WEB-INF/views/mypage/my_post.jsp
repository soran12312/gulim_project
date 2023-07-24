<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 게시글</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){


//※ event title : 	$('#mypost_select').change
//※ event info  :	말머리의 셀렉트 옵션이 바꼈을 때 검색
	$('#mypost_select').change(function(){		
		
		// 옵션의 벨류를 보내서 해당 옵션과 일치하는 목록 가져오기
		$.ajax({
			data 	: {subject : $("#mypost_select option:selected").val()}
			,type	: 'post'
			,url	: '/mypage/my_post2'
			,success	: function(result){
				displaySearchResults(result);
			}
			,error	: function(err){
				console.log(err);
			}
		}); // end of ajax
	});
//※ END of event title : 	$('#mypost_select').change

//※ function title : 	function displaySearchResults
//※ function info  :	id리스트 가져올 경우 검색결과를 지우고 새로운 결과값을 테이블에 출력   
function displaySearchResults(searchResults) {
			var searchResultTable = $('#postlist');
  
  			// 현재 테이블에 있는 모든 행을 삭제
  			searchResultTable.empty(); 
		
		//받아온 리스트만큼 반복하면서 해당 리스트안의 map값을 변수에 저장하고 테이블에 출력
		for (var i = 0; i < searchResults.length; i++) {
	    	var post_num = searchResults[i].post_num;
	   		var subject = searchResults[i].subject;
    		var post_title = searchResults[i].post_title;
    		var writing_date = searchResults[i].writing_date;

      		// 검색 결과를 테이블에 추가
     		//var row = '<td><input type="checkbox">' + post_num + '</td><td>' + subject + '</td><td>' + post_title + '</td><td>' + writing_date + '</td>';
			 var row = '<tr><td class="h30px w5per"><input type="checkbox" value= "'+post_num+'" />'+ '</td><td class="h30px w20per">' + subject + '</td><td class="h30px w60per"><a class="no_a_st" href= "/community/free_board_detail?post_num='+post_num+'">' + post_title + '</a></td><td class="h30px w15per">' + writing_date + '</td></tr>';
      		searchResultTable.append(row);
    	}
	}
//※ END of function title : 	function displaySearchResults

//※ event title : 	$('#my_post_delete').click
//※ event info  :	삭제버튼을 눌렀을 때 체크되어있는 체크박스의 값을 가져와 삭제
$('#my_post_delete').click(function() {
 
	// 체크된 체크박스의 post_num 값을 배열로 수집
    var checkedPostNums = [];
    $('input[type="checkbox"]:checked').each(function() {
      checkedPostNums.push($(this).val());
    });

    // 선택된 항목이 없으면 삭제하지 않음
    if (checkedPostNums.length === 0) {
      swal.fire("삭제할 항목을 선택해주세요.");
      return;
    }

    // 서버로 선택된 post_num 배열을 전송하여 삭제 요청
    $.ajax({
      data: { postNums: checkedPostNums },
      type: 'post',
      url: '/mypage/delete_posts',
      success: function(result) {
        swal.fire("선택한 항목이 삭제되었습니다.");

		//말머리기준으로 다시 정렬하여 화면 갱신
		$('#mypost_select').trigger('change');
      },
      error: function(err) {
        console.log(err);
      }
    });
	//※ END of event title : 	$('#my_post_delete').click
});
});
</script>
</head>
<body>	
<div class="mypagebackpage">
<jsp:include page="../../../header_after.jsp"></jsp:include>
<!-- ===================== START OF subnav =====================-->
	<div class="subnav">
		<div class="subnav_select_post subnav_select"></div>
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
	
<div class="message_back"></div>
<span class="page_name">나의 게시글</span>
<div class=" post_back_table">
	<div class="back_heiget_90per">
	<table class="my_post_table">
		<thead>
		<tr>
			<td class="my_post_td1"></td>
			<td class="my_post_td2">
				<select id = "mypost_select">
					<option value="all">전체보기</option>
					<option value="game">게임개설요청</option>
					<option value="master">게임마스터모집</option>
					<option value="user">중간파티원모집</option>
					<option value="other">잡담</option>
					<option value="review">게임리뷰</option>
					<option value="gameother">게임기타</option>
					<option value="character">캐릭터설정</option>
				</select>
			</td>
			<td class="my_post_td3">게시글 제목</td>
			<td class="my_post_td4">날짜</td>
		</tr>
	</thead>
	<tbody id="postlist">
		<c:forEach items="${list}" var="post">
			<tr>
				<td>
					<input type="checkbox" value= "${post.post_num}">
				</td>
				<td>${post.subject}</td>
				<td><a class="no_a_st" href= "/community/free_board_detail?post_num=${post.post_num}">${post.post_title}</a></td>
				<td>${post.writing_date}</td>			
			</tr>		
		</c:forEach>
	</tbody>
	</table>
	</div>
	<input type="button" class="my_post_delete" id='my_post_delete' value="글삭제"/>
</div>		
</div>
<jsp:include page="../../../footer.jsp"></jsp:include>
</body>
</html>