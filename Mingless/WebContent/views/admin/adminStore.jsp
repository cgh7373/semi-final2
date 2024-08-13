<%@page import="com.kh.admin.model.vo.ItemCategory"%>
<%@page import="com.kh.admin.model.vo.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ArrayList<Item> item = (ArrayList<Item>)request.getAttribute("item");
	// 아이템번호, 카테고리이름, 아이템이름, 가격, 아이템설명, 아이템등록일, 아이템 판매상태
	ArrayList<ItemCategory> itemCategory = (ArrayList<ItemCategory>)request.getAttribute("itemCategory");
	// 아이템카테고리번호, 카테고리 이름
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>adminStore</title>
        
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
                        <h1 class="h3 mb-0 text-gray-800">상점 관리</h1>
                        <div class="dropdown d-flex align-items-start">
                            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
                                상점 카테고리 선택
                            </button>
                            <div class="dropdown-menu">
                            	<%for(ItemCategory i : itemCategory){ %>
	                                <button class="dropdown-item" id="<%=i.getCategoryNo()%>"><%=i.getCategoryName() %></button>
                                <%} %>
                            </div>
                        </div>
                    </div>
					
					<script>
						// 카테고리별로 뜨는 아이템 변화주는 ajax
					</script>
                    <!-- 페이지 콘텐츠 -->
                    <div class="row">
                    	<%for(Item i : item) {%>
                         <div class="card" style="width:200px; height: auto; margin-left: 20px; margin-bottom: 20px">
                            <img class="card-img-top" src="./resources/images/storeItem.png" alt="item image1" style="width:100%">
                            <div class="card-body">
                                <h4 class="card-title"><%=i.getItemName() %></h4>
                                <p class="price"><%=i.getPrice() %></p>
                                <br>
                                <p class="card-text"><%=i.getItemExplan() %></p>
                                <br>
                                <button class="dropdown-menu btn-primary" id="itemSetting">상품관리</button>
                                <div class="dropdown">
                                    <button
                                        type="button"
                                        class="btn btn-item dropdown-toggle btn-primary"
                                        data-toggle="dropdown">
                                        상품관리
                                    </button>
                                    <div class="dropdown-menu">
                                        <button class="dropdown-item" id="deleteItem">상품삭제</button>
                                        <button class="dropdown-item" id="resetItem">가격설정</button>
                                        <button class="dropdown-item" id="settingPhoto">상품사진관리</button>
                                    </div>
                                </div>
                            </div>
                        </div>
						<%} %>
                
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
    <script>
	    window.onload = function() {
	        const url = window.location.href;
	        const urlWithoutQueryString = window.location.origin + window.location.pathname;
	
	        // 현재 URL이 쿼리 문자열을 포함하고 있는지 확인합니다.
	        if (url !== urlWithoutQueryString) {
	            // 쿼리 문자열이 제거된 URL로 브라우저의 URL을 업데이트합니다.
	            window.history.replaceState({}, document.title, urlWithoutQueryString);
	        }
	    };
    </script>
</body>
</html>