<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="mypagebackpage">
<jsp:include page="../../../../header_after.jsp"></jsp:include>

	<table>
		<tr>
			<td><a>게임 추천</a></td>
			<td><a>생성된 방</a></td>
			<td><a>게임 지원</a></td>
		</tr>
	</table>
	
	<iframe src="https://192.168.0.68:3000/roomList" style="width: 100%;height:800px;border: none;"></iframe>

</div>
<jsp:include page="../../../../footer.jsp"></jsp:include>
</body>
</html>