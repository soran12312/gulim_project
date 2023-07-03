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
.child, .div1 {
	position: absolute;
}

.div1 {
	top: 173px;
	left: 247px;
	font-size: var(--font-size-13xl);
	text-align: left;
}

.child {
	top: 211px;
	left: 237.99px;
	width: 934.01px;
	height: 6px;
}

.inner, .item, .rectangle-div {
	position: absolute;
	top: 632px;
	left: 259px;
	background-color: var(--color-gainsboro);
	width: 190px;
	height: 228px;
}

.inner, .rectangle-div {
	left: 500px;
}

.rectangle-div {
	left: 741px;
}

.div2, .div3, .div4, .div5 {
	position: absolute;
	top: 874px;
	left: 741px;
	font-size: var(--font-size-13xl);
	display: inline-block;
	width: 191px;
	height: 43px;
}

.div3, .div4, .div5 {
	left: 989px;
}

.div4, .div5 {
	left: 499px;
}

.div5 {
	left: 258px;
}

.child1, .div6 {
	position: absolute;
	top: 632px;
	left: 982px;
	background-color: var(--color-gainsboro);
	width: 190px;
	height: 228px;
}

.div6 {
	top: 603px;
	left: 741px;
	border-radius: var(--br-3xs);
	background-color: var(--color-darkorchid);
	width: 39px;
	height: 23px;
}

.best {
	top: 607px;
	left: 748px;
	color: var(--color-white);
	text-align: left;
}

.best, .best1, .div7 {
	position: absolute;
}

.best1 {
	top: 932px;
	left: 989px;
	color: var(--color-white);
	text-align: left;
}

.div7 {
	top: 520px;
	left: 393px;
	font-size: var(--font-size-13xl);
	display: inline-block;
	width: 191px;
	height: 43px;
}

.child6 {
	top: 274px;
	left: 405px;
	background-color: var(--color-gainsboro);
	width: 190px;
	height: 228px;
}

.best2, .child6, .div8 {
	position: absolute;
}

.div8 {
	top: 243px;
	left: 405px;
	border-radius: var(--br-3xs);
	background-color: var(--color-darkorchid);
	width: 39px;
	height: 23px;
}

.best2 {
	top: 247px;
	left: 412px;
	color: var(--color-white);
	text-align: left;
}

.div10, .div11, .div12, .div13, .div14, .div9 {
	position: absolute;
	display: inline-block;
	width: 197px;
	height: 40px;
}

.div9 {
	top: 952px;
	left: 254px;
	color: var(--color-red);
}

.div10, .div11, .div12, .div13, .div14 {
	top: 932px;
	left: 496px;
}

.div11, .div12, .div13, .div14 {
	top: 563px;
	left: 398px;
}

.div12, .div13, .div14 {
	top: 932px;
	left: 748px;
}

.div13, .div14 {
	left: 986px;
}

.div14 {
	top: 931px;
	left: 255px;
}

.p {
	margin: 0;
}

.div15 {
	top: 952px;
	left: 738px;
	color: var(--color-red);
	display: inline-block;
	width: 197px;
	height: 40px;
}

.child8, .div15, .div16 {
	position: absolute;
}

.div16 {
	top: 952px;
	left: 989px;
	color: var(--color-red);
	display: inline-block;
	width: 197px;
	height: 40px;
}

.child8 {
	top: 460px;
	left: 626px;
	border-radius: var(--br-smi);
	background-color: var(--color-rosybrown);
	width: 102px;
	height: 38px;
}

.div17 {
	top: 471px;
	left: 654px;
}

.child9, .div17, .div18 {
	position: absolute;
}

.child9 {
	top: 460px;
	left: 748px;
	border-radius: var(--br-smi);
	background-color: var(--color-rosybrown);
	width: 102px;
	height: 38px;
}

.div18 {
	top: 471px;
	left: 758px;
}

.div19, .div20, .trpg-container {
	position: absolute;
	top: 303px;
	left: 629px;
	text-align: left;
	display: inline-block;
	width: 200px;
	height: 101px;
}

.div19, .div20 {
	top: 671px;
	left: 151px;
	font-size: var(--font-size-77xl);
	width: 68px;
	height: 102px;
}

.div20 {
	top: 680px;
	left: 1212px;
}

.background {
	position: absolute;
	top: 0;
	left: -23px;
	background-color: var(--color-gainsboro);
	width: 1463px;
	height: 87px;
}

.text {
	top: 27px;
	left: 811px;
	font-size: var(--font-size-5xl);
	text-align: left;
	display: inline-block;
	width: 590px;
	height: 33px;
}

.child10, .div21, .text {
	position: absolute;
}

.child10 {
	top: 107px;
	left: 1186px;
	border-radius: var(--br-25xl);
	background-color: var(--color-gainsboro);
	box-shadow: 0 4px 4px rgba(0, 0, 0, 0.25);
	width: 154px;
	height: 66px;
}

.div21 {
	top: 125px;
	left: 1218px;
	font-size: var(--font-size-5xl);
	text-align: left;
}

.div {
	position: relative;
	background-color: var(--color-white);
	width: 100%;
	height: 1024px;
	overflow: hidden;
	text-align: center;
	font-size: var(--font-size-xs);
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
		<div class="div1">구독권</div>
		<img class="child" alt="" src="./public/line-7.svg" />

		<div class="item"></div>
		<div class="inner"></div>
		<div class="rectangle-div"></div>
		<div class="div2">6개월</div>
		<div class="div3">12개월</div>
		<div class="div4">3개월</div>
		<div class="div5">1개월</div>
		<div class="child1"></div>
		<img class="child" alt="" src="./public/line-7.svg" />

		<div class="item"></div>
		<div class="div6"></div>
		<div class="best">best</div>
		<div class="best1">best</div>
		<div class="inner"></div>
		<div class="rectangle-div"></div>
		<div class="child1"></div>
		<div class="div7">일회권</div>
		<div class="child6"></div>
		<div class="div8"></div>
		<div class="best2">best</div>
		<div class="child6"></div>
		<div class="div9">첫 가입 시 한달 무료!!</div>
		<div class="div10">15000원</div>
		<div class="div11">5000원</div>
		<div class="div12">29900원</div>
		<div class="div13">55000원</div>
		<div class="div14">9900원</div>
		<div class="div15">
			<p class="p">6개월권을 사면 1개월이 무료!</p>
			<p class="p">6+1</p>
		</div>
		<div class="div16">
			<p class="p">12개월권을 사면 2개월이 무료!</p>
			<p class="p">12+2</p>
		</div>
		<div class="child8"></div>
		<div class="div17">장바구니</div>
		<div class="child9"></div>
		<div class="div18">친구에게 보내기</div>
		<div class="trpg-container">
			<p class="p">처음 입문하는 친구에게 선물하기 좋은</p>
			<p class="p">일회권이 출시되었습니다!</p>
			<p class="p">&nbsp;</p>
			<p class="p">친구에게 보내서 TRPG의 세계로 잡아오시는건 어떤가요?</p>
		</div>
		<div class="div19">&lt;</div>
		<div class="div20">&gt;</div>
		<div class="background"></div>
		
		<div class="child10"></div>
		<div class="div21">장바구니</div>
	</div>
</body>

<footer>
	<jsp:include page="../../../../footer.jsp"></jsp:include>
</footer>
</html>
