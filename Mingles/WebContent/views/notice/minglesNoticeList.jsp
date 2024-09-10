<%@page import="com.kh.posts.model.vo.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member m=(Member)session.getAttribute("loginUser");
PageInfo pi=(PageInfo)request.getAttribute("pi"); 
ArrayList<Post> list = (ArrayList<Post>)request.getAttribute("list");
String contextPath = request.getContextPath();
int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 외부파일 -->
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script defer src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script defer src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"
        integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script defer src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <link rel="stylesheet" href="./resources/css/commonBoard.css">
    <script defer src="./resources/js/commonBoard.js"></script>
</head>
<body>
<script>
$(document).ready(function() {
    // 모달 요소
    var modal = $('#myModal');
    var modalText = $('#modal-text');
    
    // 닫기 버튼
    var span = $('.close');

    // ul 태그 클릭 시 모달 열기
    $(".list_view").click(function() {
        // 글번호를 모달에 표시
        var postNum = $(this).children().eq(0).text().trim();
        modalText.text("글번호: " + postNum + "에 대한 내용");

        // 모달 창 열기
        modal.css("display", "block");
    });

    // 닫기 버튼 클릭 시 모달 닫기
    span.click(function() {
        modal.css("display", "none");
    });

    // 모달 외부 클릭 시 모달 닫기
    $(window).click(function(event) {
        if ($(event.target).is(modal)) {
            modal.css("display", "none");
        }
    });
});
</script>
    <div id="wrap">

        <!-- 메인 화면 -->
    <div id="container">
        <div class="post-list" id="right">
            <div id="post-right__title">
                <div id="right-title__text">공지사항</div>
                <div id="right-title__btn">
                    <button class="btn-set" id="b5"
                        onclick="history.back()"><span>뒤로가기</span>
                    </button>
                </div>
            </div>
            <div id="post-right__list">
                <section class="right-list__content">
                    <ul id="firstul">
                        <li style="width: 5%;">글번호</li>
                        <li style="width: 8%;">공개범위</li>
                        <li style="width: 72%;">제목</li>
                        <li style="width: 10%;">작성일자</li>
                        <li style="width: 5%;">조회수</li>
                    </ul>
                    <div>
                        <% if(list.isEmpty()) {%>
                            <!--게시글 없을 경우-->
                            <ul>
                                <li>조회된 게시글이 없습니다.</li>
                            </ul>
                            <%}else{ %>
                                <!--게시글 있을 경우-->
                                <%for(Post p:list){ %>
                                    <ul class="list_view">
                                        <li style="width: 5%;">
                                            <%=p.getPostNum()%>
                                        </li>
                                        <li style="width: 8%;">
										   공지사항
                                        </li>
                                        <li style="width: 72%; text-align: left;">
                                            <%=p.getPostTitle()%>
                                        </li>
                                        <li style="width: 10%;">
                                            <%=p.getPostRegdate()%>
                                        </li>
                                        <li style="width: 5%;">
                                            <%=p.getPostCount()%>
                                        </li>
                                    </ul>
                                    <%} %>
                                        <%}%>
                    </div>
                </section>
                   <div class="paging-area" align="center">
                        <% if(currentPage != 1){%>
                        <button onclick="location.href='<%= contextPath%>/notice.mi?cpage=<%=currentPage-1%>&writer=<%=m.getMemNo()%>'">&lt;</button>
                        <%} %>
                        <%for(int p = startPage; p<=endPage; p++){%>
                            <%if(p== currentPage){%>
                                <button disabled class="butchoice"><%= p %></button>
                            <%}else{%>
                                <button onclick="location.href='<%= contextPath %>/notice.mi?cpage=<%=p%>&writer=<%=m.getMemNo()%>'"><%= p %></button>
                                <%} %>
                        <%}%>
                        <%if(currentPage != maxPage){ %>
                        <button onclick="location.href='<%= contextPath%>/notice.mi?cpage=<%=currentPage+1%>&writer=<%=m.getMemNo()%>'">&gt;</button>
                        <%} %>
                    </div>
            </div>
        </div>
    </div>
    <div id="myModal" class="modal">
	  <div class="modal-content">
		    <span class="close">&times;</span>
		    <div class="modal_container">
               
            </div>
	  </div>
	</div>
</div> 
<script>
$(function() {
    $(".list_view").click(function() {
        let pno = $(this).children().eq(0).text().trim();

        $.ajax({
            url: "noticedeail.po",
            method: "POST",
            data: { pno: pno },
            success: function(response) {
                if (response.error) {
                    alert(response.error);
                } else {
                    // 모달창에 데이터를 채워넣음
                    $(".modal_container").html(response.postContent);
                    // 모달창 표시
                    $("#myModal").css("display", "block");
                }
            },
            error: function() {
                alert("게시글을 불러오는 중 오류가 발생했습니다.");
            }
        });
    });
});
</script>
</body>
</html>