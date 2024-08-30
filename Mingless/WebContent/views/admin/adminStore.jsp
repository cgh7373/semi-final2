<%@page import="com.kh.admin.model.vo.ItemCategory"%>
<%@page import="com.kh.admin.model.vo.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ArrayList<Item> item = (ArrayList<Item>)request.getAttribute("item");
	// 아이템번호, 카테고리이름, 아이템파일번호 ,아이템이름, 가격, 아이템설명, 아이템등록일, 아이템 판매상태, 태그
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
                                                    <!-- <div id="insertform"> -->
                                                    <label id="productImage" for="input-file" style="display: block;"></label>
                                                    
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
                                                                <%for(ItemCategory ic : itemCategory){  %>
                                                                    <option value="<%=ic.getCategoryNo()%>"><%=ic.getCategoryName() %></option>
                                                                <%} %>
                                                            </select>
                                                        </div>
                                                        <div class="detailCategory">
                                                            <input name="basic" id="tag"/>
                                                        </div>
                                                        <div class="openTag btn tagify--hasMaxTags">태그작성</div>
                                                    </div>
                                                    <button id="insertItem" class="submit btn btn-sm" onclick="insertItems();">상품등록</button>
                                                <!--  </div> -->
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 폼태그내의 값들 보내기 -->
					<script>
                        // 태그
                        var input = document.querySelector('input[name=basic]')
                        var tagify = new Tagify(input, {
                            maxTags: 3,
                        });
					
					// 등록 버튼 눌렀을때
                    $('#insertItem').on('submit', function(event) {
                        	// alert("dddddd")
                            event.preventDefault();
                        	// 태그값 저장
							var tags = tagify.value;
                            var tagString = JSON.stringify(tags);
                        	// formdata 저장
                            var formData = new FormData(this);
                            formData.append('tags', tagString)
                            
                            $.ajax({
                                type: 'POST',
                                url: "<%= contextPath %>/insertItem.am",
                                data: formData,
                                processData: false,
                                contentType: false, 
                                cache: false,
                                success:function(){
                                    consloe.log("Ajax insertItem success")
                                },
                                error:function(){
                                    console.log("Ajax insertItem error");
                                    
                                },
                            });

                    });
					
                    </script>
                    
					
                    <!-- 페이지 콘텐츠 -->
                    <div class="row">
                        <%for(Item i : item) {%>
                            <div class="card itemCard" style="width:200px; margin-left: 20px; margin-bottom: 20px">
                                <img class="card-img-top" src=".<%=i.getSaveFile() %>" alt="item image1" style="width:100%">
                                <div class="card-body">
                                    <h4 class="card-title"><%=i.getItemName() %></h4>
                                    <p class="price"><%=i.getPrice() %> <i class="fas fa-solid fa-egg" style="color: lightblue"></i></p>
                                    <p class="card-text"><%=i.getItemExplan() %></p>
                                    <%if(i.getItemTag() == null){ %>
                                        <p class="itemTag">#태그없음</p>
                                    <%}else{ %>
                                        <p class="itemTag"><%=i.getItemTag().replaceAll("[,]", " ") %></p>
                                    <%} %>
                                    <button class="dropdown-menu btn-primary" id="itemSetting">상품관리</button>
                                    <div class="dropdown">
                                        <button type="button" class="btn btn-item dropdown-toggle btn-primary" data-toggle="dropdown">
                                        상품관리
                                        </button>
                                        <div class="dropdown-menu">
                                            <button class="dropdown-item" id="deleteItem" name="<%=i.getItemNo() %>" onclick="deleteItem(this);">상품삭제</button>
                                            <button class="dropdown-item" id="resetItem" name="<%=i.getItemNo() %>"  onclick="updatePrice(this);">가격설정</button>
                                            <button class="dropdown-item" id="settingPhoto" name="<%=i.getItemNo() %>,<%=i.getChangeName() %>" onclick="changePicture(this);">상품사진변경</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <% } %>
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
                
				<script defer>
						// 카테고리별로 뜨는 아이템 변화주는 ajax
						function selectIC(el){	
							
							$.ajax({
								url:"categoryChoice.am",
								data:{category: $(el).text()},
								success:function(a){
									let value = "";
									$(".row").html("");
									for(let i=0;i<a.length; i++){
                                        let itemTags = (a[i].itemTag || '').replaceAll(',', ' ');
                                        let itemNo = a[i].itemNo;
                                        let originFileName = a[i].changeName;
                                        let itemStatus = a[i].itemStatus;
                                            value += `
											<div class="card itemCard" style="width:200px; height: auto; margin-left: 20px; margin-bottom: 20px">
                                                <img class="card-img-top" src=".\${a[i].saveFile}" alt="item image1" style="width:100%">
                                                <div class="card-body">
                                                <h4 class="card-title">\${a[i].itemName}</h4>
                                                <p class="price">\${a[i].price} <i class="fas fa-egg" style="color: lightblue"></i></p>
                                                    
                                                <p class="card-text">\${a[i].itemExplan}</p>
                                                <p class="itemTag">\${itemTags ? itemTags : '#태그없음'}</p>
                                                <button class="dropdown-menu btn-primary" id="itemSetting">상품관리</button>
                                                <div class="dropdown">
                                                    <button type="button" class="btn btn-item dropdown-toggle btn-primary" data-toggle="dropdown">
                                                        상품관리
                                                    </button>
                                                    <div class="dropdown-menu ">
                                                    \${itemStatus === 'Y' ? 
                                                        `<button class="dropdown-item" id="deleteItem" name="\${itemNo}" onclick="deleteItem(this);">상품삭제</button>`
                                                       : `<button class="dropdown-item" id="deleteItem" name="\${itemNo}" onclick="cancelDeleteItem(this);">상품재등록</button>`}
                                                        <button class="dropdown-item" id="resetItem" name="\${itemNo}" onclick="updatePrice(this);">가격설정</button>
                                                        <button class="dropdown-item" id="settingPhoto" name="\${itemNo}, \${originFileName}" onclick="changePicture(this);">상품사진변경</button>
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
						
                        // 상품 삭제
                        function deleteItem(el){
							let itemNo = el.name;
                        	Swal.fire({
                        		title: "상품을 삭제 하시겠습니까?",
                        		showCancelButton: true,
                        		confirmButtonText: "삭제",
                        		cancelButtonText: "취소",
                        	}).then((result)=>{
                        		if(result.isConfirmed){
                            		location.href = "deleteItem.am?itemNo=" + itemNo;						
                        		}else if(result.isDismissed){
                        			return;
                        		}
                        	})
                        }
                        
                        // 상품 재등록
                        function cancelDeleteItem(el){
                        	let itemNo = el.name;
                        	function showAlert(){                        
	                        	Swal.fire({
	                        		title: "상품을 재등록 하시겠습니까?",
	                        		showCancelButton: true,
	                        		confirmButtonText: "재등록",
	                        		cancelButtonText: "취소",
	                        		input: "select",
	                        		inputOptions:{
	                        			'IC1': '홈피꾸미기',
	                        			'IC2': '내방꾸미기',
	                        			'IC3': '아바타꾸미기',
	                        			'IC4': '아이템광장',
	                        			'IC5': '벽지꾸미기',
	                        			'IC6': '바닥꾸미기',
	                        			'IC7': '테마꾸미기',
	                        			'IC8': '헤어꾸미기',
	                        			'IC9': '표정꾸미기',
	                        			'IC10': '상의꾸미기',
	                        			'IC11': '하의꾸미기',
	                        			'IC12': '신발꾸미기',
	                        		},
	                        		inputPlaceholder: '변경할 아이템 카테고리를 선택해주세요',
	                        		customClass:{
	                        			input: 'btn',
	                        			option: 'btn'
	                        		}
	                        	}).then((result) => {                        		
	                        		if(result.isConfirmed){
	                        			
		                        		let itemCategory = result.value; 
	                        			if(itemCategory){
		                        			location.href = "cancleDeleteItem.am?itemNo=" + itemNo + "&itemCategory=" + itemCategory;                    				
	                        			}else{
	                        				Swal.fire("카테고리를 입력해주세요!", "", "warning").then(()=>{
		                        				showAlert();	                        					
	                        				});
	                        			}
	                        		}else if(result.isDismissed){
	                        			return;
	                        		}
	                        	})
                        	}
                        	
                        	showAlert();
                        }

                        // 상품 가격 설정
                        function updatePrice(el){

                            Swal.fire({
                                title: "변경할 가격",
                                input: "number",
                                inputAttributes: {
                                    autocapitalize: "off"
                                },
                                showCancelButton: true,
                                confirmButtonText: "확인",
                                cancelButtonText: "취소",
                            }).then((result) => {
                                if(result.isConfirmed){
                                    let price = result.value;

                                    if(price){
                                        location.href = "updatePrice.am?itemNo=" + el.name + "&price=" + price;
                                    }
                                }
                            })
                            
                        }

                        // 사진 변경
                        function changePicture(el){
                         	// 아이템 번호 가져오기
                            var itemNo = el.name;
                            
                            // 모달의 hidden input에 아이템 번호 설정
                            document.getElementById('itemNum').value = itemNo;
                            
                            // 모달 띄우기
                            $('#changePictureModal').modal('show');
                            
                        }

                        function submitPictureForm() {
	                        // 폼 제출
                            document.getElementById('changePictureForm').submit();
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