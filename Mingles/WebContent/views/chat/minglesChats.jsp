<%@page import="com.kh.chat.model.vo.Friend"%> <%@page
import="java.util.ArrayList"%> <%@page import="com.kh.chat.model.vo.Chat"%>
<%@page import="com.kh.member.model.vo.Member"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<% Member m = (Member)session.getAttribute("loginUser"); 
ArrayList<Friend> friend = (ArrayList<Friend>)request.getAttribute("friend"); 
%>

    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Mingles chatting</title>

        <!-- 외부파일 -->
        <script
          defer
          src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        ></script>
        <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        />
        <link
          href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet"
        />
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <link
          href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css"
          rel="stylesheet"
        />
        <!-- 스크롤 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollToPlugin.min.js" integrity="sha512-1PKqXBz2ju2JcAerHKL0ldg0PT/1vr3LghYAtc59+9xy8e19QEtaNUyt1gprouyWnpOPqNJjL4gXMRMEpHYyLQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


        <!-- 내부파일 -->
        <link
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/mingles-chat.css"
        />
        <script defer src="./resources/js/mingles-chat.js"></script>
      </head>

      <body>
        <div id="wrap">
          <!-- 배경화면 -->
          <div id="container"></div>

          <!-- 채팅창 -->
          <section class="chat">
            <!-- 친구리스트 -->
            <a href="#" class="chat-logo"
              ><img
                src="./resources/images/Mingles로고-움직임-짤.gif"
                alt="mingles"
            /></a>
            <div class="chat-left">
              <div class="group">
                <svg viewBox="0 0 24 24" aria-hidden="true" class="Searchicon">
                  <g>
                    <path
                      d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"
                    ></path>
                  </g>
                </svg>
                <input
                  class="inputSearch"
                  type="search"
                  id="searchInput"
                  placeholder="입력후 enter를 누르세요 :)"
                />
              </div>

              <!-- 친구리스트 동적으로 만듬 -->
              <ul class="chat-friend">
                <% for(Friend f : friend){ %>
                <li class="friendList" value="<%= f.getfMemNo() %>">
                  <div class="friend__icon">
                    <img src="<%= f.getProfilePic() %>" alt="친구프로필" />
                  </div>
                  <div class="friend-info">
                    <span class="friend__name"><%= f.getNickName() %></span>
                    <span class="friend__text">20</span>
                  </div>
                </li>
                <% } %>
              </ul>
            </div>

            <!-- 대화창 -->
            <div class="chat-right">
              <div class="chatRoom">
                <img
                  src="./resources/images/채팅 초기 배경.webp"
                  alt=""
                  id="back"
                  style="width: 100%; height: 100%"
                />
                <canvas id="jsCanvas" class="canvas" name="canvas"></canvas>
              </div>

              <!-- send부분 -->
              <div
                id="chat-form"
                class="chat-form"
                enctype="multipart/form-data"
              >
              <div class="inputContainer">
                <input
                  type="text"
                  id="messageInput"
                  name="inMessage"
                  placeholder="메세지를 입력하세요 :)"
                />
                <label for="input-file">
                  <div class="material-icons">attach_file</div>
                </label>
                <input
                  type="file"
                  id="input-file"
                  name="originFileNo"
                  style="display: none"
                  accept="image/*"
                />
                
                <span class="material-icons draw">draw</span>
                <button class="send_btn" id="subBtn" onclick="insertchat(<%= m.getMemNo() %>)">
                  send
                  <div class="hoverEffect">
                    <div><!-- 이펙트공간 --></div>
                  </div>
                </button>
                
              </div>
              </form>
            </div>
          </section>
        </div>

        <script>
          let fromMemprofile = '<%= m.getProfilePic() %>';
          let loginNo = <%= m.getMemNo() %>;
          let toNo;
          let fromNo;
          let isAutoScroll = true; // 자동 스크롤 활성화 상태.
          
		     // 채팅 로드
          $(document).ready(()=>{
            setInterval(test, 2000);

            $(".chat-friend").on("click", "li", function () {
                 toNo = $(this).attr("value");
                 fromNo = loginNo;
                 loadChatting(toNo, fromNo, loginNo); 
               });

            // 스크롤 위치 감지 함수
            $('.chatRoom').on('scroll', function(){
                let chatRoom = $(this);
                // 사용자가 스크롤 올렸는지 감지
                if(chatRoom.scrollTop() + chatRoom.innerHeight() >= chatRoom[0].scrollHeight - 10){
                  isAutoScroll = true;
                }else{
                  isAutoScroll = false;
                }
               });   
          });

               function test() {
            	   loadChatting(toNo, fromNo, loginNo);
               }

               function scrollToBottom(){
                let chatRoom = $(".chatRoom");
                chatRoom.scrollTop(chatRoom[0].scrollHeight);
               }
               
               // 채팅 로딩하는 함수
               function loadChatting(toNo, fromNo, loginNo) {
                 $.ajax({
                   url: "chatting.ch",
                   type: "GET",
                   data: {
                 	  toNo: toNo,
                 	  fromNo:fromNo,
                 	  loginNo:loginNo
                 	  },
                   dataType: "json",
                   success: function (c) {
               	   let chatContent = "";
                     $.each(c, function (index, chat) {
                     		if(loginNo !== chat.fromNo){
                     			chatContent +=
                                     "<div class='chatting ch1'>" +
                                     "<div class='icon'><img src='" +
                                     chat.toNoprofile +
                                     "' alt='Friend Profile'></div>" +
                                     "<div class='textbox'>" +
                                     chat.chatContent +
                                     "</div>" +
                                     "</div>";
                     		}else{
                     			chatContent +=
                                     "<div class='chatting ch2'>" +
                                     "<div class='icon'><img src='" +
                                     fromMemprofile +
                                     "' alt='My Profile'></div>" +
                                     "<div class='textbox'>" +
                                     chat.chatContent +
                                     "</div>" +
                                     "</div>";
                      		}
                     });

                     let chatRoom =	$(".chatRoom");
                     chatRoom.html("<canvas id='jsCanvas' class='canvas' name='canvas'></canvas>" + chatContent);
                     if(isAutoScroll){
                       scrollToBottom();
                     }
                 },
                   error: function () {
                     console.log("채팅 조회 실패했지요");
                   },
                 });
               }

               // ajax으로 메세지 작성하는 함수
               function insertchat(fromNo){
             	  $.ajax({
             		  url:"insert.ch",
             		  data:{
             			  content : $("#messageInput").val(),
             			  toNo:toNo,
             			  fromNo:fromNo,
             			  loginNo:loginNo,
             		  },
             		  type:"post",
             		  success:function(inChat){
             			  console.log(toNo, fromNo, loginNo)
             			  if(inChat > 0){ // 채팅 보내기 성공 => 갱신 리스트 조회
             			  loadChatting(toNo, fromNo, loginNo);
             			  $("#messageInput").val("");
             			  }
             		  },
             		  error:function(){
             			  console.log("응 채팅 보내는거 실패해띠~");
             		  },
             	  });
               }

        </script>
      </body>
    </html></Friend
  ></Friend
>
