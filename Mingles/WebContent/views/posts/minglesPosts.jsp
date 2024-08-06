<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("loginUser");
%>
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

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <!-- 내부파일 -->
    <link rel="stylesheet" href="../../resources/css/minglePosts.css">
    <script defer src="../../resources/js/minglePosts.js"></script>

</head>

<body>

    <div id="wrap">

        <!-- 메인 화면 -->
        <div id="container">
            <!-- 왼쪽 화면 -->

            <div class="post-list" id="left">
                <div class="left__content" id="con1">
                    <img src="../../resources/images/Mingles아이콘-removebg-preview.png" alt="">
                </div>
                <div class="left__content" id="con2">
                	<% if (m != null) { %>
                    <div id="con2__nickname"><%=m.getNickname() %></div> 
                    <button id= "mailIcon" class="material-icons">mail_outline</button> 
                                    
                    <div id="con2__my_text">제이름은 남도일 탐정입니다. 범인은 검은 쫄쫄이</div>
                    <div id="con2__my_info">
                        <div id="my_info__1" data-toggle="tooltip" title="<%=m.getEmail()%>">이메일</div>
                        <div id="my_info__2" data-toggle="tooltip" title="INTJ">MBTI</div>
                        <div id="my_info__3" data-toggle="tooltip" title="<%=m.getZodiac()%>">별자리</div>
                        <div id="my_info__4" data-toggle="tooltip" title="o형">혈액형</div>
                    </div>
                    <% } %>
                </div>
                <!-- 인기글, 최신글 -->
                <div class="left__content" id="con3">
                    <div class ="post-box" id = "popular">
                        <div class ="sub-title">인기글</div>
                        <ul>
                            <li>뽀ㄷH 퀸ㅋr만 눌러</li>
                            <li>학생○lㄹΓ는 죄로..</li>
                            <li>친구ㄱг무엇을뜻ㅎг는줄○гㄴı¿ </li>
                        </ul>
                    </div>
                    <div class ="post-box" id = "recent">
                        <div class = "sub-title">최신글</div>
                        <ul>
                            <li>ㅂıㄹr는 ㄱł..참 ㅅĿブıㅎŀスl?</li>
                            <li>Øl젠 ⊂よ신을 ズı켜주고 싶습LI⊂ト</li>
                            <li>해피바이러스가 성공적으로 배달되었습니다*^^*</li>
                        </ul>
                    </div>
                </div>
            </div>

            
            <div class="post-list" id="right">
                <div id="post-right__title">
                    <div id="right-title__text">오늘의 일기</div>
                    <div id="right-title__btn">
                        <button><div>글쓰기</div></button>
                    </div>
                </div>
                <div id="post-right__list">
                    <section class="right-list__content">
                        <ul>
                            <li>내용1</li>
                            <li>내용2</li>
                            <li>내용3</li>
                            <li>내용4</li>
                            <li>내용5</li>
                            <li>내용6</li>
                            <li>내용7</li>
                        </ul>

                        <ul>
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