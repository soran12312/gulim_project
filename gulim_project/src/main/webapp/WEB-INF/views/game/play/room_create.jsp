<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굴림</title>
<!-- 소스 다운 -->
<script src="https://unpkg.com/@yaireo/tagify"></script>
<!-- 폴리필 (구버젼 브라우저 지원) -->
<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){

	// tagify
	const input = document.querySelector('input[name=hashtag]');
    let tagify = new Tagify(input, {
    	maxTags: 5,
    	originalInputValueFormat: valuesArr => valuesArr.map(item => item.value).join(',') // form으로 보낼 태그값들을 구분자를 ','로 하여 묶어서 보냄
    }); // initialize Tagify
    
}); // end of $

// 관전허가 체크박스 클릭 시 value 변경
const watchingValue = () => {
	console.log("click");
	
	$("#watching").val($("#watching").prop("checked") ? 0 : 1);
}

// 이미지 선택 시 미리보기 출력
function previewImage(event) {
	const fileInput = event.target;
	const previewImage = document.getElementById('preview');

	if (fileInput.files && fileInput.files[0]) {
	    const reader = new FileReader();

		reader.onload = function(e) {
		    previewImage.src = e.target.result;
		    previewImage.style.display = 'block'; // 미리보기 이미지를 보이도록 설정
		};

	    reader.readAsDataURL(fileInput.files[0]);
	} else {
	    previewImage.src = '#';
	    previewImage.style.display = 'none'; // 미리보기 이미지를 숨기도록 설정
	}
}

</script>
</head>
<body>
<div class="mypagebackpage">
<jsp:include page="../../../../header_after.jsp"></jsp:include>
	<div class = "createRoomdiv">
		<form action="/game/play/room_insert" method="post" enctype="multipart/form-data">
			<input type="text" placeholder="게임이름" name="room_name" class="room_name">
			<table class = "createRoomtable">
				<tr>
					<td rowspan="4">
						<img id="preview" alt="미리보기" style="display: none; max-width: 200px; max-height: 200px;">
						<input name="room_img" type="file" accept="image/*" onchange="previewImage(event)">					
					</td>
					<td class="room_human">
						<span>최대 방 인원수</span>
						<select name="max_member">
							<c:forEach begin="1" end="5" var="i">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select>
					</td>
					<td class="room_videocheck">
						<div>화상채팅</div>  
						<span>필수</span>
						<input type="radio" name="video" value="0">
						<span>선택</span>
						<input type="radio" name="video" value="1">
					</td>
				</tr>
				<tr>
					<td rowspan="1" class = "show_room">관전허가 <input type="checkbox" name="watching" onclick="watchingValue()" id="watching">
					</td>
					<td class="creat_period">
						<div>예상 플레이 기간</div>
						<input type="number" min="1" name="period">주
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="hashtag" class="hashtag" id="hashtag" placeholder="태그입력 후 엔터(5개까지 입력 가능)"></td>
				</tr>
				<tr></tr>
				<tr>
					<td colspan="3" class="content_label">시나리오 줄거리</td>
				</tr>
				<tr>
					<td colspan="3"><textarea name="plot" placeholder="줄거리를 써 주세요" rows="4" cols="80"></textarea></td>
				</tr>
				<tr>
					<td colspan="3">시나리오 규칙</td>
				</tr>
				<tr>
					<td colspan="3"><textarea name="law" placeholder="규칙를 써 주세요" rows="4" cols="80"></textarea></td>
				</tr>
				<tr>
					<td colspan="3">기타사항</td>
				</tr>
				<tr>
					<td colspan="3"><textarea name="etc" placeholder="기타사항을 써 주세요" rows="4" cols="80"></textarea></td>
				</tr>
				<tr>
					<td>
						<button type="submit" class="creatRoom_btn">방 생성하기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

</div>
<jsp:include page="../../../../footer.jsp"></jsp:include>
</body>
</html>