<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width,initial-scale=1">
            <title>글 작성 </title>
            <!-- Favicon icon -->
            <link rel="icon" type="image/png" sizes="16x16" href="/admin/images/favicon.png">
            <!-- Daterange picker -->
            <link href="/admin/vendor/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
            <!-- Clockpicker -->
            <link href="/admin/vendor/clockpicker/css/bootstrap-clockpicker.min.css" rel="stylesheet">
            <!-- asColorpicker -->
            <link href="/admin/vendor/jquery-asColorPicker/css/asColorPicker.min.css" rel="stylesheet">
            <!-- Material color picker -->
            <link href="/admin/vendor/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css"
                rel="stylesheet">
            <!-- Pick date -->
            <link rel="stylesheet" href="/admin/vendor/pickadate/themes/default.css">
            <link rel="stylesheet" href="/admin/vendor/pickadate/themes/default.date.css">
            <!-- Custom Stylesheet -->
            <link href="/admin/css/style.css" rel="stylesheet">
            <!-- 관리자 전용 css -->
            <link href="/admin/css/admin.css" rel="stylesheet">
            <!-- Summernote -->
            <link href="/admin/vendor/summernote/summernote.css" rel="stylesheet">
            <!-- 크롬 탭의 아이콘 -->
            <link rel="shortcut icon" href="/files/images/favicon-32x32.png">
            <!-- 부트스트랩 -->
            <link href="/admin/vendor/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">


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
                                            <li><a href="/admin/view_list" class="tab_inactive">관리자 글목록</a></li>
                                            <!-- tab_active: 현재 선택된 메뉴를 보라색 글자로 -->
                                            <li><a href="/admin/insert_form" class="tab_active">글 작성</a></li>
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
                            <li><a href="/admin/question"><i class="icon icon-single-04"></i><span class="nav-text">회원 관리</span></a>
                            </li>

                            <li><a href="/admin/place_list"><i class="icon icon-world-2"></i><span class="nav-text">모임장소 관리</span></a>
                            </li>
                            <li><a href="/admin/sales_stats"><i class="icon icon-chart-bar-33"></i><span  class="nav-text">판매 관리</span></a>
                            </li>
                            <!-- 현재 선택된 대카테고리 -->
                            <li class="selected_sidebar mm-active-selected"><a href="/admin/view_list"><i class="icon icon-form"></i><span class="nav-text">이벤트 및 공지 관리</span></a>
                            </li>
                            <li><a href="/admin/product_list"><i class="icon icon-plug"></i><span class="nav-text">상품 및 서비스 관리</span></a>
                            </li>
                            <li><a href="/admin/game_stats"><i class="icon icon-app-store"></i><span class="nav-text">게임 통계</span></a>
                            </li>
                            <li ><a href="/admin/live_question" class="live_question"><i 
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
                                    <li class="breadcrumb-item"><a id="category_big" href="/admin/view_list"></a></li>
                                    <li class="breadcrumb-item active"><a id="category_small"
                                            href="/admin/insert_form"></a></li>
                                </ol>
                            </div>
                        </div>
                        <!-- row -->
                        <!-- form 태그(POST) start -->
                        <div class="row">
                            <div class="card col-sm-7 p-md-12">
                                <form action="/admin/insert_form/noContest" method="POST">
                                    <div id="announceOrEvent">
                                        <table>
                                            <tr>
                                                <td colspan="2">
                                                    <div style="position: relative; top:14px; right: -19px; width: 192px; float: left;">
                                                        <!-- 게시판 종류 선택 -->
                                                        <p class="mb-1">게시판 종류</p>
                                                        <select name="board" id="inputState_noContest"
                                                            class="form-control">
                                                            <option value="공지사항">공지사항</option>
                                                            <option value="이벤트">이벤트</option>
                                                            <option value="공모전">공모전</option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td colspan="10"></td>
                                            </tr>
                                        </table>
                                        <table>
                                            <tr>
                                                <td colspan="9">
                                                    <div class="card-body">
                                                        <div class="basic-form">
                                                            <div class="form-group"
                                                                style="width: 95%; position: relative; top: 7px;">
                                                                <!-- 게시글 제목 입력 -->
                                                                <p class="mb-1">제목</p>
                                                                <input type="text" name="post_title" class="form-control input-default" placeholder="제목을 입력하시오.">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="11">
                                                    <div class="card-body">
                                                        <!-- 게시글 본문 내용 입력 -->
                                                        <p class="mb-1">본문 내용</p>
                                                        <textarea name="post_content" class="summernote"></textarea>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <div
                                            style="margin-bottom: 20px; text-align:right; position: relative; right: 19px;">
                                            <!-- 글 작성 버튼 -->
                                            <button type="submit" class="btn btn-outline-success">글 작성</button>
                                        </div>
                                    </div>
                                </form>
                                <form action="/admin/insert_form/yesContest" method="POST">
                                    <div id="justContest" hidden>
                                        <table>
                                            <tr>
                                                <td colspan="2">
                                                    <div style="position: relative; top:14px; right: -19px; width: 192px; float: left;">
                                                        <!-- 게시판 종류 선택 -->
                                                        <p class="mb-1">게시판 종류</p>
                                                        <select name="board" id="inputState_yesContest"
                                                            class="form-control">
                                                            <option value="공지사항">공지사항</option>
                                                            <option value="이벤트">이벤트</option>
                                                            <option value="공모전">공모전</option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td colspan="10"></td>
                                            </tr>
                                        </table>
                                        <table>
                                            <tr>
                                                <td colspan="9">
                                                    <div class="card-body">
                                                        <div class="basic-form">
                                                            <div class="form-group" style="width: 95%; position: relative; top: 7px;">
                                                                <!-- 게시글 제목 입력 -->
                                                                <p class="mb-1">제목</p>
                                                                <input type="text" name="contest_title"
                                                                    class="form-control input-default"
                                                                    placeholder="제목을 입력하시오.">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <div class="card-body"
                                                        style="position: relative; right: -18px; width: 230px;">
                                                        <!-- 공모전의 시작일 설정 -->
                                                        <p class="mb-1">시작일</p>
                                                        <input type="date" style="border:none; background-color: #F5F5F5;" name="start_date" placeholder="시작일 선택">
                                                    </div>
                                                </td>
                                                <td colspan="2">
                                                    <div class="card-body" style="width: 230px;">
                                                        <!-- 공모전의 종료일 설정 -->
                                                        <p class="mb-1">종료일</p>
                                                        <input type="date" style="border:none; background-color: #F5F5F5;" name="end_date" placeholder="종료일 선택">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="11">
                                                    <div class="card-body">
                                                        <!-- 게시글 본문 내용 입력 -->
                                                        <p class="mb-1">본문 내용</p>
                                                        <textarea name="contest_content" class="summernote"></textarea>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <div style="margin-bottom: 20px; text-align:right; position: relative; right: 19px;">
                                            <!-- 글 작성 버튼 -->
                                            <button type="submit" class="btn btn-outline-success">글 작성</button>
                                        </div>
                                    </div>
                                </form>
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
            <script src="./vendor/global/global.min.js"></script>
            <script src="./js/quixnav-init.js"></script>
            <script src="./js/custom.min.js"></script>



            <!-- Daterangepicker -->
            <!-- momment js is must -->
            <script src="./vendor/moment/moment.min.js"></script>
            <script src="./vendor/bootstrap-daterangepicker/daterangepicker.js"></script>
            <!-- clockpicker -->
            <script src="./vendor/clockpicker/js/bootstrap-clockpicker.min.js"></script>
            <!-- asColorPicker -->
            <script src="./vendor/jquery-asColor/jquery-asColor.min.js"></script>
            <script src="./vendor/jquery-asGradient/jquery-asGradient.min.js"></script>
            <script src="./vendor/jquery-asColorPicker/js/jquery-asColorPicker.min.js"></script>
            <!-- Material color picker -->
            <script src="./vendor/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
            <!-- pickdate -->
            <script src="./vendor/pickadate/picker.js"></script>
            <script src="./vendor/pickadate/picker.time.js"></script>
            <script src="./vendor/pickadate/picker.date.js"></script>



            <!-- Daterangepicker -->
            <script src="./js/plugins-init/bs-daterange-picker-init.js"></script>
            <!-- Clockpicker init -->
            <script src="./js/plugins-init/clock-picker-init.js"></script>
            <!-- asColorPicker init -->
            <script src="./js/plugins-init/jquery-asColorPicker.init.js"></script>
            <!-- Material color picker init -->
            <script src="./js/plugins-init/material-date-picker-init.js"></script>
            <!-- Pickdate -->
            <script src="./js/plugins-init/pickadate-init.js"></script>

            <!-- Summernote -->
            <script src="./vendor/summernote/js/summernote.min.js"></script>
            <!-- Summernote init -->
            <script src="./js/plugins-init/summernote-init.js"></script>



            <!-- 관리자 전용 js -->
            <script src="/admin/js/adminChart.js"></script>


        </body>

        </html>