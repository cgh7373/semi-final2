<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        // <![CDATA[
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
    <link rel="stylesheet" href="../../resources/css/mingles-chat.css">
    <script defer src="../../resources/js/mingles-chat.js"></script>
    
    <link rel="icon" href="../chat/favicon.ico">

</head>

<body>

    <div id="wrap">
        <!-- 배경화면 -->
        
        <div id="container"></div>
        


        <!-- 채팅창 -->
        
         <section class="chat">
            
             <!-- 친구리스트 -->
             <a href="http://127.0.0.1:5500/chat/chat.html" class="chat-logo"><img src="../../resources/images/Mingles로고-움직임-짤.gif" alt="mingles"></a>
             <div class="chat-left">

                <!-- 로고 누르면 home창 만들고 싶어. 안예쁠것 같아서 고민중.! -->

                <ul class="chat-friend">
                    <li class="friendList">
                        <div class="friend__icon"><img src="../../resources/images/차은우.jpeg" alt=""></div>
                        <div class="friend-info">
                            <span class="friend__name">김서경</span>
                            <span class="friend__text">마지막채팅떴으면 아주아주아주아주 좋겠다리좋겠다~</span>
                        </div>
                    </li>
                    <li class="friendList">
                        <div class="friend__icon"><img src="../../resources/images/차은우.jpeg" alt=""></div>
                        <div>
                            <span class="friend__name">이주영</span>
                            <span class="friend__text">반짝반짝 작은별 아름답게 비치네</span>
                        </div>
                    </li>
                    <li class="friendList">
                        <div class="friend__icon"><img src="../../resources/images/차은우.jpeg" alt=""></div>
                        <div>
                            <span class="friend__name">유현동</span>
                            <span class="friend__text"> 동쪽하늘에서도 서쪽하늘에서도</span>
                        </div>
                    </li>
                    <li class="friendList">
                        <div class="friend__icon"><img src="../../resources/images/차은우.jpeg" alt=""></div>
                        <div>
                            <span class="friend__name">김상우</span>
                            <span class="friend__text">반짝반짝 작은별 아름답게 비치네 짝!</span>
                        </div>
                    </li>
                    <li class="friendList">
                        <div class="friend__icon"><img src="../../resources/images/차은우.jpeg" alt=""></div>
                        <div>
                            <span class="friend__name">정택은</span>
                            <span class="friend__text"></span>
                        </div>
                    </li>
                    <li class="friendList">
                        <div class="friend__icon"><img src="../../resources/images/차은우.jpeg" alt=""></div>
                        <div>
                            <span class="friend__name">최규호</span>
                            <span class="friend__text">그냥.. 복붙만 하니까 이상해서 아무거나 써봤어요;;</span>
                        </div>
                    </li>
                    <li class="friendList">
                        <div class="friend__icon"><img src="../../resources/images/차은우.jpeg" alt=""></div>
                        <div>
                            <span class="friend__name">김서경</span>
                            <span class="friend__text">마지막채팅떴으면 아주아주아주아주 좋겠다리좋겠다~</span>
                        </div>
                    </li>
                    <li class="friendList">
                        <div class="friend__icon"><img src="../../resources/images/차은우.jpeg" alt=""></div>
                        <div>
                            <span class="friend__name">김서경</span>
                            <span class="friend__text">마지막채팅떴으면 아주아주아주아주 좋겠다리좋겠다~</span>
                        </div>
                    </li>
                    <li class="friendList">
                        <div class="friend__icon"><img src="../../resources/images/차은우.jpeg" alt=""></div>
                        <div>
                            <span class="friend__name">김서경</span>
                            <span class="friend__text">마지막채팅떴으면 아주아주아주아주 좋겠다리좋겠다~</span>
                        </div>
                    </li>
                </ul>
            </div>


            <!-- 대화창 -->
            <div class="chat-right">
                <!-- <div class="chatting-head">
                    <div class="icon"><img src="../resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
                </div> -->
                <div class="chatRoom">
                    <canvas id="jsCanvas" class="canvas"></canvas>
                    <div class="chatting ch1">
                        <div class="icon"><img src="../../resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
                        <div class="textbox">안녕하세요~ 김서경입니당ㅎㅎ</div>
                    </div>
                    <div class="chatting ch2">
                        <div class="icon"><img src="../../resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
                        <div class="textbox">안녕하세요. 홈페이지 주인입니다.</div>
                    </div>
                    <div class="chatting ch1">
                        <div class="icon"><img src="../../resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
                        <div class="textbox">홈페이지가 너무 예뻐서 친하게 지내고 싶어요~~</div>
                    </div>
                    <div class="chatting ch2">
                        <div class="icon"><img src="../../resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
                        <div class="textbox">예쁘게 봐주셔서 감사합니다. 자주 소통해요ㅎㅎ</div>
                    </div>
                    <div class="chatting ch1">
                        <div class="icon"><img src="../../resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
                        <div class="textbox">홈페이지가 너무 예뻐서 친하게 지내고 싶어요~~</div>
                    </div>
                    <div class="chatting ch2">
                        <div class="icon"><img src="../../resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
                        <div class="textbox">예쁘게 봐주셔서 감사합니다. 자주 소통해요ㅎㅎ</div>
                    </div><div class="chatting ch1">
                        <div class="icon"><img src="../../resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
                        <div class="textbox">홈페이지가 너무 예뻐서 친하게 지내고 싶어요~~</div>
                    </div>
                    <div class="chatting ch2">
                        <div class="icon"><img src="../../resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
                        <div class="textbox">예쁘게 봐주셔서 감사합니다. 자주 소통해요ㅎㅎ</div>
                    </div><div class="chatting ch1">
                        <div class="icon"><img src="../../resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
                        <div class="textbox">홈페이지가 너무 예뻐서 친하게 지내고 싶어요~~</div>
                    </div>
                    <div class="chatting ch2">
                        <div class="icon"><img src="../../resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
                        <div class="textbox">예쁘게 봐주셔서 감사합니다. 자주 소통해요ㅎㅎ</div>
                    </div>
                    <div class="chatting ch1">
                        <div class="icon"><img src="../../resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
                        <div class="textbox">홈페이지가 너무 예뻐서 친하게 지내고 싶어요~~</div>
                    </div>
                    <div class="chatting ch2">
                        <div class="icon"><img src="../../resources/images/Mingles아이콘-removebg-preview.png" alt=""></div>
                        <div class="textbox">예쁘게 봐주셔서 감사합니다. 자주 소통해요ㅎㅎ</div>
                    </div>
                    
                </div>
                
                <form class="chat-form"> 
                    <input type="text" id="messageInput" placeholder="메세지를 입력하세요 :)"/>
                        <label for="input-file">
                            <div class="material-icons">attach_file</div>
                        </label>
                        <input type="file" id="input-file" style="display: none;" accept="image/*" onchange="setThumbnail(event);"/>
                        <span class="material-icons draw">draw</span>
                    <input type="submit" value="send">
                </form>
            </div>
         </section>

    </div>

</body>

</html>