<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="initial-scale=1, width=device-width" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>


<style>
.child {
	top: 0;
	left: -23px;
	background-color: var(--color-gainsboro);
	width: 1463px;
	height: 87px;
}

.child, .div1, .item {
	position: absolute;
}

.div1 {
	top: 27px;
	left: 798px;
	display: inline-block;
	width: 590px;
	height: 33px;
}

.item {
	top: 246px;
	left: 206px;
	border-radius: 79px;
	background-color: var(--color-gainsboro);
	width: 1027px;
	height: 697px;
}

.inner, .text-editer {
	position: absolute;
	top: 346px;
	left: 293px;
}

.inner {
	top: 188.5px;
	left: 14.5px;
	border-top: 1px solid var(--color-black);
	box-sizing: border-box;
	width: 1452px;
	height: 1px;
}

.div2, .div3, .div4 {
	position: absolute;
	top: 124px;
}

.div2 {
	left: calc(50% + 500px);
}

.div3, .div4 {
	left: calc(50% + 306px);
}

.div4 {
	left: calc(50% + 127px);
}

.div5 {
	top: 124px;
	left: calc(50% - 32px);
}

.div5, .div6, .icon {
	position: absolute;
}

.icon {
	top: 857px;
	left: 998px;
	border-radius: 12px;
	width: 153px;
	height: 49px;
}

.div6 {
	top: 867px;
	left: 1005px;
	color: var(--color-white);
}

.div {
	position: relative;
	background-color: var(--color-white);
	width: 100%;
	height: 1024px;
	overflow: hidden;
	text-align: left;
	font-size: var(--font-size-5xl);
	color: var(--color-black);
	font-family: var(--font-inter);
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../../../../header_before.jsp"></jsp:include>
	</header>

	<div class="div">
		<div class="child"></div>
		<div class="div2">공지사항</div>
		<div class="div3">공모전게시판</div>
		<div class="div4">이벤트게시판</div>
		<div class="div5">자유게시판</div>
		<div class="inner"></div>

		<div class="item"></div>
		
		<div class="text-editer">
			 <textarea id="summernote" class="summernote" placeholder="내용을 입력해주세요"></textarea></br>
                    <textarea id="detail" name="detail" style="display: none;"></textarea>
                    
		</div>

		<div class="inner"></div>


		<div class="div6">
			<button>게시글 올리기</button>
		</div>
	</div>

	<script>
		$('.summernote').summernote({
			height : 150,
			lang : "ko-KR",
			toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	  
		});
	</script>
</body>


<footer>
	<jsp:include page="../../../../footer.jsp"></jsp:include>
</footer>
</html>
