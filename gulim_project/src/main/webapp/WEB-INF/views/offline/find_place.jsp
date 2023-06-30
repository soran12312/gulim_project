<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
        <link href="/css/place.css" rel="stylesheet" />
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af5116371e6fcb826c25a4987ca0a0b2"></script>
        <title>모임 장소 찾기</title>
    </head>
    <body>
        <div class="place_section">
             <!--  헤더  -->
            <jsp:include page="../../../header_after.jsp"></jsp:include>
            
            
            <!-- 지도 띄우기 아직 완성 안됌 --> 
          	<div class="place_map">
            <div id="map" style="width:1000px;height:700px;"></div>
				<script>
				var container = document.getElementById('map');
				var options = {
				center: new kakao.maps.LatLng(37.566535,126.9779692),
				level:9
				};

			var map = new kakao.maps.Map(container, options);
			</script>
                 
            </div> 
             
            <button class="place_partnership">제휴 매장보기</button>
            
            <span class="place_recommend">추천 모임 장소</span>
            <div class="place_lines"><hr></div>
            <div class="place_line"><hr></div>
            <div class="place_detail_table">
           <table>
           <tr>카페명</tr>
           
			
			</table>
			</div>

<div class="place_partnership_box"></div>
<span class="place_partnership_benefit">제휴매장 혜택
제휴매장의 경우 10% 할인된 가격으로 이용하실 수 있습니다! 
가셔서 "굴림회원이요!"라고 말씀해주세요!</span>

</div>
</body>
 <jsp:include page="../../../footer.jsp"></jsp:include>
</html>