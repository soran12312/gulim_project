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

		var char_etc = "인격특성 : "+$("#etc1").val() +"\n이상 : "+ $("#etc2").val() +"\n유대 : "+ $("#etc3").val() +"\n단점 : "+ $("#etc4").val();

		$("#char_etc").val(char_etc);
	});
	
}); // end of $
</script>

</head>
<body>
<div class="loginmain_wallpaper">
<jsp:include page="../../../../header_after.jsp"></jsp:include>
<div class="char_sheet_form">
	<form action="/game/play/insertJoin" id="char_sheet_form">
	<input type="hidden" name="char_propensity" id="char_propensity">
	<input type="hidden" name="char_etc" id="char_etc">
	<input type="hidden" name="room_num" value="${room_num}">
	
		<input class= "char_name" type="text" placeholder="캐릭터 이름" name="char_name" required>
		<input class="char_class" type="text" placeholder="클래스" name="char_class" required>
		<input class="species" type="text" placeholder="종족" name="species" required>
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
		<input class="str" type="number" placeholder="근력" name="str" required>
		<input class="dex" type="number" placeholder="민첩" name="dex" required>
		<input class="con" type="number" placeholder="건강" name="con" required>
		<input class="intel" type="number" placeholder="지능" name="intelligence" required>
		<input class="wis" type="number" placeholder="지혜" name="wis" required>
		<input class="chr" type="number" placeholder="매력" name="chr" required>
		<input class="char_gold" type="number" placeholder="소지금" name="money" required>
		<div class="skilldiv">
			<label for="skill_name">기술명 : </label><input name="skills[0].skill_name"></br>
			<label for="skill_detail">기술 상세 : </label><input name="skills[0].skill_detail" class= "skillpadding"></br>
			<label for="skill_name">기술명 : </label><input name="skills[1].skill_name"></br>
			<label for="skill_detail">기술 상세 : </label><input name="skills[1].skill_detail" class= "skillpadding"></br>
			<label for="skill_name">기술명 : </label><input name="skills[2].skill_name"></br>
			<label for="skill_detail">기술 상세 : </label><input name="skills[2].skill_detail" class= "skillpadding"></br>
			<label for="skill_name">기술명 : </label><input name="skills[3].skill_name"></br>
			<label for="skill_detail">기술 상세 : </label><input name="skills[3].skill_detail" class= "skillpadding"></br>
			<label for="skill_name">기술명 : </label><input name="skills[4].skill_name"></br>
			<label for="skill_detail">기술 상세 : </label><input name="skills[4].skill_detail" class= "skillpadding"></br>
		</div>
		<table class= "itemtable">
			<tr>
				<td class="tdname">이름</td>
				<td colspan="2" class="tdname_input">
					<input type="text" name="items[0].item_name" class= "item_name">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input min="1" type="number" name="items[0].item_amount" class= "item_amount">
				</td>
				<td class="tdkg">무게</td>
				<td colspan="2" class="tdkg_input">
					<input min="1" type="number" name="items[0].item_weight" class= "item_weight">
				</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="items[0].item_detail" class= "item_detail">
				</td>
				<td colspan="2" class="tdselect">
					<select name="items[0].equip_state" class="tdselect_select">
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
					<input type="text" name="items[1].item_name" class= "item_name">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input min="1" type="number" name="items[1].item_amount" class= "item_amount">
				</td>
				<td class="tdkg">무게</td>
				<td colspan="2" class="tdkg_input">
					<input min="1" type="number" name="items[1].item_weight" class= "item_weight">
				</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="items[1].item_detail" class= "item_detail">
				</td>
				<td colspan="2" class="tdselect">
					<select name="items[1].equip_state" class="tdselect_select">
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
					<input type="text" name="items[2].item_name" class= "item_name">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input min="1" type="number" name="items[2].item_amount" class= "item_amount">
				</td>
				<td class="tdkg">무게</td>
				<td colspan="2" class="tdkg_input">
					<input min="1" type="number" name="items[2].item_weight" class= "item_weight">
				</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="items[2].item_detail" class= "item_detail">
				</td>
				<td colspan="2" class="tdselect">
					<select name="items[2].equip_state" class="tdselect_select">
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
					<input type="text" name="items[3].item_name" class= "item_name">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input min="1" type="number" name="items[3].item_amount" class= "item_amount">
				</td>
				<td class="tdkg">무게</td>
				<td colspan="2" class="tdkg_input">
					<input min="1" type="number" name="items[3].item_weight" class= "item_weight">
				</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="items[3].item_detail" class= "item_detail">
				</td>
				<td colspan="2" class="tdselect">
					<select name="items[3].equip_state" class="tdselect_select">
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
					<input type="text" name="items[4].item_name" class= "item_name">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input min="1" type="number" name="items[4].item_amount" class= "item_amount">
				</td>
				<td colspan="2" class="tdkg">무게</td>
				<td class="tdkg_input">
					<input min="1" type="number" name="items[4].item_weight" class= "item_weight">
				</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="items[4].item_detail" class= "item_detail">
				</td>
				<td colspan="2" class="tdselect">
					<select name="items[4].equip_state" class="tdselect_select">
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
					<input type="text" name="items[5].item_name" class= "item_name">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input min="1" type="number" name="items[5].item_amount" class= "item_amount">
				</td>
				<td class="tdkg">무게</td>
				<td colspan="2" class="tdkg_input">
					<input min="1" type="number" name="items[5].item_weight" class= "item_weight">
				</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="items[5].item_detail" class= "item_detail">
				</td>
				<td colspan="2" class="tdselect">
					<select name="items[5].equip_state" class="tdselect_select">
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