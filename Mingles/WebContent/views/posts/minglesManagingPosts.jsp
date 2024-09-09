<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="com.kh.posts.model.vo.Post" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.kh.common.model.vo.PageInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
Member m=(Member)session.getAttribute("loginUser");
PageInfo pi=(PageInfo)request.getAttribute("pi"); 
ArrayList<Post> list = (ArrayList<Post>)request.getAttribute("list");
System.out.println("1:"+list);
String contextPath = request.getContextPath();
int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mingles Frame</title>

    <!-- 외부파일 -->
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- 내부파일 -->
    <script src="./resources/js/mingleManagingPosts.js"></script>
    <script defer
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="./resources/css/mingleManagingPosts.css">

</head>

<body>

    <div id="wrap">

        <!-- 메인 화면 -->
    <div id="container">
        <div class="post-list" id="right">
            <div id="post-right__title">
                <div id="right-title__text">개인 게시글 관리</div>
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
										    <%
                                                String scopeString = p.getPostScope();
                                                char scope = scopeString.charAt(0); 

                                                if (scope == 'p') { %>
                                                    전체공개
                                                <% } else if (scope == 'f') { %>
                                                    친구만
                                                <% } else if (scope == 'm') { %>
                                                    나만보기
                                                <% } %>
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
                        <button onclick="location.href='<%= contextPath%>/postsForm.mi?cpage=<%=currentPage-1%>&writer=<%=m.getMemNo()%>'">&lt;</button>
                        <%} %>
                        <%for(int p = startPage; p<=endPage; p++){%>
                            <%if(p== currentPage){%>
                                <button disabled class="butchoice"><%= p %></button>
                            <%}else{%>
                                <button onclick="location.href='<%= contextPath %>/postsForm.mi?cpage=<%=p%>&writer=<%=m.getMemNo()%>'"><%= p %></button>
                                <%} %>
                        <%}%>
                        <%if(currentPage != maxPage){ %>
                        <button onclick="location.href='<%= contextPath%>/postsForm.mi?cpage=<%=currentPage+1%>&writer=<%=m.getMemNo()%>'">&gt;</button>
                        <%} %>
                    </div>
            </div>
        </div>
    </div>
</div> 
<script>
$(function()
        {
            $(".list_view").click(function()
            {
                location.href = '<%= contextPath %>/detail.po?pno='+$(this).children().eq(0).text().trim();
            })
        })
</script>
</body>
</html>