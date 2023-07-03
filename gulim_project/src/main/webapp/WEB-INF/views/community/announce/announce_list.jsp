<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- Bootstrap core CSS -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- Bootstrap core JS -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!-- Additional CSS Files -->

<style>

.child {
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
  top: 236px;
  border-radius: var(--br-60xl);
  background-color: var(--color-gainsboro);
  height: 697px;
}
.inner,
.item,
.line-icon {
  left: 193px;
  width: 1027px;
}
.inner {
  position: absolute;
  top: 236px;
  border-radius: var(--br-60xl);
  height: 697px;
}
.line-icon {
  top: 323px;
  height: 2px;
}
.child1,
.div2,
.line-icon {
  position: absolute;
}
.child1 {
  top: 405px;
  left: 193px;
  width: 1027px;
  height: 2px;
}
.div2 {
  top: 122px;
  left: calc(50% - 70px);
}
.div3 {
  top: 122px;
  left: calc(50% + 60px);
}
.div3,
.div4,
.line-div {
  position: absolute;
}
.div4 {
  top: 122px;
  left: calc(50% + 222px);
}
.line-div {
  top: 185.5px;
  left: -0.5px;
  border-top: 1px solid var(--color-black);
  box-sizing: border-box;
  width: 1452px;
  height: 1px;
}
.div5,
.div6,
.div7 {
  position: absolute;
  top: 345px;
  left: 220px;
}
.div6,
.div7 {
  top: 122px;
  left: calc(50% + 422px);;
}
.div7 {
  top: 345px;
  left: 476px;
}
.div10,
.div11,
.div12,
.div8,
.div9 {
  position: absolute;
  top: 266px;
  left: 625px;
}
.div10,
.div11,
.div12,
.div9 {
  left: 250px;
}
.div10,
.div11,
.div12 {
  left: 1009px;
}
.div11,
.div12 {
  top: 351px;
}
.div12 {
  top: 436px;
  left: 221px;
}
.div13,
.div14,
.div15 {
  position: absolute;
  top: 439px;
  left: 476px;
}
.div14,
.div15 {
  top: 436px;
  left: 1010px;
}
.div15 {
  top: 965px;
  left: 598px;
  display: inline-block;
  width: 552px;
  height: 48px;
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



<body class="d-flex flex-column min-vh-100">
	<header>
		<jsp:include page="../../../../header_before.jsp"></jsp:include>
	</header>

	<div class="div">
      <div class="child"></div>
     
      <div class="item"></div>
     

      <div class="div2">자유게시판</div>
      <div class="div3">이벤트게시판</div>
      <div class="div4">공모전게시판</div>
      <div class="line-div"></div>
      <div class="div5">[중간 파티원 모집]</div>
      <div class="div6">공지사항</div>
      <div class="div7">이웃집 주사위 룰을 적용하고 있습니다</div>
      <div class="div8">[게시글]</div>
      <div class="div9">[카테고리]</div>
      <div class="div10">[아이디]</div>
      <div class="div11">황윤재진</div>
      <div class="div12">[게임 개설 요청]</div>
      <div class="div13">굴림 더 락! 룰을 적용한 게임이 하고 싶습니다</div>
      <div class="div14">최다비니</div>
    </div>
</body>
<footer>
	<jsp:include page="../../../../footer.jsp"></jsp:include>
</footer>
</html>