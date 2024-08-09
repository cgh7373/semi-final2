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

        <link rel="stylesheet" href="./views/admin/resources/adminMenubar.css">
        <script src="./views/admin/resources/adminMenubar.js" defer></script>
            </head>
    <body>

        <div id="menuWrap">
            <!-- 뒤로가기버튼 -->
            <!-- <button
                id="menuBack"
                class="rounded-circle"
                style="width: 70px; height: 70px; background-color: white; border: none;">
                <img
                    src="./resources/images/greenpointer.png"
                    style="background-color: white; width: 70%; height: 70%;"> -->
                <!-- 화살표 이미지(->)로 변경, deg(270 제거) -->
            </button>

            <!-- mHead -->
            <div id="mHead">
                <img src="./resources/images/Mingles 로고이미지-짤.png">
            </div>

            <!-- mBody -->
            <div id="mBody">
                <div class="material-icons">home
                    <!-- ./views/common/Mingles.jsp -->
                    <a href="">홈</a>
                </div>
                <div class="material-icons">store
                    <a href="../mingle store admin/store admin.html">상점관리</a>
                </div>
                <div class="material-icons">view_list
                    <a href="../member/mingle-member.html">회원관리</a>
                </div>
                <div class="material-icons">signpost
                    <a href="../mingle post admin/게시글관리.html">게시글관리</a>
                </div>
                <div class="material-icons">logout
                    <a href="javascript:void(0)">로그아웃</a>
                </div>
            </div>
            <!-- mFoot -->
            <div id="mFoot"></div>
        </div>
    </body>
</html>