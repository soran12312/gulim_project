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
                                    <li><a href="/admin/sales_stats" class="tab_inactive">판매 통계</a></li>
                                    <li><a href="/admin/delivery_refund" class="tab_active">환불</a></li>
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
                                <h4 class="card-title">LIST</h4>
                            </div>
                            <form action="" method="POST">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="example" class="display refundTable" style="min-width: 845px">
                                            <thead>
                                                <tr>
                                                    <th id="orderNum">주문번호</th>
                                                    <th>ID</th>
                                                    <th>주문일자</th>
                                                    <th>상품명</th>
                                                    <th>사용자</th>
                                                    <th>상태</th>
                                                    <th>결제금액</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listRefund}" var="lf">
                                                    <tr class="refund-link">
                                                        <td>${lf.basket_num}</td>
                                                        <td>${lf.id}</td>
                                                        <td>${lf.purchase_date}</td>
                                                        <td>${lf.book_title}</td>
                                                        <td>${lf.id}</td>
                                                        <td>
                                                            <select class="selectRefund" style="border: 0px; background-color:#ffffff;">
                                                                <c:choose>
                                                                    <c:when test="${lf.delivery_state eq '배송대기'}">
                                                                        <option selected value="배송대기">배송대기</option>
                                                                        <option value="배송완료">배송완료</option>  
                                                                        <option value="반품신청">반품신청</option>
                                                                        <option value="반품완료">반품완료</option>                                                                        
                                                                    </c:when>
                                                                    <c:when test="${lf.delivery_state eq '배송완료'}">
                                                                        <option value="배송대기">배송대기</option>
                                                                        <option selected value="배송완료">배송완료</option>  
                                                                        <option value="반품신청">반품신청</option>
                                                                        <option value="반품완료">반품완료</option>                                                                        
                                                                    </c:when>
                                                                    <c:when test="${lf.delivery_state eq '반품신청'}">
                                                                        <option value="배송대기">배송대기</option>
                                                                        <option value="배송완료">배송완료</option>  
                                                                        <option selected value="반품신청">반품신청</option>
                                                                        <option value="반품완료">반품완료</option>                                                                        
                                                                    </c:when>
                                                                    <c:when test="${lf.delivery_state eq '반품완료'}">
                                                                        <option value="배송대기">배송대기</option>
                                                                        <option value="배송완료">배송완료</option>  
                                                                        <option value="반품신청">반품신청</option>
                                                                        <option selected value="반품완료">반품완료</option>                                                                        
                                                                    </c:when>
                                                                </c:choose>
                                                            </select>
                                                        </td>
                                                        <td>${lf.price}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
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