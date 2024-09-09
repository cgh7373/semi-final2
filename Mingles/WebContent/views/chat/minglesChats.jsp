<%@page import="com.kh.chat.model.vo.Friend"%> <%@page
import="java.util.ArrayList"%> <%@page import="com.kh.chat.model.vo.Chat"%>
<%@page import="com.kh.member.model.vo.Member"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<% Member m = (Member)session.getAttribute("loginUser"); 
ArrayList<Friend> friend = (ArrayList<Friend>)request.getAttribute("friend"); 
String contextPath = request.getContextPath();
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
        <link rel="stylesheet" href="./resources/css/mingles-chat.css?ver=1" />
        <script defer src="./resources/js/mingles-chat.js"></script>

        <!-- 마우스 커서 불가사리 -->
    <style type="text/css">* {
      cursor: url(https://cur.cursors-4u.net/nature/nat-3/nat296.cur), 
      auto !important;}
      </style><a href="https://www.cursors-4u.com/cursor/2006/05/01/nat296.html" target="_blank" title="Star Fish 2"><img src="https://cur.cursors-4u.net/cursor.png" border="0" alt="Star Fish 2" style="position:absolute; top: 0px; right: 0px;" /></a>

  <!-- 마우스 이펙트 포인터 -->
  <script type="text/javascript">
      var colours=new Array("#80FFDB", "#48BFE3", "#5E60CE", "#7400B8", "#72EFDD"); // colours for top, right, bottom and left borders and background of bubbles
      var bubbles=66; // maximum number of bubbles on screen
      var over_or_under="over"; // set to "over" for bubbles to always be on top, or "under" to allow them to float behind other objects
      var x=ox=400;
      var y=oy=300;
      var swide=800;
      var shigh=600;
      var sleft=sdown=0;
      var bubb=new Array();
      var bubbx=new Array();
      var bubby=new Array();
      var bubbs=new Array();
      var sploosh=false; 
      function addLoadEvent(funky) {
        var oldonload=window.onload;
        if (typeof(oldonload)!='function') window.onload=funky;
        else window.onload=function() {
          if (oldonload) oldonload();
          funky();
        }
      }
      addLoadEvent(buble);
      function buble() { if (document.getElementById) {
        var i, rats, div;
        for (i=0; i<bubbles; i++) {
          rats=createDiv("3px", "3px");
          rats.style.visibility="hidden";
          rats.style.zIndex=(over_or_under=="over")?"1001":"0";
          div=createDiv("auto", "auto");
          rats.appendChild(div);
          div=div.style;
          div.top="1px";
          div.left="0px";
          div.bottom="1px";
          div.right="0px";
          div.borderLeft="1px solid "+colours[3];
          div.borderRight="1px solid "+colours[1];
          div=createDiv("auto", "auto");
          rats.appendChild(div);
          div=div.style;
          div.top="0px";
          div.left="1px";
          div.right="1px";
          div.bottom="0px"
          div.borderTop="1px solid "+colours[0];
          div.borderBottom="1px solid "+colours[2];
          div=createDiv("auto", "auto");
          rats.appendChild(div);
          div=div.style;
          div.left="1px";
          div.right="1px";
          div.bottom="1px";
          div.top="1px";
          div.backgroundColor=colours[4];
          if (navigator.appName=="Microsoft Internet Explorer") div.filter="alpha(opacity=50)";
          else div.opacity=0.5;
          document.body.appendChild(rats);
          bubb[i]=rats.style;
        }
        set_scroll();
        set_width();
        bubble();
      }}
      function bubble() {
        var c;
        if (Math.abs(x-ox)>1 || Math.abs(y-oy)>1) {
          ox=x;
          oy=y;
          for (c=0; c<bubbles; c++) if (!bubby[c]) {
            bubb[c].left=(bubbx[c]=x)+"px";
            bubb[c].top=(bubby[c]=y-3)+"px";
            bubb[c].width="3px";
            bubb[c].height="3px"
            bubb[c].visibility="visible";
            bubbs[c]=3;
            break;
          }
        }
        for (c=0; c<bubbles; c++) if (bubby[c]) update_bubb(c);
        setTimeout("bubble()", 40);
      }
      document.onmousedown=splash;
      document.onmouseup=function(){clearTimeout(sploosh);};
      function splash() {
        ox=-1;
        oy=-1;
        sploosh=setTimeout('splash()', 100);
      }
      function update_bubb(i) {
        if (bubby[i]) {
          bubby[i]-=bubbs[i]/2+i%2;
          bubbx[i]+=(i%5-2)/5;
          if (bubby[i]>sdown && bubbx[i]>sleft && bubbx[i]<sleft+swide+bubbs[i]) {
            if (Math.random()<bubbs[i]/shigh*2 && bubbs[i]++<8) {
              bubb[i].width=bubbs[i]+"px";
              bubb[i].height=bubbs[i]+"px";
            }
            bubb[i].top=bubby[i]+"px";
            bubb[i].left=bubbx[i]+"px";
          }
          else {
            bubb[i].visibility="hidden";
            bubby[i]=0;
            return;
          }
        }
      }
      document.onmousemove=mouse;
      function mouse(e) {
        if (e) {
          y=e.pageY;
          x=e.pageX;
        }
        else {
          set_scroll();
          y=event.y+sdown;
          x=event.x+sleft;
        }
      }
      window.onresize=set_width;
      function set_width() {
        var sw_min=999999;
        var sh_min=999999;
        if (document.documentElement && document.documentElement.clientWidth) {
          if (document.documentElement.clientWidth>0) sw_min=document.documentElement.clientWidth;
          if (document.documentElement.clientHeight>0) sh_min=document.documentElement.clientHeight;
        }
        if (typeof(self.innerWidth)=='number' && self.innerWidth) {
          if (self.innerWidth>0 && self.innerWidth<sw_min) sw_min=self.innerWidth;
          if (self.innerHeight>0 && self.innerHeight<sh_min) sh_min=self.innerHeight;
        }
        if (document.body.clientWidth) {
          if (document.body.clientWidth>0 && document.body.clientWidth<sw_min) sw_min=document.body.clientWidth;
          if (document.body.clientHeight>0 && document.body.clientHeight<sh_min) sh_min=document.body.clientHeight;
        }
        if (sw_min==999999 || sh_min==999999) {
          sw_min=800;
          sh_min=600;
        }
        swide=sw_min;
        shigh=sh_min;
      }
      window.onscroll=set_scroll;
      function set_scroll() {
        if (typeof(self.pageYOffset)=='number') {
          sdown=self.pageYOffset;
          sleft=self.pageXOffset;
        }
        else if (document.body && (document.body.scrollTop || document.body.scrollLeft)) {
          sdown=document.body.scrollTop;
          sleft=document.body.scrollLeft;
        }
        else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
          sleft=document.documentElement.scrollLeft;
          sdown=document.documentElement.scrollTop;
        }
        else {
          sdown=0;
          sleft=0;
        }
      }
      
      function createDiv(height, width) {
        var div=document.createElement("div");
        div.style.position="absolute";
        div.style.height=height;
        div.style.width=width;
        div.style.overflow="hidden";
        div.style.backgroundColor="transparent";
        return (div);
      }
      // ]]>
      </script>

      </head>

      <body>
        <div id="wrap">
          <!-- 배경화면 -->
          <div id="container"></div>

          <!-- 채팅창 -->
          <section class="chat">
            <!-- 친구리스트 -->
            <a href="<%= contextPath %>/friend.ch" class="chat-logo"
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
                <li class="friendList" value="<%= f.getfMemNo() %>" rel="friendList">
                  <div class="friend__icon">
                    <img src="<%= f.getProfilePic().substring(4) %>" alt="친구프로필" />
                  </div>
                  <div class="friend-info">
                    <span class="friend__name" rel="frinedNick"><%= f.getNickName() %></span>
                    <span class="friend__text">20</span>
                  </div>
                </li>
                <% } %>
              </ul>
            </div>

            <!-- 대화창 -->
            <div class="chat-right">
              <canvas id="jsCanvas" class="canvas" name="canvas"></canvas>
              <div class="chatRoom">
                <img
                  src="./resources/images/채팅 초기 배경.webp"
                  alt=""
                  id="back"
                  style="width: 100%; height: 100%"
                />
              </div>

              <!-- send부분 -->
              <div id="chat-form">
              <div class="inputContainer">
                <input
                  type="text"
                  id="messageInput"
                  name=""
                  placeholder="메세지를 입력하세요 :)"
                />
                <label for="input-file">
                  <div class="material-icons">attach_file</div>
                </label>
                <input
                  type="file"
                  id="input-file"
                  name="originFileNo"
                  onchange="loadImg(this)"
                  style="display: none"
                  multiple="multiple"
                  accept=".png, .jpg, .jpeg"
                />
                
                <span class="material-icons draw">draw</span>
                <button type="button" class="send_btn" id="subBtn" onclick="insertchat(<%= m.getMemNo()%>)">
                  send
                  <div class="hoverEffect">
                    <div><!-- 이펙트공간 --></div>
                  </div>
                </button>
                
              </div>
            </div>
          </section>
        </div>

        <script>
          let fromMemprofile = '<%= m.getProfilePic() %>';
          let loginNo = <%= m.getMemNo() %>;
          let toNo = 0;
          let fromNo;
          let isAutoScroll = true; // 자동 스크롤 활성화 상태.
          let lastDate = null;
          let sendChat = "";
          const newCanvas = '<canvas id="jsCanvas" class="canvas" name="canvas"></canvas>';
          
          // 친구 검색
    	  const originalList = $('.chat-friend').html();
      	 
      	 // enter event
      	 $('.inputSearch').on('keydown', (e)=>{
      		 if(e.key === 'Enter'){
      			 $.ajax({
      				 url:'search.ch',
      				 data:{
      					 friendKeyword:$('.inputSearch').val(),
      				 },
      				 success:function(s){
      					 if(s.length === 0){
	      					 let value = "";
      						 value += '<div style="text-align:center">찾으시는 친구가</div>'
      						 		+ '<div style="text-align:center">존재하지 않습니다.</div>';
       					 $('.chat-friend').html(value);
      					 }else{
	      					 let sFriend = "";
      						 $('.chat-friend').html("");
      						 for(let i=0; i<s.length; i++){						 
      							sFriend += `
          							<li class='friendList' value="\${s[i].fMemNo}" rel='friendList'>
                                        <div class='friend__icon'>
                                        	<img src="\${s[i].profilePic}" alt='친구프로필' />
                                        </div>
                                        <div class='friend-info'>
                                        	<span class='friend__name' rel='frinedNick'>\${s[i].nickName}</span>
                                        	<span class='friend__text'>20</span>
                                        </div>
                                    </li>
                                    `;
      						 }
      		               	$('.chat-friend').html(sFriend);
      					 }
      				 },
      				 error:function(){
      					 console.log("친구검색 망해띠");
      				 },
      			 });
      			}
        	 });
       
       // 인풋 서치 내용 지우면 친구리스트 나옴
       $('.inputSearch').on('input', () => {
           if ($('.inputSearch').val() === '') {
               $('.chat-friend').html(originalList);
           }
       });

       // focus 다른곳으로 바꾸면 친구리스트 리셋
       $('.inputSearch').on('blur', () => {
           if ($('.inputSearch').val() === '') {
               $('.chat-friend').html(originalList);
           }
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
       
       function scrollToBottom(){
           let chatRoom = $(".chatRoom");
           chatRoom.scrollTop(chatRoom[0].scrollHeight);
          }
          

            // 친구 리스트 클릭시 값 받기
            $(".chat-friend").on("click", "li", function () {
                 toNo = $(this).attr("value");
                 fromNo = loginNo;
                 loadChatting(toNo, fromNo, loginNo); 
                 setInterval(()=>{
              		 loadChatting(toNo, fromNo, loginNo);
              	}, 2000);
               });


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
                    	 const chatDate = new Date(chat.chatTime);
                         const year = chatDate.getFullYear();
                         const month = chatDate.getMonth() + 1;
                         const date = chatDate.getDate();
                         const dayIndex = chatDate.getDay();
                         const hour = chatDate.getHours().toString().padStart(2, '0');
                         const minute = chatDate.getMinutes().toString().padStart(2, '0');
               
                         // 요일을 문자열로 변환
                         const daysOfWeek = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
                         const dayString = daysOfWeek[dayIndex];

                         // 현재 날짜를 비교할 수 있도록 새 객체로 생성
                         const currentDate = new Date(chatDate.getFullYear(), chatDate.getMonth(), chatDate.getDate());
                         
                         // 같은 날짜의 메시지일 때 날짜를 표시하지 않도록 설정
                         if (lastDate === null || lastDate.getTime() !== currentDate.getTime()) {
                             // 날짜를 표시한 후, 그 날짜에 속하는 메시지를 표시하도록 value에 추가
                             if (sendChat) {
                            	 chatContent += sendChat;
                                 sendChat = "";
                             }
                             chatContent += `
                             <div class="message-container chat-date">
                                 <div class="chat-item chat-date">\${year}년 \${month}월 \${date}일 \${dayString}</div>
                             </div>`;
                             lastDate = currentDate;
                         }
                         
                         // 채팅 content만 로드
                     		if(loginNo !== chat.fromNo){
                     			
                     			chatContent +=
                                     "<div class='chatting ch1'>" +
                                     "<div class='icon'><img src='" +
                                     chat.toNoprofile.substring(4) +
                                     "' alt='Friend Profile'></div>" +
                                     "<div class='textbox'>" +
                                     chat.chatContent +
                                     "</div>" +
                                     "</div>";
                     		}else{
                     			chatContent +=
                                     "<div class='chatting ch2'>" +
                                     "<div class='icon'><img src='" +
                                     fromMemprofile.substring(4) +
                                     "' alt='My Profile'></div>" +
                                     "<div class='textbox'>" +
                                     chat.chatContent +
                                     "</div>" +
                                     "</div>";
                      		}

                     });
                     let chatRoom = $(".chatRoom");
                     chatRoom.html(chatContent);
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
                      	if(inChat > 0){ // 채팅 보내기 성공 => 갱신 리스트 조회
             			    loadChatting(toNo, fromNo, loginNo);
             			    }
             			   $("#messageInput").val("");
             		  },
             		  error:function(){
             			  console.log("응 채팅 보내는거 실패해띠~");
             		  },
             	  });
               }
               
               //
              /*  $(()=>{
            	   const inputs = $("#messageInput");
            	   
            	   inputs.on("keydown", (e)=>{
            		   
            		   if(e.key === "Enter"){
            			   $.ajax({
                      		  url:"insert.ch",
                      		  data:{
                      			  content : inputs.val(),
                      			  toNo:toNo,
                      			  fromNo:fromNo,
                      			  loginNo:loginNo,
                      		  },
                      		  type:"post",
                      		  success:function(inChat){
                               	if(inChat > 0){ // 채팅 보내기 성공 => 갱신 리스트 조회
                      			    loadChatting(toNo, fromNo, loginNo);
                      			    }
                      			   $("#messageInput").val("");
                      		  },
                      		  error:function(){
                      			  console.log("응 채팅 보내는거 실패해띠~");
                      		  },
                      	  });
            		   }
            	   })
            	   
               })
 */
        </script>
      </body>
    </html></Friend
  ></Friend
>
