<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>캐릭터시트리스트</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
<div class="send_message_backpage">
	<div class="sheet_list">
		<table>
		<c:forEach items="${join}" var="join">
			<tr><td>
			<a class="no_a_st2 fs15" href="/mypage/game/char_sheet_confirm?join_num=${join.join_num}">
			${join.char_propensity} ${join.species} ${join.char_class} ${join.char_name} (${join.id})</a></td></tr>
		</c:forEach>
		</table>
	</div>
</div>
</body>
</html>