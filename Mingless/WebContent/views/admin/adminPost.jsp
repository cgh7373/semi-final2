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
                                        \${postTag === null ? 
                                            `<p class="postTag">#태그없음</p>` :
                                            `<p class="postTag">\${postTag}</p>`
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
                                        <p class="postTag"><%=p.getPostTag() %></p>
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
                                            <%if(loginUser.getNickname().equals(p.getPostWriter())){ %>
                                            <%}else{ %>
                                                <button class="dropdown-item" id="sendMessage" name="<%=p.getPostWriter()%>"onclick="event.stopPropagation(); sendMessage(this);">메세지보내기</button>
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
                                <div id="post-header">
                                    <h2 id="post-title">제목</h2>
                                    <h5 id="post-tags">태그자리</h5>
                                </div>
                                <div id="post-enroll">
                                    <h5>글쓴이</h5>
                                    <h5>날짜자리</h5>
                                </div>
                                <hr>
                                <div class="post-content" align="center">
                                    <img id="post-img" src="./resources/post_upfiles/2024082612101434602.gif" alt="">
                                    <div id="post-text" align="start">내용자리</div>
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
                                    <h2 id="post-title">\${e.postTitle}</h2>
                                    <h5 id="post-tags">\${e.postTag}</h5>
                                </div>
                                <div id="post-enroll">
                                    <h5>\${e.postWriter}</h5>
                                    <h5>\${e.postRegdate}</h5>
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
                    
                    
                    function sendMessage(el){
                    	console.log(el.name);
                    	location.href = "adminChat.am?userNickname=" + el.name;
                    }

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