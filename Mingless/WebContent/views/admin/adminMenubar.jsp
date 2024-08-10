<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>adminMenubar</title>
        <!-- bootstrap -->
        <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
        <script
        src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- chart -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <!-- icon -->
        <link
        href="https://fonts.googleapis.com/icon?family=Material+Icons"
        rel="stylesheet">
        <!-- w3 icon -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <!-- reset -->
        <link
        href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css"
        rel="stylesheet">

        <!-- <link rel="stylesheet" href="./views/admin/resources/adminMenubar.css"> -->
        <link href="./views/admin/resources/sb-admin-2.css" rel="stylesheet">
        <script src="./views/admin/resources/adminMenubar.js" defer></script>  
</head>
<body id="page-top">

    <!-- 페이지 래퍼 -->
    <div id="wrapper">

        <!-- 사이드바 -->
        <ul class="navbar-nav bg-gradient-green sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- 사이드바 - 브랜드 -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">    
                </div>
                <div class="logo-wrap animate__animated animate__zoomOut animate__delay-1s">
                    <div class="logo--disappear">
                        <h1 class="animate__animated animate__zoomOut animate__delay-1s">
                            <span>M</span>
                            <span>I</span>
                            <span>N</span>
                            <span>G</span>
                            <span>L</span>
                            <span>E</span>
                            <span>S</span>
                        </h1>
                    </div>
                </div>
            </a>

            <!-- 구분선 -->
            <hr class="sidebar-divider my-0">

            <!-- 네비게이션 항목 - 대시보드 -->
            <li class="nav-item">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-home"></i>
                    <span>메인화면</span></a>
            </li>

            <!-- 구분선 -->
            <hr class="sidebar-divider">

            <!-- 제목 -->
            <!-- <div class="sidebar-heading">
                인터페이스
            </div> -->

            <!-- 네비게이션 항목 - 페이지 접기 메뉴 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-store"></i>
                    <span>상점 관리</span>
                </a>
              
            </li>

            <!-- 네비게이션 항목 - 페이지 접기 메뉴 -->
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true"
                    aria-controls="collapsePages">
                    <i class="fas fa-fw fa-users"></i>
                    <span>회원 관리</span>
                </a>
            </li>

            <!-- 네비게이션 항목 - 차트 -->
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-list"></i>
                    <span>게시글 관리</span></a>
            </li>

            <!-- 네비게이션 항목 - 테이블 -->
            <li class="nav-item">
                <a class="nav-link" href="tables.html" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2"></i>
                    <span>로그아웃</span></a>
            </li>

            <!-- 구분선 -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- 사이드바 토글 버튼 (사이드바) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- 사이드바 끝 -->

        <!-- 콘텐츠 래퍼 -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- 메인 콘텐츠 -->
            <div id="content">

                <!-- 상단바 -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- 사이드바 토글 버튼 (상단바) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- 상단바 네비게이션 -->
                    <ul class="navbar-nav ml-auto">

                        <!-- 네비게이션 항목 - 사용자 정보 -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자님 환영합니다</span>
                                <img class="img-profile rounded-circle"
                                    src="./resources/images/Mingles-removebg-preview.png">
                            </a>
                        </li>

                    </ul>

                </nav>
                <!-- 상단바 끝 -->

                <!-- 시작 페이지 내용 -->
                <div class="container-fluid">

                    <!-- 페이지 헤더 -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">관리자 페이지</h1>
                    </div>

                    <!-- 페이지 콘텐츠 -->
                    <div class="row">
                        <div class="col-lg-5 mb-1">

                            <!-- 페이지 내용 예시 -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">회원 차트</h6>
                                </div>
                                <div class="card-body">
                                    <div class="statisticsUser">
                                        <div>
                                          <canvas id="myChart" width="600" height="300"></canvas>
                                        </div>
                                      </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-xl-5 col-lg-5">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">게시글 차트</h6>
                                </div>
                                <div class="card-body">
                                    <div class="statisticsPost">
                                        <div>
                                          <canvas id="myChart2" width="600" height="300"></canvas>
                                        </div>
                                      </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-5 mb-1">
                            <div class="card shadow mb-6">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">신고 현황</h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>아이디</th>
                                                    <th>신고내용</th>
                                                    <th>신고자</th>
                                                    <th>신고횟수</th>
                                                    <th>가입일</th>
                                                    <th>닉네임</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>누군가</td>
                                                    <td>잘못해서</td>
                                                    <td>신고자</td>
                                                    <td>61</td>
                                                    <td>2011/04/25</td>
                                                    <td>잘못</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>              
                        </div>
                    </div>
                    
                </div>
                <!-- 끝 페이지 내용 -->

            </div>
            <!-- 끝 메인 콘텐츠 -->

        </div>
        <!-- 끝 콘텐츠 래퍼 -->

    </div>
    <!-- 끝 페이지 래퍼 -->

    <!-- 스크롤 버튼 위로 -->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- 로그아웃 모달 -->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">정말 로그아웃하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃할 준비가 되었다면 아래 "로그아웃"을 클릭하세요.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="login.html">로그아웃</a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Core plugin JavaScript-->
    <script src="./views/admin/resources/jquery.easing.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="./views/admin/resources/sb-admin-2.min.js"></script>

</body>
</html>