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
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <!-- 내부파일 -->
    <script src="./resources/js/mingleManagingPosts.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="./resources/css/mingleManagingPosts.css">

</head>

<body>

    <div id="wrap">

        <!-- 메인 화면 -->
        <div id="container">
            <div class="post-list" id="right">
                <div id="post-right__title">
                    <div id="right-title__text">게시글 관리</div>
                    <div id="right-title__btn">
                        <button class="btn-set" id="b1"><span>게시글 수정</span></button>
                        <button class="btn-set" id="b2"><span>게시글 삭제</span></button>
                        <button class="btn-set" id="b3"><span></span></button>
                        <button class="btn-set" id="b4"><span></span></button>
                        <button class="btn-set" id="b5" onclick="history.back()"><span>뒤로가기</span></button>
                    </div>
                </div>
                <div id="post-right__list">
                    <section class="right-list__content">
                        <ul>
                            <input type="checkbox" class="list__check" id="ch1" name="choice" value='selectall' onclick='selectAll(this)'>
                            <li>내용1</li>
                            <li>내용2</li>
                            <li>내용3</li>
                            <li>내용4</li>
                            <li>내용5</li>
                            <li>내용6</li>
                            <li>내용7</li>
                        </ul>

                        <ul>
                            <input type="checkbox" class="list__check" id="ch1" name="choice">
                            <li>내용1</li>
                            <li>내용2</li>
                            <li>내용3</li>
                            <li>내용4</li>
                            <li>내용5</li>
                            <li>내용6</li>
                            <li>내용7</li>
                        </ul>

                        <ul>
                            <input type="checkbox" class="list__check" id="ch2" name="choice">
                            <li>내용1</li>
                            <li>내용2</li>
                            <li>내용3</li>
                            <li>내용4</li>
                            <li>내용5</li>
                            <li>내용6</li>
                            <li>내용7</li>
                        </ul>
                    </section>
                </div>
            </div>
        </div>
    </div>

</body>

</html>