<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
<!-- sweet alert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2"></script>
<script src="https://unpkg.com/tippy.js@6"></script>

<script type="text/javascript">
//※ function title	:	addEventListener 
//※ function info	:	캘린더 설정과 출력 
	document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
          
        //※ calendar option info :	날짜 선택가능
          ,selectable: true
          
        //※ calendar option info :	한글패치
          ,locale: 'kr'
          
        //※ calendar option info :	캘린더 스크롤 
          ,Boolean, default: true
          
        //※ calendar option info :	DATE 높이 
          ,contentHeight: 600
          
        //※ calendar option info :	날짜 옆에 '일' 글자 없애기 
		  ,dayCellContent: function(info){
		  		var number = document.createElement("a");
		  		number.classList.add("fc-daygrid-day-number");
		  		number.innerHTML = info.dayNumberText.replace("일",'');
		  		if(info.view.type === "dayGridMonth")
					{
			  		return{html: number.outerHTML};
		  			}
				return{domNodes:[]};
			}
		  
		//※ calendar option info :	툴팁 생성
		   ,eventDidMount: function(info){
				tippy(info.el,{
				content:info.event._def.title,
				placement:"bottom",
				offset:[0,0],
				interactive:true})
			}  
		//※ calendar option info :	이벤트 디스크립션을 툴팁으로 가져오기
		   ,eventDidMount: function(info) {
            	tippy(info.el, {
                content:  info.event.extendedProps.description,//이벤트 디스크립션을 툴팁으로 가져옵니다. 
            	})
        	}

          
        //※ calendar option info :	일정 컬러 그린
		    ,eventColor: 'green'
			
		//※ calendar option info :	일정 리스트형태로 캘린더에 띄우기
			,events:
			[	<c:forEach items="${evt}" var="evt2">
				{
					id 			: "${evt2.num}",
                    start 		: "${evt2.start}",
                    title 		: "${evt2.title}",
                    description	: "${evt2.description}"
                },
			</c:forEach>
			]
     



		//※ calendar option title :	dateClick  (날짜 빈공간 클릭 시)
		//※ calendar option info :	날짜 빈공간 클릭 시 해당 날짜를 얻어오고 일정을 입력받아(sweetAlert2) 일정저장 후 새로고침
		    ,dateClick: function (info) {
				const clickedDate = info.date; // 클릭한 날짜
				const year = clickedDate.getFullYear();
				const month = String(clickedDate.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1
				const day = String(clickedDate.getDate()).padStart(2, '0');
				let start_time; 
							
            	// sweet alert2로 시간 받기
          		(async () => {
					const { value: time } = await Swal.fire({
						title: '시간을 골라주세요',
						input: 'select',
						inputOptions: {
						'T00:00:00' : '00:00',
						'T01:00:00' : '01:00',
						'T02:00:00' : '02:00',
						'T03:00:00' : '03:00',
						'T04:00:00' : '04:00',
						'T05:00:00' : '05:00',
						'T06:00:00' : '06:00',
						'T07:00:00' : '07:00',
						'T08:00:00' : '08:00',
						'T09:00:00' : '09:00',
						'T10:00:00' : '10:00',
						'T11:00:00' : '11:00',
						'T12:00:00' : '12:00',
						'T13:00:00' : '13:00',
						'T14:00:00' : '14:00',
						'T15:00:00' : '15:00',
						'T16:00:00' : '16:00',
						'T17:00:00' : '17:00',
						'T18:00:00' : '18:00',
						'T19:00:00' : '19:00',
						'T20:00:00' : '20:00',
						'T21:00:00' : '21:00',
						'T22:00:00' : '22:00',
						'T23:00:00' : '23:00',
						'T24:00:00' : '24:00'
						},
					  	inputPlaceholder: '약속시간을 정해주세요',
					  	showCancelButton: true,
					  	inputValidator: (value) => {
					    	return new Promise((resolve) => {

								//입력받은 날짜와 시간을 일정 출력 형태에 맞도록 가공
				     			if (value != null) {
									start_time = year + "-" + month + "-" + day + value;
				        			resolve()
				      			} else {
				      			}			  
				   			})
						}
					})

					// 시간 선택 시 일정명 입력
					if (time) {
						(async () => {
				    		const { value: schedule_title } = await Swal.fire({
				        	title: '약속을 뭐라고 저장할까요?',
				        	input: 'text',
				        	inputPlaceholder: '약속이름을 적어주세요'
				    		})
				
				    		// 일정 내용 입력
				    		if (schedule_title) {
								const { value: schedule_content } = await Swal.fire({
					        	title: '내용을 뭐라고 저장할까요?',
					        	input: 'text',
					        	inputPlaceholder: '내용을 적어주세요'
					    		}) 

								//입력받은 내용을 DB에 저장, 성공 시 새로고침
								$.ajax({
									url: '/mypage/insert_evt',
									type: 'POST',
									data: {
										 calender_date: start_time
										,calender_title: schedule_title
										,calender_content: schedule_content
									},
									success: function() {
										window.location.reload();

									}
								});
								

							}
						})()						
					}//END of if (time)
				
				})()//END of 시간받기 
			} 
		//※ END of calendar option title :	dateClick

		//※ calendar option title :	eventClick  (일정 클릭 시)
		//※ calendar option info :	이벤트 클릭시 sweetalert2 되며 비밀번호체크 작동 후 true일 시 해당 일정 삭제
			,eventClick: function(info){
				//비밀번호 삭제 input창 출력
				const password_check_input = Swal.fire({
					title: "일정 ["+info.event.title+"]을 삭제하시려면 비밀번호를 입력해주세요",
					input: 'password',
					inputPlaceholder: '삭제를 원하시면 비밀번호를 입력해주세요.'
					}).then((result) => {
						//입력한 password = result.value 
            			if (result.isConfirmed) {
              				const  password  = result.value;
              				console.log(password);
							// 비밀번호 , 일정넘버 가지고 password_check 함수로 이동 (id는 삭제 시 PK값으로 필요)
							password_check(password,info.event.id);
							
            			}
        			});

					
				
				

			}
		//※ END calendar option title :	eventClick





		});//END of 캘린더 설정
       
    	// 캘린더 오픈
    	calendar.render();						
	});//END of addEventListener('DOMContentLoaded', function())




//※ function title	:	password_check 
//※ function info	:	입력한 password값을 로그인 한 아이디의 비밀번호와 일치하는 지 확인하는 함수
	function password_check(password_check_input, calender_num){
				
				// password값을 mypage_password_check_calender로 넘기고 
				//result가 True(일치)면 delete_evt함수에 일정id를 담아서 이동
				//result가 False(불일치)면 비밀번호 불일치라고 sweetAlert2 출력
				$.ajax({
					 type 		: 'post'
					,data 		: {password: password_check_input}		
					,url 		: '/mypage/mypage_password_check_calender'

					//비밀번호 일치 시 result값 true 불일치 시 false
					,success 	: function(result){
 						$('#password_check_input').val('');
						
						//비밀번호가 맞을때(result값이 true일때) 
						//패스워드체크div 숨기고 회원정보창출력
						if (result){
							delete_evt(calender_num);
							}
							//비밀번호가 틀렸을때 (result값이 false일때)
						else {
							//스윗Alert로 안내문구
							Swal.fire({
									icon: 'error',                     
  									title: '비밀번호가 틀렸습니다(T^T)',    
  									html: '다시 확인해주시고 문제가 지속되면 <br/> 고객센터로 문의해주세요.', 
							});//END of swal.fire
						}
					}
					,error: function(err){console.log(err);}//END of success


			,error 		: function(err){console.log(err);}//END of error
		});//END of ajax
	}
//※ END function title	:	password_check



//※ function title	:	delete_evt 
//※ function info	:	받아온 일정(클릭된 일정)의 PK값인 num을 받아 삭제 및 새로고침
	function delete_evt(calender_num){
		console.log("delete_evt 실행---"+calender_num)
		$.ajax({
			 type 		: 'post'
			,data 		: {calender_num:calender_num}		
			,url 		: '/mypage/delete_evt'
			//새로고침
			,success 	: function(){

				console.log("삭제성공");
				window.location.reload();
			}//END of success
			,error 		: function(err){console.log(err);}//END of error
		});//END of ajax
	}
//※ END of function title	:	delete_evt	
</script>




<title>Insert title here</title>
</head>
<body>
<div class="mypagebackpage">
<jsp:include page="../../../header_after.jsp"></jsp:include>
<!-- ===================== START OF subnav =====================-->
	<div class="subnav">
		<div class="subnav_select_calendar subnav_select"></div>
			<div class="subnav_menu">
				<a href ="/mypage/my_message">쪽지</a>
				<a href ="/mypage/calender">캘린더</a>
				<a href ="/mypage/game/my_game_list">나의 게임관리</a>
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
	
<!-- ===================== START OF 쪽지함list =====================-->
		<div class="calendar_back"></div>
		<div class= calendar_table>
			
			<!-- 캘린더 불러오기  -->
			<div id='calendar'></div>
		</div>
</div>
<jsp:include page="../../../footer.jsp"></jsp:include>
</body>
</html>