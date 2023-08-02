<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

<html>
<head>
<meta charset="UTF-8">
<title>공모전 리스트</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



<style>
.image-grid-cover {
    width: 100%;
    background-size: cover;
    min-height: 180px;
    position: relative;
    margin-bottom: 30px;
    text-shadow: rgba(0,0,0,.8) 0 1px 0;
    border-radius: 4px;
}
.image-grid-clickbox {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    display: block;
    width: 100%;
    height: 100%;
    z-index: 20;
    background: rgba(0,0,0,.45);
}
.cover-wrapper {
    font-size: 18px;
    text-align: center;
    display: block;
    color: #fff;
    text-shadow: rgba(0,0,0,.8) 0 1px 0;
    z-index: 21;
    position: relative;
    top: 80px;
}
a, a:focus, a:hover {
    text-decoration: none;
    outline: 0;
}



html,
body {
    height: 100%;
}

body {
    display: flex;
    flex-direction: column;
}

.container {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
}

footer {
    margin-top: auto;
}



</style>

</head>


	<header>
		<jsp:include page="../../../../header_after.jsp"></jsp:include>
	</header>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="./free_board_list">자유게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="./event_list">이벤트게시판</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="./contest_list">공모전게시판</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="./announce_list">공지사항</a>
				</li>
			</ul>
		</div>
	</nav>


	<div class="container">
        <div class="row">
        
        	<c:set var="contestsPerPage" value="6" />
			<c:set var="startIndex" value="${(currentPage - 1) * contestsPerPage}" />
			<c:set var="endIndex" value="${startIndex + contestsPerPage}" />
			
            <c:forEach items="${contests}" var="contest" varStatus="loop">
            
            	<c:if test="${loop.index >= startIndex && loop.index < endIndex}">
	                <div class="col-12 col-sm-6 col-md-4 image-grid-item">
	                    <div style="background-image: url(${contest.path});" class="entry-cover image-grid-cover has-image">
	                    	<input type="hidden" name="contest_num" value="${contest.post_num}" />
	                        <a href="/community/contest_detail?contest_num=${contest.post_num}" class="image-grid-clickbox"></a>
	                        <a href="/community/contest_detail?contest_num=${contest.post_num}" class="cover-wrapper">${contest.post_title}</a>
	                    </div>
	                </div>
               </c:if>
               
               
               
            </c:forEach>
        </div>
        
        
        
		<!-- 페이징 번호 표시 -->
			<div class="pagination">
			    <c:if test="${currentPage > 1}">
			        <a href="/community/contest_list?page=${currentPage - 1}">이전</a>
			    </c:if>
			    
			    <c:forEach begin="1" end="${totalPages}" var="pageNum">
			        <c:choose>
			            <c:when test="${pageNum == currentPage}">
			                <strong>${pageNum}</strong>
			            </c:when>
			            <c:otherwise>
			                <a href="/community/contest_list?page=${pageNum}">${pageNum}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    
			    <c:if test="${currentPage < totalPages}">
				    <a href="/community/contest_list?page=${currentPage + 1}">다음</a>
				</c:if>
			</div>
    </div>
    
    

		

<footer>
	<jsp:include page="../../../../footer.jsp"></jsp:include>
</footer>
</html>