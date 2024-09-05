<%@page import="com.kh.style.model.service.StyleService"%> <%@page
import="com.kh.member.model.service.MemberService"%> <%@page
import="com.kh.member.model.vo.Member"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <% Member m =
(Member)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mingles Frame</title>

    <!-- 외부파일 -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    />
    <script
      defer
      src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"
    ></script>
    <script
      defer
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
    ></script>
    <script
      defer
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
    ></script>
    <link
      href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css"
      rel="stylesheet"
    />
    <script
      defer
      src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"
      integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    ></script>

    <!-- SweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- 내부파일 -->
    <link rel="stylesheet" href="../../resources/css/mingle-style.css" />
    <script defer src="../../resources/js/mingle-style.js"></script>
    <script defer src="../../resources/js/mingle-style2.js"></script>
    <script
      defer
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"
    ></script>
    <link
      rel="icon"
      href="../../resources/images/Mingles아이콘-removebg-preview.png"
    />
  </head>

  <body>
    <!-- 아바타룸에서 보이는 화면입니다. 절대절대 지우지 말것!!!!! -->

    <div id="wrap">
      <!-- 메인 화면 -->
      <div id="container">
        <!-- ELEMENTS -->
        <div class="main-left">
          <img
            src="../../resources/images/Mingles로고-움직임-짤.gif"
            alt=""
            class="logo"
          />

          <div class="float title">방꾸미기</div>

          <!-- 클릭시 카테고리 바뀌기 -->
          <span class="style-tag">나만의 미니룸을 꾸며요</span>

          <ul class="item-container">
            <li class="items">
              <img src="../../resources/stylesources/eyes1.png" />
            </li>
            <li class="items">
              <img src="../../resources/stylesources/eyes2.png" />
            </li>
            <li class="items">
              <img src="../../resources/stylesources/eyes3.png" />
            </li>
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
                <div class="bal-theme">테마</div>
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
              <div class="avatar-box">
                <!-- BODY -->
                <div class="body">
                  <img
                    id="body"
                    src="../../resources/stylesources/body.png"
                    alt="body"
                  />
                </div>

                <!-- HAIR -->
                <div class="hair" id="hairSave">
                  <img
                    id="hair"
                    src="../../resources/stylesources/hair15.png"
                    alt="hair"
                  />
                </div>

                <!-- FACE -->
                <div class="face" id="faceSave">
                  <img
                    id="face"
                    src="../../resources/stylesources/eyes3.png"
                    alt="eyes"
                  />
                </div>

                <!-- BOTTOM -->
                <div class="bottom" id="bottomSave">
                  <img
                    id="bottom"
                    src="../../resources/stylesources/bottom11.png"
                    alt="bottom"
                  />
                </div>

                <!-- TOP -->
                <div class="top" id="topSave">
                  <img
                    id="top"
                    src="../../resources/stylesources/top8.png"
                    alt="top"
                  />
                </div>

                <!-- SHOES -->
                <div class="shoes" id="shoesSave">
                  <img
                    id="shoes"
                    src="../../resources/stylesources/shoes11.png"
                    alt="shoes"
                  />
                </div>
              </div>
              <!--AVATAR-->

              <!-- ROOM : 80 -->
              <div class="room-box">
                <!-- WALL-->
                <div class="wall" id="wallSave">
                  <img
                    id="wall"
                    src="../../resources/stylesources/wall6.png"
                    alt="wall"
                  />
                </div>
                <!--WALL-->

                <!-- FLOOR-->
                <div class="floor" id="floorSave">
                  <img
                    id="floor"
                    src="../../resources/stylesources/floor10.png"
                    alt="floor"
                  />
                </div>
                <!-- FLOOR -->

                <!-- THEME -->
                <div class="theme" id="themeSave">
                  <img
                    id="theme"
                    src="../../resources/stylesources/theme1.png"
                    alt="theme"
                  />
                </div>
              </div>
              <!-- ROOM -->
            </div>
            <!-- MINIHOMPI ROOM-->

            <div class="bot-box">
              <div class="btn btn1" style="visibility: hidden">mingleShop</div>

              <div class="btn btn2" onclick="saveAvatar()">저장하기</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script>
      let memNo = <%= m.getMemNo()%>

      // 페이지 로드 시 select됬던 요소 실행
      window.onload= function(){
      	selectAvatar();
      }

      // getValues()에 선택된 값 담기
      function getValues(){
      	return {
      		userNo : memNo,
      		hair : document.getElementById('hairSave').querySelector('img').src,
      		face : document.getElementById('faceSave').querySelector('img').src,
      		top : document.getElementById('topSave').querySelector('img').src,
      		bottom : document.getElementById('bottomSave').querySelector('img').src,
      		shoes : document.getElementById('shoesSave').querySelector('img').src,
      		wall : document.getElementById('wallSave').querySelector('img').src,
      		floor: document.getElementById('floorSave').querySelector('img').src,
      		theme : document.getElementById('themeSave').querySelector('img').src,
      	};

      }// getValues()

      // COOKIE 만들기 - cookie도 getter, setter이 있다.

      function setCookie(name, value, expire){
      	var date = new Date();
      	date.setTime(date.getTime() + expire*24*60*60*1000);
      	document.cookie = name + "=" + encodeURIComponent(value) + ";expires =" + date.toUTCString() + ";path=/";
      }// setCookie

      function getCookie(name){
      	var nameEQ  = name + "=";
      	var ca = document.cookie.split(';');
      	for(let i=0; i<ca.length; i++){
      		var c = ca[i];
      		while (c.charAt(0) === ' ') c = c.substring(1);
      		if(c.indexOf(nameEQ) === 0){
      			return decodeURIComponent(c.substring(nameEQ.length, c.length));
      			}
      		}
      		console.log("get 실패");
      	}// getCookie


      // COOKIE 삭제
      function deleteCookie(name){
      	document.cookie = name + '=; MAX-AGE = -99999999; path =/';
      }

      // 선택된 값을 saveAvatar을 이용해 Servlet으로 옮기기 - insert, update문
      function saveAvatar(){
      	let selected = getValues();

      	// 사용자가 아바타가 있는지 없는지 확인하는 ajax문
      	$.ajax({
      		url: "/Mingles/hasAvatar.st",
      		data : {
      			memno : selected.userNo,
      		},
      		type :"post",
      		success : function(result){
      			let flag = result.flag;

      			// 사용자에게 아바타가 있을 경우 == hasAvatar의 flag가 true일 경우 == update문 쏘기
      			if(flag == true){
      			$.ajax({
      				url : "/Mingles/updateAvatar.st",
      				data :{
      					memno: selected.userNo,
      					hair: selected.hair,
      					face: selected.face,
      					top : selected.top,
      					bottom :selected.bottom,
      					shoes :selected.shoes,
      					wall : selected.wall,
      					floor: selected.floor,
      					theme : selected.theme,
      				},
      				type : "post",
      				success : function(){
      					selectAvatar();
      					Swal.fire({
      					title: "성공적으로 저장하였습니다",
      					text: "내 아바타를 자랑해봐요!",
      					icon: "success",
      					confirmButtonColor: "#75DAD7",
      					confirmButtonText: "당장 갈래요",
      					});
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
      					memno: selected.userNo,
      					hair: selected.hair,
      					face: selected.face,
      					top : selected.top,
      					bottom :selected.bottom,
      					shoes :selected.shoes,
      					wall: selected.wall,
      					floor: selected.floor,
      					theme : selected.theme,
      				},
      				type : "post",
      				success : function(result){
      					// select문을 통해서 저장된 상태를 유지하기
      					selectAvatar();
      					Swal.fire({
      					title: "성공적으로 저장하였습니다",
      					text: "내 아바타를 자랑해봐요!",
      					icon: "success"
      					});
      				},
      				error : function(result){
      					console.log("ajax insert avatar 통신 fail");
      				},
      			})
      		   }
      		},
      		error : function(){
      			console.log("hasAvatar여부 실패..");
      		},
      	}) --%>

      }

      function selectAvatar(){ // select문
      	let selected = getValues();

      	// url 형식 바꾸기
      	let changeURL = function(url){
      		let originalURL = 'http://localhost:8254/Mingles/';
      		return url.replace(originalURL, '../../');
      	};

      	function getAvatarFromCookie(){
      		let avatarData = {
      			hair: getCookie('hair'),
      			face: getCookie('face'),
      			top : getCookie('top'),
      			bottom : getCookie('bottom'),
      			shoes: getCookie('shoes'),
      			wall : getCookie('wall'),
      			floor: getCookie('floor'),
      			theme : getCookie('theme'),
      		};
      		return avatarData;
      	}// getAvatarFromCookies()

      	let avatarData = getAvatarFromCookie();

      	$.ajax({
      		url : "/Mingles/selectAvatar.st",
      		data : {memno : selected.userNo,},
      		type : "post",
      		success : function(result){
      			if(result.hair || result.face || result.top || result.bottom || result.shoes || result.wall || result.floor || result.theme){

      				setCookie('hair',changeURL(result.hair), 365);
                      setCookie('face', changeURL(result.face), 365);
                      setCookie('top', changeURL(result.top), 365);
                      setCookie('bottom', changeURL(result.bottom), 365);
                      setCookie('shoes', changeURL(result.shoes), 365);
                      setCookie('wall', changeURL(result.wall), 365);
                      setCookie('floor', changeURL(result.floor), 365);
                      setCookie('theme', changeURL(result.theme), 365);

                  	$('#hair').attr('src', changeURL(result.hair));
      				$('#face').attr('src', changeURL(result.face));
      				$('#top').attr('src', changeURL(result.top));
      				$('#bottom').attr('src', changeURL(result.bottom));
      				$('#shoes').attr('src', changeURL(result.shoes));
      				$('#wall').attr('src', changeURL(result.wall));
      				$('#floor').attr('src', changeURL(result.floor));
      				$('#theme').attr('src', changeURL(result.theme));

      			}
      		},
      		error : function(result){
      			console.log("select ajax result 실패...");
      		},
      	});

      }// selectAvatar();


      document.addEventListener("DOMContentLoaded", function() {

      		selectItem();

         		// shop에서 사온 아이템들 전체 select하고 값 뿌리기 위해선
         		function selectItem(){
         			$.ajax({
         			url : '/Mingles/selectItem.st',
         			method : 'post',
         			data : {userNo : memNo},
         			success:function(result){
         				updateItemList(result);
         			},
         			error :function(result){
         				console.log("select 실패", result);
         			},
         			});
         		}// selectItem

      	 });
    </script>
  </body>
</html>
