<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설정집 판매</title>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
    <link href="/css/place.css" rel="stylesheet"/>

</head>
<jsp:include page="../../../../header_after.jsp"></jsp:include>
<body>
<div class="bookpage">
    

    <iframe src="https://192.168.0.68:3000/sales/${id}" style="height: 1800px; width: 100%; border: none;"></iframe>
    
</div>
</body>
	<jsp:include page="../../../../footer.jsp"></jsp:include>
</html>