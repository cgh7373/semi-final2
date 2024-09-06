<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="com.kh.posts.model.vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 
	Post p =(Post)request.getAttribute("p");
 	int pno = (int)request.getAttribute("pno");
 	Member m = (Member)session.getAttribute("loginUser");
 	String contextPath = request.getContextPath();
 
 %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mingles Frame</title>

    <!-- 외부파일 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <!-- 내부파일 -->
    <script src="./resources/js/minglesdetailpost.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="./resources/css/minglesdetailpost.css">

</head>

<body>

    <div id="wrap">

        <!-- 메인 화면 -->
        <div id="container">
            <div class="post-list" id="right">
                <div id="post-right__title">
                    <div id="right-title__text">자세히 보기</div>
                    <div id="right-title__btn">
                        <button class="btn-set" id="b3" onclick="postupdateform(<%=p.getPostNum()%>);"><span>게시글 수정</span></button>
                        <button class="btn-set" id="b4" onclick="postdelete(<%=p.getPostNum()%>);"><span>게시글 삭제</span></button>
                        <button class="btn-set" id="b5" onclick="history.back()"><span>뒤로가기</span></button>
                    </div>
                </div>
                <div id="post-right__list">
                   <div id="right_area">
                    <img style="width:100%; height:100%;" src="<%= p.getPostThumbnail().replace("../.", "") %>">
                   </div>
                   <div id="left_area">
                        <div style="width: 100%; height: 50%;" id="content_area">
                            <div style="width: 100%; height: 20%; line-height: 190%; border-bottom: 1px solid black;">
								<div style="width: 100%; height: 50%; border-bottom: 1px solid rgb(230, 228, 228); display: flex;">
									<div style="height: 100%; width: 30%;">
										공개범위 : <%
                                                String scopeString = p.getPostScope();
                                                char scope = scopeString.charAt(0); 

                                                if (scope == 'p') { %>
                                                    전체공개
                                                <% } else if (scope == 'f') { %>
                                                    친구만
                                                <% } else if (scope == 'm') { %>
                                                    나만보기
                                                <% } %>
									</div>
									<div style="height: 100%; width: 70%;">제목 : <%=p.getPostTitle()%></div>
								</div>
								<div style="width: 100%; height: 50%; display: flex;">
									<div style="height: 100%; width: 30%;">글번호 : <%=p.getPostNum()%> </div>
									<div style="height: 100%; width: 70%;">태그 : <%=p.getPostTag() %></div>
								</div>
                            </div>
                            <div style="width: 100%; height: 80%;"><%=p.getPostContent() %></div>
                        </div>
                        <div style="width: 100%; height: 50%;" id="coment_area">
	                           <table border="1" align="center" style="width: 100%;">
						        	<thead>
						        		<tr>
                                            <td style="vertical-align: middle; width: 10%;">
												댓글 작성
											</td>
                                            <td style="width: 77%;">
                                            <textarea id="replycontent"style="resize: none; width: 100%;"></textarea>
                                            </td>
                                            <td style="position: relative; width: 13%;">
												<button style="position: absolute; right: 5%; top: 7%; height: 80%; width: 65px;" onclick="insertReply();">댓글등록</button>
											</td>
						        		</tr>
						        	</thead>
						        	<tbody>
						        		<tr>
						        			<td>admin</td>
						        			<td>재밌네요</td>
						        			<td>24/08/13</td>
						        		</tr>
						        	</tbody>
		       				  </table>
			        		  <div class="pagination">

                              </div>
                        </div>
                   </div>
                </div>
            </div>
        </div>
    </div>
	<script type="text/javascript">
    $(function() {
        selectReplyList();
        setInterval(selectReplyList, 10000); // 10초마다 댓글 리스트 갱신
    });

    function insertReply() {
        $.ajax({
            url: "rinsert.po",
            data: {
                content: $("#replycontent").val(),
                pno: <%=pno%>
            },
            type: "post",
            success: function(result) {
                if (result > 0) {
                    selectReplyList();
                    $("#replycontent").val("");
                }
            },
            error: function() {
                console.log("댓글작성용 ajax 통신 실패");
            }
        });
    }

    function selectReplyList() {
        $.ajax({
            url: "rlist.po",
            data: {
                pno: <%=pno%>
            },
            success: function(list) {
                updateReplyList(list);
            },
            error: function() {
                console.log("댓글조회용 ajax 통신 실패");
            }
        });
    }

    function parseDate(dateString) {
        const [datePart, timePart] = dateString.split(' ');
        const [year, month, day] = datePart.split('/').map(Number);
        const [hour, minute, second] = timePart.split(':').map(Number);

        const fullYear = year + 2000; // 2000년대 기준으로 변환
        return new Date(fullYear, month - 1, day, hour, minute, second);
    }

    function updateReplyList(list) {
        const itemsPerPage = 15; 
        let currentPage = 1; 
        let totalPages = Math.ceil(list.length / itemsPerPage);
        
        function renderPage(page) {
            let start = (page - 1) * itemsPerPage;
            let end = Math.min(start + itemsPerPage, list.length);
            let value = "";
            const now = new Date();

            for (let i = start; i < end; i++) {
                const replyTime = parseDate(list[i].replyDate);
                const diffInSeconds = Math.floor((now - replyTime) / 1000);

                let formattedTime;
                if (diffInSeconds < 60) {
                    formattedTime = diffInSeconds + "초 전";
                } else if (diffInSeconds < 3600) {
                    const minutes = Math.floor(diffInSeconds / 60);
                    formattedTime = minutes + "분 전";
                } else if (diffInSeconds < 86400) {
                    const hours = Math.floor(diffInSeconds / 3600);
                    formattedTime = hours + "시간 전";
                } else if (diffInSeconds < 2592000) {
                    const days = Math.floor(diffInSeconds / 86400);
                    formattedTime = days + "일 전";
                } else if (diffInSeconds < 31536000) {
                    const months = Math.floor(diffInSeconds / 2592000);
                    formattedTime = months + "개월 전";
                } else {
                    const years = Math.floor(diffInSeconds / 31536000);
                    formattedTime = years + "년 전";
                }

                value += "<tr>"
                      + "<td style='text-align: center;'>" + list[i].replyStatus + "</td>"
                      + "<td> &nbsp" + list[i].replyContent + "</td>"
                      + "<td>" + formattedTime + "</td>"
                      + "</tr>";
            }
            $("#coment_area tbody").html(value);
            renderPagination();
        }

        function renderPagination() {
            let paginationHtml = "";
            if (totalPages > 1) {
                paginationHtml += "<button id='prevPage' " + (currentPage === 1 ? "disabled" : "") + ">&lt;</button>";
                for (let i = 1; i <= totalPages; i++) {
                    paginationHtml += "<button class='page-btn' " + (i === currentPage ? "style='font-weight: bold;'" : "") + ">" + i + "</button>";
                }
                paginationHtml += "<button id='nextPage' " + (currentPage === totalPages ? "disabled" : "") + ">&gt;</button>";
            }
            $(".pagination").html(paginationHtml);

            $(".page-btn").click(function() {
                currentPage = parseInt($(this).text());
                renderPage(currentPage);
            });

            $("#prevPage").click(function() {
                if (currentPage > 1) {
                    currentPage--;
                    renderPage(currentPage);
                }
            });

            $("#nextPage").click(function() {
                if (currentPage < totalPages) {
                    currentPage++;
                    renderPage(currentPage);
                }
            });
        }

        renderPage(currentPage);   
    }

    function postdelete(pno) {
        location.href = '<%= contextPath %>/delete.po?pno=' + pno;
    }
	function postupdateform(pno) {
		location.href = '<%= contextPath %>/updateform.po?pno=' + pno;
	}
</script>
</body>

</html>