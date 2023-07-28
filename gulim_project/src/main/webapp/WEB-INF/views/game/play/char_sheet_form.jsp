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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){

	$("#char_sheet_form").submit(() => {
		var char_propensity = $("#propensity_1").val() +" "+ $("#propensity_2").val();

		$("#char_propensity").val(char_propensity);

		var char_etc = $("#etc1") +"\n"+ $("#etc2") +"\n"+ $("#etc3") +"\n"+ $("#etc4");

		$("#char_etc").val(char_etc);
	});
	
}); // end of $
</script>

</head>
<body>
<div class="loginmain_wallpaper">
<jsp:include page="../../../../header_after.jsp"></jsp:include>
<div class="char_sheet_form">
	<form action="" id="char_sheet_form">
	<input type="hidden" name="char_propensity" id="char_propensity">
	<input type="hidden" name="char_etc" id="char_etc">
	<input type="hidden" name="room_num" value="${room_num}">
	
		<input class= "char_name" type="text" placeholder="캐릭터 이름" name="char_name">
		<input class="char_class" type="text" placeholder="클래스" name="char_class">
		<input class="species" type="text" placeholder="종족" name="species">
		<select class="propensity_1" id="propensity_1">
			<option>질서</option>
			<option>중립</option>
			<option>혼돈</option>
		</select>
		<select class="propensity_2" id="propensity_2">
			<option>선</option>
			<option>중립</option>
			<option>악</option>
		</select>
		<input class="str" type="text" placeholder="근력" name="str">
		<input class="dex" type="text" placeholder="민첩" name="dex">
		<input class="con" type="text" placeholder="건강" name="con">
		<input class="intel" type="text" placeholder="지능" name="intelligence">
		<input class="wis" type="text" placeholder="지혜" name="wis">
		<input class="chr" type="text" placeholder="매력" name="chr">
		<input class="char_gold" type="text" placeholder="소지금" name="money">
		<!-- <textarea class="char_skill" placeholder="기술&주문" name=""></textarea> -->
		<div class="skilldiv">
			<label for="skill_name">기술명 : </label><input name="skill_name"></br>
			<label for="skill_detail">기술 상세 : </label><input name="skill_detail" class= "skillpadding"></br>
			<label for="skill_name">기술명 : </label><input name="skill_name"></br>
			<label for="skill_detail">기술 상세 : </label><input name="skill_detail" class= "skillpadding"></br>
			<label for="skill_name">기술명 : </label><input name="skill_name"></br>
			<label for="skill_detail">기술 상세 : </label><input name="skill_detail" class= "skillpadding"></br>
			<label for="skill_name">기술명 : </label><input name="skill_name"></br>
			<label for="skill_detail">기술 상세 : </label><input name="skill_detail" class= "skillpadding"></br>
			<label for="skill_name">기술명 : </label><input name="skill_name"></br>
			<label for="skill_detail">기술 상세 : </label><input name="skill_detail" class= "skillpadding"></br>
		</div>
		<!-- <textarea class="char_inven" placeholder="장비&인벤토리" name=""></textarea> -->
		<table class= "itemtable">
			<tr>
				<td class="tdname">이름</td>
				<td colspan="2" class="tdname_input">
					<input type="text" name="item_name" class= "item_name">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input type="number" name="item_amount" class= "item_amount">
				</td>
				<td class="tdkg">무게</td>
				<td class="tdkg_input">
					<input type="number" name="item_weight" class= "item_weight">
				</td>
				<td class="tdkg">kg</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="item_detail" class= "item_detail">
				</td>
				<td colspan="2" class="tdselect">
					<select name="equip_state" class="tdselect_select">
						<option value=1>장착중</option>
						<option value=0>미장착</option>
					</select>
				</td>
			</tr>
		</table>
			<table class= "itemtable">
			<tr>
				<td class="tdname">이름</td>
				<td colspan="2" class="tdname_input">
					<input type="text" name="item_name" class= "item_name">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input type="number" name="item_amount" class= "item_amount">
				</td>
				<td class="tdkg">무게</td>
				<td class="tdkg_input">
					<input type="number" name="item_weight" class= "item_weight">
				</td>
				<td class="tdkg">kg</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="item_detail" class= "item_detail">
				</td>
				<td colspan="2" class="tdselect">
					<select name="equip_state" class="tdselect_select">
						<option value=1>장착중</option>
						<option value=0>미장착</option>
					</select>
				</td>
			</tr>
		</table>
			<table class= "itemtable">
			<tr>
				<td class="tdname">이름</td>
				<td colspan="2" class="tdname_input">
					<input type="text" name="item_name" class= "item_name">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input type="number" name="item_amount" class= "item_amount">
				</td>
				<td class="tdkg">무게</td>
				<td class="tdkg_input">
					<input type="number" name="item_weight" class= "item_weight">
				</td>
				<td class="tdkg">kg</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="item_detail" class= "item_detail">
				</td>
				<td colspan="2" class="tdselect">
					<select name="equip_state" class="tdselect_select">
						<option value=1>장착중</option>
						<option value=0>미장착</option>
					</select>
				</td>
			</tr>
		</table>
			<table class= "itemtable" >
			<tr>
				<td class="tdname">이름</td>
				<td colspan="2" class="tdname_input">
					<input type="text" name="item_name" class= "item_name">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input type="number" name="item_amount" class= "item_amount">
				</td>
				<td class="tdkg">무게</td>
				<td class="tdkg_input">
					<input type="number" name="item_weight" class= "item_weight">
				</td>
				<td class="tdkg">kg</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="item_detail" class= "item_detail">
				</td>
				<td colspan="2" class="tdselect">
					<select name="equip_state" class="tdselect_select">
						<option value=1>장착중</option>
						<option value=0>미장착</option>
					</select>
				</td>
			</tr>
		</table>
			<table class= "itemtable">
			<tr>
				<td class="tdname">이름</td>
				<td colspan="2" class="tdname_input">
					<input type="text" name="item_name" class= "item_name">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input type="number" name="item_amount" class= "item_amount">
				</td>
				<td class="tdkg">무게</td>
				<td class="tdkg_input">
					<input type="number" name="item_weight" class= "item_weight">
				</td>
				<td class="tdkg">kg</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="item_detail" class= "item_detail">
				</td>
				<td colspan="2" class="tdselect">
					<select name="equip_state" class="tdselect_select">
						<option value=1>장착중</option>
						<option value=0>미장착</option>
					</select>
				</td>
			</tr>
		</table>
			<table class= "itemtable">
			<tr>
				<td class="tdname">이름</td>
				<td colspan="2" class="tdname_input">
					<input type="text" name="item_name" class= "item_name">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input type="number" name="item_amount" class= "item_amount">
				</td>
				<td class="tdkg">무게</td>
				<td class="tdkg_input">
					<input type="number" name="item_weight" class= "item_weight">
				</td>
				<td class="tdkg">kg</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="item_detail" class= "item_detail">
				</td>
				<td colspan="2" class="tdselect">
					<select name="equip_state" class="tdselect_select">
						<option value=1>장착중</option>
						<option value=0>미장착</option>
					</select>
				</td>
			</tr>
		</table>
		<textarea class="etc1" placeholder="인격특성" id="etc1"></textarea>
		<textarea class="etc2" placeholder="이상" id="etc2"></textarea>
		<textarea class="etc3" placeholder="유대" id="etc3"></textarea>
		<textarea class="etc4" placeholder="단점" id="etc4"></textarea>
		<textarea class="explain" placeholder="특징 및 설명" name="char_explain"></textarea>
		<button class="charbtn" type="submit">제출</button>
	</form>
</div>
</div>
<jsp:include page="../../../../footer.jsp"></jsp:include>

</body>
</html>