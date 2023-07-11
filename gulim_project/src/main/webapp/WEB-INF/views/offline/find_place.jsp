<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
    <link href="/css/place.css" rel="stylesheet" />
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=af5116371e6fcb826c25a4987ca0a0b2"></script>
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
                    place_address:"${marker.place_address}"
                },
            </c:forEach>
            ];

          
            

    // 처음 웹에 들어오면 데이터 베이스 값을 받아다가 마커를 만든다
    for (var i = 0; i < locals.length; i++) {
    var markerPosition = new kakao.maps.LatLng(locals[i].latitude, locals[i].longitude);
    //마커 클릭했을 때 정보 표시
    var infoContent = '<div style="padding:15px;"><strong>' + locals[i].place_name + '</strong><hr>' + locals[i].tel + '<hr><p>' + locals[i].place_address + '</p></div>';
   
    var infowindow = new kakao.maps.InfoWindow({
        content: infoContent,
        
    });
    
    //마커 안에 들어갈 정보
    var marker = new kakao.maps.Marker({
        position: markerPosition,
        map: map,
        place_name: locals[i].place_name,
        tel: locals[i].tel,
        place_address: locals[i].place_address
    });

    markers.push(marker);

    // 마커 정보 객체에 담기
    markerinfomation.push({
        marker: marker,
        infowindow: infowindow
    });
    

    $('.place_name_css').each(function(event) {
    $(this).data('marker-index', event); // 해당 요소에 인덱스 데이터 저장

    // this 클릭시
    $(this).click(function() {
       
    var markerIndex = $(this).data('marker-index'); // 저장된 인덱스 데이터 가져오기
    var marker = markers[markerIndex];
    if (marker) {
        //지도 이동
      map.panTo(marker.getPosition());
      //마커 생성
      var infowindowContent = '<div style="padding:15px;"><strong>' + locals[markerIndex].place_name + '</strong><hr>' + locals[markerIndex].tel + '<hr>' + '<p>'+locals[markerIndex].place_address +'</p>'+ '</div>';
      // 생성된 마커의 정보 저장
       var iwRemoveable = true;
        var infowindow = new kakao.maps.InfoWindow({
        content: infowindowContent,
        removable : iwRemoveable
        });      
      // 맵에 마커 생성
        infowindow.open(map, marker);
        
        removable.click(function(){
        infowindow.close();
        })

      // 제휴매장 보기 버튼 , 전체 매장 보기 버튼 클릭시 infowindow 창 닫기
      $("#place_partnership, #place_allplace").click(function() {
        infowindow.close();

      });// end click func
    }// end if
  }); // end this func
}); // end place_name_css func
 
    }// end for




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
            $("#data_marker tr").remove();
            // result를 기반으로 마커를 생성   
            for (var i = 0; i < result.length; i++) {
                var markerPosition = new kakao.maps.LatLng(result[i].latitude, result[i].longitude);
                //이미지 붙히기 위한 변수
                var markerImage = new kakao.maps.MarkerImage(markerImg, imgSize);

                // 마커 클릭했을 때 정보 표시 
                var infoContent = '<div style="padding:15px;"><strong>' + result[i].place_name + '</strong><hr>' + result[i].tel + '<hr>' + '<p>'+result[i].place_address +'</p>'+ '</div>';
                var infowindow = new kakao.maps.InfoWindow({
                    content: infoContent
                });

                // 마커 안에 들어갈 정보
                var marker = new kakao.maps.Marker({
                    position: markerPosition,
                    map: map,
                    place_name: result[i].place_name,
                    tel: result[i].tel,
                    place_address: result[i].place_address,
                    image: markerImage
                });
                markers.push(marker);

                // 마커 정보 객체에 담기
                markerinfomation.push({
                    marker: marker,
                    infowindow: infowindow
                });

                //테이블에 붙힐 새로운 tr 만듬
                var partnership_detail = $('<tr></tr>');
                // td 안에 result 값 붙힘
                var partnership_name = $('<td class="place_name_css"></td>').text(result[i].place_name);
                var partnership_tel = $('<td class="place_tel_css"></td>').text(result[i].tel);
                var partnership_address = $('<td class="address_css"></td>').text(result[i].place_address);
                // tr에 그 값들을 붙힘
                partnership_detail.append(partnership_name, partnership_tel, partnership_address);
                // table에 새로만든 tr 붙힘
                $("#data_marker").append(partnership_detail);


                
                partnership_name.click(function() {
                    
                // 가장 가까운 tr 의 인덱스를 찾는다
                var index = $(this).closest("tr").index();
                var marker = markers[index];

                if (marker) {
                //지도 이동
                map.panTo(marker.getPosition());
                //해당 마커 생성
                var infowindowContent = '<div style="padding:15px;"><strong>' + result[index].place_name + '</strong><hr>' + result[index].tel + '<hr>' + '<p>'+result[index].place_address +'</p>'+ '</div>';
                //x 누르면 창 닫기
                iwRemoveable = true;
                var infowindow = new kakao.maps.InfoWindow({
                content: infowindowContent,
                removable : iwRemoveable
                });      
                    infowindow.open(map, marker);
                //전체 매장 보기 버튼을 누르면 인포 창 전부 닫기
                $("#place_allplace").click(function() {
                infowindow.close();
                });                
                }
                });

                // 현재 페이지 지정
                currentPage = 1;
                //끝 페이지를 result의 길이 만큼 지정
                totalRows = result.length;
                // 전체 페이지
                totalPages = Math.ceil(totalRows / rowsPerPage);
                //displaypage 함수 호출 
                displayPage(currentPage);
               } // end result for



               
      
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
        $("#data_marker tr").remove();
        for (var i = 0; i < locals.length; i++) {
        var markerPosition = new kakao.maps.LatLng(locals[i].latitude, locals[i].longitude);
       
        //마커 클릭했을 때 정보 표시 
        var infoContent = '<div style="margin:20px;"><strong>' + locals[i].place_name + '</strong><hr>' + locals[i].tel + '<hr><p>' + locals[i].place_address + '</p></div>';
        var infowindow = new kakao.maps.InfoWindow({
        content: infoContent,
        }); // end infowindow

        //마커 안에 들어갈 정보
        var marker = new kakao.maps.Marker({
        position: markerPosition,
        map: map,
        place_name: locals[i].place_name,
        tel: locals[i].tel,
        address: locals[i].place_address
        });// end marker
        
        markers.push(marker);

        // 마커 정보 객체에 담기
        markerinfomation.push({
        marker: marker,
        infowindow: infowindow
        }); // end markerinfomation

        //테이블에 붙힐 새로운 tr 만듬
        var place_all_datail = $('<tr></tr>');
        // td 안에 locals 값 붙힘
        var place_all_name = $('<td class="place_name_css"></td>').text(locals[i].place_name);
        var place_all_tel = $('<td class="place_tel_css"></td>').text(locals[i].tel);
        var place_all_address = $('<td class="address_css"></td>').text(locals[i].place_address);   
        // tr에 그 값들을 붙힘
        place_all_datail.append(place_all_name, place_all_tel, place_all_address);
        // table에 새로만든 tr 붙힘
        $("#data_marker").append(place_all_datail);   

        // place_all_name 을 클릭시 실행하는 이벤트
        place_all_name.click(function() {
           
            var index = $(this).closest("tr").index();
            var marker = markers[index];
            if (marker) {
            map.panTo(marker.getPosition());
            var infowindowContent = '<div style="padding:15px;"><strong>' + locals[index].place_name + '</strong><hr>' + locals[index].tel + '<hr>' + '<p>'+locals[index].place_address +'</p>'+ '</div>';
            iwRemoveable = true;
            var infowindow = new kakao.maps.InfoWindow({
            content: infowindowContent,
            removable : iwRemoveable
            });
            infowindow.open(map, marker);
            $("#place_partnership").click(function() {
                infowindow.close();
            });
            }
        }); 





        
        // 현재 페이지 지정
        currentPage = 1;
        //끝 페이지를 locals 길이 만큼 지정
        totalRows = locals.length;
        // 전체 페이지
        totalPages = Math.ceil(totalRows / rowsPerPage);
        //displaypage 함수 호출 
        displayPage(currentPage);

        }// end for locals

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
    }// end for markerinfomation

    }) // end #place_allplace
   
  // 페이징 기능 추가
    var currentPage = 1; // 현재 페이지
    var rowsPerPage = 10; // 페이지 당 행 수
    var totalRows = $("#place_table tbody tr").length; // 전체 행 수
    var totalPages = Math.ceil(totalRows / rowsPerPage); // 전체 페이지 수

        // 페이지 표시 함수
        function displayPage(page) {
        //시작 페이지 
        var startIndex = (page - 1) * rowsPerPage;
        //끝 페이지
        var endIndex = startIndex + rowsPerPage;
        // 
        $("#place_table tbody tr").hide();
        $("#place_table tbody tr").slice(startIndex, endIndex).show();

        var pagination = $("#pagination");
        pagination.empty();

        for (var i = 1; i <= totalPages; i++) {
            //a 태그 생성 그 안에 숫자 1개씩 찍어줌
            var pageLink = $("<a href='#'></a>").text(i);

            if (i == page) {
                pageLink.addClass("active");
            }
            pageLink.data("page", i);
            pagination.append(pageLink);
        }

        pagination.find("a").click(function() {
            var selectedPage = $(this).data("page");
            goToPage(selectedPage);
        });
    }

    function goToPage(page) {
        if (page < 1 || page > totalPages) {
            return;
        }
        currentPage = page;
        displayPage(currentPage);
    }

    // 이전 페이지로 이동
    $(".place_prev").click(function() {
    goToPage(currentPage - 1);
        });

    // 다음 페이지로 이동
    $(".place_next").click(function() {
    goToPage(currentPage + 1);
    });

    displayPage(currentPage);

}); // end function



    </script>
    <title>모임 장소 찾기</title>
</head>
<body>
<div class="mypagebackpage">
    <!-- 헤더 -->
    <jsp:include page="../../../header_after.jsp"></jsp:include>
    <jsp:include page="../../../sidebar.jsp"></jsp:include>
    <!-- 지도 띄우기 -->
    <div class="place_map">
        <div id="map" style="width:1000px;height:600px;"></div>
      
    </div>
    <!-- 버튼 생성 -->
    <button class="place_partnership" id="place_partnership">제휴 매장보기</button>
    <button class="place_allplace" id="place_allplace">전체 매장보기</button>

    <span class="place_recommend">추천 모임 장소</span>

    <div class="place_lines"><hr></div>

    <div class="place_line"><hr></div>
    
    <div class="place_detail_table">

        <table id="place_table" class="place_table" >
                
            <thead>
                <tr>
                    <th>카페명</th>
                    <th>전화번호</th>
                    <th>주소</th>
                </tr>
            </thead>
                <c:forEach items="${Marker}" var="marker">
                    <tbody id="data_marker">        
                    <tr>
                        <td class="place_name_css">${marker.place_name}</td>
                        <td class="place_tel_css">${marker.tel}</td>
                        <td class="address_css">${marker.place_address}</td>
                    </tr>
                </tbody>

            </c:forEach>
            <div>
                 <button class="place_prev"> << </button>
            </div>
            <div id="pagination" class="pagination"></div>
           <div>
            <button class="place_next"> >> </button>
           </div>
            
        </table>
    </div>

    <div class="place_partnership_box"></div>
    <span class="place_partnership_benefit">제휴매장 혜택은 매장을 이용하시고 결제 하실 때 "굴림 사이트회원"을 인증하시면 10% 할인 된 가격으로 이용하실 수 있습니다!!</span>

</div>
</body>
<jsp:include page="../../../footer.jsp"></jsp:include>
</html>