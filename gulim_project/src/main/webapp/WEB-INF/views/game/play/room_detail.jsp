<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굴림</title>
<script type="text/javascript">

const joinRoom = (room_num) => {
	location.href = "/game/play/char_sheet_form?room_num="+room_num;
}

</script>
</head>
<body>

<jsp:include page="../../../../header_after.jsp"></jsp:include>
<div class="gamebackpage">
	<div class="detailroom">
		<div class="roomname">${room.room_name}</div>
		<div class="roomimg">
			<c:if test="${room.containsKey('room_img')}">
				<img src="${room.room_img}" style="width: 400px;height:400px;"/>
			</c:if>
			<c:if test="${not room.containsKey('room_img')}">
				<img src="/files/images/no_image.jpg" />
			</c:if>
		</div>
		<h3>시나리오 줄거리</h3>
		<div>
			<span>${room.plot}</span>
		</div>
		
		<h3>시나리오 규칙</h3>
		<div>
			<span>${room.law}</span>
		</div>
		
		<h3>기타 사항</h3>
		<div>
			<span>${room.etc}</span>
		</div>
		
		<c:if test="${!room.containsKey('join')}">
			<button class= "joinRoom" onclick="joinRoom(${room.room_num})" style="background: #FD786A;">방 참가하기</button>
		</c:if>
		<c:if test="${room.containsKey('join')}">
			<button class= "joinRoom" onclick="joinRoom(${room.room_num})" disabled>이미 참가한 방</button>
		</c:if>
	
	</div>
</div>
<jsp:include page="../../../../footer.jsp"></jsp:include>
</body>
</html>