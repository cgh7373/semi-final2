<%@page import="com.kh.admin.model.vo.Blacklist"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<Blacklist> blacklist = (ArrayList<Blacklist>)request.getAttribute("blacklist");
	ArrayList<Integer> memberCount = (ArrayList<Integer>)request.getAttribute("memberCount");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
	String errorMsg = (String)session.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>adminMenubar</title>
        <!-- bootstrap -->
        <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
        <!-- tagify -->
        <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
        <link
            href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css"
            rel="stylesheet"
            type="text/css"/>
        <!-- sweetalert -->
        <script defer src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!-- reset -->
        <link
        href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css"
        rel="stylesheet">
        <!-- 내부파일 -->
        <link href="./views/admin/resources/admin.css" rel="stylesheet">                 
        <script src="./views/admin/resources/admin.js" defer></script>
        <script src="./views/admin/resources/adminJq.js" defer></script>
</head>
<body id="page-top">
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		// 성공메시지
        <% if (alertMsg != null) { %>
            swal({
            icon: 'success',
            title: '<%=alertMsg%>',
            });
        <% session.removeAttribute("alertMsg"); %>
        <% } %>

        <% if (errorMsg != null) { %>
            swal({
            icon: 'error',
            title: '<%=errorMsg%>',
            });
        <% session.removeAttribute("errorMsg"); %>
        <% } %>
        });
	
        window.addEventListener('message', function(event) {
            if (event.data === 'membershipCanceled') {
                scrollToSection(0); 
            }
        });
	</script>
    <!-- 페이지 래퍼 -->
    <div id="wrapper">

        <!-- 사이드바 -->
        <ul class="navbar-nav bg-gradient-green sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- 사이드바 - 브랜드 -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=contextPath%>/login.me?userId=<%=loginUser.getMemId()%>&userPwd=<%=loginUser.getMemPwd()%>">
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
                <a class="nav-link" href="<%=contextPath%>/main.am">
                    <i class="fas fa-fw fa-home"></i>
                    <span>메인화면</span></a>
            </li>

            <!-- 구분선 -->
            <hr class="sidebar-divider">


            <!-- 네비게이션 항목 - 페이지 접기 메뉴 -->
            <li class="nav-item">
                <a class="nav-link" href="<%=contextPath%>/store.am">
                    <i class="fas fa-fw fa-store"></i>
                    <span>상점 관리</span>
                </a>
              
            </li>

            <!-- 네비게이션 항목 - 페이지 접기 메뉴 -->
            <li class="nav-item">
                <a class="nav-link" href="<%=contextPath%>/member.am?cpage=1">
                    <i class="fas fa-fw fa-users"></i>
                    <span>회원 관리</span>
                </a>
            </li>

            <!-- 네비게이션 항목 - 차트 -->
            <li class="nav-item">
                <a class="nav-link" href="<%=contextPath%>/post.am">
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
		

    </div>

    <!-- 스크롤 버튼 위로 -->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
</body>
</html>