<%@page import="com.kh.style.model.service.StyleService"%>
<%@page import="com.kh.member.model.service.MemberService"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member m = (Member)session.getAttribute("loginUser");
String contextPath = request.getContextPath();
String alertMsg = (String)session.getAttribute("alertMsg");
String errorMsg = (String)session.getAttribute("errorMsg");

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mingles Frame</title>

    <!-- 외부파일 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script defer src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <script defer src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"
        integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- 내부파일 -->
    <link rel="stylesheet" href="../../resources/css/mingle-style.css">
    <script defer src="../../resources/js/mingle-style.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="icon" href="../../resources/images/Mingles아이콘-removebg-preview.png">

</head>

<body>

    <div id="wrap">

        <!-- 메인 화면 -->
        <div id="container">

            <!-- ELEMENTS -->
            <div class="main-left">

                <img src="../../resources/images/Mingles로고-움직임-짤.gif" alt="" class="logo" />

                <div class="float title">방꾸미기</div>

                <!-- 클릭시 카테고리 바뀌기 -->
                <span class="style-tag">나만의 미니룸을 꾸며요</span>

                <ul class="item-container">
                    <li class="items"><img src="../../resources/stylesources/eyes1.png" /></li>
                    <li class="items"><img src="../../resources/stylesources/eyes2.png" /></li>
                    <li class="items"><img src="../../resources/stylesources/eyes3.png" /></li>
                </ul>

                <footer>
                    <div class="pagination-container">

                        <!-- 이전 버튼 -->
                        <div class="prev-button">&lt;</div>

                        <!-- 페이징바 : pageLimit: 하단에 보여질 페이징 바의 페이지 최대 개수 -->
                        <div class="btn-wrapper">
                            <span class="number-btn">1</span>
                        </div>

                        <!-- 다음 버튼 -->
                        <div class="next-button">&gt;</div>

                    </div>


                </footer>
            </div>

            <!-- CATEGORY -->
            <div class="main-right">

                <div class="right-wrapper">

                    <div class="style-shop">

                        <div class="bal bal2">
                            <div class="bal-wall">벽지</div>
                            <div class="bal-floor">바닥</div>
                            <div class="bal-item">아이템</div>
                        </div>

                        <div class="bal bal3">
                            <div class="bal-hair">헤어</div>
                            <div class="bal-face">표정</div>
                            <div class="bal-outer">상의</div>
                            <div class="bal-pants">하의</div>
                            <div class="bal-shoes">신발</div>
                        </div>

                        <div class="catB">
                            <div class="catTitle roomDeco">방꾸미기</div>
                            <div class="catTitle avatar">아바타</div>
                        </div>

                    </div>

                    <!-- MINIHOMPI ROOM-->
                    <div class="vis-room">

                        <!-- AVATAR : 90-->
                        <div class = "avatar-box">
                            
                            <!-- BODY -->
                            <div class="body">
                                <img id = "body" src="../../resources/stylesources/body.png" alt="body">
                            </div>

                            <!-- HAIR -->
                            <div class="hair" id="hairSave">
                                <img  id = "hair" src="../../resources/stylesources/hair3.png" alt="hair">
                            </div>

                            <!-- FACE -->
                             <div class="face" id = "faceSave">
                                <img id = "face" src="../../resources/stylesources/eyes3.png" alt="eyes">
                             </div>

                             <!-- BOTTOM -->
                              <div class="bottom" id ="bottomSave">
                                 <img id ="bottom" src="../../resources/stylesources/bottom2.png" alt="bottom">
                              </div>

                            <!-- TOP -->
                             <div class="top" id = "topSave">
                                <img id= "top" src="../../resources/stylesources/top4.png" alt="top">
                             </div>

                            <!-- SHOES -->
                             <div class="shoes" id = "shoesSave">
                                <img id = "shoes" src="../../resources/stylesources/shoes13.png" alt="shoes">
                             </div>

                        </div> <!--AVATAR-->

                        <!-- FLOOR SKIN -->
                         <div class="floor-box">
                            <!-- FLOOR관련 ACCESSORIES 배치할 것 -->    

                            <div class="floor-skin">
                                <img id = "floor-skin" src="../../resources/stylesources/floor10.png" alt="floor">
                            </div>

                         </div> <!-- FLOOR -->

                        <!-- WALL SKIN -->
                         <div class="wall-box">
                            <!-- WALL관련 ACCESSORIES 배치할 것 -->
                         </div> <!--WALL-->

                    </div> <!-- MINIHOMPI ROOM-->

                    <div class="bot-box">
                        <div class="btn btn1">mingleShop</div>
                       
                        <div class="btn btn2" onclick = "saveAvatar()">저장하기</div>
                       
                    </div>
 
                </div>

            </div>


        </div>

    </div>
	
	<script>
	// getValues()에 선택된 값 담기
	function getValues(){
		return {
			hair : document.getElementById('hairSave').querySelector('img').src,
			face : document.getElementById('faceSave').querySelector('img').src,
			top : document.getElementById('topSave').querySelector('img').src,
			bottom : document.getElementById('bottomSave').querySelector('img').src,
			shoes : document.getElementById('shoesSave').querySelector('img').src,
		};
	}
	
	// 선택된 값을 saveAvatar을 이용해 Servlet으로 옮기기
	function saveAvatar(){
		let selected = getValues();
		const userId = 1;
		
		// 사용자가 아바타가 있는지 없는지 확인하는 ajax문
		$.ajax({
			url: "/Mingles/hasAvatar.st",
			data : {
				memno : userId,
			},
			type :"post",
			success : function(response){
				let flag = response.flag;
				console.log("hasAvatar여부 성공!");
 			// 사용자에게 아바타가 있을 경우 == hasAvatar의 flag가 true일 경우 == update문 쏘기
				if(flag == true){
				$.ajax({
					url : "/Mingles/updateAvatar.st",
					data :{
						memno: userId,
						hair: selected.hair,
						face: selected.face,
						top : selected.top,
						bottom :selected.bottom,
						shoes :selected.shoes,
					},
					type : "post",
					success : function(){
						console.log("ajax update avatar 통신 success");
					},
					error : function(){
						console.log("ajax update avatar 통신 fail");
					},
				  });
				}else{
				// 사용자에게 아바타가 없을 경우 == hasAvatar의 flag가 false일 경우 == insert문 쏘기(최초 1번)
				$.ajax({
					url : "/Mingles/insertAvatar.st",
					data :{
						memno: userId,
						hair: selected.hair,
						face: selected.face,
						top : selected.top,
						bottom :selected.bottom,
						shoes :selected.shoes,
					},
					type : "post",
					success : function(){
						console.log("ajax insert avatar 통신 success");
					},
					error : function(){
						console.log("ajax insert avatar 통신 fail");
					},
				})
			   }
			},
			error : function(){
				console.log("hasAvatar여부 실패..");
			},
		})
		
	}
	
	</script>

</body>

</html>