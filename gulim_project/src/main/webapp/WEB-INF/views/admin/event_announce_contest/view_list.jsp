<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>관리자 글목록</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/admin/images/favicon.png">
    <!-- Datatable -->
    <link href="/admin/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="/admin/css/style.css" rel="stylesheet">
    <!-- 부트스트랩 -->
    <link href="/admin/vendor/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 크롬 탭의 아이콘 -->
    <link rel="shortcut icon" href="/files/images/favicon-32x32.png">
    <!-- 내가 만든 css -->
    <link href="/admin/css/admin.css" rel="stylesheet">

</head>

<body>
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->


    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <a href="/main/login_main" class="brand-logo">
                <!-- 굴림 로고 이미지 -->
                <img class="logo-image" src="/files/images/LOGO_white_ver.png" alt="">
            </a>

            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                            <!-- 메뉴 소카테고리 -->
                            <div class="text-uppercase">
                                <ul>
                                    <!-- tab_active: 현재 선택된 메뉴를 보라색 글자로 -->
                                    <li><a href="/admin/view_list" class="tab_active">관리자 글목록</a></li>
                                    <li><a href="/admin/insert_form" class="tab_inactive">글 작성</a></li>
                                  </ul>  
                            </div>
                        </div>

                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown header-profile">
                                    <a href="/main/logout" class="dropdown-item">
                                        <i class="icon-key"></i>
                                        <span class="ml-2">Logout </span>
                                    </a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="quixnav">
            <div class="quixnav-scroll">
                <!-- 메뉴 대카테고리 -->
                <ul class="metismenu" id="menu">
                    <li class="nav-label first">Menu</li>
                    <li><a href="/admin/question"><i
                        class="icon icon-single-04"></i><span class="nav-text">회원 관리</span></a>
                    </li>
                    
                    <li><a href="/admin/place_list"><i
                                class="icon icon-world-2"></i><span class="nav-text">모임장소 관리</span></a>
                    </li>
                    <li><a href="/admin/sales_stats"><i
                                class="icon icon-chart-bar-33"></i><span class="nav-text">판매 관리</span></a>
                    </li>
                    <!-- 현재 선택된 대카테고리 -->
                    <li class="selected_sidebar mm-active-selected"><a href="/admin/view_list"><i
                                class="icon icon-form"></i><span class="nav-text">이벤트 및 공지 관리</span></a>
                    </li>
                    <li><a href="/admin/product_list"><i
                        class="icon icon-plug"></i><span class="nav-text">상품 및 서비스 관리</span></a>
                    </li>
                    <li><a href="/admin/game_stats"><i 
                                class="icon icon-app-store"></i><span class="nav-text">게임 통계</span></a>
                    </li>
                    <li ><a onclick="chat_GPT_open()" class="live_question"><i 
                        class="icon icon-single-copy-06"></i><span class="nav-text">실시간 문의사항</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <!-- 대카테고리 > 소카테고리 -->
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a id="category_big" href="javascript:void(0)"></a></li>
                            <li class="breadcrumb-item active"><a id="category_small" href="javascript:void(0)"></a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->


                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <select id="filter-select" style="border:0px; background-color:#00000000;">
                                    <option>전체보기</option>
                                    <option>공지사항</option>   
                                    <option>이벤트</option>   
                                    <option>공모전</option>   
                                </select>
                            </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <!-- postTable start -->
                                        <table id="example" class="display postTable" style="min-width: 845px">
                                            <thead>
                                                <tr>
                                                    <th id="writeNum">글번호</th>
                                                    <th>게시판</th>
                                                    <th>제목</th>
                                                    <th>등록상태</th>
                                                    <th>게시일</th>
                                                    <th>기간</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- taglib forEach start -->
                                                <c:forEach items="${listPost}" var="lpo">
                                                    <tr class="post-link">
                                                            <%-- 글번호 --%>
                                                            <td name="post_num">${lpo.post_num}</td>
                                                            <%-- 게시판 --%>
                                                            <td>${lpo.board}</td>
                                                            <%-- 제목 --%>
                                                            <td>
                                                                        <c:choose>
                                                                            <%-- post_title이 존재할 경우 post_title을 출력 --%>
                                                                            <c:when test="${not empty lpo.post_title}">
                                                                                ${lpo.post_title}
                                                                            </c:when>
                                                                            <%-- 그 외의 경우(즉, post_title이 없고 contest_title이 존재하는 경우) contest_title을 출력 --%>
                                                                            <c:otherwise>
                                                                                ${lpo.contest_title}
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                            </td>
                                                            <td>
                                                                <select class="selectPost" style="border: 0px; background-color:#ffffff;">
                                                                    <%-- taglib choose start --%>
                                                                    <c:choose>
                                                                        <%-- 등록상태가 게시중일 경우 --%>
                                                                        <c:when test="${lpo.post_state eq 0}">
                                                                            <option selected value="0">게시중</option>
                                                                            <option value="1">게시중단</option>                                                                   
                                                                        </c:when>
                                                                        <%-- 등록상태가 게시중단일 경우 --%>
                                                                        <c:when test="${lpo.post_state eq 1}">
                                                                            <option value="0">게시중</option>
                                                                            <option selected value="1">게시중단</option>                                                               
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <%-- taglib choose end --%>
                                                                </select>
                                                            </td>
                                                            <%-- 게시일 --%>
                                                            <td>${lpo.writing_date}</td>
                                                            <td>
                                                                <%-- taglib choose start --%>
                                                                <c:choose>
                                                                    <%-- 게시 기간이 존재할 경우 --%>
                                                                    <c:when test="${lpo.start_date ne null}">
                                                                        ${lpo.start_date} ~ ${lpo.end_date}                                                                
                                                                    </c:when>
                                                                </c:choose>
                                                                <%-- taglib choose end --%>
                                                            </td>
                                                    </tr>
                                                </c:forEach>
                                                <!-- taglib forEach end -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->


        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <jsp:include page="../admin_footer.jsp"></jsp:include>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->

        <!--**********************************
           Support ticket button start
        ***********************************-->

        <!--**********************************
           Support ticket button end
        ***********************************-->

        
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="/admin/vendor/global/global.min.js"></script>
    <script src="/admin/js/quixnav-init.js"></script>
    <script src="/admin/js/custom.min.js"></script>
    


    <!-- Datatable -->
    <script src="/admin/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/admin/js/plugins-init/datatables.init.js"></script>


    <!-- 관리자 전용 js -->
    <script src="/admin/js/admin.js"></script>

    <script>

        
    </script>

</body>

</html>