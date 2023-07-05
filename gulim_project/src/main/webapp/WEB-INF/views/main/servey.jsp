<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굴림</title>
<link href="/css/main.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	// 제출버튼 클릭 시 이용자가 작성한 내용이 없거나 내용이 공백인 input태그의 value를 "없음"으로 입력
	const setDefaultValue = () => {
		
		var defaultValue = "없음";

		for (var i = 1; i <= 7; i++) {
	        var inputId = "#input" + i;
	        var inputValue = $(inputId).val().trim();

	        if (inputValue === "") {
	          $(inputId).val(defaultValue);
			}
		}
	}

	// 제출버튼 클릭 시
	$("#servey_form").submit(setDefaultValue);
	
}); // end of $
</script>
</head>
<body>
<jsp:include page="../../../header_before.jsp"></jsp:include>

<div>
	<div class="fs_30 pt_30">
		TRPG 플레이 경험이 있으신가요?<br/>이 설문이 향후 당신에게 많은 도움이 됩니다.
	</div>

	<div class="pt_30">
		<!-- 설문조사 form -->
		<form action="/main/servey_insert" class="fs_25" method="post" id="servey_form">
		
			<input type="hidden" name="id" id="id" value="${id}">
			
			<table class="regist_form">
				<tr class="h_50">
					<td class="ta_c">
						<label for="play_rull">플레이 해본 룰 북</label>
					</td>
					<td class="ta_l">
						<input type="text" id="input1" name="play_rull" class="fill">
					</td>
					<td class="ta_c">
						<label for="play_genre">플레이 해본 장르</label>
					</td>
					<td class="ta_l">
						<input type="text" id="input2" name="play_genre" class="fill">
					</td>
				</tr>
				<tr class="h_50">
					<td class="ta_c">
						<label for="play_period">플레이 기간</label>
					</td>
					<td class="ta_l">
						<input type="text" name="play_period" id="input3" class="fill">
					</td>
					<td class="ta_c">
						<label for="play_species">플레이 한 종족</label>
					</td>
					<td class="ta_l">
						<input type="text" class="fill" id="input4" name="play_species">
					</td>
				</tr>
				<tr class="h_50">
					<td class="ta_c">
						<label for="master">게임 마스터 경험횟수</label>
					</td>
					<td class="ta_l">
						<input type="number" min="0" class="fill" name="master" id="master" value="0" required>
					</td>
					<td class="ta_c">
						<label for="want_genre">플레이 하고싶은 장르</label>
					</td>
					<td class="ta_l">
						<input type="text" class="fill" id="input5" name="want_genre">
					</td>
				</tr>
				<tr class="h_50">
					<td class="ta_c">
						<label for="play_class">플레이 해본 직업</label>
					</td>
					<td class="ta_l">
						<input type="text" class="fill" id="input6" name="play_class">
					</td>
					<td class="ta_c">
						<label for="other_site">다른 사이트 이용 경험</label>
					</td>
					<td class="ta_l">
						<input type="text" class="fill" id="input7" name="other_site">
					</td>
				</tr>
				<tr>
					<td colspan="5" class="ta_r">
						<button type="submit">제출</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<jsp:include page="../../../footer.jsp"></jsp:include>
</body>
</html>