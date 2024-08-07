<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mingles Shop</title>

    <!-- 외부파일 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"
    integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- 내부파일 -->
    <link rel="stylesheet" href="../../resources/css/mingle-shop.css">
    <script defer src="../../resources/js/mingle-shop.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="icon" href="../../resources/images/Mingles아이콘-removebg-preview.png">

</head>

<body>

    <div id="wrap">

        <!-- 메인 화면 -->
        <div id="container">

            <div class="contain-box">

                <header>

                    <div class="hd-logos">

                        <div class="logo"><img src="../../resources/images/Mingles로고-움직임-짤.gif" alt=""></div>

                        <div class="hd-title delay1">상점</div>

                    </div>

                    <div class="hd-menus">

                        <div class="menubar">

                            <div>홈피 꾸미기</div>

                            <div>내방 꾸미기</div>

                            <div>아바타 꾸미기</div>

                        </div>

                        <div class="menu-content">

                            <ul>
                                <li id="1-1">스킨</li>
                                <li id="1-2">폰트</li>
                                <li id="1-3">주크박스</li>
                            </ul>

                            <ul>
                                <li id="2-1">벽지</li>
                                <li id="2-2">바닥</li>
                                <li id="2-3">아이템</li>
                            </ul>

                            <ul>
                                <li id="3-1">헤어</li>
                                <li id="3-2">표정</li>
                                <li id="3-3">상의</li>
                                <li id="3-4">하의</li>
                                <li id="3-5">신발</li>
                                <li id="3-6">악세사리</li>
                            </ul>

                        </div>

                    </div>


                </header>

                <content>

                    <div class="content-top">
                        <span class="tag-wrapper">
                            <div id="tag">홈피 꾸미기 - 스킨</div>
                        </span>
                    </div>

                    <div class="content-main">

                        <ul> <!-- 여기 안에 아이템 데이터목록 -->

                            <!-- 이게 template -->
                            <li>

                                <div class="item-container">

                                    <div class="img-box"><img src="../../resources/images/Mingles-움직임.gif" alt=""></div>

                                    <div class="item-detail">
                                        <p class="item-name">백설공주의 유혹</p>
                                        <p class="item-desc">후후.. 너도 나처럼.... Lorem ipsum dolor sit amet consectetur
                                            adipisicing elit. Labore ex aliquid incidunt itaque similique ab, maxime
                                            consequuntur consequatur minima? Sed deleniti quisquam aspernatur,
                                            temporibus minus similique rem accusamus iure perspiciatis?</p>
                                        <p class="item-maker"><span>만든이 : </span>김응애(kimbaby)</p>
                                        <p class="item-date"><span>출시일 : </span>2024/06/04</p>
                                    </div>


                                </div>

                            </li>

                            <li>

                                <div class="item-container">
                                    
                                    <div class="img-box"><img src="../../resources/images/차은우.jpg" alt=""></div>

                                    <div class="item-detail">
                                        <p class="item-name">공주의물약</p>
                                        <p class="item-desc">Lorem ipsum dolor sit amet consectetur
                                            adipisicing elit. Labore ex aliquid incidunt itaque similique ab, maxime
                                            consequuntur consequatur minima? Sed deleniti quisquam aspernatur,
                                            temporibus minus similique rem accusamus iure perspiciatis?</p>
                                        <p class="item-maker"><span>만든이 : </span>김야옹(kimbaby)</p>
                                        <p class="item-date"><span>출시일 : </span>2024/07/04</p>
                                    </div>

                                </div>

                            </li>

                        </ul>

                    </div>

                </content>

                <footer>

                    <div class="pagination-container">

                        <div class="prev-button"><</div>

                        <div class="btn-wrapper">

                            <span class="number-btn">1</span>

                        </div>

                        <div class="next-button">></div>

                    </div>

                </footer>

            </div>
        </div>

    </div>

</body>

</html>