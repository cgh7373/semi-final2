<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.admin.model.vo.Item"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>
<% ArrayList<Item> list = (ArrayList<Item>)request.getAttribute("list"); 
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


    <!-- 내부파일 -->
	<link rel="stylesheet" href="<%= contextPath %>/resources/css/mingle-shop.css">
	<script defer src="<%= contextPath %>/resources/js/mingle-shop.js"></script>
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
                        <ul> 
						  <% for(Item it: list){%>
                            <!-- 이게 template -->
                           <li>
                                <div class="item-container">
                                    <div class="img-box"><img src="<%= contextPath %><%= it.getSaveFile()%>"></div>
                                    <div class="basket">
                                        <button class="material-icons" id ="cart">add_shopping_cart</button>
                                        <button class="material-icons" id="jjimkong">auto_awesome</button>
                                    </div>
                                    <div class="item-detail">
                                        <p class="item-name"><%= it.getItemName()%></p>
                                        <p class="item-desc"><%= it.getItemExplan()%></p>
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
						
							<a href ="<%=contextPath %>/list.it?category=aa&cpage=<%=currentPage-1%>" class="page-button">&lt;</a>
						<%} %>
						
						<% for(int p=startPage; p<=endPage; p++){ %>
						<% if(p==currentPage){ %>
							<span><%=p%></span>
                        	<%}else{ %>
                        	<a href="<%=contextPath %>/list.it?category=aa&cpage=<%=p %>"class="page-button"><%=p %></a>
                        	<%} %>
                          <%} %>
                          
                          <%if(currentPage != maxPage){ %>
                          <a href="<%=contextPath%>/list.it?category=aa&cpage=<%=currentPage +1%>" class="page-button">&gt;</a>
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
		    let currentCategory = '';
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
		            url: contextPath + '/list.it',
		            data: { category: currentCategory, cpage: currentPage},
		            method: 'get',
		            success: function(result) {
		            	console.log("왜 두번 출력되는 거임 :" , result);
		            	updatePage(result);
		                // ArrayList<Item> list, PageInfo pi가 담겨있음.
		            },
		        });
		    }
			
		    function updatePage(result) {
		        var contentBar = document.querySelector('.content-main ul');
		        var pagingArea = document.querySelector('.paging-area'); 

		        contentBar.innerHTML = '';

		        if (Array.isArray(result.list) && result.list.length > 0) {
		            for(var i=0; i<result.list.length; i++){
		            	var item = result.list[i]
		                var listItem = document.createElement('li');
		                listItem.classList.add('item-class');
		                listItem.innerHTML = 
						'<div class="item-container">' +
						'    <div class="img-box"><img src="' + item.saveFile + '></div>' +
						'    <div class="basket">' +
						'        <button class="material-icons" id="cart">add_shopping_cart</button>' +
						'        <button class="material-icons" id="jjimkong">auto_awesome</button>' +
						'    </div>' +
						'    <div class="item-detail">' +
						'        <p class="item-name">' + item.itemName + '</p>' +
						'        <p class="item-desc">' + item.itemExplan + '</p>' +
						'        <p class="item-date"><span>출시일 : </span>' + item.itemEnrollDate + '</p>' +
						'    </div>' +
						'</div>';
		                contentBar.appendChild(listItem);
		            };
		        }

		        pagingArea.innerHTML = '';

		        if (result.pi.currentPage !== 1) {
		            var prevButton = document.createElement('a');
		            prevButton.href = contextPath + '/list.it?category=' + currentCategory + '&cpage=' + (result.pi.currentPage - 1);
		            prevButton.textContent = '<';
		            pagingArea.appendChild(prevButton);
		        }

		        for (var p = result.pi.startPage; p <= result.pi.endPage; p++) {
		            var pageButton = document.createElement('a');
		            pageButton.href = contextPath + '/list.it?category=' + currentCategory + '&cpage=' + p;
		            pageButton.textContent = p;
		            if (p === result.pi.currentPage) {
		                pageButton.classList.add('current-page');
		            }
		            pagingArea.appendChild(pageButton);
		        }

		        if (result.pi.currentPage < result.pi.maxPage) {
		            var nextButton = document.createElement('a');
		            nextButton.href = contextPath + '/list.it?category=' + currentCategory + '&cpage=' + (result.pi.currentPage + 1);
		            nextButton.textContent = '>';
		            pagingArea.appendChild(nextButton);
		        }
		    }
		</script>
			
