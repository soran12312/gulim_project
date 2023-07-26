<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/place.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>

<body>
    <section>
    <h1 class="book_text">많이 보는 설정집</h1>
    <div class="book_hr"><hr/></div>

    <div class="book_list">
        <div>
        <c:forEach items="${result}" var="book">
            <input type="hidden" value="${book.book_num}" class="book_number"/>
            <div class="book_item">
                <img src="${book.path}" class="book_image" />
                <div class="book_title">${book.book_title}</div>
                <div class="book_simple_info">${book.simple_info}</div>

                    <div class="book_view_container">
                    <div class="book_view"><h1>상 세 보 기</h1></div></div>
                    <div class="book_views_container">
                    <div class="book_views"><hr/></div></div>
                    <div class="book_detail">${book.book_detail}</div>
                    <div class="book_price">${book.price}원</div>
                    <div class="book_writer">${book.writer}</div>
            </div>
        
        </c:forEach>
    </div>
    </div>
    
    <button class="pocket book_btn">장바구니</button>
    <button class="purchase book_btns">구매하기</button>
    </section>
</body>
<script type="text/javascript">

      $(".pocket").click(function() {
        console.log($(".book_num").val())
        window.parent.location.href = "https://192.168.0.68:8080/sale/basket/book_num=" + $(".book_number").val();
        });
    
    </script>
</html>
