<%@page import="com.kh.chat.model.vo.Friend"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.chat.model.vo.Chat"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String contextPath = (String)request.getSession().getAttribute("contextPath");
	Member m = (Member)session.getAttribute("loginUser");
	ArrayList<Friend> friend = (ArrayList<Friend>)request.getAttribute("friend");
	
	
	System.out.println(contextPath);
	System.out.println(m);
	System.out.println(friend);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mingles chatting</title>

    <!-- 외부파일 -->
	<script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">

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
    
    
    <!-- 내부파일 -->
    <link rel="stylesheet" href="./resources/css/mingles-chat.css">
    <script defer src="./resources/js/mingles-chat.js"></script>

</head>

<body>


    <div id="wrap">
        <!-- 배경화면 -->
        <div id="container"></div>
        
        <!-- 채팅창 -->
         <section class="chat">
            
             <!-- 친구리스트 -->
             <a href="/mingles.jsp" class="chat-logo"><img src="./resources/images/Mingles로고-움직임-짤.gif" alt="mingles"></a>
             <div class="chat-left">

              <div class="group">
                <svg viewBox="0 0 24 24" aria-hidden="true" class="Searchicon">
                  <g>
                    <path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path>
                  </g>
                </svg>
                <input class="inputSearch" type="search" id="searchInput" placeholder="입력후 enter를 누르세요 :)" />
              </div>

                <ul class="chat-friend">
               	<% for(Friend f : friend){ %>
                    <li class="friendList">
                        <div class="friend__icon"><img src="<%= f.getProfilePic() %>" alt="친구프로필"></div>
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
	                    <canvas id="jsCanvas" class="canvas" name="canvas"></canvas>
	                    
	                    <div class="chatting ch1">
	                        <div class="icon"><img src="<%= friend %>" alt="친구프로필"></div>
	                        <div class="textbox">안녕하세요~ 김서경입니당ㅎㅎ</div>
	                    </div>
	                    
	                    <div class="chatting ch2">
	                        <div href="#" class="icon"><img src="<%= m.getProfilePic() %>" alt="내프로필"></div>
	                        <div class="textbox">안녕하세요. 홈페이지 주인입니다.</div>
	                        <span>2024-08-23</span>
	                    </div>
	                    <div class="chatting ch1">
	                        <div href="#" class="icon"><img src="" alt=""></div>
	                        <div class="textbox">홈페이지가 너무 예뻐서 친하게 지내고 싶어요~~</div>
	                    </div>
	                    <div class="chatting ch2">
	                        <div class="icon"><img src="" alt=""></div>
	                        <div class="textbox">예쁘게 봐주셔서 감사합니다. 자주 소통해요ㅎㅎ</div>
	                    </div>
	                    <div class="chatting ch1">
	                        <div class="icon"><img src="" alt=""></div>
	                        <div class="textbox">홈페이지가 너무 예뻐서 친하게 지내고 싶어요~~</div>
	                    </div>
	                    <div class="chatting ch2">
	                        <div class="icon"><img src="./resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
	                        <div class="textbox">예쁘게 봐주셔서 감사합니다. 자주 소통해요ㅎㅎ</div>
	                    </div><div class="chatting ch1">
	                        <div class="icon"><img src="./resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
	                        <div class="textbox">홈페이지가 너무 예뻐서 친하게 지내고 싶어요~~</div>
	                    </div>
	                    <div class="chatting ch2">
	                        <div class="icon"><img src="./resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
	                        <div class="textbox">예쁘게 봐주셔서 감사합니다. 자주 소통해요ㅎㅎ</div>
	                    </div><div class="chatting ch1">
	                        <div class="icon"><img src="./resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
	                        <div class="textbox">홈페이지가 너무 예뻐서 친하게 지내고 싶어요~~</div>
	                    </div>
	                    <div class="chatting ch2">
	                        <div class="icon"><img src="./resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
	                        <div class="textbox">예쁘게 봐주셔서 감사합니다. 자주 소통해요ㅎㅎ</div>
	                    </div>
	                    <div class="chatting ch1">
	                        <div class="icon"><img src="./resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
	                        <div class="textbox">홈페이지가 너무 예뻐서 친하게 지내고 싶어요~~</div>
	                    </div>
	                    <div class="chatting ch2">
	                        <div class="icon"><img src="./resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
	                        <div class="textbox">예쁘게 봐주셔서 감사합니다. 자주 소통해요ㅎㅎ</div>
	                    </div>

	                </div>
	                
	                
		         <form action="<%= contextPath %>/chatting.ch" class="chat-form" enctype="multipart/form-data"> 
	                 <div class="inputContainer">
	                    <input type="text" id="chatContent" name="inMess" value="" placeholder="메세지를 입력하세요 :)" />
	                    <label for="input-file">
	                      <div class="material-icons">attach_file</div>
	                    </label>
	                    <input type="file" id="input-file" name="originFileNo" value="" style="display: none;" accept="image/*"/>
	                    <span class="material-icons draw">draw</span>
	                    <button type="submit" class="send_btn" id="subBtn">send
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
    
    	$(function(){
    		selectChatList();
    		setInterval(selectChatList,20000);
    	})
    	
    	// ajax로 해당 게시글에 댓글 작성하는 함수
    	function insertChat(){
    		$.ajax({
    			url:"chatting.ch",
    			data:{
    				content:$("#chatContent").val(),
    				chatNo:<%=  %>
    			},
    			success:function(result){ // 채팅성공 = > 갱신된 채팅 리스트 조회
    				if(result>0){
    					selectChatList();
    					$("#chatContent").val("");
    				}
    			},
    			error:function(){
    				console.log("응 코딩 잘못했어~ 다시해");
    			},
    		})
    	}
	  
    </script>
    

</body>

</html>