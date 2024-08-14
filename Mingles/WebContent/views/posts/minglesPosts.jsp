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
    <link rel="stylesheet" href="../../resources/css/commonBoard.css">
    <script defer src="../../resources/js/commonBoard.js"></script>
</head>
<body>

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
		/*
		$(function() {
			showPostList();
		})
		
		function showPostList() {
			$.ajax({
				url : '',
				
			})
		}*/
	</script>
	
     <% if (m != null) { %>
	 <div id="wrap">
        <div id="container">
            <!-- Left Screen -->
            <div class="post-list" id="left">
                <div class="left__content" id="con1">
                    <img src="<%=m.getProfilePic() %>" alt="">
                </div>
                <div class="left__content" id="con2">
                    <div id="con2__nickname"><%= m.getNickname() %></div>
                    <button id="mailIcon" class="material-icons">mail_outline</button>
                    <div id="con2__my_text"><%=m.getStatusMsg() %></div>
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
                        <button data-toggle="modal"
                        data-target="#writePostModal"><div>글쓰기</div></button>
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
     
    						<!-- 글쓰기용 Modal -->
                            <div class="modal fade" id="writePostModal">
                                <div class="modal-dialog modal-dialog-centered modal-xl">
                                       <div class="modal-content">
    
                                       <!-- Modal Header -->
                                       <div class="modal-header">
                                           <h4 class="modal-title" align="center">회원 탈퇴</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
    
                                    <!-- Modal body -->
                                    <div class="modal-body" align="center">
                                   
                                    <form action="/Mingles/memberQuit.mi" method="post">
                                   
                                           <input type="hidden" name="userId" value="<%= m.getMemId() %>">
                                           <table>
                                           
                                            <tr>
                                                <td>"탈퇴하겠습니다"를 입력해주세요</td>                               		
                                                <td><input type="text" name="quitMent" required></td>                               	
                                            </tr>	
                                           
                                            <tr>
                                                <td>비밀번호</td>                               		
                                                <td><input type="password" name="updatePwd" required></td>                               	
                                            </tr>	
                                           
                                            <tr>
                                                <td>비밀번호 확인</td>                               		
                                                <td><input type="password" name="checkPwd" required></td>                               	
                                            </tr>	
                                           
                                           </table>
                                   
                                           <br>
                                           
                                           <button type="submit" class="btn btn-sm" onclick="return validatePwd();">회원 탈퇴</button>
                                  		 </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                               </div>
    </div>
	<% } %>

</body>
</html>