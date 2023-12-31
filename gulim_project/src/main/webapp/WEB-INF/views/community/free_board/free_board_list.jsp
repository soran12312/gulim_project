<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<!-- Bootstrap core CSS -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- Bootstrap core JS -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!-- Additional CSS Files -->

<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
}

section.notice {
	padding: 80px 0;
}

.page-title {
	margin-bottom: 60px;
}

.page-title h3 {
	font-size: 28px;
	color: #333333;
	font-weight: 400;
	text-align: center;
}

#board-search .search-window {
	padding: 15px 0;
	background-color: #f9f7f9;
}

#board-search .search-window .search-wrap {
	position: relative;
	/*   padding-right: 124px; */
	margin: 0 auto;
	width: 80%;
	max-width: 564px;
}

#board-search .search-window .search-wrap input {
	height: 40px;
	width: 100%;
	font-size: 14px;
	padding: 7px 14px;
	border: 1px solid #ccc;
}

#board-search .search-window .search-wrap input:focus {
	border-color: #333;
	outline: 0;
	border-width: 1px;
}

#board-search .search-window .search-wrap .btn {
	position: absolute;
	right: 0;
	top: 0;
	bottom: 0;
	width: 108px;
	padding: 0;
	font-size: 16px;
}

.board-table {
	font-size: 13px;
	width: 100%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.board-table a
{
	color: #fff;
	display: inline-block;
	line-height: 1.4;
	word-break: break-all;
	vertical-align: middle;
}

.board-table a:hover {
	text-decoration: underline;
}

.board-table th {
	color: #fff;
	text-align: center;
}

.board-table .th-num {
	width: 100px;
	text-align: center;
}

.board-table .th-date {
	color: #fff;
	width: 200px;
}

.board-table th, .board-table td {
	padding: 14px 0;
}

.board-table tbody td {
	border-top: 1px solid #e7e7e7;
	text-align: center;
}

.board-table tbody th {
	padding-left: 28px;
	padding-right: 14px;
	border-top: 1px solid #e7e7e7;
	text-align: left;
}

.board-table tbody th p {
	display: none;
}

.btn {
	display: inline-block;
	padding: 0 30px;
	font-size: 15px;
	font-weight: 400;
	background: transparent;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	text-transform: uppercase;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-ms-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

.btn-dark {
	background: #555;
	color: #fff;
	margin-top: 30px;
	font-size: 25px;
	padding-left: 10px;
	padding-right: 10px;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

.btn-dark {
	background: #555;
	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

/* reset */
* {
	list-style: none;
	text-decoration: none;
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

.clearfix:after {
	content: '';
	display: block;
	clear: both;
}

.container {
	width: 1100px;
	margin: 0 auto;
}

.blind {
	position: absolute;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	margin: -1px;
	width: 1px;
	height: 1px;
}

.navbar ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.navbar li {
	display: inline-block;
	margin-right: 10px;
}

.navbar li:last-child {
	margin-right: 0;
}

.navbar li a {
	text-decoration: none;
}


#register {
  color: #fff;
  float: right;
  border: 1px solid black;
  border-radius: 5px; /* 원하는 모서리의 둥글기 정도 조절 */
}


.row {
	width: 100%;
	height: 1024px;
	opacity: 0.8;
	background-size: cover;
	opacity: 1;
	overflow: hidden;
}

</style>


</head>



<body class="d-flex flex-column min-vh-100">
<div class = "cumu_wallpaper">	
	<header>
		<jsp:include page="../../../../header_after.jsp"></jsp:include>
	</header>
	<jsp:include page="../../../../sidebar.jsp"></jsp:include>

	<section class="notice">

	
	<div class = "row">
	
		<div class="page-title">
			<nav class="navbar">
				<div class="container">
					<ul class="nav">
						<li class="nav-item"><a class="nav-link" href="./free_board_list">자유게시판</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="./event_list">이벤트 게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="./contest_list">공모전 게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="./announce_list">공지사항</a>
						</li>
					</ul>
				</div>
			</nav>
		</div>
		
			

		<!-- board list area -->
		<div id="board-list" class="cumu_fred_bord">
		
			
				<div class="container">
					<table class="board-table">
						<thead>
							<tr>
								<th scope="col" class="th-num">카테고리</th>
								<th scope="col" class="th-title">게시글</th>
								<th scope="col" class="th-date">아이디</th>
							</tr>
						</thead>
						<tbody>
							
							 <c:forEach items="${posts}" var="post">
					            <tr>
					            	<input type="hidden" name="post_num" value="${post.post_num}">
					                <td>
							            <c:choose>
							                <c:when test="${post.subject == 'game'}">
							                    <a href="/community/free_board_detail?post_num=${post.post_num}">게임 개설 요청</a>
							                </c:when>
							                <c:when test="${post.subject == 'master'}">
							                    <a href="/community/free_board_detail?post_num=${post.post_num}">게임마스터 모집</a>
							                </c:when>
							                <c:when test="${post.subject == 'user'}">
							                    <a href="/community/free_board_detail?post_num=${post.post_num}">중간 파티원 모집</a>
							                </c:when>
							                <c:when test="${post.subject == 'other'}">
							                    <a href="/community/free_board_detail?post_num=${post.post_num}">잡담</a>
							                </c:when>
							                <c:when test="${post.subject == 'review'}">
							                    <a href="/community/free_board_detail?post_num=${post.post_num}">게임리뷰</a>
							                </c:when>
							                <c:when test="${post.subject == 'character'}">
							                    <a href="/community/free_board_detail?post_num=${post.post_num}">캐릭터 설정</a>
							                </c:when>
							                <c:otherwise>
							                    <a href="/community/free_board_detail?post_num=${post.post_num}">게임기타</a>
							                </c:otherwise>
							            </c:choose>
							        </td>
					                <td><a href="/community/free_board_detail?post_num=${post.post_num}">${post.post_title}</a></td>
					                <td>${post.id}</td>
					            </tr>
					        </c:forEach>
	
							
						</tbody>
					</table>
					
					<!-- 페이징 번호 표시 -->
					<div class="pagination">
					    <c:if test="${currentPage > 1}">
					        <a href="/community/free_board_list?page=${currentPage - 1}">이전</a>
					    </c:if>
					    
					    <c:forEach begin="1" end="${totalPages}" var="pageNum">
					        <c:choose>
					            <c:when test="${pageNum == currentPage}">
					                <strong>${pageNum}</strong>
					            </c:when>
					            <c:otherwise>
					                <a href="/community/free_board_list?page=${pageNum}">${pageNum}</a>
					            </c:otherwise>
					        </c:choose>
					    </c:forEach>
					    
					    <c:if test="${currentPage < totalPages}">
					        <a href="/community/free_board_list?page=${currentPage + 1}">다음</a>
					    </c:if>
					</div>
						<button type="button" class="btn-dark" id="register" class="btn">등록</button>
				</div>
			</div>
		</div>


	</section>
</div>		
	
	<script>

		document.getElementById("register").addEventListener("click", function() {
		  	window.location.href = "/community/free_board_insert";
		});




	</script>
</body>
<footer>
	<jsp:include page="../../../../footer.jsp"></jsp:include>
</footer>
</html>