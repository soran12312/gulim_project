<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet"/>
    <link href="/css/place.css" rel="stylesheet"/>
    <script type="text/javascript">
        
        function question_select(selectElement) {
        //선택된 값
        var question_val = selectElement.value;
        // 선택된 값을 hidden 필드에 설정
        document.getElementById('question_type_hidden').value = question_val;
        }
    
    
    </script>
<meta charset="UTF-8">
<title>문의 사항</title>
</head>
<body>
    <jsp:include page="../../../header_after.jsp"></jsp:include>
    <jsp:include page="../../../sidebar.jsp"></jsp:include>
    <div class="mybotpage">
        <span class="place_recommend">1:1 문의 사항</span>

        <div class="place_lines"><hr></div>
    
        <div class="place_line"><hr></div>

       <div class="question_box">
        <form name="question_detail" id="question_detail" method="post" action="/customer_service/send_question">
            <input type="hidden" name="question_type" id="question_type_hidden">
            <select class="qustion_type" name="qustion_type" id="qustion_type" onchange="question_select(this)" required>
                <option value="">문의 사항을 선택해주세요</option>
                <option value="게임 문의사항">게임 문의사항</option>
                <option value="로그인 문의사항">로그인 문의사항</option>
                <option value="결제 문의사항">결제 문의사항</option>
                <option value="기타 문의사항">기타 문의사항</option>
            </select>
                <input type="text" placeholder="아이디" name="question_id" class="question_id" value="${questionDTO.id}" readonly>      
                <input type="text" class="question_title" id="question_title"name="question_title" placeholder="제목" required>    
                <textarea class="question_content" class="question_content" id="question_content" name="question_content" placeholder="300자 이내로 적어주세요" required></textarea>              
                <button type="submit" class="question_submit" id="question_submit">문의사항 보내기</button>
        </form>
       </div>
    </div>
</body>
<jsp:include page="../../../footer.jsp"></jsp:include>
</html>