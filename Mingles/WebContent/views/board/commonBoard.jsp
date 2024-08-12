<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("loginUser");
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
	String errorMsg = (String)session.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 외부파일 -->
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script defer src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script defer src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"
        integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script defer src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="./resources/css/commonBoard.css">
    <script defer src="./resources/js/commonBoard.js"></script>
</head>
<body>

	<!-- 게시글 관련 파일 만들때 이거 통으로 복붙한다음에 만들어요 절대 이파일은 수정하지 말것 -->

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
	</script>
	
	 <div id="wrap">
        <div id="container">
            <!-- Left Screen -->
            <div class="post-list" id="left">
                <div class="left__content" id="con1">
                    <img src="./resources/images/Mingles아이콘-removebg-preview.png" alt="">
                </div>
                <div class="left__content" id="con2">
                    <% if (m != null) { %>
                    <div id="con2__nickname"><%= m.getNickname() %></div>
                    <button id="mailIcon" class="material-icons">mail_outline</button>
                    <div id="con2__my_text">제이름은 남도일 탐정입니다. 범인은 검은 쫄쫄이</div>
                    <div id="con2__my_info">
                        <div id="my_info__1" data-toggle="tooltip" title="<%= m.getEmail() %>">이메일</div>
                        <div id="my_info__2" data-toggle="tooltip" title="<%= m.getMBTI() %>">MBTI</div>
                        <div id="my_info__3" data-toggle="tooltip" title="<%= m.getZodiac() %>">별자리</div>
                        <div id="my_info__4" data-toggle="tooltip" title="<%= m.getABO() %>">혈액형</div>
                    </div>
                    
                </div>
                <!-- Popular and Recent Posts -->
                <div class="left__content" id="con3">
                    <div class="post-box" id="popular">
                        <div class="sub-title">인기글</div>
                        <ul>
                            <li>뽀ㄷH 퀸ㅋr만 눌러</li>
                            <li>학생○lㄹΓ는 죄로..</li>
                            <li>친구ㄱг무엇을뜻ㅎг는줄○гㄴı¿ </li>
                        </ul>
                    </div>
                    <div class="post-box" id="recent">
                        <div class="sub-title">최신글</div>
                        <ul>
                            <li>ㅂıㄹr는 ㄱł..참 ㅅĿブıㅎŀスl?</li>
                            <li>Øl젠 ⊂よ신을 ズı켜주고 싶습LI⊂ト</li>
                            <li>해피바이러스가 성공적으로 배달되었습니다*^^*</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Right Screen with Post Frame -->
            <div class="post-list" id="right">
                <div id="post-right__title">
                    <div id="right-title__text">여기에 이 파일 이름</div>
                    <div id="right-title__btn">
                        <button><div>글쓰기</div></button>
                        <button onclick="history.back()"><div>뒤로가기</div></button>
                    </div>
                </div>
                <div id="post-right__list">
                    <table class="right-list__content">
                    
                        <!-- 여기가 제목칸들 -->
                        <thead>
                            <tr>
                                <th width="12%">게시번호</th>
                                <th width="10%">태그</th>
                                <th width="40%">제목</th>
                                <th width="8%">조회수</th>
                                <th width="30%">작성일</th>
                            </tr>
                        </thead> 
                        
                        
                        <!-- 여기다가 게시글 동적으로 만들면됨 -->
                        <tbody>
                            <tr>
                                <td>내용1</td>
                                <td>내용2</td>
                                <td>내용3</td>
                                <td>내용4</td>
                                <td>내용5</td>
                            </tr>
                        </tbody>
                        
                    </table>
                </div>
            </div>
        </div>
    </div>
	<% } %>

</body>
</html>