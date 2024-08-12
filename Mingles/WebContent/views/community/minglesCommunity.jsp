<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mingles Community</title>
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
        <!-- swiper -->
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>

        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <!-- style -->
        <style>
            
        </style>
        <!-- reset -->
        <link
            href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css"
            rel="stylesheet">

        <link rel="stylesheet" href="../../resources/css/mingle-community.css">
        <script src="../../resources/js/mingle-community.js" defer="defer"></script>

    </head>

    <body>

        <div id="wrap">

            <!-- 메인 화면 -->
            <div id="container">
                <!-- TAG -->
                <header class="tag">
                    <div class="tagList">
                        <div class="swiper">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide btn btn--tag color-7"># 태그1</div>
                                <div class="swiper-slide btn btn--tag color-7"># 태그2</div>
                                <div class="swiper-slide btn btn--tag color-7"># 태그3</div>
                                <div class="swiper-slide btn btn--tag color-7"># 태그4</div>
                                <div class="swiper-slide btn btn--tag color-7"># 태그5</div>
                                <div class="swiper-slide btn btn--tag color-7"># 태그6</div>
                                <div class="swiper-slide btn btn--tag color-7"># 태그7</div>
                                <div class="swiper-slide btn btn--tag color-7"># 태그8</div>
                                <div class="swiper-slide btn btn--tag color-7"># 태그9</div>
                                <div class="swiper-slide btn btn--tag color-7"># 태그10</div>
                            </div>
                        </div>
                    </div>
                </header>

                <section class="homepage">
                    <div class="showHomefield">
                        <div class="slide-title--homepage">
                          <h5>
                            <span>미</span>
                            <span>니</span>
                            <span>홈</span>
                            <span>피</span>
                          </h5>
                        </div>
                        <div class="swiper">
                            <div class="swiper-wrapper">
                                <a href="/" class="swiper-slide"><img src="../../resources/images/030305_wall_01.gif"/></a>
                                <a href="/" class="swiper-slide"><img src="../../resources/images/030305_wall_01.gif"/></a>
                                <a href="/" class="swiper-slide"><img src="../../resources/images/030305_wall_01.gif"/></a>
                                <a href="/" class="swiper-slide"><img src="../../resources/images/030305_wall_01.gif"/></a>
                                <a href="/" class="swiper-slide"><img src="../../resources/images/030305_wall_01.gif"/></a>
                                <a href="/" class="swiper-slide"><img src="../../resources/images/030305_wall_01.gif"/></a>
                                <a href="/" class="swiper-slide"><img src="../../resources/images/030305_wall_01.gif"/></a>
                            </div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                    </div>
                </section>
                <section class="popularPost">
                    <div class="showPopularPost">
                        <div class="slide-title--homepage">
                          <h5>
                            <span>인</span>
                            <span>기</span>
                            <span>게</span>
                            <span>시</span>
                            <span>물</span>
                          </h5>
                        </div>
                        <div class="swiper">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><img src="../../resources/images/게시글사진.webp"/></div>
                                <div class="swiper-slide"><div class="text--post--title">게시글1</div><div class="text--post--content">내용</div></div>
                                <div class="swiper-slide"><img src="../../resources/images/게시글사진.webp"/></div>
                                <div class="swiper-slide"><div class="text--post">게시글2</div><div class="text--post--content">내용</div></div>
                                <div class="swiper-slide"><img src="../../resources/images/게시글사진.webp"/></div>
                                <div class="swiper-slide"><div class="text--post">게시글3</div><div class="text--post--content">내용</div></div>
                                <div class="swiper-slide"><img src="../../resources/images/게시글사진.webp"/></div>
                            </div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                        
                    </div>
                </section>
            </div>

            
        </div>

    </body>

</html>