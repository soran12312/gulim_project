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
    <link rel="stylesheet" href="./vendor/chartist/css/chartist.min.css">

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
                                    <li><a href="/admin/question" class="tab_active">게임 통계</a></li>
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
                    <li><a href="/admin/sales_stats"><i
                                class="icon icon-chart-bar-33"></i><span class="nav-text">판매 관리</span></a>
                    </li>
                    <li><a href="/admin/view_list"><i
                                class="icon icon-form"></i><span class="nav-text">이벤트 및 공지 관리</span></a>
                    </li>

                    <li><a href="/admin/product_list"><i
                                class="icon icon-plug"></i><span class="nav-text">상품 및 서비스 관리</span></a>
                    </li>
                    <li class="selected_sidebar mm-active-selected"><a href="/admin/game_stats"><i 
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

                <!-- data -->
                <table class="prbTable" hidden>
                    <tbody>
                        <c:forEach items="${playedRuleBook}" var="prb">
                            <tr class="prb-link">
                                <td>${prb.play_rull}</td>
                                <td>${prb.count_play_rull}</td>                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="ptTable" hidden>
                    <tbody>
                        <c:forEach items="${playedTime}" var="pt">
                            <tr class="pt-link">
                                <td>${pt.play_period}</td>
                                <td>${pt.count_play_period}</td>                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="pgTable" hidden>
                    <tbody>
                        <c:forEach items="${playedGm}" var="pg">
                            <tr class="pg-link">
                                <td>${pg.master}</td>
                                <td>${pg.count_master}</td>                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="pcTable" hidden>
                    <tbody>
                        <c:forEach items="${playedClass}" var="pc">
                            <tr class="pc-link">
                                <td>${pc.play_class}</td>
                                <td>${pc.count_play_class}</td>                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="pgenTable" hidden>
                    <tbody>
                        <c:forEach items="${playedGenre}" var="pgen">
                            <tr class="pgen-link">
                                <td>${pgen.play_genre}</td>
                                <td>${pgen.count_play_genre}</td>                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="psTable" hidden>
                    <tbody>
                        <c:forEach items="${playedSpecies}" var="ps">
                            <tr class="ps-link">
                                <td>${ps.play_species}</td>
                                <td>${ps.count_play_species}</td>                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="wgenTable" hidden>
                    <tbody>
                        <c:forEach items="${wantedGenre}" var="wgen">
                            <tr class="wgen-link">
                                <td>${wgen.want_genre}</td>
                                <td>${wgen.count_want_genre}</td>                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="osTable" hidden>
                    <tbody>
                        <c:forEach items="${otherSite}" var="os">
                            <tr class="os-link">
                                <td>${os.other_site}</td>
                                <td>${os.count_other_site}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="pfsTable" hidden>
                    <tbody>
                        <c:forEach items="${preferredPropensity}" var="pfs">
                            <tr class="pfs-link">
                                <td>${pfs.char_propensity}</td>
                                <td>${pfs.count_char_propensity}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="pfcTable" hidden>
                    <tbody>
                        <c:forEach items="${preferredClass}" var="pfc">
                            <tr class="pfc-link">
                                <td>${pfc.char_class}</td>
                                <td>${pfc.count_char_class}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="pfspTable" hidden>
                    <tbody>
                        <c:forEach items="${preferredSpecies}" var="pfsp">
                            <tr class="pfsp-link">
                                <td>${pfsp.species}</td>
                                <td>${pfsp.count_species}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <table class="pfstTable">
                    <tbody id="pfstTableBody">
                        <c:forEach items="${preferredStatsByClasses}" var="pfsc">
                            <tr class="pfsc-link">
                                <td>${pfsc.avg_str}</td>
                                <td>${pfsc.avg_dex}</td>
                                <td>${pfsc.avg_con}</td>
                                <td>${pfsc.avg_intelligence}</td>
                                <td>${pfsc.avg_wis}</td>
                                <td>${pfsc.avg_chr}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>


                <!-- row -->

                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-lg-6 col-sm-6">
                                <div class="card">
                                    <div class="card-header surveyButton">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td colspan="3">
                                                        <button id="btn_quarter" class="btn btn-outline-dark btn-prb">플레이해본 룰북</button>
                                                    </td>
                                                    <td colspan="3">
                                                        <button id="btn_quarter_product" class="btn btn-outline-dark btn-pt">플레이해본 시간</button>
                                                    </td>
                                                    <td colspan="3">
                                                        <button id="btn_quarter_subscribe" class="btn btn-outline-dark btn-pg">마스터 플레이 횟수</button>
                                                    </td>
                                                    <td colspan="3">
                                                        <button id="btn_quarter_book" class="btn btn-outline-dark btn-pc">플레이해본 직업</button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <button id="btn_quarter" class="btn btn-outline-dark btn-pgen">플레이해본 장르</button>
                                                    </td>
                                                    <td colspan="3">
                                                        <button id="btn_quarter_product" class="btn btn-outline-dark btn-ps">플레이해본 종족</button>
                                                    </td>
                                                    <td colspan="3">
                                                        <button id="btn_quarter_subscribe" class="btn btn-outline-dark btn-wgen">플레이해보고 싶은 장르</button>
                                                    </td>
                                                    <td colspan="3">
                                                        <button id="btn_quarter_book" class="btn btn-outline-dark btn-os">다른 사이트 이용 경험</button>
                                                    </td> 
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="card-body">
                                        <div>
                                            <h6 style="color:black;">2023년 월매출</h6>
                                        </div>
                                        <div id="simple-pie" class="ct-chart ct-golden-section simple-pie-chart-chartist"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-sm-6">
                                <div class="card">
                                    <div class="card-header flavorButton">
                                        <table>
                                            <tbody>
                                                <tr>   
                                                    <td colspan="3">
                                                        <button id="btn_quarter" class="btn btn-outline-dark btn-pfs">플레이어 선호</button>
                                                    </td>
                                                    <td colspan="3">
                                                        <button id="btn_quarter_product" class="btn btn-outline-dark btn-pfc">직업 선호</button>
                                                    </td>
                                                    <td colspan="3">    
                                                        <button id="btn_quarter_subscribe" class="btn btn-outline-dark btn-pfsp">종족 선호</button>
                                                    </td>
                                                    <td colspan="3">
                                                        <button id="btn_quarter_book" class="btn btn-outline-dark btn-pfst">직업에 따른 스탯 선호</button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>    
                                    </div>
                                    <div class="card-body">
                                        <div>
                                            <h6 style="color:black;">2023년 월매출</h6>
                                        </div>
                                        <div>
                                            <select name="char_class" id="class-select" class="hide-class-select" style="border:0px; background-color:#00000000;">
                                                <c:forEach items="${classForStats}" var="cfs">
                                                    <option value="${cfs.char_class}">${cfs.char_class}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div id="simple-pie2" class="ct-chart ct-golden-section simple-pie-chart-chartist"></div>
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
    


        <!-- Chart Chartist plugin files -->
        <script src="./vendor/chartist/js/chartist.min.js"></script>
        <script src="./vendor/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
        <script src="./js/plugins-init/chartist-init.js"></script>

    <!-- 관리자 전용 js -->
    <script src="/admin/js/adminChart.js"></script>

</body>

</html>