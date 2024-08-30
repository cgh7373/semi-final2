<%@page import="com.kh.admin.model.vo.PostType"%>
<%@page import="com.kh.admin.model.vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    ArrayList<Post> postArr = (ArrayList<Post>)request.getAttribute("postArr");
    // 게시글번호, 타입, 제목, 내용, 태그, 공개범위, 닉네임, 조회수, 등록일, 파일경로, 블락상태
    ArrayList<PostType> postType = (ArrayList<PostType>)request.getAttribute("postType");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Post</title>
        <!-- toastUi editor cdn -->
        <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
        <!-- Editor's Style -->
        <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

        <link rel="stylesheet" href="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.css" />
        <link rel="stylesheet" href="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.css"/>

        <!-- Color Picker -->
        <script src="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.js"></script>
        <!-- Editor's Plugin -->
        <script src="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.js"></script>
        
</head>
<body id="page-top">
    <!-- 페이지 래퍼 -->
    <div id="wrapper">

        <%@include file="/views/admin/adminMenubar.jsp" %> 

        <!-- 콘텐츠 래퍼 -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- 메인 콘텐츠 -->
            <div id="content">
                <!-- 상단바 -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- 상단바 네비게이션 -->
                    <ul class="navbar-nav ml-auto">
                        <!-- 네비게이션 항목 - 사용자 정보 -->
                        <li class="nav-item no-arrow">
                            <a class="nav-link" href="#" id="userDropdown">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자님 환영합니다</span>
                                <img class="img-profile rounded-circle"
                                    src="./resources/images/Mingles-removebg-preview.png">
                            </a>
                        </li>
                    </ul>
                </nav>

                <!-- 시작 페이지 내용 -->
                <div class="container-fluid">
							
                    <!-- 페이지 헤더 -->
                    <div class="d-sm-flex justify-content-start mb-4" id="page-header">
                        <h1 class="h3 mb-0 text-gray-800">게시글 관리</h1>
                        <div class="dropdown d-flex align-items-start">
                            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" id="postType">
                                게시글 카테고리 선택
                            </button>
                            <div class="dropdown-menu">
                                <% for(PostType pt : postType) { %>
                                    <button class="dropdown-item" onclick="choicePT(this)" id="postType<%=pt.getPostTypeNo()%>"><%=pt.getPostTypeName() %></button>
                                <% } %>
                            </div>
                        </div>
                        <div class="insert-notice ">
                            <button id="noticeEnroll" class="btn btn-primary" data-toggle="modal" data-target="#addNotice">공지사항 작성</button>
                            <div class="modal fade" id="addNotice">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-body">
                                            <div class="addProduct">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">공지사항 작성</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                </div>
                                                <div class="modal-body">
                                                    <div id="notice-content"></div>
                                                </div>    
                                                <div class="modal-footer">
                                                        <button type="reset" class="btn btn-lg" id="noticeResetButton">작성 취소</button>
                                                        <button type="button" class="btn btn-lg" id="notice-enroll">작성 완료</button>
                                                </div>    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- editor -->
					<script defer>
						// editor
						const Editor = toastui.Editor;
						const { colorSyntax } = toastui.Editor.plugin;
						const editor = new Editor({
						    el: document.querySelector('#notice-content'), // 에디터를 적용할 요소 (컨테이너)
						    height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
						    initialEditType: 'wysiwyg',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
						    // initialValue:내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
						    previewStyle: 'tab',                // 마크다운 프리뷰 스타일 (tab || vertical)
                            plugins: [colorSyntax],
                            usageStatics: false,
                            hooks: {
                                // 이미지 파일 받고 db저장, 에디터에 사진 추가
                                addImageBlobHook: (blob, callback) => {
                                    // forData 생성
                                    const formData = new FormData();
                                    formData.append('file', blob, blob.name);

                                    // 파일업로드 요청
                                    fetch('<%=contextPath%>/upload-image', {
                                        method: 'post',
                                        body: formData,
                                    })
                                    .then(response => response.json())
                                    .then(data => {
                                        // 서버에서 반환한 url 에디터에 삽입
                                        callback(data.url, blob.name);
                                    })
                                    .catch(error => {
                                        console.error("error : ", error);
                                    });
                                },

                                change: () => {
                                    const contentElement = document.querySelector('#notice-content');
                                    // notice-title 아이디 부여
                                    if (contentElement) {
                                        const headings = contentElement.querySelectorAll('h2');
                                        headings.forEach((heading) => {
                                            if (!heading.id) {
                                                heading.id = 'notice-title'; // 원하는 id를 추가
                                            }
                                        });                                       
                                    }         
                                } 
                            },
						});

                        editor.setHTML('<h2 id="notice-title">제목: </h2> <hr> <div id="notice-content">내용: </div>');

						console.log(editor.getHTML());
						
						document.getElementById('noticeResetButton').addEventListener('click', function() {
					        editor.setHTML('<h2 id="notice-title">제목: </h2> <hr> <div id="notice-content">내용: </div>'); // 초기 상태로 되돌리기
                        });
						
						$(function(){
							// 공지사항 등록
                            $("#notice-enroll").click(function(){
                                const htmlContent = editor.getHTML();

                                const parser = new DOMParser();
                                const doc = parser.parseFromString(htmlContent, 'text/html');

                                // 제목과 본문 추출
                                const titleElement = doc.querySelector('#notice-title');
                                let contentElement = titleElement ? titleElement.nextElementSibling : null;
                                const imgElement = doc.querySelector('img');
                                
                                const contents = [];

                                while(contentElement){
                                    contents.push(contentElement.textContent.trim()); // 요소의 텍스트 내용을 배열에 추가
                                    contentElement = contentElement.nextElementSibling;
                                }

                                const title = titleElement ? titleElement.textContent.trim() : '';
                                const content = contents.join('\n'); // 배열의 요소들을 줄바꿈으로 구분하여 하나의 문자열로 만듭니다.
                                const img = imgElement ? imgElement.src : '';

								const urls = "<%=contextPath %>";
								// 공지사항 등록 ajax 
                                $.ajax({
                                    url:"insertNotice.am",
                                    type:"post",
                                    data:{
                                        "nTitle":title,
                                        "nContent": content,
                                        "nImg":img,
                                        "html":htmlContent,
                                    },
                                    success:function(e){
                                        console.log("ajax insertNotice");
                                        if(e === 'noticeY'){
                                            swal({
                                                icon: 'success',
                                                title: "공지사항 등록 성공!",
                                            });
                                        }else if(e === 'noticeN'){
                                            swal({
                                                icon: 'error',
                                                title: "공지사항 등록 실패!",
                                            });
                                        } 
                                        location.href = urls + "/post.am";
                                    },
                                    error: function(){
                                        console.log("ajax insertNotice faild");
                                        
                                    },
                                })
                            });
                            
						})
                        
						// 게시글 카테고리별 조회
						function choicePT(el) {
                            var loginUserNickname = '${loginUser.getNickname()}';
                        
                            $(el).closest('.dropdown-menu').removeClass('show');
                        
                            $.ajax({
                                url: "choicePostType.am",
                                data: {"postType": $(el).text()},
                                success: function (e) {
                                    console.log("ajax success");
                                    let value = "";
                                    $(".row").html("");
                        
                                    e.forEach(post => {
                                        value += generatePostCard(post, loginUserNickname);
                                    });
                        
                                    $("#postArea").html(value);
                                    $("#postType").text($(el).text());
                                },
                                error: function () {
                                    console.log("ajax choicePT failed");
                                }
                            });
						}
						
						function generatePostCard(post, loginUserNickname) {
                            const { postAttachment, postTitle, postBlock, postCount, postContent, postTag, postNum, postWriter, postType } = post;
                            const isUserPost = postType === 1;
                            const modalId = isUserPost ? 'userPostDetailModal' : 'postDetailModal';
                            const clickHandler = isUserPost ? `userPostDetail(event, \${postNum})` : `postDetail(event, \${postNum})`;
                            console.log(postTag);
                            return `
                                <div class="card postCard" data-toggle="modal" data-target="#\${modalId}" onclick="\${clickHandler}">
                                    <img class="card-img-top" src=".\${postAttachment}" alt="post image1" style="width:100%">
                                    <div class="card-body">
                                        <h4 class="card-title">\${postTitle}</h4>
                                        \${postBlock === "N" ? 
                                            `<p class="postCount">\${postCount} 
                                                <i class="fas fa-solid fa-heart" style="color: pink"></i>
                                            </p>` :
                                            `<i class="fas fa-solid fa-lock" style="color: gray"></i>`
                                        }
                                        <p class="card-text">\${postContent}</p>
                                        \${!postTag  ? 
                                            `<p class="postTag">#태그없음</p>` :
                                            `<p class="postTag">\${postTag.replaceAll(',', ' ')}</p>`
                                        }
                                        <button class="dropdown-menu btn-primary" id="postSetting" onclick="event.stopPropagation();">게시글관리</button>
                                        <div class="dropdown">
                                            <button type="button" class="btn btn-post dropdown-toggle btn-primary" data-toggle="dropdown">
                                                게시글관리
                                            </button>
                                            <div class="dropdown-menu">
                                                <button class="dropdown-item" id="deletePost" onclick="event.stopPropagation(); deletePost(\${postNum});">게시글삭제</button>
                                                \${postBlock === "N" ? 
                                                    `<button class="dropdown-item" id="blockPost" onclick="event.stopPropagation(); updateBlock(\${postNum});">블락설정</button>`:
                                                    `<button class="dropdown-item" id="blockPost" onclick="event.stopPropagation(); cancleBlock(\${postNum});">블락해제</button>`
                                                }
                                                \${loginUserNickname === postWriter ? 
                                                    `` :
                                                    `<button class="dropdown-item" id="sendMessage" name="\${postWriter}" onclick="event.stopPropagation(); sendMessage(this);">메세지보내기</button>`
                                                }
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            `;
						}

						
                    </script>
                    
					
                    <!-- 페이지 콘텐츠 -->
                    <div class="row" id="postArea">
                        <%for(Post p : postArr) {%>
                            <%if(p.getPostType() == 1){ %>
                                <div class="card postCard" data-toggle="modal" data-target="#userPostDetailModal" onclick="userPostDetail(event, <%=p.getPostNum() %>)">
                            <%}else{ %>
                                <div class="card postCard" data-toggle="modal" data-target="#postDetailModal" onclick="postDetail(event, <%=p.getPostNum() %>)">
                            <%} %>
                                <img class="card-img-top" src=".<%=p.getPostAttachment() %>" alt="item image1" style="width:100%">
                                <div class="card-body">
                                    <h4 class="card-title"><%=p.getPostTitle() %></h4>  
                                    <%if(p.getPostBlock().equals("N")){ %> 
                                        <p class="postCount"><%=p.getPostCount() %>
                                            <i class="fas fa-solid fa-heart" style="color: pink"></i>
                                        </p>
                                    <%}else{ %>
                                            <i class="fas fa-solid fa-lock" style="color: gray"></i>
                                    <%} %>
                                    <p class="card-text"><%=p.getPostContent() %></p>
                                    <%if(p.getPostTag() == null) {%>
                                        <p class="postTag">#태그없음</p>
                                    <%}else{ %>
                                        <p class="postTag"><%=p.getPostTag().replaceAll("[,]", " ") %></p>
                                    <%} %>
                                    <button class="dropdown-menu btn-primary" id="postSetting" onclick="event.stopPropagation();">게시글관리</button>
                                    <div class="dropdown">
                                        <button type="button" class="btn btn-post dropdown-toggle btn-primary" data-toggle="dropdown" >
                                        게시글관리
                                        </button>
                                        <div class="dropdown-menu">
                                            <button class="dropdown-item" id="deletePost" onclick="event.stopPropagation(); deletePost(<%=p.getPostNum() %>); ">게시글삭제</button>
                                            <%if(p.getPostBlock().equals("N")){ %>
                                                <button class="dropdown-item" id="blockPost" onclick="event.stopPropagation(); updateBlock(<%=p.getPostNum() %>); ">블락설정</button>
                                            <%}else{ %>
                                                <button class="dropdown-item" id="blockPost" onclick="event.stopPropagation(); cancleBlock(<%=p.getPostNum() %>); ">블락해제</button>
                                            <%} %>
                                            <%if(loginUser.getMemId().equals(p.getPostWriter())){ %>
                                                <!-- 아이디가 같으면 메세지보내기 안뜸 -->
                                            <%}else{ %>
                                                <button class="dropdown-item" id="sendMessage" name="<%=p.getPostWriter()%>" data-toggle="modal" data-target="#admin-chat" onclick="event.stopPropagation(); sendMessage(this);">메세지보내기</button>
                                            <%} %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <%} %>
                    </div>   
                </div>
                
                <!-- 공지사항 상세보기 modal -->
                <div class="modal fade" id="postDetailModal" tabindex="-1" role="dialog" aria-labelledby="postDetailModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content" id="noticeModal">
                            <div class="modal-header">
                                <h5 class="modal-title" id="postDetailModalLabel">공지사항 상세보기</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" id="postDetailContent">
                                
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 유저 게시글 상세보기 modal -->
                <div class="modal fade" id="userPostDetailModal" tabindex="-1" role="dialog" aria-labelledby="postDetailModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content" id="noticeModal">
                            <div class="modal-header">
                                <h5 class="modal-title" id="postDetailModalLabel">게시글 상세보기</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" id="userPostDetailContent">

                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 관리자 채팅 modal -->
				<div class="modal fade" id="admin-chat" tabindex="0" role="dialog" aria-labelledby="adminChatModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content" id="admin-chat-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="adminChatModalLabel">관리자 채팅</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" id="admin-chat-body">
								<!-- 메시지 받는 대상 리스트 -->
                                <div class="contact-list" id="contact-list">
                                    <div class="contact-item" id="toMember">작성자</div>
                                </div>
                                <!-- 채팅 리스트 및 입력 -->
                                <div class="chat-container">
                                    <div class="chat-list" id="chat-list">
                                        <!-- 채팅 내역 없으면  -->
                                        <div class="message-container chat-empty">
                                            <div class="chat-item chat-empty">대화내용이없습니다...</div>
                                        </div>
                                        <div class="message-container">
                                            <h6 class="time">10:00 AM</h6>
                                            <div class="chat-item sent">보낸 내용</div>
                                        </div>
                                        <div class="message-container">
                                            <div class="chat-item received">받은 내용~~~~~~~~~~</div>
                                            <h6 class="time">10:01 AM</h6>
                                        </div>
                                        <div class="message-container">
                                            <h6 class="time">10:02 AM</h6>
                                            <div class="chat-item sent">보낸 내용</div>
                                        </div>
                                        <div class="message-container">
                                            <div class="chat-item received">받은 내용~~~~~~~~~~</div>
                                            <h6 class="time">10:03 AM</h6>
                                        </div>
                                        <div class="message-container">
                                            <h6 class="time">10:04 AM</h6>
                                            <div class="chat-item sent">보낸 내용</div>
                                        </div>
                                        <div class="message-container">
                                            <div class="chat-item received">받은 내용~~~~~~~~~~</div>
                                            <h6 class="time">10:05 AM</h6>
                                        </div>
                                    </div>
                                    <div class="chat-input">
                                        <input type="text" id="chat-message" placeholder="메시지를 입력하세요..." class="form-control">
                                        <button type="button" class="btn btn-primary mt-2" id="send-message-btn">전송</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
				</div>

                <script defer>
                    function postDetail(event, no){
                        const modalBody = $("#postDetailContent");
                        const modal = $("#postDetailModal");
                        let value = "";
                        
                        if ($(event.target).closest('.dropdown').length > 0) {
                               return; // 드롭다운 클릭 시 모달 열기 방지
                        }

                        $.ajax({
                            url:"selectPostDetail.am",
                            data:{postNo:no},
                            success:function(e){
                                
                                if(e === 'NNNN'){
                                    swal({
                                        icon: 'error',
                                        title: "상세 조회 실패!",
                                    }).then(() => {
                                        modal.modal('hide');  // 모달 닫기
                                    });
                                }else{
                                    value += e;
                                    modal.modal('show');
                                }
                                    modalBody.html(value);

                            },
                            error:function(){
                                console.log("ajax selectPostDetail error");
                            },
                        });
                    }
                    
                    //유저 게시글 상세 조회
                    function userPostDetail(event, no){
                        const userPostModal = $("userPostDetailModal");
                        const userPostModalBody = $("#userPostDetailContent");
                        let value = "";
                        
                        if ($(event.target).closest('.dropdown').length > 0) {
                        	return; // 드롭다운 클릭 시 모달 열기 방지
                        }
                        
                        $.ajax({
                            url:"userPostDetail.am",
                            data:{postNo:no},
                            success:function(e){
                                console.log("userPost ajax success");
                                
                                value += `
                                    <div id="post-header">
                                    <h2 id="post-title">제목 : \${e.postTitle}</h2>
                                    <h5 id="post-tags">태그 : \${e.postTag}</h5>
                                </div>
                                <div id="post-enroll">
                                    <h5>작성자(ID) : \${e.postWriter}</h5>
                                    <h5>작성일 : \${e.postRegdate}</h5>
                                </div>
                                <hr>
                                <div class="post-content" align="center">
                                    <img id="post-img" src=".\${e.postAttachment}" alt="">
                                    <div id="post-text" align="start">\${e.postContent}</div>
                                </div>
                                `;
                                userPostModalBody.html("");
                                userPostModalBody.html(value);
                            },
                            error:function(){
                                console.log("userPost ajax faild");
                            },
                        })
                    }

                    // 클릭 시 이벤트 전파 차단
                    $(document).on('click', '.dropdown-item', function(event) {
                        event.stopPropagation(); 
                    });

					// 게시글 삭제
                    function deletePost(no){
                        location.href = "deletePost.am?postNo=" + no; 
                    }
					
                    // 블락 처리
                    function updateBlock(no){
                        location.href = "updateBlock.am?postNo=" + no;
                    }
                    // 블락 해제
                    function cancleBlock(no){
                        location.href = "cancleBlock.am?postNo=" + no;
                    }
                    
                    let toNo = "";
                    let memId;
                    // 채팅 로드 하는 함수
                    function sendMessage(el) {
                        memId = el.name;
                        let value = "";
                        let sendChat = "";
                        
                        let toNoIn = "";
                        let lastDate = null; // 마지막으로 표시한 날짜
                        const chatLists = $('#chat-list');
                        $('#toMember').text(el.name);
                        chatLists.html("");
                        $('#admin-chat').modal('show');

                        $.ajax({
                            url: "adminChat.am",
                            data: {
                                memId: memId,
                            },
                            dataType: 'json',
                            success: (chatList) => {
                                console.log("loadChat success");
                                console.log(chatList);
                                if (chatList.length === 0) {
                                    value += `
                                    <div class="message-container chat-empty">
                                        <div class="chat-item chat-empty">대화내용이없습니다...</div>
                                    </div>
                                    <input type='hidden' id='toNoBox' value='\${memId}'  />
                                    `;
                                } else {
                                    
                                    chatList.forEach(chat => {
                                        const chatDate = new Date(chat.chatTime);
                                        const year = chatDate.getFullYear();
                                        const month = chatDate.getMonth() + 1;
                                        const date = chatDate.getDate();
                                        const dayIndex = chatDate.getDay();
                                        const hour = chatDate.getHours().toString().padStart(2, '0');
                                        const minute = chatDate.getMinutes().toString().padStart(2, '0');
										
                                        // 요일을 문자열로 변환
                                        const daysOfWeek = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
                                        const dayString = daysOfWeek[dayIndex];

                                        // 현재 날짜를 비교할 수 있도록 새 객체로 생성
                                        const currentDate = new Date(chatDate.getFullYear(), chatDate.getMonth(), chatDate.getDate());
                                        
                                        // 같은 날짜의 메시지일 때 날짜를 표시하지 않도록 설정
                                        if (lastDate === null || lastDate.getTime() !== currentDate.getTime()) {
                                            // 날짜를 표시한 후, 그 날짜에 속하는 메시지를 표시하도록 value에 추가
                                            if (sendChat) {
                                                value += sendChat;
                                                sendChat = "";
                                            }
                                            value += `
                                            <div class="message-container chat-date">
                                                <div class="chat-item chat-date">\${year}년 \${month}월 \${date}일 \${dayString}</div>
                                            </div>`;
                                            lastDate = currentDate;
                                        }

                                        // 메시지 표시
                                        if (chat.fromNo === 4) {
                                            toNo = `\${chat.toNo}`;
                                            sendChat += `
                                            <div class="message-container">
                                                <h6 class="time">\${hour}:\${minute}</h6>
                                                <div class="chat-item sent">\${chat.chatContent}</div>
                                            </div>`;
                                        } else if (chat.toNo === 4) {
                                            sendChat += `
                                            <div class="message-container">
                                                <div class="chat-item received">\${chat.chatContent}</div>
                                                <h6 class="time">\${hour}:\${minute}</h6>
                                            </div>`;
                                        }
                                    });

                                    // 마지막으로 남은 메시지 추가
                                    if (sendChat) {
                                        value += sendChat;
                                    }
                                }
                                toNoIn += `<input type='hidden' id='toNoBox' value='\${toNo}'>`;
                                chatLists.html(value + toNoIn);
                            },
                            error: () => {
                                console.log("loadChat failed");
                            },
                        });

                        prepareScroll();
                    }


	                    // 채팅창 스크롤 항상 아래로
                        function prepareScroll() {
                            
                            window.setTimeout(scrollList, 500);
                        }
						
				

                    // scroll 함수
                    function scrollList() {
                        // 채팅창 form 안의 채팅 요소
                        let chatList = document.querySelector('.chat-list');
                        chatList.scrollTop = chatList.scrollHeight; // 스크롤의 위치를 최하단으로
                    }

                    function delayedSendMessage(el) {
                        setTimeout(() => {
                            sendMessage(el); 
                        }, 500); 
                    }

                    $(() => {
                        const sendMsgInput = $("#chat-message"); // 인풋(엔터, 버튼 클릭시 안에 밸류넘기기)
                        const sendMsgBtn = $("#send-message-btn"); // 버튼(클릭이벤트)
                        let sendMsg = "";
                        // 엔터 눌렀을 때
                        sendMsgInput.on('keydown',(e)=>{
                            let toMem = $('#toNoBox').val();
                            if(e.key === 'Enter'){
                                sendMsg = sendMsgInput.val();
                                $.ajax({
                                    url:"insertChat.am",
                                    data:{
                                        sendMsg:sendMsg,
                                        toMem: toMem,
                                    },
                                    success:(e)=>{
                                        console.log("insert chat success");
                                        if(e === 'YYYI'){
											sendMsgInput.val("");
											
											delayedSendMessage({name: memId});
										}else{
											
										}
                                    },
                                    error:()=>{
                                        console.log("insert chat faild");
                                        
                                    },
                                })
                            }
                        });
                        // 버튼 클릭시
                        sendMsgBtn.on('click' ,() =>{
                            sendMsg = sendMsgInput.val();
                                $.ajax({
                                    url:"insertChat.am",
                                    data:{
                                    	sendMsg:sendMsg,
                                        toMem: toMem,
                                    },
                                    success:()=>{
                                    	 console.log("insert chat success");
                                         if(e === 'YYYI'){
 											sendMsgInput.val("");
 											
 											delayedSendMessage({name: memId});
 										}else{
 											
 										}
                                    },
                                    error:()=>{
                                        console.log("insert chat faild");
                                    },
                                })
                        })

                    });

                </script>

            </div>
        </div>

    </div>
	
	
	
    <!-- 스크롤 버튼 위로 -->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- 로그아웃 모달 -->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">정말 로그아웃하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃을 원하면 아래 "로그아웃"을 클릭하세요.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-danger" href="logout.mi">로그아웃</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>