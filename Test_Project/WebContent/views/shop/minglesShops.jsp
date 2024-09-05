<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.item.model.vo.Item"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 	Member m = (Member)session.getAttribute("loginUser");
	String contextPath = request.getContextPath(); 
	String defaultCategory = (String)request.getAttribute("defaultCategory");
	ArrayList<Item> list = (ArrayList<Item>)request.getAttribute("list"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage =  pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mingles Shop</title>

    <!-- 외부파일 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"
    integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    <!-- Google Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	
	<!-- SweetAlert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- 내부파일 -->
	<link rel="stylesheet" href="<%= contextPath %>/resources/css/mingle-shop.css">
	<script defer src="<%= contextPath %>/resources/js/mingle-shop.js"></script>
	<script type="text/javascript"> let memNo = <%= m.getMemNo() %>;</script>
	<script defer src = "<%= contextPath%>/resources/js/mingle-style2.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="icon" href="<%= contextPath %>/resources/images/Mingles아이콘-removebg-preview.png">

</head>

<body>

    <div id="wrap">

        <!-- 메인 화면 -->
        <div id="container">

            <div class="contain-box">

                <header>

                    <div class="hd-logos">

                        <div class="logo"><img src="<%= contextPath %>/resources/images/Mingles로고-움직임-짤.gif" alt=""></div>

                        <div class="hd-title delay1">상점</div>

                    </div>

                    <div class="hd-menus">

                        <div class="menubar">

                            <div>내 홈피 꾸미기</div>

                            <div>내 아바타 꾸미기</div>

                        </div>

                        <div class="menu-content">

                            <ul>
                                <li id="2-1">벽지</li>
                                <li id="2-2">바닥</li>
                                <li id="2-3">테마</li>
                            </ul>

                            <ul>
                                <li id="3-1">헤어</li>
                                <li id="3-2">표정</li>
                                <li id="3-3">상의</li>
                                <li id="3-4">하의</li>
                                <li id="3-5">신발</li>
                            </ul>

                        </div>

                    </div>
                </header>
                
                <div class = "content">
                    <div class="content-top">
                        <span class="tag-wrapper">
                            <div id="tag">카테고리를 선택해서 아이템을 모아보아요!</div>
                        </span>
                    </div>
                    <div class="content-main">
                        <ul class = "floating"> 
						  <% for(Item it: list){%>
                            <!-- 이게 template -->
                           <li>
                                <div class="item-container">
                                    <div class="img-box"><img src="<%= contextPath %><%= it.getSaveFile()%>"></div>
                                    <div class="item-detail">
                                        <p class="item-name"><%= it.getItemName()%></p>
                                        <p class="item-desc"><%= it.getItemExplan()%></p>
										<button type="button" class="btn btn-info pay purchaseBtn" onclick = "purchaseItem(<%= it.getItemNo()%>,<%= it.getPrice() %>)">
											<img src="<%= contextPath %>/resources/images/거북알.png" style = "width:30px; height:30px;">
											<p
											data-item-no="<%= it.getItemNo() %>" 
											data-item-price="<%= it.getPrice() %>">
											<%= it.getPrice()%>
											</p>
										</button>
                                        <p class="item-date"><span>출시일 : </span><%=it.getItemEnrollDate() %></p>
                                    </div>
                                </div>
                            </li>
						  	<%} %>
                        </ul>
                    </div>
                <footer>
                    <div class="paging-area" align="center">

						<%if(currentPage != 1){ %>
						
							<a href ="<%=contextPath %>/list.it?category=<%=defaultCategory%>&cpage=<%=currentPage-1%>" class="page-button">&lt;</a>
						<%} %>
						
						<% for(int p=startPage; p<=endPage; p++){ %>
						<% if(p==currentPage){ %>
							<span class = "currentpage"><%=p%></span>
                        	<%}else{ %>
                        	<a href="<%=contextPath %>/list.it?category=<%=defaultCategory%>&cpage=<%=p %>"class="page-button"><%=p %></a>
                        	<%} %>
                          <%} %>
                          
                          <%if(currentPage != maxPage){ %>
                          <a href="<%=contextPath%>/list.it?category=<%=defaultCategory%>&cpage=<%=currentPage +1%>" class="page-button">&gt;</a>
                          <%}%>
                    </div>
                </footer>
              </div>
            </div>
        </div>
    </div>
</body>

			<script>
			var ajaxRequest = null;
			
		    // 카테고리, 페이지를 별도로 처리해야 한다.
		    let currentPage = 1; // 기본 페이지
		    let currentCategory = "<%=defaultCategory%>";
		    const tag = document.getElementById('tag');

		    function setCurrentCategory(category) {
		        currentCategory = category;
		        selectItem(currentCategory, currentPage);
		    }

		    function setCurrentPage(page) {
		        currentPage = page;
		        selectItem(currentCategory, currentPage);
		    }

		    document.getElementById('2-1').addEventListener('click', function() {
		        tag.innerHTML = '내방 꾸미기 - 벽지';
		        setCurrentPage(1);
		        setCurrentCategory('IC5');
		    });
		    document.getElementById('2-2').addEventListener('click', function() {
		        tag.innerHTML = '내방 꾸미기 - 바닥';
		        setCurrentPage(1);
		        setCurrentCategory('IC6');
		    });
		    document.getElementById('2-3').addEventListener('click', function() {
		        tag.innerHTML = '내방 꾸미기 - 테마';
		        setCurrentPage(1);
		        setCurrentCategory('IC7');
		    });
		    document.getElementById('3-1').addEventListener('click', function() {
		        tag.innerHTML = '아바타 꾸미기 - 헤어';
		        setCurrentPage(1);
		        setCurrentCategory('IC8');
		    });
		    document.getElementById('3-2').addEventListener('click', function() {
		        tag.innerHTML = '아바타 꾸미기 - 표정';
		        setCurrentPage(1);
		        setCurrentCategory('IC9');
		    });
		    document.getElementById('3-3').addEventListener('click', function() {
		        tag.innerHTML = '아바타 꾸미기 - 상의';
		        setCurrentPage(1);
		        setCurrentCategory('IC10');
		    });
		    document.getElementById('3-4').addEventListener('click', function() {
		        tag.innerHTML = '아바타 꾸미기 - 하의';
		        setCurrentPage(1);
		        setCurrentCategory('IC11');
		    });
		    document.getElementById('3-5').addEventListener('click', function() {
		        tag.innerHTML = '아바타 꾸미기 - 신발';
		        setCurrentPage(1);
		        setCurrentCategory('IC12');
		    });

		    const contextPath = '<%= contextPath %>';
		    
		    function selectItem(currentCategory, currentPage) { // 카테고리별로 아이템 뽑는 함수

		    	if(ajaxRequest !== null){
		    		ajaxRequest.abort();
		    	}
		    
		    	ajaxRequest = $.ajax({
		            url: contextPath + '/listCa.it?',
		            data: { category: currentCategory, cpage: currentPage},
		            method: 'post',
		            dataType:'json',
		            success: function(result) {
		            	updatePage(result);
		                // ArrayList<Item> list, PageInfo pi가 담겨있음.
		            },
		        });
		    }// selectItem
			
		    function updatePage(result) {
		        var contentBar = document.querySelector('.content-main ul');
		        var pagingArea = document.querySelector('.paging-area'); 

		        if (typeof result === 'string') {
		            result = JSON.parse(result); // 문자열인 경우 JSON으로 변환
		        }
		        
		        contentBar.innerHTML = '';
		        
		        if (Array.isArray(result.list) && result.list.length > 0) {
		            for(var i=0; i<result.list.length; i++){
		            	var item = result.list[i]
		                var listItem = document.createElement('li');
		                listItem.classList.add('item-class');
		                listItem.innerHTML = 
		                    '<div class="item-container">' +
		                    '    <div class="img-box"><img src="'+ contextPath + item.saveFile +'"></div>' +
		                    '    <div class="item-detail">' +
		                    '        <p class="item-name">' + item.itemName + '</p>' +
		                    '        <p class="item-desc">' + item.itemExplan + '</p>' +
		                    '        <button type="button" class="btn btn-info pay purchaseBtn" onclick = "purchaseItem('+ item.itemNo + ',' + item.price +')">' +
		                    '            <img src="' + contextPath + '/resources/images/거북알.png" style="width:30px; height:30px;">' +
		                    '            <p data-item-no = "' + item.itemNo + '" data-item-price = "' + item.price+ '">' + item.price + '</p>' +
		                    '        </button>' +
		                    '        <p class="item-date"><span>출시일 : </span>' + item.itemEnrollDate + '</p>' +
		                    '    </div>' +
		                    '</div>';
		                contentBar.appendChild(listItem);
		            };
		        }

		        pagingArea.innerHTML = '';
		        if (result.pi.currentPage !== 1) {
		            var prevButton = document.createElement('span');
		            prevButton.classList.add('page-button');
		            prevButton.style.cursor = 'pointer';
		            prevButton.textContent = '<';
		            prevButton.addEventListener('click', function() {
		                selectItem(currentCategory, result.pi.currentPage - 1);
		            });
		            pagingArea.appendChild(prevButton);
		        }

		        for (var p = result.pi.startPage; p <= result.pi.endPage; p++) {
		            var pageButton = document.createElement('span');
		            pageButton.classList.add('page-button');
		            pageButton.style.cursor = 'pointer';
		            pageButton.textContent = p;
		            if (p === result.pi.currentPage) {
		                pageButton.classList.add('currentpage');
		            } else {
		                pageButton.addEventListener('click', function() {
		                    selectItem(currentCategory, parseInt(this.textContent));
		                });
		            }
		            pagingArea.appendChild(pageButton);
		        }

		        if (result.pi.currentPage < result.pi.maxPage) {
		            var nextButton = document.createElement('span');
		            nextButton.classList.add('page-button');
		            nextButton.style.cursor = 'pointer';
		            nextButton.textContent = '>';
		            nextButton.addEventListener('click', function() {
		                selectItem(currentCategory, result.pi.currentPage + 1);
		            });
		            pagingArea.appendChild(nextButton);
		        }
		    } // updatePage
		    
		    function purchaseItem(itemNo, itemPrice) {
				
		    	Swal.fire({
		    		  title: "아이템을 구매하시겠습니까?",
		    		  text: "아이템이 좀 예쁘긴 하지요~",
		    		  icon: "question",
		    		  showCancelButton: true,
		    		  confirmButtonColor: "#72DDF7",
		    		  cancelButtonColor: " #FCC5D9",
		    		  confirmButtonText: "완전 예뻐요 살래요",
					  cancelButtonText: "좀만 더 고민할래요",
		    		}).then((result) => {
		    		  if (result.isConfirmed) {
			            	updateEgg(itemPrice);
			                $.ajax({
			                    url: contextPath + '/payItem.it',
			                    method: 'POST',
			                    dataType: 'json',
			                    data: {itemNo: itemNo, itemPrice: itemPrice }, 
			                    success: function(result) {
			                    	sendItem(result);
			                    	if(<%=m.getEgg()%><100){
			    		    		    Swal.fire({
			    			    		      title: "구입에 실패하였습니다",
			    			    		      text: "거북알을 충전해주세요!",
			    			    		      icon: "warning",
											  confirmButtonColor: "#75DAD7",
											  confirmButtonText: "충전할게요",
			    			    		    });
			                    	}else{
			    		    		    Swal.fire({
			    			    		      title: "성공적으로 구입했습니다",
			    			    		      text: "꾸미기 화면에서 확인하세요!",
			    			    		      icon: "success",
											  confirmButtonColor: "#75DAD7",
											  confirmButtonText: "당장 갈래요",
			    			    		    });
			                    	}
			                    },
			                    error: function() {}
			                });
		    		  }
		    		});
		    	
		            
		    }// purchaseItem

		</script>
			