<%@page import="com.kh.member.model.service.MemberService"%>
<%@page import="com.kh.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%  
	
	String memNoStr = request.getParameter("memNo");

	if (memNoStr != null) {
		
	    int memNo = Integer.parseInt(memNoStr);
	    Member m = new MemberService().selectNoMember(memNo);
	    
	    request.setAttribute("otherUser", m);
	}

	Member m = (Member)session.getAttribute("loginUser"); 
    Member o = (Member)request.getAttribute("otherUser");
	String contextPath=request.getContextPath(); 
	String alertMsg=(String)session.getAttribute("alertMsg"); 
	String errorMsg=(String)session.getAttribute("errorMsg");
	Member mem = (o != null) ? o : m;
	request.setAttribute("user", mem);
%>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>말좀들어줘제발</title>
                <!-- 외부파일 -->

                <!-- jQuery, ajax library -->
                <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

                <!-- Latest compiled and minified CSS -->
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

                <!-- Popper JS -->
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

                <!-- Reset CSS -->
                <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">

                <!-- Swiper JS -->
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
                <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

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


                        document.addEventListener("DOMContentLoaded", function () {
                   
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

                                    <div class="music--update">
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

                                                        <label for="thumbnail">
                                                            <div class="material-icons" id="music--thumbnail">
                                                                smart_display
                                                            </div>
                                                            <input type="file" name="musicThumbnail" id="thumbnail">
                                                        </label>
                                                    </td>
                                                    <td width="360px">
                                                        &nbsp;
                                                        제목 : <input type="text" name="title" id="musicTitle" required />
                                                        가수 : <input type="text" name="singer" id="singer" required />
                                                        <br>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br><br>
                                            <div class="btn btn-sm btn-info" id="music--add">
                                                추가
                                            </div>
                                            <div class="btn btn-sm btn-warning" id="music--seq">
                                                순서변경
                                            </div>
                                            <div class="btn btn-sm btn-danger" id="music--delete">
                                                삭제
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 캘린더 Modal -->
                    <div class="modal fade" id="calendarModal">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <div class="modal-body" align="center">
                                    <div class="calendar-container">
                                        <div class="calendar-header">
                                            <a id="prevBtn" class="btn">이전</a>
                                            <h2 id="currentMonth"></h2>
                                            <a id="nextBtn" class="btn">다음</a>
                                        </div>
                                        <div class="calendar-days">
                                            <div class="day">일</div>
                                            <div class="day">월</div>
                                            <div class="day">화</div>
                                            <div class="day">수</div>
                                            <div class="day">목</div>
                                            <div class="day">금</div>
                                            <div class="day">토</div>
                                        </div>
                                        <div class="calendar-dates" id="calendarDates"></div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="wrap">
                        <div id="container">
                            <!-- Left Screen -->
                            <% if (mem !=null) { %>
                                <div class="post-list" id="left">
                                    <div class="left__content" id="con1">
                                        <img src="<%=mem.getProfilePic() %>" alt="">
                                    </div>
                                    <div class="left__content" id="con2">
                                        <div id="con2__nickname">
                                            <%= mem.getNickname() %>
                                        </div>

                                        <button id="calendarIcon" class="material-icons" data-toggle="modal"
                                            data-target="#calendarModal">calendar_month</button>

                                        <div id="con2__my_text">
                                            <%=mem.getStatusMsg() %>
                                        </div>
                                        <div id="con2__my_info">
                                            <div id="my_info__1" data-toggle="tooltip" title="<%= mem.getEmail() %>">이메일
                                            </div>
                                            <div id="my_info__2" data-toggle="tooltip" title="<%= mem.getMBTI() %>">MBTI
                                            </div>
                                            <div id="my_info__3" data-toggle="tooltip" title="<%= mem.getZodiac() %>">별자리
                                            </div>
                                            <span id="zodiac" data-zodiac="<%= mem.getZodiac() %>"></span>
                                            <div id="my_info__4" data-toggle="tooltip" title="<%= mem.getABO()%>">혈액형
                                            </div>
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

                                <div class="weatherCard">
                                    <div id="card">
                                        <div class="icon">
                                            <img id="weatherImg" src="" id="weather_img" />
                                        </div>

                                        <div class="detatils">
                                            <div class="weather">
                                                <h3><span id="temperate"></span>℃</h3>
                                                <h3 id="skyStatus"></h3>
                                            </div>
                                            <div class="bottom">
                                                <sapn id="wYear"></sapn>년
                                                <span id="wMonth"></span>월
                                                <span id="wDay"></span>일
                                            </div>
                                        </div>
                                    </div>
                                    <div id="weatherList">
                                        <div class="swiper">
                                            <div class="swiper-wrapper">
                                                <div class="swiper-slide">
                                                    <div id="weatherListTop"><span class="weatherListTop__time"
                                                            id="no0"></span><span>시</span></div>
                                                    <div id="weatherListCenter"><img src="" alt="" id="no0"></div>
                                                    <div id="weatherListBottom"><span class="weatherListBottom__tmp"
                                                            id="no0"></span><span>℃</span></div>
                                                </div>
                                                <div class="swiper-slide">
                                                    <div id="weatherListTop"><span class="weatherListTop__time"
                                                            id="no1"></span><span>시</span></div>
                                                    <div id="weatherListCenter"><img src="" alt="" id="no1"></div>
                                                    <div id="weatherListBottom"><span class="weatherListBottom__tmp"
                                                            id="no1"></span><span>℃</span></div>
                                                </div>
                                                <div class="swiper-slide">
                                                    <div id="weatherListTop"><span class="weatherListTop__time"
                                                            id="no2"></span><span>시</span></div>
                                                    <div id="weatherListCenter"><img src="" alt="" id="no2"></div>
                                                    <div id="weatherListBottom"><span class="weatherListBottom__tmp"
                                                            id="no2"></span><span>℃</span></div>
                                                </div>
                                                <div class="swiper-slide">
                                                    <div id="weatherListTop"><span class="weatherListTop__time"
                                                            id="no3"></span><span>시</span></div>
                                                    <div id="weatherListCenter"><img src="" alt="" id="no3"></div>
                                                    <div id="weatherListBottom"><span class="weatherListBottom__tmp"
                                                            id="no3"></span><span>℃</span></div>
                                                </div>
                                                <div class="swiper-slide">
                                                    <div id="weatherListTop"><span class="weatherListTop__time"
                                                            id="no4"></span><span>시</span></div>
                                                    <div id="weatherListCenter"><img src="" alt="" id="no4"></div>
                                                    <div id="weatherListBottom"><span class="weatherListBottom__tmp"
                                                            id="no4"></span><span>℃</span></div>
                                                </div>
                                                <div class="swiper-slide">
                                                    <div id="weatherListTop"><span class="weatherListTop__time"
                                                            id="no5"></span><span>시</span></div>
                                                    <div id="weatherListCenter"><img src="" alt="" id="no5"></div>
                                                    <div id="weatherListBottom"><span class="weatherListBottom__tmp"
                                                            id="no5"></span><span>℃</span></div>
                                                </div>
                                                <div class="swiper-slide">
                                                    <div id="weatherListTop"><span class="weatherListTop__time"
                                                            id="no6"></span><span>시</span></div>
                                                    <div id="weatherListCenter"><img src="" alt="" id="no6"></div>
                                                    <div id="weatherListBottom"><span class="weatherListBottom__tmp"
                                                            id="no6"></span><span>℃</span></div>
                                                </div>
                                                <div class="swiper-slide">
                                                    <div id="weatherListTop"><span class="weatherListTop__time"
                                                            id="no7"></span><span>시</span></div>
                                                    <div id="weatherListCenter"><img src="" alt="" id="no7"></div>
                                                    <div id="weatherListBottom"><span class="weatherListBottom__tmp"
                                                            id="no7"></span><span>℃</span></div>
                                                </div>
                                                <div class="swiper-slide">
                                                    <div id="weatherListTop"><span class="weatherListTop__time"
                                                            id="no8"></span><span>시</span></div>
                                                    <div id="weatherListCenter"><img src="" alt="" id="no8"></div>
                                                    <div id="weatherListBottom"><span class="weatherListBottom__tmp"
                                                            id="no8"></span><span>℃</span></div>
                                                </div>
                                                <div class="swiper-slide">
                                                    <div id="weatherListTop"><span class="weatherListTop__time"
                                                            id="no9"></span><span>시</span></div>
                                                    <div id="weatherListCenter"><img src="" alt="" id="no9"></div>
                                                    <div id="weatherListBottom"><span class="weatherListBottom__tmp"
                                                            id="no9"></span><span>℃</span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <script>
                                    var swiper = new Swiper('.swiper', {
                                        slidesPerView: 'auto',
                                        direction: getDirection(),
                                        navigation: {
                                            nextEl: '.swiper-button-next',
                                            prevEl: '.swiper-button-prev',
                                        },
                                        on: {
                                            resize: function () {
                                                swiper.changeDirection(getDirection());
                                            },
                                        },
                                    });

                                    function getDirection() {
                                        var windowWidth = window.innerWidth;
                                        var direction = window.innerWidth <= 300 ? 'vertical' : 'horizontal';
                                        
                                        return direction;
                                    }
                                </script>


                                <!-- 오른쪽 화면 - 미니홈피 -->
                                <div class="minihompi">
                                   <jsp:include page="../style/minglesStyle2.jsp"/>
                                </div><!-- 미니홈피 div 끝 -->

                                <!-- 꾸미기 버튼 -->
                                <button id="decorate">나도 꾸미기</button>

                                <!-- 좋아요 표시 -->
                                <div class="heart-container" title="Like">
                                    <input type="checkbox" class="checkbox" id="Give-It-An-Id">
                                    <div class="svg-container">
                                        <svg viewBox="0 0 24 24" class="svg-outline" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Zm-3.585,18.4a2.973,2.973,0,0,1-3.83,0C4.947,16.006,2,11.87,2,8.967a4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,11,8.967a1,1,0,0,0,2,0,4.8,4.8,0,0,1,4.5-5.05A4.8,4.8,0,0,1,22,8.967C22,11.87,19.053,16.006,13.915,20.313Z">
                                            </path>
                                        </svg>
                                        <svg viewBox="0 0 24 24" class="svg-filled" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M17.5,1.917a6.4,6.4,0,0,0-5.5,3.3,6.4,6.4,0,0,0-5.5-3.3A6.8,6.8,0,0,0,0,8.967c0,4.547,4.786,9.513,8.8,12.88a4.974,4.974,0,0,0,6.4,0C19.214,18.48,24,13.514,24,8.967A6.8,6.8,0,0,0,17.5,1.917Z">
                                            </path>
                                        </svg>
                                        <svg class="svg-celebrate" width="100" height="100"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <polygon points="10,10 20,20"></polygon>
                                            <polygon points="10,50 20,50"></polygon>
                                            <polygon points="20,80 30,70"></polygon>
                                            <polygon points="90,10 80,20"></polygon>
                                            <polygon points="90,50 80,50"></polygon>
                                            <polygon points="80,80 70,70"></polygon>
                                        </svg>
                                    </div>
                                </div><!--좋아요 div 끝-->

                                <!-- MP3 BUTTON-->
                                <div class="music">
                                    <img src="../../resources/images/cd.png" alt="cd그림" id="mp3Button">

                                    <!-- img 클릭하면 이 창 뜸 -->
                                    <div class="popover-content" id="show">
                                        <div class="musicThumbnail" id="musicThumbnail">
                                            <!-- 여기에 썸네일 이미지 추가 -->
                                        </div>
                                        <div class="music--info">
                                            <p class="music--title">ETA <!--여기에 jsp로 제목 입력할것--> </p>
                                            <p class="music--singer">뉴진스<!--여기에 jsp로 가수 입력할것--> </p>
                                        </div>
                                        <!-- PLAYLIST BUTTON -->
                                        <button class="material-icons">expand_less</button>
                                        <button class="material-icons">expand_more</button>
                                        <button class="material-icons" id="playlist" data-toggle="modal"
                                            data-target="#myModal">playlist_play</button>
                                    </div>

                                </div>

                                <!--mp3 음악 버튼-->
                                <div class="music">
                                    <img src="../../resources/images/cd.png" alt="cd그림" id="mp3Button">

                                    <!-- img 클릭하면 이 창 뜸 -->
                                    <div class="popover-content" id="show">
                                        <div class="iframe-container" id="player">
                                            <!-- <iframe src="https://www.youtube.com/embed/?autoplay=1&mute=1" allow="autoplay"></iframe> -->
                                            <iframe width="1280" height="720"
                                                src="https://www.youtube.com/embed/jOTfBlKSQYY?autoplay=1"
                                                title="NewJeans (뉴진스) &#39;ETA&#39; Official MV" frameborder="0"
                                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                                referrerpolicy="strict-origin-when-cross-origin"
                                                allowfullscreen></iframe>
                                        </div>
                                        <div class="music--info">
                                            <p class="music--title">ETA</p>
                                            <p class="music--singer">뉴진스</p>
                                        </div>
                                        <!-- 플리 버튼 -->
                                        <button class="material-icons">expand_less</button>
                                        <button class="material-icons">expand_more</button>
                                        <button class="material-icons" id="playlist">playlist_play</button>
                                    </div>

                                </div>

                                <!-- Bulletin Board Modal -->
                                <div class="modal fade" id="bulletinModal" tabindex="-1"
                                    aria-labelledby="bulletinModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">

                                            <div class="modal-header">
                                                <h5 class="modal-title" id="bulletinModalLabel">Bulletin Board</h5>
                                                <button type="button" class="close"
                                                    data-dismiss="modal">&times;</button>
                                            </div>

                                            <div class="modal-body" id="bulletinModalBody">

                                                <table class="modal-table">

                                                    <tr>
                                                        <td rowspan="2" class="modal-img"><img src=<%=mem.getProfilePic()
                                                                %>></td>
                                                        <td class="modal-nickname">
                                                            <%=mem.getNickname() %>
                                                        </td>
                                                        <td rowspan='2' class='memo-content'>Content</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="modal-statusMsg">
                                                            <%=mem.getStatusMsg() %>
                                                        </td>
                                                    </tr>

                                                </table>
                                                <span id="owner" data-owner="<%= mem.getMemNo() %>"></span>
                                                <div class="pagination">
                                                    <button id="prevPage">&lt;</button>
                                                    <span id="pageNumbers"></span>
                                                    <button id="nextPage">&gt;</button>
                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <table>
                                                    <tr>
                                                        <th>
                                                            <img class='bullImg' src=<%=mem.getProfilePic() %>>
                                                        </th>
                                                        <td id="writeMemo">
                                                            <input id="replyContent" maxlength="100" type="text">
                                                        </td>
                                                        <td>
                                                            <select id="memoScopeSelect">
                                                                <option value='P'>전체공개</option>
                                                                <option value='F'>친구공개</option>
                                                                <option value='M'>비공개</option>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <button onclick="insertReply();">메모작성</button>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <!-- PLAYLIST UPDATE MODAL-->

                                <div class="modal fade" id="myModal" role="dialog">
                                    <div class="modal-dialog modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h2 class="modal-title">플레이리스트 관리</h2>
                                                <button type="button" class="close"
                                                    data-dismiss="modal">&times;</button>
                                            </div>
                                            <div class="modal-body">

                                                <div class="music--update">
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
                                                                        <input type="file" name="music" accept=".MP3"
                                                                            id="file">
                                                                    </label>

                                                                    <label for="thumbnail">
                                                                        <div class="material-icons"
                                                                            id="music--thumbnail">
                                                                            smart_display
                                                                        </div>
                                                                        <input type="file" name="musicThumbnail"
                                                                            id="thumbnail">
                                                                    </label>
                                                                </td>
                                                                <td width="360px">
                                                                    &nbsp;
                                                                    제목 : <input type="text" name="title" id="musicTitle"
                                                                        required />
                                                                    가수 : <input type="text" name="singer" id="singer"
                                                                        required />
                                                                    <br>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br><br>
                                                        <div class="btn btn-sm btn-info" id="music--add">
                                                            추가
                                                        </div>
                                                        <div class="btn btn-sm btn-warning" id="music--seq">
                                                            순서변경
                                                        </div>
                                                        <div class="btn btn-sm btn-danger" id="music--delete">
                                                            삭제
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