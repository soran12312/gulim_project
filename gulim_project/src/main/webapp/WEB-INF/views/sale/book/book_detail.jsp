<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/place.css" rel="stylesheet" />
</head>
<body>
    <h1 class="book_text">많이 보는 설정집</h1>
    <div><hr/></div>
  
    <table>
        <tr>
           <thead>
                <td>제목</td>
                <td>상세설명</td>
                <td>간단소개</td>
                <td>번역가</td>
                <td>가격</td>
                <td>장르</td>
                <td>이미지</td>
                <td>작가</td>
           </thead>
        </tr>
        <c:forEach items="${result}" var="book">
            <tr>
                <td>${book.book_title}</td>
                <td>${book.book_detail}</td>
                <td>${book.simple_info}</td>
                <td>${book.translation}</td>
                <td>${book.price}</td>
                <td>${book.genre}</td>
                <td>${book.path}</td>
                <td>${book.book.writer}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
