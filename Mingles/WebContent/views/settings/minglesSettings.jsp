<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("loginUser");
	ArrayList<Member> list = (ArrayList<Member>)session.getAttribute("list");
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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

<% if (m != null) { %>

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
    	 
    	 // 유저 검색함수
    	 function loadData(type) {
      	   
      	   let url;
      	   let data;
      	   
      	   switch (type) {
      	   
      	   case 'mbti' : 
      		   url = '/Mingles/frFromMbti.mi';
      		   data = {
      			   myMBTI : "<%=m.getMBTI()%>",
 				   myMemNo : "<%=m.getMemNo()%>"
 				   };
 				   break;
 				   
      	   case 'findMember' :
      		   url = '/Mingles/memberFind.mi';
      		   data = {
     				   findMem : $("input[name=findMember]").val(),
 				       myMemNo : "<%=m.getMemNo()%>"   
      		   };
      		   break;
      		  
      	   default : 
      		   console.error('Unknown type:', type);
                 return;
                 
      	   }
      	   
      	 $.ajax({
             url: url,
             data: data,
             type: 'post',
             success: function(result) {
            	 
                 const itemsPerPage = 10;
                 let currentPage = 1;
                 const totalItems = result.length;
                 const totalPages = Math.ceil(totalItems / itemsPerPage);

                 function renderPage(page) {
                	 
                     const start = (page - 1) * itemsPerPage;
                     const end = start + itemsPerPage;
                     const pageItems = result.slice(start, end);

                     let value = "";
                     
                     for (let i in pageItems) {
                    	 
                          value += "<tr>"
	                             + "<td rowspan='2' class='modal-img'><img src='" + pageItems[i].profilePic + "'></td>"
	                             + "<td class='modal-nickname'>" + pageItems[i].nickname + "</td>"
	                             + "<td rowspan='2' class='btn-plus visitFriend'><button data-memno='" + pageItems[i].memNo + "'>놀러가기</button></td>"
	                             + "<td rowspan='2' class='btn-plus requestFriend'><button data-memno='" + pageItems[i].memNo + "'>친구신청</button></td>"
	                             + "</tr>"
	                             + "<tr>"
	                             + "<td class='modal-statusMsg'>" + pageItems[i].statusMsg + "</td>"
	                             + "</tr>";
                             
                     }

                     $("#findMemberModal .modal-body2 table").html(value);
	                     updatePaginationControls();
	                 }

	                 function updatePaginationControls() {
	                	 
	                     const pageNumbers = $("#findMemberModal #pageNumbers");
	                     pageNumbers.empty();
	                     
	                     for (let i = 1; i <= totalPages; i++) {
	                    	 
	                         const button = $("<button>")
							                             .text(i)
							                             .addClass('page-btn')
							                             .data('page', i)
							                             .on('click', function() {
							                                 currentPage = $(this).data('page');
							                                 renderPage(currentPage);
							                                });
	                         pageNumbers.append(button);
	                     }
	
	                     $("#findMemberModal #prevPage").prop('disabled', currentPage === 1);
	                     $("#findMemberModal #nextPage").prop('disabled', currentPage === totalPages);
	                     
	                 }

                 $("#findMemberModal #prevPage").on('click', function() {
                	 
                     if (currentPage > 1) {
                         currentPage--;
                         renderPage(currentPage);
                     }
                     
                 });

                 $("#findMemberModal #nextPage").on('click', function() {
                	 
                     if (currentPage < totalPages) {
                         currentPage++;
                         renderPage(currentPage);
                     }
                     
                 });

                 renderPage(currentPage);
                 
	             },
	         });
         }
    	 
 		 loadData('mbti');
    	 
         $("#findBtn").click(function() {
		        loadData('findMember');
	     });
 	   
         // 받은 친구요청목록 호출함수
         function loadReceive() {
        	   
        	 $.ajax({
               url: '/Mingles/frReceive.mi',
               data: {
            	      myMemNo : "<%=m.getMemNo()%>" 
               },
               type: 'post',
               success: function(result) {
              	 
                   const itemsPerPage = 10;
                   let currentPage = 1;
                   const totalItems = result.length;
                   const totalPages = Math.ceil(totalItems / itemsPerPage);

                   function renderPage(page) {
                  	 
                       const start = (page - 1) * itemsPerPage;
                       const end = start + itemsPerPage;
                       const pageItems = result.slice(start, end);

                       let value = "";
                       
                       for (let i in pageItems) {
                      	 
                            value += "<tr>"
  	                             + "<td rowspan='2' class='modal-img'><img src='" + pageItems[i].profilePic + "'></td>"
  	                             + "<td class='modal-nickname'>" + pageItems[i].nickname + "</td>"
  	                             + "<td rowspan='2' class='btn-plus acceptRequest'><button data-memno='" + pageItems[i].memNo + "'>수락</button></td>"
  	                             + "<td rowspan='2' class='btn-plus declineRequest'><button data-memno='" + pageItems[i].memNo + "'>거절</button></td>"
  	                             + "</tr>"
  	                             + "<tr>"
  	                             + "<td class='modal-statusMsg'>" + pageItems[i].statusMsg + "</td>"
  	                             + "</tr>";
                               
                       }

                       $("#frReceiveModal .modal-body2 table").html(value);
  	                     updatePaginationControls();
  	                 }

  	                 function updatePaginationControls() {
  	                	 
  	                     const pageNumbers = $("#frReceiveModal #pageNumbers");
  	                     pageNumbers.empty();
  	                     
  	                     for (let i = 1; i <= totalPages; i++) {
  	                    	 
  	                         const button = $("<button>")
  							                             .text(i)
  							                             .addClass('page-btn')
  							                             .data('page', i)
  							                             .on('click', function() {
  							                                 currentPage = $(this).data('page');
  							                                 renderPage(currentPage);
  							                                });
  	                         pageNumbers.append(button);
  	                     }
  	
  	                     $("#frReceiveModal #prevPage").prop('disabled', currentPage === 1);
  	                     $("#frReceiveModal #nextPage").prop('disabled', currentPage === totalPages);
  	                     
  	                 }

                   $("#frReceiveModal #prevPage").on('click', function() {
                  	 
                       if (currentPage > 1) {
                           currentPage--;
                           renderPage(currentPage);
                       }
                       
                   });

                   $("#frReceiveModal #nextPage").on('click', function() {
                  	 
                       if (currentPage < totalPages) {
                           currentPage++;
                           renderPage(currentPage);
                       }
                       
                   });

                   renderPage(currentPage);
                   
  	             },
  	         });
           };
           
           $("#frReceiveModal").on('click', '.acceptRequest button', function() {
        	    handleRequest('accept', $(this));
           });

           $("#frReceiveModal").on('click', '.declineRequest button', function() {
        	    handleRequest('decline', $(this));
           });
           
           loadReceive();
           setInterval(loadReceive, 10000);
    	 
           // 친구목록호출함수
           function friendList() {
          	   
          	 $.ajax({
                 url: '/Mingles/frList.mi',
                 data: {
                	memNo : "<%=m.getMemNo()%>" 
                 },
                 type: 'post',
                 success: function(result) {
                	 
                     const itemsPerPage = 10;
                     let currentPage = 1;
                     const totalItems = result.length;
                     const totalPages = Math.ceil(totalItems / itemsPerPage);

                     function renderPage(page) {
                    	 
                         const start = (page - 1) * itemsPerPage;
                         const end = start + itemsPerPage;
                         const pageItems = result.slice(start, end);

                         let value = "";
                         
                         for (let i in pageItems) {
                        	 
                               value += "<tr>"
	                            	  + "<td rowspan='2' class='modal-img'><img src='" + pageItems[i].profilePic + "'></td>"
	                                  + "<td class='modal-nickname'>" + pageItems[i].nickname + "</td>"
	                                  + "<td rowspan='2' class='btn-plus visitFriend'><button data-memno='" + pageItems[i].memNo + "'>놀러가기</button></td>"
	                                  + "<td rowspan='2' class='setFriendLevel'><select data-memno='" + pageItems[i].memNo + "'>"
	                                  + "<option value=''>-선택-</option>"
	                                  + "<option value='A'>짱친</option>"
	                                  + "<option value='B'>좀친</option>"
	                                  + "<option value='C'>걍친</option>"
	                                  + "<option value='D'>지인</option>"
	                                  + "<option value='F'>차단</option>"
	                                  + "</select></td>"
	                                  + "</tr>"
	                                  + "<tr>"
	                                  + "<td class='modal-statusMsg'>" + pageItems[i].statusMsg + "</td>"
	                                  + "</tr>";
                                 
                         }

                         $("#frListModal .modal-body2 table").html(value);
    	                     updatePaginationControls();
    	                 }

    	                 function updatePaginationControls() {
    	                	 
    	                     const pageNumbers = $("#frListModal #pageNumbers");
    	                     pageNumbers.empty();
    	                     
    	                     for (let i = 1; i <= totalPages; i++) {
    	                    	 
    	                         const button = $("<button>")
    							                             .text(i)
    							                             .addClass('page-btn')
    							                             .data('page', i)
    							                             .on('click', function() {
    							                                 currentPage = $(this).data('page');
    							                                 renderPage(currentPage);
    							                                });
    	                         pageNumbers.append(button);
    	                     }
    	
    	                     $("#frListModal #prevPage").prop('disabled', currentPage === 1);
    	                     $("#frListModal #nextPage").prop('disabled', currentPage === totalPages);
    	                     
    	                 }

                     $("#frListModal #prevPage").on('click', function() {
                    	 
                         if (currentPage > 1) {
                             currentPage--;
                             renderPage(currentPage);
                         }
                         
                     });

                     $("#frListModal #nextPage").on('click', function() {
                    	 
                         if (currentPage < totalPages) {
                             currentPage++;
                             renderPage(currentPage);
                         }
                         
                     });

                     renderPage(currentPage);
                     
    	             },
    	         });
             }
           
             $("#frListModal").on('change', ".setFriendLevel select", function() {
            	 
            	 const memNo = $(this).data('memno');
            	 const setLv = $(this).val();
            	 
            	 $.ajax({
            		 url : '/Mingles/updateFriendLevel.mi',
            		 data : {
            			 memNo : memNo,
            			 setLv : setLv,
            		 },
            		 success : function(r) {
            			 
            			 if (r > 0) {
            			 swal({
    			             icon: 'success',
    			             title: '변경되었어요',
    			        	 });
            			 }
            		 },
            	 })
            	 
             });
           
             friendList();
             setInterval(friendList, 10000);
             
             $(".modal").on('click', '.visitFriend button', function() {
         	    
            	 location.href="/Mingles/othersMain.mi?oMemNo=" + $(this).data('memno');
	            	 
             });
           
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
                                <img src="<%=m.getProfilePic()%>" alt="profilePhoto">
                            </div>

                            <!-- 사진첨부할 인풋 -->
                            <form id="proPic" method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/updatePic.mi">
                            <input type="hidden" name="memId" value="<%=m.getMemId()%>">
                            <label for="file">
                                <div class="btn-upload">
                                    <span class="material-icons">
                                        add_a_photo
                                    </span>
                                </div>
                            </label>
                            <input type="file" name="profilePic" id="file" style="display: none;" accept="image/*">
                            <button type="submit" style="opacity:0"></button>
                            <script>
                            	$("#file").change(function () {
                            		$(".top__left button").click();
                            	})
                            </script>
							</form>
							
                        </div>
                        
                        
                        <div class="top__right">
                            <div class="nickName"><%=m.getNickname() %></div>
                            <div class="userEmail"><%=m.getEmail() %></div>
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
                        
                        <div class="setbox" data-toggle="modal"
                        data-target="#updateNNameModal">
                            <span class="material-icons">face</span>
                            <span class="set-tag">닉네임 변경</span>
                        </div>

                        <div class="setbox" data-toggle="modal"
                        data-target="#updateEmailModal">
                            <span class="material-icons">alternate_email</span>
                            <span class="set-tag">이메일 변경</span>
                        </div>

                        <div class="setbox" data-toggle="modal"
                        data-target="#memberQuitModal">
                            <span class="material-icons">sentiment_dissatisfied</span>
                            <span class="set-tag">회원 탈퇴</span>
                        </div>

                        <div class="setbox" data-toggle="modal"
                        data-target="#MBTIModal">
                            <span class="material-icons">attribution</span>
                            <span class="set-tag">MBTI 변경</span>
                        </div>

                        <div class="setbox" data-toggle="modal"
                        data-target="#statusMsgModal">
                            <span class="material-icons">psychology_alt</span>
                            <span class="set-tag">상태메세지 변경</span>
                        </div>

                        <div class="setbox" data-toggle="modal"
                        data-target="#findMemberModal">
                            <span class="material-icons">group</span>
                            <span class="set-tag">회원 검색</span>
                        </div>

                        <div class="setbox" data-toggle="modal"
                        data-target="#frReceiveModal">
                            <span class="material-icons">spatial_tracking</span>
                            <span class="set-tag">받은 친구요청</span>
                        </div>

                        <div class="setbox" data-toggle="modal"
                        data-target="#frListModal">
                            <span class="material-icons">catching_pokemon</span>
                            <span class="set-tag">친구목록</span>
                        </div>

                        <div class="setbox">
                            <span class="material-icons"></span>
                            <span class="set-tag"></span>
                        </div>

                        <script>
							function toEgg() {
								location.href="/Mingles/eggForm.mi?cpage=1&userNo=" + <%= m.getMemNo() %>;
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
                		<div class="modal fade" id="updatePwdModal">
                    		<div class="modal-dialog modal-dialog-centered">
                       			<div class="modal-content">

                           		<!-- Modal Header -->
                           		<div class="modal-header">
                               		<h4 class="modal-title" align="center">비밀번호 변경</h4>
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
                               		
                               		<button type="submit" class="btn btn-sm" onclick="return validatePwd();">비밀번호 변경</button>
                               
                               </form>
                               
                                    </div>
                                </div>
                            </div>
                        </div>
	
                        <!-- 닉네임 변경용 Modal -->
                            <div class="modal fade" id="updateNNameModal">
                                <div class="modal-dialog modal-dialog-centered">
                                       <div class="modal-content">
    
                                       <!-- Modal Header -->
                                       <div class="modal-header">
                                           <h4 class="modal-title" align="center">닉네임 변경</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
    
                                    <!-- Modal body -->
                                    <div class="modal-body" align="center">
                                   
                                    <form action="/Mingles/updateNick.mi" method="post">
                                   
                                           <input type="hidden" name="userId" value="<%= m.getMemId() %>">
                                           <table>
                                           
                                            <tr>
                                                <td>변경할 닉네임</td>                               		
                                                <td><input type="text" name="userNick" required></td>                               	
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
                                           
                                           <button type="submit" class="btn btn-sm" onclick="return validatePwd();">닉네임 변경</button>
                                   
                                   </form>
                                   
                                        </div>
                                    </div>
                                </div>
                            </div>
                                       
                            <!-- 이메일 변경용 Modal -->
                            <div class="modal fade" id="updateEmailModal">
                                <div class="modal-dialog modal-dialog-centered">
                                       <div class="modal-content">
    
                                       <!-- Modal Header -->
                                       <div class="modal-header">
                                           <h4 class="modal-title" align="center">이메일 변경</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
    
                                    <!-- Modal body -->
                                    <div class="modal-body" align="center">
                                   
                                    <form action="/Mingles/updateEmail.mi" method="post">
                                   
                                           <input type="hidden" name="userId" value="<%= m.getMemId() %>">
                                           <table>
                                           
                                            <tr>
                                                <td>변경할 이메일</td>                               		
                                                <td><input type="email" name="userEmail" required></td>                               	
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
                                           
                                           <button type="submit" class="btn btn-sm" onclick="return validatePwd();">이메일 변경</button>
                                   
                                   </form>
                                   
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 회원 탈퇴용 Modal -->
                            <div class="modal fade" id="memberQuitModal">
                                <div class="modal-dialog modal-dialog-centered">
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
                            
                            <!-- MBTI용 Modal -->
                            <div class="modal fade" id="MBTIModal">
                                <div class="modal-dialog modal-dialog-centered">
                                       <div class="modal-content">
    
                                       <!-- Modal Header -->
                                       <div class="modal-header">
                                           <h4 class="modal-title" align="center">MBTI 변경</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
    
                                    <!-- Modal body -->
                                    <div class="modal-body" align="center">
                                   
                                    <form action="/Mingles/memberMBTI.mi" method="post">
                                   
                                           <input type="hidden" name="userId" value="<%= m.getMemId() %>">
                                           <table>
                                           
                                            <tr>
                                                <td>MBTI 선택 : </td>                               		
                                                <td><select name="mbti">
                                                	<option>ISTJ</option>
                                                	<option>ISFJ</option>
                                                	<option>INTJ</option>
                                                	<option>INFJ</option>
                                                	<option>ISTP</option>
                                                	<option>ISFP</option>
                                                	<option>INFP</option>
                                                	<option>INTP</option>
                                                	<option>ESTP</option>
                                                	<option>ESFP</option>
                                                	<option>ENFP</option>
                                                	<option>ENTP</option>
                                                	<option>ESTJ</option>
                                                	<option>ESFJ</option>
                                                	<option>ENFJ</option>
                                                	<option>ENTJ</option>
                                                </select></td>                               	
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
                                           
                                           <button type="submit" class="btn btn-sm" onclick="return validatePwd();">변경</button>
                                  		 </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 상태메세지 변경용 Modal -->
                            <div class="modal fade" id="statusMsgModal">
                                <div class="modal-dialog modal-dialog-centered">
                                       <div class="modal-content">
    
                                       <!-- Modal Header -->
                                       <div class="modal-header">
                                           <h4 class="modal-title" align="center">상태메세지 변경</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
    
                                    <!-- Modal body -->
                                    <div class="modal-body" align="center">
                                   
                                    <form action="/Mingles/statusMsg.mi" method="post">
                                   
                                           <input type="hidden" name="userId" value="<%= m.getMemId() %>">
                                           <table>
                                           
                                            <tr>
                                                <td>변경할 상태메세지를 입력해주세요</td>                               		
                                                <td><input type="text" name="statusMsg" required></td>                               	
                                            </tr>	
                                           
                                           </table>
                                   
                                           <br>
                                           
                                           <button type="submit" class="btn btn-sm">상태메세지 변경</button>
                                  		 </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

							<!-- 회원 검색용 Modal -->
                            <div class="modal fade" id="findMemberModal">
                                <div class="modal-dialog modal-dialog-centered modal-lg">
                                       <div class="modal-content">
    
                                       
                                       <!-- Modal Header -->
                                       <div class="modal-header">
                                           <h4 class="modal-title" align="center"><input type="text" name="findMember" required placeholder="회원이름을 입력하세요">
                                           <button id="findBtn" class="btn btn-sm" style="background-color: white;">검색</button>
                                           <button id="resetBtn" class="btn btn-sm" style="background-color: white;">취소</button></h4>
                                       	   <button type="button" class="close" data-dismiss="modal">&times;</button>
                                       </div>
    
	                                    <!-- Modal body -->
	                                    <div class="modal-body2" align="center">
                                        
                                           <table>
                                           
                                           </table>
                                           
                                            <div class="pagination">
										        <button id="prevPage">&lt;</button>
										        <span id="pageNumbers"></span>
										        <button id="nextPage">&gt;</button>
										    </div>
                                           
                                   
                                           <br>
                                           
                                           
                                    </div>
                                        
                                    </div>
                                </div>
                            </div>

							<!-- 친구요청 수락용 Modal -->
                            <div class="modal fade" id="frReceiveModal">
                                <div class="modal-dialog modal-dialog-centered modal-lg">
                                       <div class="modal-content">
    
                                       
                                       <!-- Modal Header -->
                                       <div class="modal-header">
                                           <h4 class="modal-title" align="center">받은 요청</h4>
                                           <button type="button" class="close" data-dismiss="modal">&times;</button>
                                       </div>
    
	                                    <!-- Modal body -->
	                                    <div class="modal-body2" align="center">
                                        
                                           <table>
                                           
                                           </table>
                                           
                                            <div class="pagination">
										        <button id="prevPage">&lt;</button>
										        <span id="pageNumbers"></span>
										        <button id="nextPage">&gt;</button>
										    </div>
                                           
                                   
                                           <br>
                                           
                                           
                                    </div>
                                        
                                    </div>
                                </div>
                            </div>

							<!-- 친구목록 Modal -->
                            <div class="modal fade" id="frListModal">
                                <div class="modal-dialog modal-dialog-centered modal-lg">
                                       <div class="modal-content">
    
                                       
                                       <!-- Modal Header -->
                                       <div class="modal-header">
                                           <h4 class="modal-title" align="center">친구 목록</h4>
                                           <button type="button" class="close" data-dismiss="modal">&times;</button>
                                       </div>
    
	                                    <!-- Modal body -->
	                                    <div class="modal-body2" align="center">
                                        
                                           <table>
                                           
                                            <tr>
                                                <td rowspan="2" class="modal-img"><img src=<%=m.getProfilePic() %>></td>                               		
                                                <td class="modal-nickname"><%=m.getNickname() %></td>                               	
                                            </tr>	
                                            <tr>
                                            	<td class="modal-statusMsg"><%=m.getStatusMsg() %></td>
                                            </tr>
                                           
                                           </table>
                                           
                                            <div class="pagination">
										        <button id="prevPage">&lt;</button>
										        <span id="pageNumbers"></span>
										        <button id="nextPage">&gt;</button>
										    </div>
                                           
                                   
                                           <br>
                                           
                                           
                                    </div>
                                        
                                    </div>
                                </div>
                            </div>

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
                                           
                                       	   $("#resetBtn").click(function() {
                                       		   $("input[name=findMember]").val("");
                                       		   $(".modal-body2 table").html("");
                                       		   $("#pageNumbers").empty();
                                       	   })
                                       	   
                                       	   $(".modal-body2").on('click', '.requestFriend button', function() {
                                       		   
                                       		   const btn = $(this);
                                       		   
                                       		   $.ajax({
                                       			   url : '/Mingles/requestFriend.mi',
                                       			   data : {myMemNo : "<%=m.getMemNo()%>",
                                       				       frMemNo : btn.data('memno')},
                                       			   success : function(result) {
                                       				   if (result > 0) {
                                        				   swal({
                                        			             icon: 'success',
                                        			             title: '신청을 보냈어요',
                                        			        	 });
                                        				   btn.attr('disabled',true);
                                       				   } else {
                                       					   swal({
                                       				             icon: 'error',
                                       				             title: '신청하지 못했어요',
                                       				        	 });
                                       					   btn.attr('disabled',true);
                                       				   }
                                       			   }, 
                                       			   error : function() {
                                       				   swal({
                                 				             icon: 'error',
                                 				             title: '신청하지 못했어요',
                                 				        	 });
                                 					       btn.attr('disabled',true);
                                       			   },
                                       		   })
                                       	   })
                                        	   
                         				   function handleRequest(action, btn) {
                                       		   
											    let url = '/Mingles/frRequests.mi';
											    let data = {
											        myMemNo: "<%=m.getMemNo()%>",
											        frMemNo: btn.data('memno'),
											        action : action,
											    };
				
											    $.ajax({
											        url: url,
											        data: data,
											        type: 'post',
											        success: function(result) {
											            if (result > 0) {
											                swal({
											                    icon: 'success',
											                    title: action === 'accept' ? '신청을 수락했어요' : '신청을 거절했어요',
											                });
											                loadReceive();
											            } else {
											                swal({
											                    icon: 'error',
											                    title: action === 'accept' ? '신청 수락에 실패했어요' : '신청 거절에 실패했어요',
											                });
											                loadReceive();
											            }
											        },
											        error: function() {
											            swal({
											                icon: 'error',
											                title: '처리 중 오류가 발생했어요',
											            });
											        },
											    });
											}
											
                                   </script>
                                   

        </div>

        </div>

        </div>

        </div>

       

    </div>
    	<% } else { %>
             <script>
             function cancelMembership() {
                 window.parent.postMessage('membershipCanceled', '*');
             }
             cancelMembership();
             </script>
    	<% } %>
</body>

</html>