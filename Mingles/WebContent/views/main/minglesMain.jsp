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

    <!--부트 스트랩-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    
    
    <!-- 구글폰트-아이콘 외부파일 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!--gsap 라이브러리-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- 내부파일 -->
    <link rel="stylesheet" href="../../resources/css/mingles-main.css">
    <script defer src="../../resources/js/mingles-main.js"></script>
    <link rel="icon" href="../../resources/images/Mingles아이콘-removebg-preview.png">

</head>

<body>

            <!-- 플레이리스트 추가 모달-->

            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    <h4 class="modal-title">Modal Header</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                    <p>Some text in the Modal Body</p>
                    </div>
                </div>
                </div>
            </div>
            
    

    <div id="wrap">

        <!-- 메인 화면 -->
        <div id="container">

            <% if (m != null) { %>
            <!-- 왼쪽 화면 -->
            <div class="post-list" id="left">
                <div class="left__content" id="con1">
                    <img src="../../resources/images/Mingles아이콘-removebg-preview.png" alt="프사">
                </div>
                <div class="left__content" id="con2">
                    <div id="con2__nickname"><%=m.getNickname() %></div> 
                    
                    <button id= "diary" class="material-icons">auto_stories</button> 
                    <button id= "mailIcon" class="material-icons">mail_outline</button> 
                                    
                    <div id="con2__my_text">제이름은 남도일 탐정입니다. 범인은 검은 쫄쫄이</div>
                    <div id="con2__my_info">
                        <div id="my_info__1" data-toggle="tooltip" title="<%=m.getEmail()%>">이메일</div>
                        <div id="my_info__2" data-toggle="tooltip" title="INTJ">MBTI</div>
                        <div id="my_info__3" data-toggle="tooltip" title="<%=m.getZodiac()%>">별자리</div>
                        <div id="my_info__4" data-toggle="tooltip" title="o형">혈액형</div>
                    </div>
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
            </div><!--인기글, 최신글 div 끝-->

            <!-- 오른쪽 화면 - 미니홈피 -->
            <div class = "minihompi">
            <img src="http://i61.photobucket.com/albums/h58/bourniio/cyworld%20backgrounds/030305_wall_01.gif" alt="미니홈피 배경화면">
            </div><!--미니홈피 div 끝-->

            <!-- 꾸미기 버튼 -->
            <button id = "decorate">나도 꾸미기</button>

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

             <!--mp3 음악 버튼-->
               <div class="music">
               <img src="../../resources/images/cd.png" alt="cd그림" id ="mp3Button">

                <!-- img 클릭하면 이 창 뜸 -->
                <div class ="popover-content" id = "show">
                    <div class = "iframe-container" id="player">
                        <iframe src="https://www.youtube.com/embed/?autoplay=1&mute=1" allow="autoplay"></iframe>
                    </div>
                    <div class = "music--info">
                        <p class="music--title">ETA</p>
                        <p class="music--singer">뉴진스</p>
                    </div>
                    <!-- 플리 버튼 -->
                    <button class="material-icons">expand_less</button>
                    <button class="material-icons">expand_more</button>
                    <button class="material-icons" id="playlist" data-toggle="modal" data-target="#myModal">playlist_play</button>
                </div>

            </div>
            
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
        <!-- 홈키 -->
        <!-- <button id="homeKey" class="rounded-circle"></button> -->

        <!-- 메뉴바 -->
        <div id="menuBar">

            <div id="menuWrap">

                <!-- 뒤로가기버튼 -->
                <button id="menuBack" class="rounded-circle" style="width: 70px; height: 70px; background-color: white; border: none;">
                    <img src="../../resources/images/greenpointer.png" style = "width:50px; height:50px;">
                    <!-- 화살표 이미지(->)로 변경, deg(270 제거) -->
                </button>

                <!-- mHead -->
                 <div id="mHead"><img src="../../resources/images/밍글로고.PNG" style = "width:90%; height:90%;"></div>

                <!-- mBody -->
                 <div id="mBody">

                    <div class="menu">
                        <div class="menu--myHome">
                            <span class="material-icons">fireplace</span> 마이홈
                        </div>
                        <div class="menu--store">
                            <span class="material-icons">storefront</span> 상점
                        </div>
                        <div class="menu-community">
                            <span class="material-icons">diversity_1</span> 커뮤니티
                        </div>
                        <div class="menu--config">
                            <span class="material-icons">settings</span> 환경설정
                        </div>
                    </div>
                    <div class="category">

                        <p>카테고리</p>

                        <div class="category--first">
                            오늘의 일기
                        </div>
                        <div class="category--second">
                            맛집 기록
                        </div>
                        <div class="category--third">
                            나만의 플리
                        </div>
                        <div class="category--fourth">
                            웃짤 모음집
                        </div>
                        <div class="cagegory--fifth">
                            내가그린 기린그림
                        </div>

                    </div>

                 </div>

                <!-- mFoot -->
                 <div id="mFoot"></div>

            </div>

        </div>

    </div>

</body>

</html>