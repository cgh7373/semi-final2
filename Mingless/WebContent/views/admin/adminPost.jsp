<%@page import="com.kh.admin.model.vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
 ArrayList<Post> postArr = (ArrayList<Post>)request.getAttribute("postArr");
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
                            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" id="iCategory">
                                상점 카테고리 선택
                            </button>
                            <div class="dropdown-menu">
                                    <button class="dropdown-item" onclick="">일반 게시판</button>
                                    <button class="dropdown-item" onclick="">사진 게시판</button>
                            </div>
                        </div>
                        <div class="goToPrice">
                            <button id="productReg" class="btn btn-primary" data-toggle="modal" data-target="#addNotice">공지사항 작성</button>
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
                                                        <button type="reset" class="btn btn-lg" id="modalCloseButton">작성 취소</button>
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
						    // initialValue: "<h2 id='notice-title'>제목 :</h2><p id='notice-content'>내용 : </p>",     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
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

                        editor.setHTML('<h2 id="notice-title">제목: </h2> <div id="notice-content">내용: </div>');

						console.log(editor.getHTML());


						$(function(){
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

                                console.log(title);
                                console.log(content);
                                console.log(img);   
								
                                
								const urls = "<%=contextPath %>";
								
                                $.ajax({
                                    url:"insertNotice.am",
                                    data:{
                                        "nTitle":title,
                                        "nContent": content,
                                        "nImg":img,
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
                        
					
                    </script>
                    
					
                    <!-- 페이지 콘텐츠 -->
                    <div class="row">
                        <%for(Post p : postArr) {%>
                            <div class="card postCard" style="width:200px; margin-left: 20px; margin-bottom: 20px">
                                <img class="card-img-top" src=".<%=p.getPostAttachment() %>" alt="item image1" style="width:100%">
                                <div class="card-body">
                                    <h4 class="card-title"><%=p.getPostTitle() %></h4>
                                    <p class="postCount"><%=p.getPostCount() %> <i class="fas fa-solid fa-heart" style="color: pink"></i></p>
                                    <p class="card-text"><%=p.getPostContent() %></p>
                                    <%if(p.getPostTag() == null) {%>
                                        <p class="postTag">#태그없음</p>
                                    <%}else{ %>
                                        <p class="postTag"><%=p.getPostTag() %></p>
                                    <%} %>
                                    <button class="dropdown-menu btn-primary" id="postSetting">게시글관리</button>
                                    <div class="dropdown">
                                        <button type="button" class="btn btn-post dropdown-toggle btn-primary" data-toggle="dropdown">
                                        게시글관리
                                        </button>
                                        <div class="dropdown-menu">
                                            <button class="dropdown-item" id="deletePost" name="" onclick="deleteItem(this);">게시글삭제</button>
                                            <button class="dropdown-item" id="blockPost" name=""  onclick="updatePrice(this);">블락설정</button>
                                            <button class="dropdown-item" id="sendMessage" name="" onclick="changePicture(this);">메세지보내기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <%} %>
                    </div>   
                </div>
                
                <!-- 사진 수정 modal -->
                <div class="modal fade" id="changePictureModal" tabindex="-1" role="dialog" aria-labelledby="changePictureModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="changePictureModalLabel">사진 변경</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="changePictureForm" action="changePicture.am" method="post" enctype="multipart/form-data">
                                    <div id="productImages"></div>
                                    <div align="center">
                                    <label class="btn btn-info" for="input-files" >
                                        사진 업로드
                                    </label>
                                    <input type="file" id="input-files" name="changeImg" accept="image/*" style="display: none;" required>
                                    <input type="hidden" id="itemNum" name="itemNo">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">사진 변경</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                
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