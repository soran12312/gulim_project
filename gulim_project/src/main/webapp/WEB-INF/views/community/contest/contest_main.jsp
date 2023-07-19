<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="initial-scale=1, width=device-width" />
<link rel="stylesheet" href="./global.css" />
<link rel="stylesheet" href="./index.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400&display=swap" />
	

<style>
child {
  top: 0;
  left: -23px;
  background-color: var(--color-gainsboro);
  width: 1463px;
  height: 87px;
}
.child,
.div1,
.item {
  position: absolute;
}
.div1 {
  top: 27px;
  left: 811px;
  display: inline-block;
  width: 590px;
  height: 33px;
}
.item {
  top: 200.5px;
  left: -11.5px;
  border-top: 1px solid var(--color-black);
  box-sizing: border-box;
  width: 1452px;
  height: 1px;
}
.div2,
.div3 {
  position: absolute;
  top: 130px;
}
.div2 {
  left: 1261px;
}
.div3 {
  left: calc(50% + 35px);
}
.div4 {
  top: 130px;
  left: calc(50% + 356px);
  display: inline-block;
  width: 133px;
  height: 29px;
}
.div4,
.div5,
.inner {
  position: absolute;
}
.div5 {
  top: 130px;
  left: calc(50% + 192px);
}
.inner {
  top: 243px;
  left: 200px;
  border-radius: var(--br-60xl);
  background-color: var(--color-gainsboro);
  width: 1109px;
  height: 697px;
}
.images-4-icon {
  position: absolute;
  top: 409px;
  left: 882px;
  width: 293px;
  height: 358px;
  object-fit: cover;
}
.i-want-you {
  position: absolute;
  top: 767px;
  left: 324px;
  font-size: var(--font-size-77xl);
  letter-spacing: 0.28em;
  color: #ef8080;
}
.div6,
.wanted {
  position: absolute;
  top: 598px;
  left: 288px;
  font-size: 16px;
}
.wanted {
  top: 321px;
  left: 618px;
  font-size: 64px;
}
.p {
  margin: 0;
}
.div7 {
  position: absolute;
  top: 468px;
  left: 288px;
  font-size: var(--font-size-13xl);
  display: inline-block;
  width: 1058px;
  height: 31px;
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

</style>	
	
	
</head>
<body>

	<header>
		<jsp:include page="../../../../header_after.jsp"></jsp:include>
	</header>


	<div class="div">
		<div class="child"></div>
		<div class="page-title">
			<nav class="navbar">
				<div class="container">
					<ul class="nav">
						<li class="nav-item"><a class="nav-link" href="./free_board_list">자유게시판</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="./event_list">이벤트
								게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="./contest_main">공모전
								게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="./announce_list">공지사항</a>
						</li>
					</ul>
				</div>
			</nav>
		</div>
		<img class="images-4-icon" alt="" src="/files/images/clip1688436575483.png" />

		<div class="i-want-you">I WANT YOU</div>
		<div class="div6">1위 상금 : 10억짐바브웨달러, 굴림에서 시나리오 채택</div>
		<div class="wanted">WANTED</div>
		<div class="div7">
			<p class="p">12월 31일 부터 2월 21일 까지</p>
			<p class="p">굴림에서 시나리오 공모전을 실시합니다</p>
		</div>
	</div>
</body>


<footer>
	<jsp:include page="../../../../footer.jsp"></jsp:include>
</footer>
</html>
