<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>판매 통계</title>
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
                                    <li><a href="/admin/sales_stats" class="tab_active">판매 통계</a></li>
                                    <li><a href="/admin/delivery_refund" class="tab_inactive">환불</a></li>
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
                    <li class="selected_sidebar mm-active-selected"><a href="/admin/sales_stats"><i
                                class="icon icon-chart-bar-33"></i><span class="nav-text">판매 관리</span></a>
                    </li>
                    <li><a href="/admin/view_list"><i
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
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a id="category_big" href="javascript:void(0)"></a></li>
                            <li class="breadcrumb-item active"><a id="category_small" href="javascript:void(0)"></a></li>
                        </ol>
                    </div>
                </div>

                <table class="ssyTable" hidden>
                    <tbody>
                        <c:forEach items="${salesStatsYear}" var="ssy">
                            <tr class="ssy-link">
                                <td>${ssy.purchase_year}</td>
                                <td>${ssy.total_book_price}</td>
                                <td>${ssy.total_subscribe_price}</td>
                                <td>${ssy.total_price}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="ssysTable" hidden>
                    <tbody>
                        <c:forEach items="${salesStatsYear_subs}" var="ssys">
                            <tr class="ssys-link">
                                <td>${ssys.sub_date}</td>
                                <td>${ssys.price}</td>
                                <td>${ssys.total_subscribe_price}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="ssybTable" hidden>
                    <tbody>
                        <c:forEach items="${salesStatsYear_book}" var="ssyb">
                            <tr class="ssyb-link">
                                <td>${ssyb.purchase_date}</td>
                                <td>${ssyb.book_title}</td>
                                <td>${ssyb.total_book_price}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>


                <!-- row -->

                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-lg-7 col-sm-7">
                                <div class="card">
                                    <div class="card-header">
                                        <button id="btn_year" class="btn btn-outline-dark">전체</button>
                                        <button id="btn_year_subscribe" class="btn btn-outline-primary">구독권</button>
                                        <button id="btn_year_book" class="btn btn-outline-danger">설정집</button>                                        
                                        <a style="user-select: none; cursor: not-allowed; pointer-events: none; color: rgba(0, 0, 0, 0.00);">gulim</a>
                                        <a class="col-7"></a>
                                    </div>
                                    <div class="card-body">
                                        <div>
                                            <h6 class="h6_year" style="color:black;">2023년 연매출</h6>
                                        </div>
                                        <div id="line_chart_2" class="morris_chart_height"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5 col-sm-5">
                                <div class="card">
                                    <div class="card-header">
                                        <button id="btn_day" class="btn btn-outline-dark">전체</button>
                                        <button id="btn_day_subscribe" class="btn btn-outline-primary">구독권</button>
                                        <button id="btn_day_book" class="btn btn-outline-danger">설정집</button>  
                                        <a class="col-2"></a>
                                        <input style="border:none; background-color: #F5F5F5;" type="date" id="selectDay">
                                    </div>
                                    <div class="card-body">
                                        <div>
                                            <h6 class="h6_day" style="color:black;"></h6>
                                        </div>
                                        <div id="morris_donught" class="morris_chart_height"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-sm-12">
                                <div class="card">
                                    <div class="card-header">
                                        <button id="btn_month" class="btn btn-outline-dark">전체</button>
                                        <button id="btn_month_subscribe" class="btn btn-outline-primary">구독권</button>
                                        <button id="btn_month_book" class="btn btn-outline-danger">설정집</button>                                        
                                        <a class="col-8"></a>
                                        <select class="selectYear" id="selectYear_month">
                                            <c:forEach items="${selectYear_mon}" var="sym">
                                                <option value="${sym.selectedYear}">${sym.selectedYear}</option>
                                            </c:forEach>
                                        </select>
                                        <a class="col-1"></a>
                                    </div>
                                    <div class="card-body">
                                        <div>
                                            <h6 class="h6_month" style="color:black;">2023년 월매출</h6>
                                        </div>
                                        <div id="morris_bar_2" class="morris_chart_height"></div>
                                    </div>
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
    <script src="./vendor/global/global.min.js"></script>
    <script src="./js/quixnav-init.js"></script>
    <script src="./js/custom.min.js"></script>
    

    <!-- Chart Morris plugin files -->
    <script src="./vendor/raphael/raphael.min.js"></script>
    <script src="./vendor/morris/morris.min.js"></script>
    <script src="./js/plugins-init/morris-init.js"></script>

    <!-- 관리자 차트 전용 js -->
    <script src="/admin/js/adminChart.js"></script>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    
</body>

</html>