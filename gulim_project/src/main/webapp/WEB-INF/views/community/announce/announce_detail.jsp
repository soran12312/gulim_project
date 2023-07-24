<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
<head>
    <th:block th:insert="fragments/head :: common"></th:block>
    <title>공지사항</title>
</head>
<body class="ui grid">
<div class="ui container eleven wide column main-container" style="padding: 50px 0">
    <div class="ui inverted menu">
        <a th:href="@{/notices}" class="active item">
            공지사항
        </a>
        <a sec:authorize="!isAuthenticated()" th:href="@{/session}" class="item">
            로그인
        </a>
        <a sec:authorize="!isAuthenticated()" th:href="@{/users}" class="item">
            회원가입
        </a>
        <a sec:authorize="isAuthenticated()" th:href="@{/logout}" class="item">
            로그아웃
        </a>
        <span sec:authorize="isAuthenticated()" sec:authentication="principal.username" class="right item"></span>
    </div>


    <hr>
    <div class="ui segment">
        <div class="ui comments">
            <div class="comment">
                <div class="content">
                    <a class="author" th:text="'글쓴이 : '+${notice.user.nickName}"></a>
                    <div class="metadata">
                        <div class="date" th:text="'작성일시 : '+${notice.registerDate}"></div>
                        <div class="date" th:text="'최종 수정일시 : '+${notice.modifyDate}"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="ui clearing divider"></div>

        <div class="ui message">
            <div class="header">
                <p th:text="${notice.title}"></p>
            </div>
        </div>

        <div class="ui message" style="min-height: 150px">
            <p th:text="${notice.noticeContent.content}"></p>
        </div>
    </div>
    <div>
        <button id="back" class="left floated ui button">이전으로</button>
        <form style="display: inline" th:method="DELETE" th:action="@{'/notices/' + ${notice.id}}"
              onsubmit="return confirm('정말 삭제하시겠습니까?');">
            <button type="submit" class="right floated ui red button">삭제</button>
        </form>
        <a th:href="@{'/edit/' + ${notice.id}}" class="right floated ui button">수정</a>
    </div>
</div>
</body>
<script>
    $("#back").click(function () {
        window.history.back();
    });

    var urlParams;

    (window.onpopstate = function () {
        var match,
            pl = /\+/g,  // Regex for replacing addition symbol with a space
            search = /([^&=]+)=?([^&]*)/g,
            decode = function (s) {
                return decodeURIComponent(s.replace(pl, " "));
            },
            query = window.location.search.substring(1);

        urlParams = {};
        while (match = search.exec(query))
            urlParams[decode(match[1])] = decode(match[2]);

        checkAuthError();
    })();

    function checkAuthError() {
        if (urlParams["auth-error"]) {
            alert("권한이 없습니다.")
        }
    }
</script>
</html>