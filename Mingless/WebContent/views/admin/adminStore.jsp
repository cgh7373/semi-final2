<%@page import="com.kh.admin.model.vo.ItemCategory"%>
<%@page import="com.kh.admin.model.vo.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ArrayList<Item> item = (ArrayList<Item>)request.getAttribute("item");
	// 아이템번호, 카테고리이름, 아이템이름, 가격, 아이템설명, 아이템등록일, 아이템 판매상태
	ArrayList<ItemCategory> itemCategory = (ArrayList<ItemCategory>)request.getAttribute("itemCategory");
	// 아이템카테고리번호, 카테고리 이름
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>adminStore</title>
        
</head>
<body id="page-top">
	<% if(alertMsg != null){ %>
		<script>
			alert("<%=alertMsg %>");				
		</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>
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
                            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" id="iCategory">
                                상점 카테고리 선택
                            </button>
                            <div class="dropdown-menu">
                                <% for(ItemCategory it : itemCategory) { %>
                                    <button class="dropdown-item" onclick="selectIC(this)" id="<%=it.getCategoryNo()%>"><%=it.getCategoryName() %></button>
                                <% } %>
                            </div>
                        </div>
                        <div class="goToPrice">
                            <button id="productReg" class="btn btn-primary" data-toggle="modal" data-target="#addProduct">상품등록</button>
                            <div class="modal fade" id="addProduct">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-body">
                                            <div class="addProduct">
                                                <h2 class="modal-header">상품 등록</h2>
                                                <form action="insertItem.am" method="post" enctype="multipart/form-data">
                                                    <div id="productImage"></div>
                                                    <label class="input-file-button" for="input-file">
                                                        사진 업로드
                                                    </label>
                                                    <input type="file" name="itemImg" id="input-file" accept="image/*" style="display: none;"/>
                                                    <div class="form">
                                                        상품이름<input type="text" name="itemName" id="itemName" required="required">
                                                        상품설명<textarea name="itemDes" id="itemDes" required="required"></textarea>
                                                        상품가격<input type="number" name="itemPrice" id="itemPrice" required="required">
                                                        <div class="custom-select" style="width: 200px;">
                                                            <select name="category" id="productCategory" required="required">
                                                                <option value="none">카테고리 선택</option>
                                                                <option value="IC1">홈피꾸미기</option>
                                                                <option value="IC2">내방꾸미기</option>
                                                                <option value="IC3">아바타꾸미기</option>
                                                                <option value="IC4">아이템광장</option>
                                                            </select>
                                                        </div>
                                                        <div class="detailCategory">
                                                            <input name="basic" id="tag"/>
                                                        </div>
                                                        <div class="openTag btn">태그작성</div>
                                                    </div>
                                                    <button class="submit btn btn-sm btn-primary">상품등록</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
					
					
                    <!-- 페이지 콘텐츠 -->
                    <div class="row">
                        <%for(Item i : item) {%>
                            <div class="card" style="width:200px; height: auto; margin-left: 20px; margin-bottom: 20px">
                                <img class="card-img-top" src=".<%=i.getSaveFile() %>" alt="item image1" style="width:100%">
                                    <div class="card-body">
                                        <h4 class="card-title"><%=i.getItemName() %></h4>
                                        <p class="price"><%=i.getPrice() %> <i class="fas fa-solid fa-egg" style="color: lightblue"></i></p>
                                        <p class="card-text" style="font-size:18px" height:60px><%=i.getItemExplan() %></p>
                                        <br>
                                        <button class="dropdown-menu btn-primary" id="itemSetting">상품관리</button>
                                        <div class="dropdown">
                                            <button type="button" class="btn btn-item dropdown-toggle btn-primary" data-toggle="dropdown">
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
                        <% } %>
                    </div>   
                </div>
				<script>
						// 카테고리별로 뜨는 아이템 변화주는 ajax
						// 카테고리에서 선택시 아이템 목록 조회 다시해서 카테고리별로 띄우기
						// 백틱사용해서 html문 만들기
						function selectIC(el){	
							
							$.ajax({
								url:"categoryChoice.am",
								data:{category: $(el).text()},
								success:function(a){
									let value = "";
									$(".row").html("");
									for(let i=0;i<a.length; i++){
										value += `
											<div class="card" style="width:200px; height: auto; margin-left: 20px; margin-bottom: 20px">
                                                <img class="card-img-top" src=".\${a[i].saveFile}" alt="item image1" style="width:100%">
                                                <div class="card-body">
                                                <h4 class="card-title">\${a[i].itemName}</h4>
                                                <p class="price">\${a[i].price} <i class="fas fa-egg" style="color: lightblue"></i></p>
                                                    
                                                <p class="card-text" style="font-size:18px">\${a[i].itemExplan}</p>
                                                <br>
                                                <button class="dropdown-menu btn-primary" id="itemSetting">상품관리</button>
                                                <div class="dropdown">
                                                    <button type="button" class="btn btn-item dropdown-toggle btn-primary" data-toggle="dropdown">
                                                        상품관리
                                                    </button>
                                                    <div class="dropdown-menu ">
                                                        <button class="dropdown-item" id="deleteItem">상품삭제</button>
                                                        <button class="dropdown-item" id="resetItem">가격설정</button>
                                                        <button class="dropdown-item" id="settingPhoto">상품사진관리</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
										`;									
									}
									$(".row").html(value);
									$("#iCategory").text($(el).text());
								},
								error:function(){
									console.log("categroy ajax fail");
								},
							})							
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