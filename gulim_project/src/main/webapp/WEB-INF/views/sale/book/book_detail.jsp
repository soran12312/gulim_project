<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/place.css" rel="stylesheet" />
</head>
    <section>
    <h1 class="book_text">많이 보는 설정집</h1>
    <div><hr/></div>
  
    <div class="book_list">
        <div>
        <c:forEach items="${result}" var="book">
            <div class="book_item">
                <img src="${book.path}" class="book_image" />
                <div class="book_title">${book.book_title}</div>
                <div class="book_simple_info">${book.simple_info}</div>
                    <h1>상 세 보 기</h1>
                    <hr/>
                    <div class="book_detail">${book.book_detail}</div>
                    <div class="book_translation">${book.translation}</div>
                    <div class="book_price">${book.price}</div>
                    <div class="book_genre">${book.genre}</div>
                    <div class="book_writer">${book.writer}</div>
                
            </div>
        
        </c:forEach>
    </div>
    </div>
    
    <button class="pocket">장바구니</button>
    <button>구매하기</button>
    </section>
</html>
