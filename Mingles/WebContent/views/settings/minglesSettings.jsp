<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
	String errorMsg = (String)session.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mingles Settings</title>

    <!-- 외부파일 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- SWIPER -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
    <script defer src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    <!-- 내부파일 -->
    <link rel="stylesheet" href="../../resources/css/mingle-settings.css">
    <script defer src="../../resources/js/mingle-settings.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="icon" href="../../resources/images/Mingles아이콘-removebg-preview.png">

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
	</script>

    <div id="wrap">

        <!-- 메인 화면 -->
        <div id="container">

            <div id="settings">

                <div class="left">

                    <div class="top">

                        <div class="top__left">

                            <!-- 사진이 나오는곳 -->
                            <div class="profilePhoto">
                                <img src="../../resources/images/Mingles아이콘-removebg-preview.png" alt="profilePhoto">
                            </div>

                            <!-- 사진첨부할 인풋 -->
                            <label for="file">
                                <div class="btn-upload">
                                    <span class="material-icons">
                                        add_a_photo
                                    </span>
                                </div>
                            </label>
                            <input type="file" name="file" id="file" style="display: none;">

                        </div>

                        <div class="top__right">

							<% if (m != null) { %>
                            <div class="nickName"><%=m.getNickname() %></div>
                            <div class="userEmail"><%=m.getEmail() %></div>
                            <% } else { %>
							<div class="nickName">로그인이 필요해요</div>
                            <div class="userEmail">로그인이 필요해요</div>
							<% } %>
                        </div>

                    </div>

                    <!-- 좌중단 -->
                    <div class="mid">

                        <div class="promotion">

                            <div class="promo-tag">최근 방문</div>

                            <div class="swiper-container">

                                <div class="swiper-wrapper">

                                    <!-- 여기 이미지 -->
                                    <div class="swiper-slide">
                                        <img src="../../resources/images/Mingles-움직임.gif" alt="2024 뉴이어, 스타벅스와 함께" />
                                    </div>

                                    <div class="swiper-slide">
                                        <img src="../../resources/images/차은우.jpg" alt="2024 뉴이어, 스타벅스와 함께" />
                                    </div>

                                    <div class="swiper-slide">
                                        <img src="../../resources/images/Mingles로고-움직임.gif" alt="2024 뉴이어, 스타벅스와 함께" />
                                    </div>

                                </div>

                            </div>

                            <div class="swiper-pagination"></div>
                            <div class="swiper-btn swiper-prev">
                                <div class="material-icons">arrow_back</div>
                            </div>
                            <div class="swiper-btn swiper-next">
                                <div class="material-icons">arrow_forward</div>
                            </div>

                        </div>

                    </div>

                    <!-- 좌하단 -->
                    <div class="bot">

                        <div class="promotion">

                            <div class="promo-tag">~~~</div>

                            <div class="swiper-container">

                                <!-- 여기 이미지 -->
                                <div class="swiper-wrapper">

                                    <div class="swiper-slide">
                                        <img src="../../resources/images/Mingles-움직임.gif" alt="2024 뉴이어, 스타벅스와 함께" />
                                    </div>

                                    <div class="swiper-slide">
                                        <img src="../../resources/images/차은우.jpg" alt="2024 뉴이어, 스타벅스와 함께" />
                                    </div>

                                    <div class="swiper-slide">
                                        <img src="../../resources/images/Mingles로고-움직임.gif" alt="2024 뉴이어, 스타벅스와 함께" />
                                    </div>

                                </div>

                            </div>

                            <div class="swiper-pagination"></div>
                            <div class="swiper-btn swiper-prev">
                                <div class="material-icons">arrow_back</div>
                            </div>
                            <div class="swiper-btn swiper-next">
                                <div class="material-icons">arrow_forward</div>
                            </div>

                        </div>


                    </div>

                </div>

                <div class="right">

                    <div class="right-top">

                        <span class="material-icons">settings</span>

                        &nbsp;&nbsp;

                        <span class="rt-title"> 환경설정</span>

                    </div>

                    <!-- setboxes -->
                    <div class="right-bot">

                        <div class="setbox" onclick="toNotice()">
                            <span class="material-icons">help_outline</span>
                            <span class="set-tag">공지사항</span>
                        </div>

                        <div class="setbox" data-toggle="modal"
                                data-target="#updatePwdModal">
                            <span class="material-icons">
                                key
                                </span>
                            <span class="set-tag">패스워드 변경</span>
                        </div>

                        <div class="setbox" onclick="toPosts();">
                            <span class="material-icons">feed</span>
                            <span class="set-tag">게시글 관리</span>
                        </div>

                        <div class="setbox" onclick="toEgg();">
                            <span class="material-icons">egg</span>
                            <span class="set-tag">거북알 충전</span>
                        </div>
                        
                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

                        <script>
							function toEgg() {
								location.href="/Mingles/eggForm.mi";
							}                     
							
							function toPosts() {
								location.href="/Mingles/postsForm.mi";
							}
							
							function toNotice() {
								location.href="/Mingles/notice.mi";
							}
                        </script>
                        
                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

						<!-- 비밀번호 변경용 Modal -->
						<% if (m != null) { %>
                <div class="modal" id="updatePwdModal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">비밀번호 변경</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                               
                               <form action="/Mingles/updatePwd.mi" method="post">
                               
                               		<input type="hidden" name="userId" value="<%= m.getMemId() %>">
                               		<table>
                               		
										<tr>
											<td>현재 비밀번호</td>                               		
											<td><input type="password" name="userPwd" required></td>                               	
										</tr>	
                               		
										<tr>
											<td>변경할 비밀번호</td>                               		
											<td><input type="password" name="updatePwd" required></td>                               	
										</tr>	
                               		
										<tr>
											<td>변경할 비밀번호 확인</td>                               		
											<td><input type="password" name="checkPwd" required></td>                               	
										</tr>	
                               		
                               		</table>
                               
                               		<br>
                               		
                               		<button type="submit" class="btn btn-sm btn-secondary" onclick="return validatePwd();">비밀번호 변경</button>
                               
                               </form>
                               
                               <script>
                               
                               		function validatePwd() {
                               			
                               			if ($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()) {
                               				swal({
                               	             icon: 'error',
                               	             title: '비밀번호가 일치하지 않아요',
                               	        	 });
                               				return false;
                               			}
                               			
                               		}
                               
                               </script>
                               
                            </div>


                        </div>
                    </div>
                </div>
                                        

                    </div>

                </div>

            </div>

        </div>

       

    </div>
<% } %>
</body>

</html>