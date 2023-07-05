<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
    <link href="/css/place.css" rel="stylesheet" />
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af5116371e6fcb826c25a4987ca0a0b2"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script type="text/javascript">

       $(function() {
        
           
            var markers =[]
            var markerinfomation = [];
            
            //지도를 띄우기
            var container = document.getElementById('map');
            var options = {
                center: new kakao.maps.LatLng(37.566535, 126.9779692),
                level:8
            };

            var map = new kakao.maps.Map(container, options);

            //데이터 베이스에 있는 값 가져와서 변수에 담기
            var locals = [
            <c:forEach items="${Marker}" var="marker">
                {
                    latitude: ${marker.latitude},
                    longitude: ${marker.longitude},
                    place_name: "${marker.place_name}",
                    tel : "${marker.tel}",
                    address:"${marker.place_address}"
                },
            </c:forEach>
            ];

          
            

    // 처음 웹에 들어오면 데이터 베이스 값을 받아다가 마커를 만든다
    for (var i = 0; i < locals.length; i++) {
    var markerPosition = new kakao.maps.LatLng(locals[i].latitude, locals[i].longitude);
    //마커 클릭했을 때 정보 표시
    var infoContent = '<div style="padding:15px;"><strong>' + locals[i].place_name + '</strong><br>' + locals[i].tel + '<br><p>' + locals[i].address + '</p></div>';
    var infowindow = new kakao.maps.InfoWindow({
        content: infoContent,
       
    });
    //마커 안에 들어갈 정보
    var marker = new kakao.maps.Marker({
        position: markerPosition,
        map: map,
        place_name: locals[i].place_name,
        tel: locals[i].tel,
        address: locals[i].address
    });
    //
    markers.push(marker);

    // 마커 정보 객체에 담기
    markerinfomation.push({
        marker: marker,
        infowindow: infowindow
    });
    }

    // 지도에 있는 마커에 정보 담기
    for (var i = 0; i < markerinfomation.length; i++) {
    var markerInfo = markerinfomation[i];
    
    function addClickListener(markerInfo) {
        //마커에 마우스 올리면 발생하는 이벤트
        kakao.maps.event.addListener(markerInfo.marker, 'mouseover', function() {           
        markerInfo.infowindow.open(map, markerInfo.marker);
        });
        kakao.maps.event.addListener(markerInfo.marker, 'mouseout', function() {
        markerInfo.infowindow.close();
        });
    }
    addClickListener(markerInfo);
    }


        //기존에 존재하는 마커를 지우기 위한 함수
        function removeMarkers() {
        for (var i = 0; i < markers.length; i++) {          
            markers[i].setMap(null);
        }
        markers = [];
        }




        

    //제휴 매장보기 버튼을 눌렀을 때
    var markerImg = "../../../files/images/marker.png";
    var imgSize = new kakao.maps.Size(50, 42);

// 제휴 매장보기 버튼을 눌렀을 때
$("#place_partnership").click(function() {
    $.ajax({
        type: "post",
        url: 'show_partnership',
        data: { partnership: marker.partnership },
        success: function(result) {
            // removeMarkers 함수 호출
            removeMarkers();
            // result를 기반으로 마커를 생성   
            for (var i = 0; i < result.length; i++) {
                var markerPosition = new kakao.maps.LatLng(result[i].latitude, result[i].longitude);
                var markerImage = new kakao.maps.MarkerImage(markerImg, imgSize);

                // 마커 클릭했을 때 정보 표시 
                var infoContent = '<div style="padding:15px;"><strong>' + locals[i].place_name + '</strong><br>' + locals[i].tel + '<br>' + '<p>'+locals[i].address +'</p>'+ '</div>';
                var infowindow = new kakao.maps.InfoWindow({
                    content: infoContent
                });

                // 마커 안에 들어갈 정보
                var marker = new kakao.maps.Marker({
                    position: markerPosition,
                    map: map,
                    place_name: locals[i].place_name,
                    tel: locals[i].tel,
                    address: locals[i].address,
                    image: markerImage
                });
                markers.push(marker);

                // 마커 정보 객체에 담기
                markerinfomation.push({
                    marker: marker,
                    infowindow: infowindow
                });
            }

            // 지도에 있는 마커에 정보 담기
            for (var i = 0; i < markerinfomation.length; i++) {
                var markerInfo = markerinfomation[i];
                // 마커에 클릭 이벤트 걸기
                function addClickListener(markerInfo) {
                    kakao.maps.event.addListener(markerInfo.marker, 'mouseover', function() {
                        markerInfo.infowindow.open(map, markerInfo.marker);
                    });
                    kakao.maps.event.addListener(markerInfo.marker, 'mouseout', function() {
                        markerInfo.infowindow.close();
                    });
                }
                addClickListener(markerInfo);
            }
        }
    });
});

    //전체 매장 보기 버튼을 눌렀을 때
    $("#place_allplace").click(function(){
        removeMarkers();

        for (var i = 0; i < locals.length; i++) {
        var markerPosition = new kakao.maps.LatLng(locals[i].latitude, locals[i].longitude);
        //마커 클릭했을 때 정보 표시 
        var infoContent = '<div style="padding:15px;"><strong>' + locals[i].place_name + '</strong><hr>' + locals[i].tel + '<hr><p>' + locals[i].address + '</p></div>';
       
        var infowindow = new kakao.maps.InfoWindow({
        content: infoContent,
        
    }); // end infowindow

        //마커 안에 들어갈 정보
        var marker = new kakao.maps.Marker({
        position: markerPosition,
        map: map,
        place_name: locals[i].place_name,
        tel: locals[i].tel,
        address: locals[i].address
        });// end marker
        
        markers.push(marker);

        // 마커 정보 객체에 담기
        markerinfomation.push({
        marker: marker,
        infowindow: infowindow
        }); // end markerinfomation
        }// end for

    // 지도에 있는 마커에 정보 담기
    for (var i = 0; i < markerinfomation.length; i++) {
    var markerInfo = markerinfomation[i];
    //마커에 클릭 이벤트 걸기
    function addClickListener(markerInfo) {
        kakao.maps.event.addListener(markerInfo.marker, 'mouseover', function() {           
        markerInfo.infowindow.open(map, markerInfo.marker);
        });
        kakao.maps.event.addListener(markerInfo.marker, 'mouseout', function() {           
        markerInfo.infowindow.close();
        });
    }
    addClickListener(markerInfo);
    }// end for
    }) // end #place_allplace
   
}); // end function



    </script>
    <title>모임 장소 찾기</title>
</head>
<body>
<div class="mypagebackpage">
    <!-- 헤더 -->
    <jsp:include page="../../../header_after.jsp"></jsp:include>

    <!-- 지도 띄우기 -->
    <div class="place_map">
        <div id="map" style="width:1000px;height:600px;"></div>
      
    </div>

    <button class="place_partnership" id="place_partnership">제휴 매장보기</button>
    <button class="place_allplace" id="place_allplace">전체 매장보기</button>
    <span class="place_recommend">추천 모임 장소</span>
    <div class="place_lines"><hr></div>
    <div class="place_line"><hr></div>
    <div class="place_detail_table">
        <table>
            <tr>
                <th>카페명</th>
                <th>전화번호</th>
                <th>주소</th>
            </tr>
            <c:forEach items="${Marker}" var="marker">
                <tr>
                    
                    <td class="place_name_css">${marker.place_name}</td>
                    <td class="place_tel_css">${marker.tel}</td>
                    <td class="address_css">${marker.place_address}</td>
                </tr>
                
            </c:forEach>
            <div>
                 <button class="place_prev">이전</button>
            </div>
           <div>
            <button class="place_next">다음</button>
           </div>
            
        </table>
    </div>

    <div class="place_partnership_box"></div>
    <span class="place_partnership_benefit">제휴매장 혜택은 매장을 이용하시고 결제 하실 때 "굴림 사이트회원"을 인증하시면 10% 할인 된 가격으로 이용하실 수 있습니다!!</span>

</div>
</body>
<jsp:include page="../../../footer.jsp"></jsp:include>
</html>