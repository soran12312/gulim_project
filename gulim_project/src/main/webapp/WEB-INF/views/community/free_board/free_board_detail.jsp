<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>

<title>자유게시판/글상세</title>
<meta charset="utf-8" />
<meta name="viewport" content="initial-scale=1, width=device-width" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">

<style>
.form-control {
	color: rgb(69, 76, 84);
	border-width: 2px;
	border-color: rgb(189, 195, 199);
	border-radius: 2px;
	box-shadow: none;
}

.form-control:focus {
	border-color: rgb(22, 160, 133);
	outline: 0px none;
	box-shadow: none;
}

.note-editor {
	border: 1px solid rgb(169, 169, 169);
}

.note-editor .note-dropzone {
	position: absolute;
	z-index: 1;
	display: none;
	color: rgb(135, 206, 250);
	background-color: white;
	border: 2px dashed rgb(135, 206, 250);
	opacity: 0.95;
}

.note-editor .note-dropzone .note-dropzone-message {
	display: table-cell;
	font-size: 28px;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
}

.note-editor .note-toolbar {
	padding-bottom: 5px;
	padding-left: 5px;
	margin: 0px;
	background-color: rgb(245, 245, 245);
	border-bottom: 1px solid rgb(169, 169, 169);
}

.note-editor .note-toolbar>.btn-group {
	margin-top: 5px;
	margin-right: 5px;
	margin-left: 0px;
}

.note-editor .note-toolbar .note-table .dropdown-menu {
	min-width: 0px;
	padding: 5px;
}

.note-editor .note-toolbar .note-table .dropdown-menu .note-dimension-picker
	{
	font-size: 18px;
}

.note-editor .note-toolbar .note-table .dropdown-menu .note-dimension-picker .note-dimension-picker-mousecatcher
	{
	position: absolute ! important;
	z-index: 3;
	width: 10em;
	height: 10em;
	cursor: pointer;
}

.note-editor .note-toolbar .note-table .dropdown-menu .note-dimension-picker .note-dimension-picker-unhighlighted
	{
	position: relative ! important;
	z-index: 1;
	width: 5em;
	height: 5em;
	background: url('undefined') repeat scroll 0% 0% transparent;
}

.note-editor .note-toolbar .note-table .dropdown-menu .note-dimension-picker .note-dimension-picker-highlighted
	{
	position: absolute ! important;
	z-index: 2;
	width: 1em;
	height: 1em;
	background: url('undefined') repeat scroll 0% 0% transparent;
}

.note-editor .note-toolbar .note-style h1, .note-editor .note-toolbar .note-style h2,
	.note-editor .note-toolbar .note-style h3, .note-editor .note-toolbar .note-style h4,
	.note-editor .note-toolbar .note-style h5, .note-editor .note-toolbar .note-style h6,
	.note-editor .note-toolbar .note-style blockquote {
	margin: 0px;
}

.note-editor .note-toolbar .note-color .dropdown-toggle {
	width: 20px;
	padding-left: 5px;
}

.note-editor .note-toolbar .note-color .dropdown-menu {
	min-width: 290px;
}

.note-editor .note-toolbar .note-color .dropdown-menu .btn-group {
	margin: 0px;
}

.note-editor .note-toolbar .note-color .dropdown-menu .btn-group:first-child
	{
	margin: 0px 5px;
}

.note-editor .note-toolbar .note-color .dropdown-menu .btn-group .note-palette-title
	{
	margin: 2px 7px;
	font-size: 12px;
	text-align: center;
	border-bottom: 1px solid rgb(238, 238, 238);
}

.note-editor .note-toolbar .note-color .dropdown-menu .btn-group .note-color-reset
	{
	padding: 0px 3px;
	margin: 5px;
	font-size: 12px;
	cursor: pointer;
	border-radius: 5px;
}

.note-editor .note-toolbar .note-color .dropdown-menu .btn-group .note-color-reset:hover
	{
	background: none repeat scroll 0% 0% rgb(238, 238, 238);
}

.note-editor .note-toolbar .note-para .dropdown-menu {
	min-width: 216px;
	padding: 5px;
}

.note-editor .note-toolbar .note-para .dropdown-menu>div:first-child {
	margin-right: 5px;
}

.note-editor .note-statusbar {
	background-color: rgb(245, 245, 245);
}

.note-editor .note-statusbar .note-resizebar {
	width: 100%;
	height: 8px;
	cursor: s-resize;
	border-top: 1px solid rgb(169, 169, 169);
}

.note-editor .note-statusbar .note-resizebar .note-icon-bar {
	width: 20px;
	margin: 1px auto;
	border-top: 1px solid rgb(169, 169, 169);
}

.note-editor .note-popover .popover {
	max-width: none;
}

.note-editor .note-popover .popover .popover-content {
	padding: 5px;
}

.note-editor .note-popover .popover .popover-content a {
	display: inline-block;
	max-width: 200px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	vertical-align: middle;
}

.note-editor .note-popover .popover .popover-content .btn-group+.btn-group
	{
	margin-left: 5px;
}

.note-editor .note-popover .popover .arrow {
	left: 20px;
}

.note-editor .note-handle .note-control-selection {
	position: absolute;
	display: none;
	border: 1px solid black;
}

.note-editor .note-handle .note-control-selection>div {
	position: absolute;
}

.note-editor .note-handle .note-control-selection .note-control-selection-bg
	{
	width: 100%;
	height: 100%;
	background-color: black;
	opacity: 0.3;
}

.note-editor .note-handle .note-control-selection .note-control-holder {
	width: 7px;
	height: 7px;
	border: 1px solid black;
}

.note-editor .note-handle .note-control-selection .note-control-sizing {
	width: 7px;
	height: 7px;
	background-color: white;
	border: 1px solid black;
}

.note-editor .note-handle .note-control-selection .note-control-nw {
	top: -5px;
	left: -5px;
	border-right: 0px none;
	border-bottom: 0px none;
}

.note-editor .note-handle .note-control-selection .note-control-ne {
	top: -5px;
	right: -5px;
	border-bottom: 0px none;
	border-left: medium none;
}

.note-editor .note-handle .note-control-selection .note-control-sw {
	bottom: -5px;
	left: -5px;
	border-top: 0px none;
	border-right: 0px none;
}

.note-editor .note-handle .note-control-selection .note-control-se {
	right: -5px;
	bottom: -5px;
	cursor: se-resize;
}

.note-editor .note-handle .note-control-selection .note-control-selection-info
	{
	right: 0px;
	bottom: 0px;
	padding: 5px;
	margin: 5px;
	font-size: 12px;
	color: white;
	background-color: black;
	border-radius: 5px;
	opacity: 0.7;
}

.note-editor .note-dialog>div {
	display: none;
}

.note-editor .note-dialog .note-help-dialog {
	font-size: 12px;
	color: #666666;
	background-image: none;
	background-repeat: repeat;
	background-attachment: scroll;
	background-position: 0% 0%;
	background-clip: border-box;
	background-origin: padding-box;
	background-size: auto auto;
	border: 0px none;
	opacity: 0.9;
}

.note-editor .note-dialog .note-help-dialog .modal-content {
	background-color: #ffffff ! important;
	background: none repeat scroll 0% 0% transparent;
	border: 1px solid #777777;
	border-radius: 5px;
	box-shadow: none;
}

.note-editor .note-dialog .note-help-dialog a {
	font-size: 12px;
	color: #777777;
}

.note-editor .note-dialog .note-help-dialog .title {
	padding-bottom: 5px;
	font-size: 14px;
	font-weight: bold;
	color: #777777;
	border-bottom: 1px solid #777777;
}

.note-editor .note-dialog .note-help-dialog .modal-close {
	font-size: 14px;
	color: #222222;
	cursor: pointer;
}

.note-editor .note-dialog .note-help-dialog .note-shortcut-layout {
	width: 100%;
}

.note-editor .note-dialog .note-help-dialog .note-shortcut-layout td {
	vertical-align: top;
}

.note-editor .note-dialog .note-help-dialog .note-shortcut {
	margin-top: 8px;
}

.note-editor .note-dialog .note-help-dialog .note-shortcut th {
	font-size: 13px;
	color: #222222;
	text-align: left;
}

.note-editor .note-dialog .note-help-dialog .note-shortcut td:first-child
	{
	min-width: 110px;
	padding-right: 10px;
	font-family: "Courier New";
	color: #222222;
	text-align: right;
}

.note-editor .note-dialog .note-help-dialog .modal-dialog .modal-content .modal-body .modal-background p,
	.note-editor .note-dialog .note-help-dialog .modal-dialog .modal-content .modal-body .modal-background p a
	{
	color: #ffffff;
}

.note-editor .note-editable {
	padding: 10px;
	overflow: auto;
	outline: 0px none;
}

.note-editor .note-codable {
	display: none;
	width: 100%;
	padding: 10px;
	margin-bottom: 0px;
	font-family: Menlo, Monaco, monospace, sans-serif;
	font-size: 14px;
	color: rgb(204, 204, 204);
	background-color: rgb(34, 34, 34);
	border: 0px none;
	border-radius: 0px;
	box-shadow: none;
	-moz-box-sizing: border-box;
	resize: none;
}

.note-editor .dropdown-menu {
	min-width: 90px;
}

.note-editor .dropdown-menu li a i {
	color: deepskyblue;
	visibility: hidden;
}

.note-editor .note-fontsize-10 {
	font-size: 10px;
}

.note-editor .note-color-palette {
	line-height: 1;
}

.note-editor .note-color-palette div .note-color-btn {
	width: 17px;
	height: 17px;
	padding: 0px;
	margin: 0px;
	border: 1px solid rgb(255, 255, 255);
}

.note-editor .note-color-palette div .note-color-btn:hover {
	border: 1px solid rgb(0, 0, 0);
}

.summernote {
	font-family: Verdana, Helvetica, Arial, sans-serif;
	line-height: 1.2;
	color: rgb(51, 51, 51);
	background-color: rgb(255, 255, 255);
	text-align: left;
	padding: 0px;
}

.summernote h1, .summernote h2, .summernote h3, .summernote h4,
	.summernote h5, .summernote h6 {
	margin: 10px 0px;
	font-family: inherit;
	font-weight: bold;
	line-height: 1.5;
	color: inherit;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../../../../header_before.jsp"></jsp:include>
	</header>

	<div class="div">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="./free_board_list">자유게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="./event_list">이벤트게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="./contest_main">공모전게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="./announce_list">공지사항</a></li>
				</ul>
			</div>
		</nav>

		
    
		<div class="container">
	    
			<div class="row">
			
		        <div class="col-lg-12">
				  
		            <div class="well">
		
		    			<form class="form-horizontal" METHOD="POST" name="example" id="edit" action="/community/freeupdate?post_num=${post.post_num}">
		
								<div class="col-sm-4">
									 <select class="form-control" name="subject">
							            <optgroup label="요청">
							                <option value="game" <c:if test="${post.subject == 'game'}">selected</c:if>>게임 개설 요청</option>
							            </optgroup>
							            <optgroup label="모집">
							                <option value="master" <c:if test="${post.subject == 'master'}">selected</c:if>>게임마스터 모집</option>
							                <option value="user" <c:if test="${post.subject == 'user'}">selected</c:if>>중간 파티원 모집</option>
							            </optgroup>
							        </select>
								</div>
								
								
								
								<div class="form-group">
									<div class="col-lg-12">
		                                <label for="title">Title</label>
		                                <input type="hidden" name="post_num" value="${post.post_num}">
									    <input type="text" class="form-control" name="post_title" placeholder="title" value="${post.post_title }">
									</div>
								</div>
		                        
								<div class="form-group">
		                            <div class="col-lg-12">
                                        <textarea class="form-control summernote" name="post_content" >${post.post_content}
	                                        <c:forEach var="image" items="${images}">
	                                        	<div class="note-editable card-block" contenteditable="true" role="textbox" aria-multiline="true" spellcheck="true" style="height: 300px;">
	                                        		<p><img src="/images/gulim/${image.origin_img_name}.png" data-filename="images.png" style="width: 168px;"></p>
	                                        	</div>
											    
											</c:forEach>
										</textarea>
		                            </div>
		                        </div>
		                        
		                        
		
		
							<c:if test="${loggedInUserId eq post.id}">
							    <button type="submit" class="btn btn-primary">수정</button>
							    <button type="button" class="btn btn-default" id="cancel" onclick="deletePost(${post.post_num})">삭제</button>
							</c:if>
							
						</form>
						
		            </div>
					
		        </div>
		        
			</div>
	    </div>
    </div>

	<script>
		$('.summernote').summernote(
		{
			height : 500,
			lang : "ko-KR",
			toolbar : [
					// [groupName, [list of button]]
					[ 'fontname', [ 'fontname' ] ],
					[ 'fontsize', [ 'fontsize' ] ],
					[
							'style',
							[ 'bold', 'italic', 'underline',
									'strikethrough', 'clear' ] ],
					[ 'color', [ 'forecolor', 'color' ] ],
					[ 'table', [ 'table' ] ],
					[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
					[ 'height', [ 'height' ] ],
					[ 'insert', [ 'picture', 'link', 'video' ] ],
					[ 'view', [ 'fullscreen', 'help' ] ] ],
			fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
					'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체',
					'바탕체' ],
			fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
					'20', '22', '24', '28', '30', '36', '50', '72' ]

		});


		$(document).ready(function() 
	    {
	        $('#summernote').summernote({height: 300, codemirror: {theme: 'monokai'}});
	    });

	    let postForm = function() {
	    	let content = $('textarea[name="content"]').html($('#summernote').code());
	    }


	    function deletePost(post_num) {
	        if (confirm("정말로 삭제하시겠습니까?")) {
	            document.getElementById("edit").action = "./freedelete?post_num=" + post_num;
	            document.getElementById("edit").submit();
	        }
	    }
					
	</script>
</body>

<footer>
	<jsp:include page="../../../../footer.jsp"></jsp:include>
</footer>

</html>
