<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<!-- fullcalendar CDN -->
 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2"></script>
<script src="https://unpkg.com/tippy.js@6"></script>
<script type="text/javascript">

/* 캘린더 설정 */
document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
          
          /* 날짜 선택가능 */
          ,selectable: true
          
          /* 한글패치*/
          ,locale: 'kr'
          
          /* 캘린더 스크롤 */
          ,Boolean, default: true
          
          /* date 높이? */
          ,contentHeight: 600
          
          /* 날짜옆에 '일' 글자 없애기 */
		  ,dayCellContent: function(info){
		  		var number = document.createElement("a");
		  		number.classList.add("fc-daygrid-day-number");
		  		number.innerHTML = info.dayNumberText.replace("일",'');
		  		if(info.view.type === "dayGridMonth"){
		  		return{html: number.outerHTML};
		  		}return{domNodes:[]};}
		  
		  /* 툴팁 생성 */ 
		   ,eventDidMount: function(info){
		   tippy(info.el,{
		   content:info.event._def.title,
		   placement:"bottom",
		   offset:[0,0],
		   interactive:true,})}      
          
          /* 일정 json으로 받기 description은 안됨 */
		    ,eventColor: 'green',
		    events: [
		      {
		        title: 'Lunch',
		        description: '툴팁뜬당',
		        start: '2023-06-12T12:00:00'
		      },
		      {
		        title: 'Meeting',
		        start: '2023-06-12T14:30:00'
		      },
		      {
		        title: 'Birthday Party',
		        url: 'http://google.com/',
		        start: '2023-06-13T07:00:00'
		      }
		    ]
		    
		   /* 날짜 클릭 이벤트 */
		   ,dateClick: function (info) {
          
           /* sweet alert2로 시간 받기 */
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
				      if (value != null) {
				        resolve()
				      } else {
				        resolve('You need to select oranges :)')
				      }
				    })
				  }
				})
				 /* 시간 선택 시 일정명 입력 */
				if (time) {
						
					(async () => {
				    const { value: schedule } = await Swal.fire({
				        title: '약속을 뭐라고 저장할까요?',
				        input: 'text',
				        inputPlaceholder: '이름을 입력..'
				    })
				
				    // 이후 처리되는 내용.
				    if (schedule) {
				        Swal.fire(schedule)     /* 이벤트 발생 + DB에 저장 + 창 다시 띄우기 */
				    }
				})()
						
				}
				
				})()
  
  

		  			
  			
 		 } /* END OF dateClick */
        });
       
       /* 캘린더 오픈 */
        calendar.render();
      });
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