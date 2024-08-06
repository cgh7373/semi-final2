<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
	String errorMsg = (String)session.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mingles Frame</title>

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
	
    <!-- 내부파일 -->
    <link rel="stylesheet" href="./resources/css/mingle.css">
    <script defer src="<%=contextPath %>/resources/js/mingle.js"></script>
    <link rel="icon" href="./resources/images/Mingles아이콘-removebg-preview.png">

    <!-- https://animate.style/ 웹사이트 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
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

    <!-- 바탕화면 -->
    <div id="wrapper">

        <!-- 제일 위 화면 -->
        <section>

            <!-- 로그인화면 -->
            <div class="login-wrap">

                <div id="container">

                    <!-- 사라지는 로고 -->
                    <div class="logo-wrap animate__animated animate__zoomOut animate__delay-1s">
                        <div class="logo--disappear">
                            <h1 class="animate__animated animate__zoomOut animate__delay-1s">
                                <span>M</span>
                                <span>I</span>
                                <span>N</span>
                                <span>G</span>
                                <span>L</span>
                                <span>E</span>
                                <span>S</span>
                            </h1>
                        </div>
                    </div>
                    
                    <% if (loginUser == null) { %>
                    <!-- gif 로고 띄우기, 로그인 화면 띄우기 -->
                    <div class="appearBox">

                        <!-- 로그인 화면 -->
                        <div class="appear animate__animated animate__fadeIn animate__delay-2s">
                            <div id="form">
                                <div class="form_area">
                                    <p class="title">Sign in</p>
                                    <form action="<%=contextPath %>/login.me" method="post">
                                        <!-- 아이디 버튼 -->
                                        <div class="form_group">
                                            <label class="sub_title" for="name">ID</label>
                                            <input placeholder="아이디를 입력하세요." class="form_style" type="text" name="userId" required>
                                        </div>

                                        <!-- 비밀번호 버튼 -->
                                        <div class="form_group">
                                            <label class="sub_title" for="password">Password</label>
                                            <input placeholder="비밀번호를 입력하세요" id="password" class="form_style"
                                                type="password" name="userPwd" required>
                                        </div>
                                        <!-- 로그인 area -->
                                        <div class="login-area">
                                            <button class="btn">LOG IN</button>
                                            <!-- 회원가입 버튼 -->
                                            <p class="announcement">처음이신가요? <a class="link" href="<%=contextPath%>/enroll.mi">회원가입하기!</a></p>
                                        </div>
                                    </form>
                                    <!-- 간편로그인 버튼 -->
                                    <div class="btnLogin">
                                        <p class="announcement login-btn">간편로그인</p>
                                        <button> <img src="./resources/images/구글로고.png" alt="구글간편로그인"> </button>
                                        <button> <img src="./resources/images/카톡로고.png" alt="카톡간편로그인"> </button>
                                        <button> <img src="./resources/images/네이버로고.png" alt="네이버간편로그인"> </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
					<% } else { %>
					<script>
					document.addEventListener("DOMContentLoaded", function() {
						
						setTimeout(() => {
							
						    scrollToSection(2);

						    for (let i = 1; i < icons.length; i++) {

						        icons[0].style.visibility = 'hidden';
						        icons[0].style.opacity = 0;

						        setTimeout(() => {
						            icons[i].style.visibility = 'visible';
						            icons[i].style.opacity = 1;
						            icons[i].style.transition = '2s';
						        }, 800 + (300 * (i + 1)));
						    };

						    initializeFloatingAnimations();
						}, 1200)
					});
					</script>
					<% } %>
                </div>

            </div>

        </section>


        <!-- 가운데 화면 -->
        <section class="middle">

            <!-- 탐색창 틀 -->
            <div class="explore-wrap">
                <iframe src="./views/community/minglesCommunity.jsp" style="visibility: visible; opacity: 1;" frameborder="0"></iframe>
            </div>

            <div class="diver float"><img src="./resources/images/173526028-젊은-남자-캐릭터-스쿠버-다이빙-또는-오리발과-고글-벡터-일러스트와-함께-수중-removebg-preview.png" alt=""></div>

        </section>


        <!-- 아래 화면 -->
        <section>

            <!-- 메인화면 프레임 -->
            <div class="iframe-wrapper">

                <iframe src="./views/main/minglesMain.jsp" class="mgScreens iframe-main"
                    frameborder="0"></iframe>
                <iframe src="./views/settings/minglesSettings.jsp" class="mgScreens iframe-settings"
                    frameborder="0"></iframe>
                <iframe src="./views/shop/minglesShop.jsp" class="mgScreens iframe-shop" frameborder="0"></iframe>
                <iframe src="./views/style/minglesStyle.jsp" class="mgScreens iframe-style" frameborder="0"></iframe>
                <iframe src="./views/chat/minglesChat.jsp" class="mgScreens iframe-chat" frameborder="0"></iframe>
                <iframe src="./views/posts/minglesPosts.jsp" class="mgScreens iframe-posts" frameborder="0"></iframe>
                
            </div>



            <!-- 메인탭 -->
            <span class="material-icons mainTab" title="메인">home</span>

            <!-- 환경설정 -->
            <span class="material-icons settings" title="설정">
                settings</span>

            <!-- 아무탭1 -->
            <span class="material-icons anyTab">
                sentiment_very_satisfied
            </span>

            <!-- 상점탭 -->
            <span class="material-icons shopTab" title="상점">
                storefront
            </span>

            <!-- 탐색탭 -->
            <span class="material-icons explore-tab" title="탐색">travel_explore</span>

            <!-- 꾸미기탭 -->
            <span class="material-icons styleTab" title="꾸미기">accessibility</span>

            <!-- 채팅탭 -->
            <span class="material-icons chatTab" title="채팅">question_answer</span>

            <!-- 게시글탭 -->
            <span class="material-icons postsTab" title="게시글">article</span>

            <!-- 아무탭7 -->
            <span class="material-icons anyTab7">add_circle_outline</span>

            <!-- 로그아웃탭 -->
            <span class="material-icons logoutTab" onclick="logout()" title="로그아웃">logout</span>
            
            <script>
            	function logout() {
            		swal({
            			  title: "로그아웃 하시겠어요?",
            			  icon: "warning",
            			  buttons: true,
            			  dangerMode: true,
            			})
            			.then((willDelete) => {
            			  if (willDelete) {
            				location.href="/Mingles/logout.mi";
            			  } else {
            			    const loTab = document.querySelector('.logoutTab');
            			    loTab.style.opacity = 1;
            			    loTab.style.visibility = 'visible';
                            restartFloatingAnimation(loTab);
            			    swal("돌아가요");
            			  }
            			});
            	}
            </script>

        
            <!-- 거북이 -->
            <div class="turtle float" onclick="goBack()"><img
                    src="./resources/images/3d-cute-turtle-character_1004243-616-removebg-preview.png"></div>

        </section>

    </div>

</body>

</html>