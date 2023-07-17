<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>상품 등록 및 수정</title>
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
    <!-- 관리자 전용 css -->
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
            <a href="/admin/member_management" class="brand-logo">
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
                    <li><a href="/admin/view_list"><i
                                class="icon icon-form"></i><span class="nav-text">이벤트 및 공지 관리</span></a>
                    </li>
                    <!-- 현재 선택된 대카테고리 -->
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
                        <!-- 대카테고리 > 소카테고리 -->
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a id="category_big" href="/admin/product_list"></a></li>
                            <li class="breadcrumb-item active"><a id="category_small" href="/admin/product_list"></a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->


                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">LIST</h4>
                            </div>
                            <form action="" method="POST">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <!-- productTable start -->
                                        <table id="example" class="display productTable" style="min-width: 845px">
                                            <thead>
                                                <tr>
                                                    <th>이미지</th>
                                                    <th>상품명</th>
                                                    <th>상태</th>
                                                    <th style="width:200px;">재고 수량</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- taglib forEach start -->
                                                <c:forEach items="${listProduct}" var="lpr">
                                                    <tr class="product-link">
                                                        <%-- 상품 이미지 --%>
                                                        <td><img width="80" height="80" src="${lpr.path}"/></td>
                                                        <%-- 상품명 --%>
                                                        <td>${lpr.book_title}</td>
                                                        <td>
                                                            <%-- taglib choose start --%>
                                                            <c:choose>
                                                                <%-- 상태가 판매중일 경우 --%>
                                                                <c:when test="${lpr.sale_state eq 0}">
                                                                    <span data-value="0" class="badge badge-success">판매중</span>
                                                                </c:when>
                                                                <%-- 상태 품절일 경우 --%>
                                                                <c:when test="${lpr.sale_state eq 1}">
                                                                    <span data-value="1" class="badge badge-danger">품절</span>
                                                                </c:when>   
                                                            </c:choose>
                                                            <%-- taglib choose end --%>
                                                        </td>
                                                        <%-- 재고 수량 --%>
                                                        <td>${lpr.stock}</td>
                                                    </tr>
                                                </c:forEach>
                                                <!-- taglib forEach end -->
                                                    <tfoot>
                                                        <tr>
                                                            <th colspan="3"></th>
                                                            <th>
                                                                <div style="text-align: right;">
                                                                    <%-- 상품등록 --%>
                                                                    <button class="btn btn-rounded btn-success"><a href="/admin/product_insert" style="color: white;">상품등록</a></button>
                                                                    <%-- 수정 --%>
                                                                    <button class="btn btn-rounded btn-dark"><a href="/admin/product_modify" style="color: white;">수정</a></button>
                                                                </div>
                                                            </th>
                                                        </tr>
                                                    </tfoot>
                                            </tbody>
                                        </table>
                                        <!-- productTable end -->
                                    </div>
                                </div>
                            </form>
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

</body>

</html>