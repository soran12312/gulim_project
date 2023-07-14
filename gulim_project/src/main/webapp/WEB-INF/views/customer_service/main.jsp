<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
    <link href="/css/place.css" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script type="text/javascript">
      $(function(){
        //게임은 어디서 만들어야하나요 버튼을 누르면 발생하는 이벤트
        $(".question_game").click(function(){
            $(".popup_overlay").show();
            $(".popup_game").show();
        });
        //버튼 클릭시 배경 약간 회색으로 만듬
        $(".popup_overlay").click(function(){
            $(".popup_overlay").hide();
            $(".popup_game").hide();
        });
        //닫기 버튼 누르면 팝업 꺼짐
        $(".popup_content button").click(function(){
            $(".popup_overlay").hide();
            $(".popup_game").hide();
        });



        //설정집 구매 버튼을 누르면 발생하는 이벤트
        $(".question_book").click(function(){
            $(".popup_overlay").show();
            $(".popup_book").show();
        });
        //버튼 클릭시 배경 약간 회색으로 만듬
        $(".popup_overlay").click(function(){
            $(".popup_overlay").hide();
            $(".popup_book").hide();
        });
        $(".popup_content button").click(function(){
            $(".popup_overlay").hide();
            $(".popup_book").hide();
        });


        //모임 장소 찾기 버튼을 누르면 발생하는 이벤트
        $(".question_map").click(function(){
            $(".popup_overlay").show();
            $(".popup_map").show();
        });
        //버튼 클릭시 배경 약간 회색으로 만듬
        $(".popup_overlay").click(function(){
            $(".popup_overlay").hide();
            $(".popup_map").hide();
        });
        $(".popup_content button").click(function(){
            $(".popup_overlay").hide();
            $(".popup_map").hide();
        });
        
        //비밀번호 버튼을 누르면 발생하는 이벤트
        $(".question_pass").click(function(){
            $(".popup_overlay").show();
            $(".popup_pass").show();
        });
        //버튼 클릭시 배경 약간 회색으로 만듬
        $(".popup_overlay").click(function(){
            $(".popup_overlay").hide();
            $(".popup_pass").hide();
        });
        $(".popup_content button").click(function(){
            $(".popup_overlay").hide();
            $(".popup_pass").hide();
        });

        //아이디 버튼을 누르면 발생하는 이벤트
        $(".question_id_id").click(function(){
            $(".popup_overlay").show();
            $(".popup_id").show();
        });
        //버튼 클릭시 배경 약간 회색으로 만듬
        $(".popup_overlay").click(function(){
            $(".popup_overlay").hide();
            $(".popup_id").hide();
        });
        $(".popup_content button").click(function(){
            $(".popup_overlay").hide();
            $(".popup_id").hide();
        });

        //캐릭터 시트 버튼누르면 발생하는 이벤트
        $(".question_char").click(function(){
            $(".popup_overlay").show();
            $(".popup_char").show();
        });
        //버튼 클릭시 배경 약간 회색으로 만듬
        $(".popup_overlay").click(function(){
            $(".popup_overlay").hide();
            $(".popup_char").hide();
        });
        $(".popup_content button").click(function(){
            $(".popup_overlay").hide();
            $(".popup_char").hide();
        });

        //게임마스터 버튼을 누르면 발생하는 이벤트
        $(".question_master").click(function(){
            $(".popup_overlay").show();
            $(".popup_master").show();
        });
        //버튼 클릭시 배경 약간 회색으로 만듬
        $(".popup_overlay").click(function(){
            $(".popup_overlay").hide();
            $(".popup_master").hide();
        });
        $(".popup_content button").click(function(){
            $(".popup_overlay").hide();
            $(".popup_master").hide();
        });

        //게임추천버튼을 누르면 발생하는 이벤트
        $(".question_reco").click(function(){
            $(".popup_overlay").show();
            $(".popup_reco").show();
        });
        //버튼 클릭시 배경 약간 회색으로 만듬
        $(".popup_overlay").click(function(){
            $(".popup_overlay").hide();
            $(".popup_reco").hide();
        });
        $(".popup_content button").click(function(){
            $(".popup_overlay").hide();
            $(".popup_reco").hide();
        });



      });
    </script>
    <meta charset="UTF-8">
    <title>고객 센터</title>
</head>
<body>
<div class="mybotpage">
    <jsp:include page="../../../header_after.jsp"></jsp:include>

    <div class="question_question">자주 묻는 문의사항</div>

    <div class="table_wrapper">
        <table class="question_table">
            <tr>
                <td class="question_td"><button class="question_game question_button">게임은 어디서 만들어야하나요?
                </button></td>
                <td class="question_td"><button class="question_book question_button">설정집 구매는 어디서 하나요?</button></td>
                <td class="question_td"><button class="question_map question_button">장소를 찾고 싶어요</button></td>
                <td class="question_td"><button class="question_pass question_button">비밀번호를 분실했어요</button></td>
            </tr>
            <tr>
                <td class="question_td"><button class="question_id_id question_button">아이디를 분실했어요</button></td>
                <td class="question_td"><button class="question_char question_button">캐릭터 시트는 뭐예요?</button></td>
                <td class="question_td"><button class="question_master question_button">게임마스터가 너무 어려워요</button></td>
                <td class="question_td"><button class="question_reco question_button">게임 추천해주세요</button></td>
            </tr>
        </table>
    </div>



</div>

<!-- 팝업 -->
<div class="popup_overlay"></div>
<div class="popup_game popup_content">
    <strong>Q.게임은 어디서 생성하나요?</strong>
    <h2>A.게임탭에서 게임생성을 누르면 됩니다.</h2>
    <a href="#"><span>게임 생성하러가기</span></a><br>
    <button>닫기</button>
</div>


<div class="popup_content popup_book">
    <strong>Q.설정집 구매는 어디서 하나요?</strong>
    <h2>A.결제로 들어가서 원하는 설정집을 선택해서 구매하시면 됩니다.</h2>
    <a href="#"><span>설정집 구매 하러가기</span></a><br>
    <button>닫기</button>
</div>


<div class="popup_content popup_map">
    <strong>Q.장소를 찾고 싶어요</strong>
    <h2>A.모임장소 찾기를 눌러서 근처에 있는 장소를 확인하세요.</h2>
    <a href="https://192.168.0.68:8080/offline/map"><span>장소 보러 하러가기</span></a><br>
    <button>닫기</button>
</div>

<div class="popup_content popup_pass">
    <strong>Q.비밀번호를 분실했어요</strong>
    <h2>A.어쩌라고요.</h2>
    <a href="#"><span>비밀번호 찾으러 하러가기</span></a><br>
    <button>닫기</button>
</div>

<div class="popup_content popup_id">
    <strong>Q.아이디를 분실했어요</strong>
    <h2>A.어쩌라고요.</h2>
    <a href="#"><span>아이디 찾으러 하러가기</span></a><br>
    <button>닫기</button>
</div>

<div class="popup_content popup_char">
    <strong>Q.캐릭터 시트가 뭐예요?</strong>
    <h2>A.나도 모르겠네요.</h2>
    <a href="#"><span>캐릭터 시트 작성 하러가기</span></a><br>
    <button>닫기</button>
</div>

<div class="popup_content popup_master">
    <strong>Q.게임마스터가 너무 어려워요</strong>
    <h2>A.네</h2>
    <a href="#"><span>하러가기</span></a><br>
    <button>닫기</button>
</div>

<div class="popup_content popup_reco">
    <strong>Q.게임 추천해주세요</strong>
    <h2>A.싫어요</h2>
    <a href="#"><span>게임추천 받으러가기</span></a><br>
    <button>닫기</button>
</div>

<jsp:include page="../../../footer.jsp"></jsp:include>
</body>
</html>
