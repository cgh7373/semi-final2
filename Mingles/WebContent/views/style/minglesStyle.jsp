<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mingles Frame</title>

    <!-- 외부파일 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script defer src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <script defer src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"
        integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- 내부파일 -->
    <link rel="stylesheet" href="../../resources/css/mingle-style.css">
    <script defer src="../../resources/js/mingle-style.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="icon" href="../../resources/images/Mingles아이콘-removebg-preview.png">

</head>

<body>

    <div id="wrap">

        <!-- 메인 화면 -->
        <div id="container">

            <div class="main-left">

                <img src="../../resources/images/Mingles로고-움직임-짤.gif" alt="" class="logo" />

                <div class="float title">방꾸미기</div>

                <span class="style-tag">가구</span>

                <ul class="item-container">

                    <li class="items"><img src="../../resources/images/tb1.PNG" /></li>

                    <li class="items"><img src="../../resources/images/tb2.PNG" /></li>

                </ul>

                <footer>
                    <div class="pagination-container">

                        <div class="prev-button">&lt;</div>

                        <div class="btn-wrapper">

                            <span class="number-btn">1</span>

                        </div>

                        <div class="next-button">&gt;</div>

                    </div>


                </footer>
            </div>


            <div class="main-right">

                <div class="right-wrapper">

                    <div class="style-shop">

                        <div class="bal bal1">
                            <div class="bal-skin">스킨</div>
                            <div class="bal-font">폰트</div>
                            <div class="bal-music">음악</div>
                        </div>

                        <div class="bal bal2">
                            <div class="bal-wall">벽지</div>
                            <div class="bal-floor">바닥</div>
                            <div class="bal-item">아이템</div>
                        </div>

                        <div class="bal bal3">
                            <div class="bal-hair">헤어</div>
                            <div class="bal-face">표정</div>
                            <div class="bal-outer">상의</div>
                            <div class="bal-pants">하의</div>
                            <div class="bal-shoes">신발</div>
                            <div class="bal-accessary">악세사리</div>
                        </div>

                        <div class="catB">
                            <div class="catTitle homepage">홈피</div>
                            <div class="catTitle roomDeco">방꾸미기</div>
                            <div class="catTitle avatar">아바타</div>
                        </div>

                    </div>

                    <div class="vis-room">
                        <!-- <img src="http://i61.photobucket.com/albums/h58/bourniio/cyworld%20backgrounds/030305_wall_01.gif" alt="미니홈피 배경화면"> -->
                    </div>

                    <div class="bot-box">
                        <div class="btn btn1">mingleShop</div>
                        <div class="btn btn2">저장하기</div>
                    </div>

                </div>

            </div>


        </div>

        
    </div>

</body>

</html>