<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>수정</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/admin/images/favicon.png">
    <!-- Daterange picker -->
    <link href="/admin/vendor/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- Clockpicker -->
    <link href="/admin/vendor/clockpicker/css/bootstrap-clockpicker.min.css" rel="stylesheet">
    <!-- asColorpicker -->
    <link href="/admin/vendor/jquery-asColorPicker/css/asColorPicker.min.css" rel="stylesheet">
    <!-- Material color picker -->
    <link href="/admin/vendor/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet">
    <!-- Pick date -->
    <link rel="stylesheet" href="/admin/vendor/pickadate/themes/default.css">
    <link rel="stylesheet" href="/admin/vendor/pickadate/themes/default.date.css">
    <!-- Custom Stylesheet -->
    <link href="/admin/css/style.css" rel="stylesheet">
    <!-- 내가 만든 css -->
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
            <a href="/admin/member_management" class="brand-logo">
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
                            <div class="text-uppercase">
                                <ul>
                                    <li><a href="/admin/question" class="tab_active">상품 등록 및 수정</a></li>
                                  </ul>  
                            </div>
                        </div>

                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown notification_dropdown">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-bell"></i>
                                    <div class="pulse-css"></div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <ul class="list-unstyled">
                                        <li class="media dropdown-item">
                                            <span class="success"><i class="ti-user"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Martin</strong> has added a <strong>customer</strong> Successfully
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="primary"><i class="ti-shopping-cart"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Jennifer</strong> purchased Light Dashboard 2.0.</p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="danger"><i class="ti-bookmark"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Robin</strong> marked a <strong>ticket</strong> as unsolved.
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="primary"><i class="ti-heart"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>David</strong> purchased Light Dashboard 1.0.</p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="success"><i class="ti-image"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong> James.</strong> has added a<strong>customer</strong> Successfully
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                    </ul>
                                    <a class="all-notification" href="#">See all notifications <i
                                            class="ti-arrow-right"></i></a>
                                </div>
                            </li>
                            <li class="nav-item dropdown header-profile">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-account"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a href="./app-profile.html" class="dropdown-item">
                                        <i class="icon-user"></i>
                                        <span class="ml-2">Profile </span>
                                    </a>
                                    <a href="./email-inbox.html" class="dropdown-item">
                                        <i class="icon-envelope-open"></i>
                                        <span class="ml-2">Inbox </span>
                                    </a>
                                    <a href="./page-login.html" class="dropdown-item">
                                        <i class="icon-key"></i>
                                        <span class="ml-2">Logout </span>
                                    </a>
                                </div>
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
                <ul class="metismenu" id="menu">
                    <li class="nav-label first">Menu</li>
                    <!-- <li><a href="index.html"><i class="icon icon-single-04"></i><span class="nav-text">Dashboard</span></a>
                    </li> -->
                    <li><a href="/admin/question"><i
                                class="icon icon-single-04"></i><span class="nav-text">회원 관리</span></a>
                    </li>
                    
                    <li><a href="/admin/place_list"><i
                        class="icon icon-world-2"></i><span class="nav-text">모임장소 관리</span></a>
                    </li>
                    <li><a href="/admin/sales_stats"><i
                                class="icon icon-chart-bar-33"></i><span class="nav-text">판매 관리</span></a>
                    </li>
                    <li><a href="/admin/view_list"><i
                                class="icon icon-form"></i><span class="nav-text">이벤트 및 공지 관리</span></a>
                    </li>

                    <li class="selected_sidebar mm-active-selected"><a href="/admin/product_list"><i
                        class="icon icon-plug"></i><span class="nav-text">상품 및 서비스 관리</span></a>
                    </li>
                    <li><a href="/admin/game_stats"><i 
                                class="icon icon-app-store"></i><span class="nav-text">게임 통계</span></a>
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
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a id="category_big" href="javascript:void(0)"></a></li>
                            <li class="breadcrumb-item active"><a id="category_small" href="javascript:void(0)"></a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0)">수정</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->
                <form action="/admin/product_modify" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name='book_num' value="${getPost.book_num}" readonly>
                    <div class="row">
                        <div class="card col-sm-12 p-md-12">
                            <table>
                                <tr>
                                    <td colspan="2">
                                        <div class="card-body">
                                            <div class="basic-form">
                                                <div class="form-group" style="width: 95%; position: relative; top: 8px;">
                                                    <h5 style="color:black; ">수정</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td colspan="10">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <div class="card-body">
                                            <div class="basic-form">
                                                <div class="form-group" style="width: 95%; position: relative; top: 7px;">
                                                    <p class="mb-1">제목</p>
                                                    <input name="book_title" type="text" class="form-control input-default" value="${getPost.book_title}" placeholder="제목을 입력하시오.">
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td colspan="4">
                                        <div style="position: relative; right: -19px; width: 95%; float: left;">
                                            <p class="mb-1">장르</p>
                                            <input name="genre" type="text" class="form-control input-default" value="${getPost.genre}" placeholder="장르를 입력하시오(ex. 판타지,SF,액션).">
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div style="position: relative; right: -19px; width: 192px; float: left;">
                                            <p class="mb-1">저자</p>
                                            <input name="writer" type="text" class="form-control input-default"value="${getPost.writer}" placeholder="저자 이름을 입력하시오.">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div style="position: relative; right: -18px; width: 250px;">
                                            <p class="mb-1">issue date</p>
                                            <div class="custom-file">
                                                <input name="issue_date" type="date" value="${outputDate}">
                                            </div>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div>
                                            <p class="mb-1">가격</p>
                                            <div class="custom-file">
                                                <input name="price" type="text" class="form-control input-default" value="${getPost.price}" placeholder="가격을 입력하시오.">
                                            </div>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div>
                                            <p class="mb-1">재고수량</p>
                                            <input name="stock" type="text" class="form-control input-default" value="${getPost.stock}" placeholder="재고수량을 입력하시오.">
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div style="position: relative; right: -19px; width: 192px; float: left;">
                                            <p class="mb-1">19금 설정</p>
                                            <select name="adult">
                                                <option value="1" ${getPost.adult == 1 ? 'selected' : ''}>O</option>
                                                <option value="0" ${getPost.adult == 0 ? 'selected' : ''}>X</option>
                                            </select>
                                            <input type="text" value="${getPost.adult}" hidden>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div style="position: relative; right: -19px; width: 192px; float: left;">
                                            <p class="mb-1">판매 여부</p>
                                            <select name="sale_state">
                                                <option value="0" ${getPost.sale_state == 0 ? 'selected' : ''}>판매중</option>
                                                <option value="1" ${getPost.sale_state == 1 ? 'selected' : ''}>판매 중지</option>
                                            </select>
                                            <input type="text" value="${getPost.sale_state}" hidden>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div style="position: relative; right: -19px; width: 192px; float: left;">
                                            <p class="mb-1">역자</p>
                                            <input name="translation" type="text" class="form-control input-default" value="${getPost.translation}" placeholder="역자 이름을 입력하시오.">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="9">
                                        <div class="card-body">
                                            <div class="basic-form">
                                                <div class="form-group" style="width: 95%; position: relative; top: 7px;">
                                                    <p class="mb-1">간단 소개</p>
                                                    <textarea name="simple_info" style="height: 110px;" class="form-control" id="comment" placeholder="간단한 소개글을 입력하시오.">${getPost.simple_info}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="7">
                                        <div style="position: relative; right: -18px; width: 550px;">
                                            <p class="mb-1">이미지 추가</p>
                                            <img id="adminPostPath" src="${getPost.path}">
                                            <div class="custom-file">
                                                <input type="file" name="file" class="custom-file-input" id="adminPostUpdate">
                                                <label class="custom-file-label" for="customFile">JPG, PNG 파일 업로드</label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="9">
                                        <div class="card-body">
                                            <div class="basic-form">
                                                <div class="form-group" style="width: 95%; position: relative; top: 7px;">
                                                    <p class="mb-1">상세 소개</p>
                                                    <textarea name="book_detail" style="height: 210px;" class="form-control" id="comment" placeholder="상세한 소개글을 입력하시오.">${getPost.book_detail}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div style="margin-bottom: 20px; text-align:right; position: relative; right: 19px;">
                                <button type="submit" class="btn btn-outline-dark">수정</button>
                            </div>
                        </div>
                    </div>
                </form>
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