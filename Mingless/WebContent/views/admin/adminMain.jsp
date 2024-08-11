<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>adminMain</title>
</head>
<body id="page-top">

    <!-- 페이지 래퍼 -->
    <div id="wrapper">

        <%@include file="./adminMenubar.jsp" %>

        <!-- 콘텐츠 래퍼 -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- 메인 콘텐츠 -->
            <div id="content">
                <!-- 상단바 -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- 상단바 네비게이션 -->
                    <ul class="navbar-nav ml-auto">
                        <!-- 네비게이션 항목 - 사용자 정보 -->
                        <li class="nav-item no-arrow">
                            <a class="nav-link" href="#" id="userDropdown">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자님 환영합니다</span>
                                <img class="img-profile rounded-circle"
                                    src="./resources/images/Mingles-removebg-preview.png">
                            </a>
                        </li>
                    </ul>
                </nav>

                <!-- 시작 페이지 내용 -->
                <div class="container-fluid">

                    <!-- 페이지 헤더 -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">관리자 페이지</h1>
                    </div>

                    <!-- 페이지 콘텐츠 -->
                    <div class="row">
                        <div class="col-lg-5 mb-1">

                            <!-- 차트 -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">회원 차트</h6>
                                </div>
                                <div class="card-body">
                                    <div class="statisticsUser">
                                        <div>
                                          <canvas id="myChart" class="col-lg-12" ></canvas>
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
                                          <canvas id="myChart2" class="col-lg-12"></canvas>
                                        </div>
                                      </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-10 mb-1">
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
                                                    <th>닉네임</th>
                                                    <th>신고사유</th>
                                                    <th>신고횟수</th>
                                                    <th>신고자</th>
                                                    <th>신고날짜</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>누군가</td>
                                                    <td>누군가닉네임</td>
                                                    <td>잘못해서~~~~~~~~~~~~~~</td>
                                                    <td>61</td>
                                                    <td>신고자</td>
                                                    <td>2024/09/25</td>
                                                </tr>
                                                  <tr>
                                                    <td>누군가</td>
                                                    <td>누군가닉네임</td>
                                                    <td>잘못해서~~~~~~~~~~~~~~</td>
                                                    <td>61</td>
                                                    <td>신고자</td>
                                                    <td>2024/09/25</td>
                                                </tr>
                                 				<tr>	
                                                    <td>누군가</td>
                                                    <td>누군가닉네임</td>
                                                    <td>잘못해서~~~~~~~~~~~~~~</td>
                                                    <td>61</td>
                                                    <td>신고자</td>
                                                    <td>2024/09/25</td>
                                                </tr>
                                      
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>              
                        </div>
                    </div>
                    
                </div>

            </div>

        </div>

    </div>

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
                <div class="modal-body">로그아웃을 원하면 아래 "로그아웃"을 클릭하세요.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-danger" href="login.html">로그아웃</a>
                </div>
            </div>
        </div>
    </div>
    <script>
	    window.onload = function() {
	        const url = window.location.href;
	        const urlWithoutQueryString = window.location.origin + window.location.pathname;
	
	        // 현재 URL이 쿼리 문자열을 포함하고 있는지 확인합니다.
	        if (url !== urlWithoutQueryString) {
	            // 쿼리 문자열이 제거된 URL로 브라우저의 URL을 업데이트합니다.
	            window.history.replaceState({}, document.title, urlWithoutQueryString);
	        }
	    };
    </script>
</body>
</html>