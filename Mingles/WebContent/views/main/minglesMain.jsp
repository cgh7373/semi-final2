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
<title>말좀들어줘제발</title>
<!-- 외부파일 -->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery, ajax library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Reset CSS -->
<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">

<!-- Google Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- GSAP -->
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"
    integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- SweetAlert -->
<script defer src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 내부파일 -->
<link rel="stylesheet" href="../../resources/css/mingles-main.css">
<script defer src="../../resources/js/mingles-main.js"></script>
<link rel="icon" href="../../resources/images/Mingles아이콘-removebg-preview.png">
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

        <!-- PLAYLIST UPDATE MODAL-->

        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                <h2 class="modal-title">플레이리스트 관리</h2>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                
                    <div class ="music--update">
                       <div>
                            좋아하는 음악을 추가해보세요! (최대 10개 가능)
                            <br><br>
                            <ul class="music--list">
                                
                            </ul>
                            <br><br>
                            <table class="music--insert">
                                <tr>
                                    <td>
                                        <label for="file">
                                            <div class="material-icons" id="music--icon">
                                                music_note
                                            </div>
                                            <input type="file" name="music" accept=".MP3" id="file">
                                        </label>

                                        <label for ="thumbnail">
                                            <div class="material-icons" id ="music--thumbnail">
                                                smart_display
                                            </div>
                                            <input type="file" name="musicThumbnail" id="thumbnail">
                                        </label>
                                    </td>
                                    <td width="360px">
                                        &nbsp;
                                        제목 : <input type="text" name="title" id = "musicTitle"required />
                                        가수 : <input type="text" name= "singer" id = "singer" required />
                                        <br>
                                    </td>
                                </tr>
                            </table>
                            <br><br>
                            <div class="btn btn-sm btn-info" id = "music--add">
                                추가
                            </div>
                            <div class="btn btn-sm btn-warning" id = "music--seq">
                                순서변경
                            </div>
                            <div class="btn btn-sm btn-danger" id = "music--delete">
                                삭제
                             </div>
                       </div> 
                    </div>

                </div>
            </div>
            </div>
        </div>
	
	 <div id="wrap">
        <div id="container">
            <!-- Left Screen -->
                    <% if (m != null) { %>
            <div class="post-list" id="left">
                <div class="left__content" id="con1">
                    <img src="<%=m.getProfilePic() %>" alt="">
                </div>
                <div class="left__content" id="con2">
                    <div id="con2__nickname"><%= m.getNickname() %></div>
                    <button id= "diary" class="material-icons">auto_stories</button> 
                    <button id="mailIcon" class="material-icons">mail_outline</button>
                    <div id="con2__my_text"><%=m.getStatusMsg() %></div>
                    <div id="con2__my_info">
                        <div id="my_info__1" data-toggle="tooltip" title="<%= m.getEmail() %>">이메일</div>
                        <div id="my_info__2" data-toggle="tooltip" title="<%= m.getMBTI() %>">MBTI</div>
                        <div id="my_info__3" data-toggle="tooltip" title="<%= m.getZodiac() %>">별자리</div>
                        <div id="my_info__4" data-toggle="tooltip" title="<%= m.getABO()%>">혈액형</div>
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
            <!-- MP3 BUTTON-->
            <div class="music">
                <img src="../../resources/images/cd.png" alt="cd그림" id ="mp3Button">
    
                    <!-- img 클릭하면 이 창 뜸 -->
                    <div class ="popover-content" id = "show">
                        <div class = "musicThumbnail" id="musicThumbnail">
                            <!-- 여기에 썸네일 이미지 추가 -->
                        </div>
                        <div class = "music--info">
                            <p class="music--title">ETA <!--여기에 jsp로 제목 입력할것--> </p>
                            <p class="music--singer">뉴진스<!--여기에 jsp로 가수 입력할것--> </p>
                        </div>
                        <!-- PLAYLIST BUTTON -->
                        <button class="material-icons">expand_less</button>
                        <button class="material-icons">expand_more</button>
                        <button class="material-icons" id="playlist" data-toggle="modal" data-target="#myModal">playlist_play</button>
                    </div>
    
                </div>

            <!-- 오른쪽 화면 - 미니홈피 -->
            <div class = "minihompi">
                <%@ include file = "../style/minglesStyle2.jsp"%> 
            </div><!--미니홈피 div 끝-->

    
                <!-- 좋아요 표시 -->
                <div class="heart-container" title="Like">
                    <input type="checkbox" class="checkbox" id="Give-It-An-Id">
                    <div class="svg-container">
                        <svg viewBox="0 0 24 24" class="svg-outline" xmlns="http://www.w3.org/2000/svg">
                            <path d="M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z">
                            </path>
                        </svg>
                        <svg viewBox="0 0 24 24" class="svg-filled" xmlns="http://www.w3.org/2000/svg">
                            <path d="M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Z">
                            </path>
                        </svg>
                        <svg class="svg-celebrate" width="100" height="100" xmlns="http://www.w3.org/2000/svg">
                            <polygon points="10,10 20,20"></polygon>
                            <polygon points="10,50 20,50"></polygon>
                            <polygon points="20,80 30,70"></polygon>
                            <polygon points="90,10 80,20"></polygon>
                            <polygon points="90,50 80,50"></polygon>
                            <polygon points="80,80 70,70"></polygon>
                        </svg>
                    </div>
                </div><!--좋아요 div 끝-->
                
                <script>
                const show = document.getElementById("show");
                const mp3button = document.getElementById("mp3Button");
    
                let isShow = false;
    
                mp3button.addEventListener("click",function(){
                    isShow = !isShow;
                    if(isShow){
                        show.classList.add('youShow');
                    }else{
                        show.classList.remove('youShow');
                    }
    
                });
                </script>
    
            </div> <!--메인화면 div 끝-->
            <% }%>
           
        </div>
    </div>

</body>
</html>