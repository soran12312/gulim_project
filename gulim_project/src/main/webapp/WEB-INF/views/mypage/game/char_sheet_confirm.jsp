<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청온 캐릭터</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/images/favicon-32x32.png">
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
<!-- sweet alert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//캐릭터 이름
	var char_name = "${sheet.char_name}";
	$('.char_name').val(char_name);
	
	//캐릭터 직업
	var char_class = "${sheet.char_class}";
	$('.char_class').val(char_class);
	
	//종족
	var species = "${sheet.species}";
	$('.species').val(species);

	//성향
	var propensity = "${sheet.char_propensity}";
	propensity = propensity.split(" ");
	var propensity1 = propensity[0]
	var propensity2 = propensity[1]

	// propensity 값을 가져와서 select 요소에서 선택합니다.
	var select1 = document.getElementById("propensity_1");
	var select2 = document.getElementById("propensity_2");

	// propensity1과 일치하는 값을 선택
	for (var i = 0; i < select1.options.length; i++) {
		if (select1.options[i].value === propensity1) {
    		select1.selectedIndex = i;
    		break;
  		}
	}

	// propensity2와 일치하는 값을 선택
	for (var i = 0; i < select2.options.length; i++) {
		if (select2.options[i].value === propensity2) {
			select2.selectedIndex = i;
			break;
		}
	}

	//근력
	var str = "${sheet.str}";
	$('.str').val(str);
	//민첩
	var dex = "${sheet.dex}";
	$('.dex').val(dex);
	//건강
 	var con = "${sheet.con}";
	 $('.con').val(con);
	//지능
	var intel = "${sheet.intelligence}";
	$('.intel').val(intel);
	//지혜
	var wis = "${sheet.wis}";
	$('.wis').val(wis);
	//매력
	var chr = "${sheet.chr}";
	$('.chr').val(chr);
	//소지금
	var char_gold = "${sheet.money}";
	$('.char_gold').val(char_gold);

	//인격특성 이상 유대 단점
	var etc1 = "${etc.etc1}";
	var etc2 = "${etc.etc2}";
	var etc3 = "${etc.etc3}";
	var etc4 = "${etc.etc4}";
	$('#etc1').val(etc1);
	$('#etc2').val(etc2);
	$('#etc3').val(etc3);
	$('#etc4').val(etc4);

	//특이사항
	var explain = "${sheet.char_explain}"
	$('.explain').val(explain);

	//스킬네임
	var skill_name_1 = "${skills[0].skill_name}";
	var skill_name_2 = "${skills[1].skill_name}";
	var skill_name_3 = "${skills[2].skill_name}";
	var skill_name_4 = "${skills[3].skill_name}";
	var skill_name_5 = "${skills[4].skill_name}";

	$('.skillname1').val(skill_name_1);
	$('.skillname2').val(skill_name_2);
	$('.skillname3').val(skill_name_3);
	$('.skillname4').val(skill_name_4);
	$('.skillname5').val(skill_name_5);

	//스킬내용
	var skill_detail_1 = "${skills[0].skill_detail}";
	var skill_detail_2 = "${skills[1].skill_detail}";
	var skill_detail_3 = "${skills[2].skill_detail}";
	var skill_detail_4 = "${skills[3].skill_detail}";
	var skill_detail_5 = "${skills[4].skill_detail}";

	$('.skill_detail1').val(skill_detail_1);
	$('.skill_detail2').val(skill_detail_2);
	$('.skill_detail3').val(skill_detail_3);
	$('.skill_detail4').val(skill_detail_4);
	$('.skill_detail5').val(skill_detail_5);
	
	//아이템 이름
	var item_name_1 = "${items[0].item_name}";
	var item_name_2 = "${items[1].item_name}";
	var item_name_3 = "${items[2].item_name}";
	var item_name_4 = "${items[3].item_name}";
	var item_name_5 = "${items[4].item_name}";
	var item_name_6 = "${items[5].item_name}";
	$('.item_name_1').val(item_name_1);
	$('.item_name_2').val(item_name_2);
	$('.item_name_3').val(item_name_3);
	$('.item_name_4').val(item_name_4);
	$('.item_name_5').val(item_name_5);
	$('.item_name_6').val(item_name_6);

	//아이템 수량
	var item_amount1 = "${items[0].item_amount}";
	var item_amount2 = "${items[1].item_amount}";
	var item_amount3 = "${items[2].item_amount}";
	var item_amount4 = "${items[3].item_amount}";
	var item_amount5 = "${items[4].item_amount}";
	var item_amount6 = "${items[5].item_amount}";
	$('.item_amount1').val(item_amount1);
	$('.item_amount2').val(item_amount2);
	$('.item_amount3').val(item_amount3);
	$('.item_amount4').val(item_amount4);
	$('.item_amount5').val(item_amount5);
	$('.item_amount6').val(item_amount6);
	//아이템 무게
	var item_weight1 = "${items[0].item_weight}";
	var item_weight2 = "${items[1].item_weight}";
	var item_weight3 = "${items[2].item_weight}";
	var item_weight4 = "${items[3].item_weight}";
	var item_weight5 = "${items[4].item_weight}";
	var item_weight6 = "${items[5].item_weight}";
	$('.item_weight1').val(item_weight1);
	$('.item_weight2').val(item_weight2);
	$('.item_weight3').val(item_weight3);
	$('.item_weight4').val(item_weight4);
	$('.item_weight5').val(item_weight5);
	$('.item_weight6').val(item_weight6);
	//아이템 상세
	var item_detail1 = "${items[0].item_detail}";
	var item_detail2 = "${items[1].item_detail}";
	var item_detail3 = "${items[2].item_detail}";
	var item_detail4 = "${items[3].item_detail}";
	var item_detail5 = "${items[4].item_detail}";
	var item_detail6 = "${items[5].item_detail}";
	$('.item_detail1').val(item_detail1);
	$('.item_detail2').val(item_detail2);
	$('.item_detail3').val(item_detail3);
	$('.item_detail4').val(item_detail4);
	$('.item_detail5').val(item_detail5);
	$('.item_detail6').val(item_detail6);
	
	//장착여부
	var equip_state1 = "${items[0].equip_state}";
	console.log("aa" + equip_state1);
		if(equip_state1 === "0"){
			$('.equip_state1').prop('selectedIndex', 1);
		}
		else{
			$('.equip_state1').prop('selectedIndex', 0);
		}

	var equip_state2 = "${items[1].equip_state}";
	console.log("bb" + equip_state2);
		if(equip_state2 === "0"){
			$('.equip_state2').prop('selectedIndex', 1);
		}
		else{
			$('.equip_state2').prop('selectedIndex', 0);
		}
	
	var equip_state3 = "${items[2].equip_state}";
		if(equip_state3==="0"){
			$('.equip_state3').prop('selectedIndex', 1);
		}
		else{
			$('.equip_state3').prop('selectedIndex', 0);
		}
	
	var equip_state4 = "${items[3].equip_state}";
		if(equip_state4==="0"){
			$('.equip_state4').prop('selectedIndex', 1);
		}
		else{
			$('.equip_state4').prop('selectedIndex', 0);
		}
	
	var equip_state5 = "${items[4].equip_state}";
		if(equip_state5==="0"){
			$('.equip_state5').prop('selectedIndex', 1);
		}
		else{
			$('.equip_state5').prop('selectedIndex', 0);
		}
	
	var equip_state6 = "${items[5].equip_state}";
		if(equip_state6==="0"){
			$('.equip_state6').prop('selectedIndex', 1);
		}
		else{
			$('.equip_state6').prop('selectedIndex', 0);
		}	

//동료영입
	$('#agree').click(function(){
		swal.fire("동료로 영입한다!").then(function(){
			location.href= "/mypage/game/agree_brother?join_num=${sheet.join_num}&room_num=${sheet.room_num}";
		});
	});
//동료반환
	$('#no_agree').click(function(){
		swal.fire("동료가 될 수 없어!!").then(function(){
			var url = "/mypage/send_message?send_id=${sheet.id}";
    		var windowFeatures = 'width=420,height=520,scrollbars=no,resizable=no';
			window.open(url, '_blank', windowFeatures);
		});

	});
});
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
	
		<input class= "char_name" type="text" placeholder="캐릭터 이름" name="char_name" disabled>
		<input class="char_class" type="text" placeholder="클래스" name="char_class" disabled>
		<input class="species" type="text" placeholder="종족" name="species" disabled>
		<select class="propensity_1" id="propensity_1" disabled>
			<option value ="질서">질서</option>
			<option value ="중립">중립</option>
			<option value ="혼돈">혼돈</option>
		</select>
		<select class="propensity_2" id="propensity_2" disabled>
			<option value ="질서">선</option>
			<option value ="중립">중립</option>
			<option value ="악">악</option>
		</select>
		<input class="str fs30" type="text" placeholder="근력" name="str">
		<input class="dex fs30" type="text" placeholder="민첩" name="dex">
		<input class="con fs30" type="text" placeholder="건강" name="con">
		<input class="intel fs30" type="text" placeholder="지능" name="intelligence">
		<input class="wis fs30" type="text" placeholder="지혜" name="wis">
		<input class="chr fs30" type="text" placeholder="매력" name="chr">
		<input class="char_gold fs30" type="text" placeholder="소지금" name="money">
		<!-- <textarea class="char_skill" placeholder="기술&주문" name=""></textarea> -->
		<div class="skilldiv">
			<label for="skill_name">기술명 : </label><input class="skillname1" name="skill_name"></br>
			<label for="skill_detail">기술 상세 : </label><input name="skill_detail" class= "skillpadding skill_detail1"></br>
			<label for="skill_name">기술명 : </label><input name="skill_name"class="skillname2"></br>
			<label for="skill_detail">기술 상세 : </label><input name="skill_detail" class= "skillpadding skill_detail2"></br>
			<label for="skill_name">기술명 : </label><input name="skill_name"class="skillname3"></br>
			<label for="skill_detail">기술 상세 : </label><input name="skill_detail" class= "skillpadding skill_detail3"></br>
			<label for="skill_name">기술명 : </label><input name="skill_name"class="skillname4"></br>
			<label for="skill_detail">기술 상세 : </label><input name="skill_detail" class= "skillpadding skill_detail4"></br>
			<label for="skill_name">기술명 : </label><input name="skill_name"class="skillname5"></br>
			<label for="skill_detail">기술 상세 : </label><input name="skill_detail" class= "skillpadding skill_detail5"></br>
		</div>
		<!-- <textarea class="char_inven" placeholder="장비&인벤토리" name=""></textarea> -->
		<table class= "itemtable">
			<tr>
				<td class="tdname">이름</td>
				<td colspan="2" class="tdname_input">
					<input type="text" name="item_name" class= "item_name item_name_1">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input type="number" name="item_amount" class= "item_amount item_amount1">
				</td>
				<td class="tdkg">무게</td>
				<td class="tdkg_input">
					<input type="number" name="item_weight" class= "item_weight item_weight1">
				</td>
				<td class="tdkg">kg</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="item_detail" class= "item_detail item_detail1">
				</td>
				<td colspan="2" class="tdselect">
					<select name="equip_state" class="tdselect_select equip_state1">
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
					<input type="text" name="item_name" class= "item_name item_name_2">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input type="number" name="item_amount" class= "item_amount item_amount2">
				</td>
				<td class="tdkg">무게</td>
				<td class="tdkg_input">
					<input type="number" name="item_weight" class= "item_weight item_weight2">
				</td>
				<td class="tdkg">kg</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="item_detail" class= "item_detail item_detail2">
				</td>
				<td colspan="2" class="tdselect">
					<select name="equip_state" class="tdselect_select equip_state2">
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
					<input type="text" name="item_name" class= "item_name item_name_3">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input type="number" name="item_amount" class= "item_amount item_amount3">
				</td>
				<td class="tdkg">무게</td>
				<td class="tdkg_input">
					<input type="number" name="item_weight" class= "item_weight item_weight3">
				</td>
				<td class="tdkg">kg</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="item_detail" class= "item_detail item_detail3">
				</td>
				<td colspan="2" class="tdselect">
					<select name="equip_state" class="tdselect_select equip_state3">
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
					<input type="text" name="item_name" class= "item_name item_name_4">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input type="number" name="item_amount" class= "item_amount item_amount4">
				</td>
				<td class="tdkg">무게</td>
				<td class="tdkg_input">
					<input type="number" name="item_weight" class= "item_weight item_weight4">
				</td>
				<td class="tdkg">kg</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="item_detail" class= "item_detail item_detail4">
				</td>
				<td colspan="2" class="tdselect">
					<select name="equip_state" class="tdselect_select equip_state4">
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
					<input type="text" name="item_name" class= "item_name item_name_5">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input type="number" name="item_amount" class= "item_amount item_amount5">
				</td>
				<td class="tdkg">무게</td>
				<td class="tdkg_input">
					<input type="number" name="item_weight" class= "item_weight item_weight5">
				</td>
				<td class="tdkg">kg</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="item_detail" class= "item_detail item_detail5">
				</td>
				<td colspan="2" class="tdselect">
					<select name="equip_state" class="tdselect_select equip_state5">
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
					<input type="text" name="item_name" class= "item_name item_name_6">
				</td>
				<td class="tdcount">수량</td>
				<td class="tdcount_input">
					<input type="number" name="item_amount" class= "item_amount item_amount6">
				</td>
				<td class="tdkg">무게</td>
				<td class="tdkg_input">
					<input type="number" name="item_weight" class= "item_weight item_weight6">
				</td>
				<td class="tdkg">kg</td>
			</tr>
			<tr>
				<td colspan="1" class="tdinfo">상세</td>
				<td colspan="5" class="tdinfo_input">
					<input type="text" name="item_detail" class= "item_detail item_detail6">
				</td>
				<td colspan="2" class="tdselect">
					<select name="equip_state" class="tdselect_select equip_state6">
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
		<button class="charbtn2 fs15" type="button" id="agree">동료영입</button>
		<button class="charbtn3 fs15" type="button" id="no_agree">문전박대</button>
	</form>
</div>
</div>
<jsp:include page="../../../../footer.jsp"></jsp:include>

</body>
</html>