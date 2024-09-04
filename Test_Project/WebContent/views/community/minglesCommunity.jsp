<%@page import="java.util.LinkedHashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.community.model.vo.Community"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	Member m = (Member)session.getAttribute("loginUser");
    	ArrayList<Community> list = (ArrayList<Community>)request.getAttribute("list"); 
    	// 게시물번호, 게시글태그, 게시글작성자번호
    %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mingles Community</title>
        <!-- bootstrap -->
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- chart -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <!-- icon -->
        <link
            href="https://fonts.googleapis.com/icon?family=Material+Icons"
            rel="stylesheet">
        <!-- swiper -->
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>

        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        
        <!-- reset -->
        <link
        href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css"
        rel="stylesheet">
        
        <link rel="stylesheet" href="../../resources/css/mingle-community.css">
        <script src="../../resources/js/mingle-community.js" defer="defer"></script>
        
        
        <!-- style -->
        <style>
          
        </style>

    </head>

    <body>
    
        <div id="wrap">

            <!-- 메인 화면 -->
            <div id="container">
                <!-- TAG -->
                <button class="reload" onclick="location.reload()">새로고침</button>
                <section class="communityTop">
                    <input type="text" placeholder="원하는 카테고리를 검색해보세요">
                    <button id="cateSearch">검색</button>
                </section>

                <header class="tag">
                    <div class="tagList">
                        <div class="swiper">
                            <div class="swiper-wrapper" id="swiper-wrapper">
           						<!-- 여기에 값이 들어가야함 -->
                                   <div class='swiper-slide btn btn--tag color-7'>#강아지</div>
                                   <div class='swiper-slide btn btn--tag color-7'>#고양이</div>
                                   <div class='swiper-slide btn btn--tag color-7'>#운동</div>
                                   <div class='swiper-slide btn btn--tag color-7'>#배고픈데 밥 뭐먹지</div>
                                   <div class='swiper-slide btn btn--tag color-7'>#놀러가실분</div>
                                   <div class='swiper-slide btn btn--tag color-7'>#정보공유</div>
                                   <div class='swiper-slide btn btn--tag color-7'>#뭘봐</div>
                                   <div class='swiper-slide btn btn--tag color-7'>#빨리도망가</div>
                            </div>
                        </div>
                    </div>
                </header>
                

                <section class="popularPost">
                    <div class="showPopularPost">
                        <div class="slide-title--homepage">
                          <h5>
                            <span>인</span>
                            <span>기</span>
                            <span>게</span>
                            <span>시</span>
                            <span>물</span>
                          </h5>
                        </div>
                        <div class="swiper">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><img src="../../resources/images/게시글사진.webp"/></div>
                                <div class="swiper-slide">
                                    <!-- 다시생각해보기 -->
                                    <ul>
                                       <td>제목</td>
                                       <td>글쓴이</td> 
                                       <td>count</td>
                                    </ul>

                                </div>
                                <div class="swiper-slide"><img src="../../resources/images/게시글사진.webp"/></div>
                                <div class="swiper-slide"></div>
                                <div class="swiper-slide"><img src="../../resources/images/게시글사진.webp"/></div>
                                <div class="swiper-slide"></div>
                                <div class="swiper-slide"><img src="../../resources/images/게시글사진.webp"/></div>
                            </div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                        
                    </div>
                </section>
            </div>
        </div>

    </body>
    
    <script>
        $(function() {
            const swiper = new Swiper('header .swiper', {
            // Optional parameters
            slidesPerView: 7,
            loop: true,
            spaceBetween: 20,
            });

            const swiperPp = new Swiper('.popularPost .swiper', {
            // Optional parameters
            slidesPerView: 4,
            loop: false,
            spaceBetween: 30,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            });
        });



    	
    	// ajax로 태그리스트 조회용
    	function tagList(){
    		$.ajax({
    			url:"/tag.cmu",
    			data:{
    				memNo:memNo
    			},
    			success:function(tags){
    				let value = "";
    				for(let i=0; i<tags.length; i++){
    					value += "<div class='swiper-slide btn btn--tag color-7'>"
    								+ tags[i].postTag
    						   + "</div>";
    				}
    				$(".swiper-wrapper").html(value);
    			},
    			error:function(){
    				console.log("태그리스트 조회용 ajax실패띠");
    			},
    		})
    	}
    	
    	/* 게시글 리스트조회용 */
    	// function postList(){
    	// 	$.ajax({
    	// 		url:"/pList.cmt",
    	// 		success:function(c){
    	// 			let value = "";
    	// 			for(Community cmt : list ){
    	// 				value += '<div class="text--post--title">
    	// 						+ cmt[i].postTitle
    	// 						+ '</div><div class="text--post--content">'
    	// 						+ cmt[i].postWirter
    	// 						+ '</div>'
    	// 			}
    	// 		},
    	// 		error:function(c){
    	// 			console.log("게시글 조회용 ajax실패띠");
    	// 		},
    	// 	})
    	// }
	</script>

</html>


