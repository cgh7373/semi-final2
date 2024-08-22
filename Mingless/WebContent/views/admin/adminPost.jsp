<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
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
                                                        <button type="submit" class="btn btn-lg" id="notice-enroll">작성 완료</button>
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
						    initialValue: '<h2 id="notice-title">제목 :</h2><p id="notice-content">내용 : </p>',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
						    previewStyle: 'tab',                // 마크다운 프리뷰 스타일 (tab || vertical)
						    plugins: [colorSyntax],
						    usageStatics: false,
						});
	
						console.log(editor.getHTML());
	
	
						$(function(){
						    $("#notice-enroll").click(function(){
						        console.log(editor.getHTML());
						    });
	
						})

					
                    </script>
                    
					
                    <!-- 페이지 콘텐츠 -->
                    <div class="row">
                        
                            <div class="card itemCard" style="width:200px; margin-left: 20px; margin-bottom: 20px">
                                <img class="card-img-top" src="" alt="item image1" style="width:100%">
                                <div class="card-body">
                                    <h4 class="card-title"></h4>
                                    <p class="price"><i class="fas fa-solid fa-egg" style="color: lightblue"></i></p>
                                    <p class="card-text"></p>
                                    
                                        <p class="itemTag">#태그없음</p>
                                    <button class="dropdown-menu btn-primary" id="itemSetting">상품관리</button>
                                    <div class="dropdown">
                                        <button type="button" class="btn btn-item dropdown-toggle btn-primary" data-toggle="dropdown">
                                        상품관리
                                        </button>
                                        <div class="dropdown-menu">
                                            <button class="dropdown-item" id="deleteItem" name="" onclick="deleteItem(this);">상품삭제</button>
                                            <button class="dropdown-item" id="resetItem" name=""  onclick="updatePrice(this);">가격설정</button>
                                            <button class="dropdown-item" id="settingPhoto" name="" onclick="changePicture(this);">상품사진변경</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                       
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