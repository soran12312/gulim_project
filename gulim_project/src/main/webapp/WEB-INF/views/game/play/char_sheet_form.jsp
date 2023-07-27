<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.char_sheet_form{
	background-image:url("/files/images/wallpaper/char_sheet.jpg");
	background-size: cover;
	width: 900px;
	height: 1100px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 70px;
}
</style>

</head>
<body>
<div class="loginmain_wallpaper">
<jsp:include page="../../../../header_after.jsp"></jsp:include>
<div class="char_sheet_form">
	<form action="">
	<input type="hidden" name="char_propensity">
	
		<input type="text" placeholder="캐릭터 이름" name="char_name">
		<input type="text" placeholder="클래스" name="char_class">
		<input type="text" placeholder="종족" name="species">
		<select id="propensity_1">
			<option>질서</option>
			<option>중립</option>
			<option>혼돈</option>
		</select>
		<select id="propensity_2">
			<option>선</option>
			<option>중립</option>
			<option>악</option>
		</select>
		<input type="text" placeholder="근력">
		<input type="text" placeholder="민첩">
		<input type="text" placeholder="건강">
		<input type="text" placeholder="지능">
		<input type="text" placeholder="지혜">
		<input type="text" placeholder="매력">
		<input type="text" placeholder="소지금">
		<textarea placeholder="기술&주문"></textarea>
		<textarea placeholder="장비&인벤토리"></textarea>
		<textarea placeholder="인격특성"></textarea>
		<textarea placeholder="이상"></textarea>
		<textarea placeholder="유대"></textarea>
		<textarea placeholder="단점"></textarea>
		<textarea placeholder="특징 및 설명"></textarea>
		<button type="submit">제출</button>
	</form>
</div>
</div>
<jsp:include page="../../../../footer.jsp"></jsp:include>

</body>
</html>