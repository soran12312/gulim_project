<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>



<style>

	
</style>




<script type="text/javascript">
$(document).ready(function(){
		$('.salemainBook').click(function(){
			location.href="/sale/book/book_list";
		});
		
		$('.salemaincoupon').click(function(){
			location.href="./subscribe";
		});
});

</script>
</head>
<body>
<jsp:include page="../../../header_after.jsp"></jsp:include>

	<div class= "mainbackpage" >
		<div class="salemaindiv">
			<button class="salemainBook">설정집<br/>구매</button>
			<button class="salemaincoupon">구독권<br/>구매</button>
		</div>
	</div>



</body>
<footer>
	<jsp:include page="../../../footer.jsp"></jsp:include>
</footer>
</html>