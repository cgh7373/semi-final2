<%@page import="com.kh.posts.model.vo.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Post> list =(ArrayList<Post>)request.getAttribute("list");
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
        integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg=="crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>
    <script defer src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="./resources/css/commonBoard.css">
    <script defer src="./resources/js/commonBoard.js"></script>
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
    		location.href="<%=contextPath %>/list.po";
		 });
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
                    <div id="right-title__text">게시글 목록</div>
                    <div id="right-title__btn">
                        <button id="modalOpenButton">글쓰기</button>
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
                        <% if(list == null || list.isEmpty()) 
            		  {%>
                 <tr>
                    <td colspan="5">존재하는 공지사항이 없습니다.</td>
                 </tr>
            		<%}
            	 else
            	     {%>
                <!-- case2 공지글이 있을 경우-->
                		<%for(Post n : list)
                     		{%>
                				<tr>
                    			<td><%=n.getPostNum()%></td>
                    			<td><%=n.getPostTag()%></td>
                    			<td><%=n.getPostTitle()%></td>
                    			<td><%=n.getCount() %></td>
                    			<td><%=n.getPostRegdate()%></td>
                 				</tr>
                   		  <%}%>
                  	<%}%>
                        </tbody>
                        
                    </table>
                </div>
            </div>
     
    						<!-- 글쓰기용 Modal -->
            <div id="modalContainer" class="hidden">
                <div id="modalContent">
                    <div class="modal_header">
                        <div class="modal_header_button">
                            <button id="modalCloseButton">X</button>
                        </div>
                        <div class="modal_header_title">
                            <p>게시글작성</p>
                        </div>
                    </div>
                    <form id="enroll-form" action="" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="userNo" value="">
                        <div class="modal_body">
                            <table align="center">
                                <tr style="height: 5%;">
                                    <th>제목</th>
                                    <td colspan="3"><input type="text" name="title" required></td>
                                </tr>
                                <tr style="height: 5%;">
                                    <th>태그</th>
                                    <td  style="width:75%;"><input type="text" name="tag" required></td>
                                    <th>공개범위</th>
                                    <td>
                                        <select name="scop">
                                            <!-- Category 테이블로부터 조회해둘꺼임-->
                                            <option value="p">전체</option>
                                            <option value="f">친구만</option>
                                            <option value="m">나만보기</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr style="height: 85%;">
                                    <th>내용</th>
                                    <td colspan="3"><textarea rows="10" name="content" style="resize: none;" required></textarea></td>
                                </tr>
                                <tr style="height: 5%; ">
                                    <th>첨부파일</th>
                                    <td colspan="3"><input style="margin-top: 2px;" type="file" name="upfile"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal_footer">
                            <button type="submit">작성하기</button>
                        </div>
                    </form>
                </div>
            </div>
         </div>
     </div>
	<% } %>
<script>

    const modalOpenButton = document.getElementById('modalOpenButton');
    const modalCloseButton = document.getElementById('modalCloseButton');
    const modal = document.getElementById('modalContainer');

    modalOpenButton.addEventListener('click', () => {
    modal.classList.remove('hidden');
    });

    modalCloseButton.addEventListener('click', () => {
    modal.classList.add('hidden');
    });
</script>
</body>
</html>