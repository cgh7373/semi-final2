<%@page import="com.kh.posts.model.vo.Post"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.community.model.vo.Community"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    Member m=(Member)session.getAttribute("loginUser"); 
    String contextPath=request.getContextPath(); String
    alertMsg=(String)session.getAttribute("alertMsg"); 
    String errorMsg=(String)session.getAttribute("errorMsg");
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
    </head>
    <body>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // 성공메시지
                <% if (alertMsg != null) { %>
                    swal({
                        icon: 'success',
                        title: '<%=alertMsg%>',
                    });
                <% session.removeAttribute("alertMsg"); %>
                <% } %>

                <% if (errorMsg != null) { %>
                    swal({
                        icon: 'error',
                        title: '<%=errorMsg%>',
                    });
                <% session.removeAttribute("errorMsg"); %>
                <% } %>

                    renderPostsList();

            });
        </script>

        <% if (m !=null) { %>
            <div id="wrap">
                <div id="container">
                    <!-- Right Screen with Post Frame -->
                    <div id="right">
                        <br><br><br>
                        <div class="slide-title--homepage">
                            <h5>
                                <span>인</span>
                                <span>기</span>
                                <span>게</span>
                                <span>시</span>
                                <span>물</span>
                            </h5>
                            <section class="communityTop">
                                <form id="searchForm">
                                    <input name="search" type="text" placeholder="원하는 카테고리를 검색해보세요">
                                    <button type="button" id="cateSearch">검색</button>
                                </form>
                            </section>
                        </div>
                        <div class="post-container">

                            <div class="posts">
                                <img src="../../resources/images/2024081415230389730.png">
                                <div class="post-titles" style="font-size: 30px;">제목 칸입니다.</div>
                                <div class="post-cover">
                                    <div class="post-cover-tag-boxes">#태그1</div>
                                    <div class="post-cover-tag-boxes">#태그2</div>
                                    <div class="post-cover-tag-boxes">#태그3</div>
                                    <div class="post-cover-tag-boxes">#태그4</div>
                                </div>
                            </div>

                        </div>

                        <div class="pagination">
                            <button id="prevPage">&lt;</button>
                            <span id="pageNumbers"></span>
                            <button id="nextPage">&gt;</button>
                        </div>

                    </div>
                    <!-- Post DetailView Modal -->
                    <div class="modal fade" id="detailPostModal">
                        <div class="modal-dialog modal-dialog-centered modal-xl">
                            <div class="modal-content">

                                <!-- Modal body -->
                                <div class="modal-body" align="center">

                                    <div class="modal-left">
                                        <img src="../../resources/images/차은우.jpeg">
                                        <div class="post-cover">
                                            <div class="post-titles" style="font-size: 30px;">제목 칸입니다.</div>
                                            <div class="post-cover-tag-boxes">#태그1</div>
                                        </div>
                                    </div>

                                    <div class="modal-right">

                                        <div class="writer-section">

                                            <div class="post-profile-pic">
                                                <img src="<%=m.getProfilePic()%>">
                                            </div>
                                            <div class="post-writer-info">
                                                <div class="post-writer-nickname">
                                                    <%=m.getNickname()%>
                                                </div>
                                                <div class="post-writer-statusMsg">
                                                    <%=m.getStatusMsg()%>
                                                </div>
                                            </div>
                                            <!-- <div class="post-visit-btn">홈피방문</div> -->

                                            <button type="button" class="close"
                                                data-dismiss="modal">&times;</button>

                                        </div>

                                        <div class="content-section">내용섹션</div>

                                        <div class="reply-section">

                                            <table>

                                                <tr>
                                                    <td rowspan='2' class='memo-img'><img
                                                            src="../../resources/images/차은우.jpeg"></td>
                                                    <td rowspan='2' class='memo-content'>
                                                        pageItems[i].memoContent</td>
                                                    <td class='memo-nickname memo-else'>pageItems[i].nickname
                                                    </td>
                                                </tr>
                                                <tr class='memo-dist'>
                                                    <td class='memo-statusMsg memo-else'>timeAgo</td>
                                                </tr>

                                            </table>

                                        </div>

                                        <div class="reply-insert">
                                            <table>
                                                <tr>
                                                    <th>
                                                        <img src=<%=m.getProfilePic() %>>
                                                    </th>
                                                    <td id="writeMemo">
                                                        <input id="replyContent" maxlength="100" type="text">
                                                    </td>
                                                    <td>
                                                        <select id="memoScopeSelect">
                                                            <option value='P'>전체공개</option>
                                                            <option value='F'>친구공개</option>
                                                            <option value='M'>비공개</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <button onclick="insertReply();">댓글작성</button>
                                                        <input type="hidden" class="pNumBox">
                                                        <input type="hidden" class="writerBox">
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                        <div class="pagination">
                                            <button id="prevPage">&lt;</button>
                                            <span id="pageNumbers"></span>
                                            <button id="nextPage">&gt;</button>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <script>

                function makePreview() {

                    var formData = new FormData();

                    var fileInput = $("#post-thumbnail")[0];
                    if (fileInput.files.length > 0) {
                        formData.append("image", fileInput.files[0]);
                    }

                    $.ajax({
                        url: "/Mingles/makePreview.mi",
                        type: "POST",
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function (response) {
                            $("#writePostModal img").attr("src", response);
                        },
                    });

                    $.ajax({
                        url: "/Mingles/makePreview2.mi",
                        data: {
                            title: $("#post-title").val(),
                            color: $("#post-title-color").val(),
                            size: $("#post-title-size").val(),
                        },
                        success: function (result) {
                            $("#writePostModal .post-titles").css("font-size", result[0].postCount + "px");
                            $("#writePostModal .post-titles").html(result[0].postTitle);
                            $("#writePostModal .post-titles").css("color", result[0].postTitleColor);
                        },
                    })

                    let values = "";

                    $.ajax({
                        url: "/Mingles/makePreview3.mi",
                        data: {
                            tag: $("#post-tag").val(),
                        },
                        success: function (tags) {

                            if (tags[0] !== "") {
                                for (let i in tags) {
                                    values += '<div class="post-cover-tag-boxes">🏷️' + tags[i].trim() + '</div>'
                                }
                            }

                            $("#writePostModal .post-cover").html(values);
                        },
                    })

                }

                function insertPost() {

                    var formData = new FormData();

                    var fileInput = $("#post-thumbnail")[0];
                    if (fileInput.files.length > 0) {
                        formData.append("image", fileInput.files[0]);
                    }

                    formData.append("title", $("#post-title").val());
                    formData.append("color", $("#post-title-color").val());
                    formData.append("size", $("#post-title-size").val());
                    formData.append("tags", $("#post-tag").val());
                    formData.append("content", $("#post-content").val());
                    formData.append("scope", $("#post-scope").val());
                    formData.append("memNo", <%=m.getMemNo() %>);

                    $.ajax({
                        url: "/Mingles/insertPost.mi",
                        type: "POST",
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function (result) {

                            if (result > 0) {
                                swal({
                                    icon: 'success',
                                    title: '게시글이 등록되었어요',
                                });
                                $("#post-title").val("")
                                $("#post-title-color").val("#000000")
                                $("#post-title-size").val(30)
                                $("#post-tag").val("")
                                $("#post-content").val("")
                                $("#post-thumbnail").val("");
                                renderPostsList();
                            }

                        },
                    });

                };

                function renderPostsList() {

                    $.ajax({
                        url: "/Mingles/selectpopular.po",
                        data: {
                            writer: <%= m.getMemNo() %>,
                        },
                        success: (result) => {

                            const itemsPerPage = 12;
                            let currentPage = 1;
                            const totalItems = result.length;
                            const totalPages = Math.ceil(totalItems / itemsPerPage);

                            $(".writerBox").val(<%= m.getMemNo() %>)

                            function renderPage(page) {

                                const start = (page - 1) * itemsPerPage;
                                const end = start + itemsPerPage;
                                const pageItems = result.slice(start, end);

                                let value = "";

                                if (pageItems.length === 0) {

                                    $("#right .post-container").html("아직 아무것도 없어요");

                                } else {

                                    for (let item of pageItems) {

                                        item.postTitle = item.postTitle ?? "";
                                        item.postTag = item.postTag ?? "";
                                        item.postThumbnail = item.postThumbnail || "./Mingles/resources/images/2024090609460747614.jpg";
                                        
                                        const tArr = item.postTag.split(",");
                                        let tagsHtml = "";

                                        for (let tag of tArr) {
                                            if (tag != "") {
                                                tagsHtml += '<div class="post-cover-tag-boxes">🏷️' + tag.trim() + '</div>';
                                            }
                                        }
                                        value += `
                                                 <div class="posts" data-pNum="\${item.postNum}">
                                                    <img src="\${item.postThumbnail}" alt="Post Thumbnail">
                                                    <div class="post-titles" style="font-size: \${item.postTitleSize}px; color:\${item.postTitleColor}">\${item.postTitle}</div>
                                                    <div class="post-cover">
                                                        <div class="post-regdate">\${item.postRegdate}</div>
                                                        <div class="post-count">⭐️\${item.postCount}</div>
                                                        \${tagsHtml}
                                                    </div>
                                                 </div>
                                                 `;
                                    }
                                    $("#right .post-container").html(value);

                                }

                                updatePaginationControls();

                            }

                            function updatePaginationControls() {

                                const pageNumbers = $("#right #pageNumbers");
                                pageNumbers.empty();

                                if (totalPages === 0) {
                                    $("#right #prevPage").prop('disabled', true);
                                    $("#right #nextPage").prop('disabled', true);
                                    return;
                                }

                                for (let i = 1; i <= totalPages; i++) {

                                    const button = $("<button>")
                                        .text(i)
                                        .addClass('page-btn')
                                        .data('page', i)
                                        .on('click', function () {
                                            currentPage = $(this).data('page');
                                            renderPage(currentPage);
                                        });
                                    if (button.text() == currentPage) {
                                        button.css("font-weight", "bold");
                                    }

                                    pageNumbers.append(button);
                                }

                                $("#right #prevPage").prop('disabled', currentPage === 1);
                                $("#right #nextPage").prop('disabled', currentPage === totalPages || totalPages === 0);

                            }

                            $("#right #prevPage").on('click', function () {

                                if (currentPage > 1) {
                                    currentPage--;
                                    renderPage(currentPage);
                                }

                            });

                            $("#right #nextPage").on('click', function () {

                                if (currentPage < totalPages) {
                                    currentPage++;
                                    renderPage(currentPage);
                                }

                            });

                            renderPage(currentPage);

                        },
                    })

                }
                function renderPostsList() {

                    $.ajax({
                        url: "/Mingles/selectpopular.po",
                        data: {
                            writer: <%= m.getMemNo() %>,
                        },
                        success: (result) => {

                            const itemsPerPage = 12;
                            let currentPage = 1;
                            const totalItems = result.length;
                            const totalPages = Math.ceil(totalItems / itemsPerPage);

                            $(".writerBox").val(<%= m.getMemNo() %>)

                            function renderPage(page) {

                                const start = (page - 1) * itemsPerPage;
                                const end = start + itemsPerPage;
                                const pageItems = result.slice(start, end);

                                let value = "";

                                if (pageItems.length === 0) {

                                    $("#right .post-container").html("아직 아무것도 없어요");

                                } else {

                                    for (let item of pageItems) {
										console.log(item.postThumbnail)
                                        item.postTitle = item.postTitle ?? "";
                                        item.postTag = item.postTag ?? "";
                                        item.postThumbnail = item.postThumbnail || "./Mingles/resources/images/2024090609460747614.jpg";
                                        const tArr = item.postTag.split(",");
                                        let tagsHtml = "";

                                        for (let tag of tArr) {
                                            if (tag != "") {
                                                tagsHtml += '<div class="post-cover-tag-boxes">🏷️' + tag.trim() + '</div>';
                                            }
                                        }
                                        value += `
                                                 <div class="posts" data-pNum="\${item.postNum}">
                                                    <img src="\${item.postThumbnail}" alt="Post Thumbnail">
                                                    <div class="post-titles" style="font-size: \${item.postTitleSize}px; color:\${item.postTitleColor}">\${item.postTitle}</div>
                                                    <div class="post-cover">
                                                        <div class="post-regdate">\${item.postRegdate}</div>
                                                        <div class="post-count">⭐️\${item.postCount}</div>
                                                        \${tagsHtml}
                                                    </div>
                                                 </div>
                                                 `;
                                    }
                                    $("#right .post-container").html(value);

                                }

                                updatePaginationControls();

                            }

                            function updatePaginationControls() {

                                const pageNumbers = $("#right #pageNumbers");
                                pageNumbers.empty();

                                if (totalPages === 0) {
                                    $("#right #prevPage").prop('disabled', true);
                                    $("#right #nextPage").prop('disabled', true);
                                    return;
                                }

                                for (let i = 1; i <= totalPages; i++) {

                                    const button = $("<button>")
                                        .text(i)
                                        .addClass('page-btn')
                                        .data('page', i)
                                        .on('click', function () {
                                            currentPage = $(this).data('page');
                                            renderPage(currentPage);
                                        });
                                    if (button.text() == currentPage) {
                                        button.css("font-weight", "bold");
                                    }

                                    pageNumbers.append(button);
                                }

                                $("#right #prevPage").prop('disabled', currentPage === 1);
                                $("#right #nextPage").prop('disabled', currentPage === totalPages || totalPages === 0);

                            }

                            $("#right #prevPage").on('click', function () {

                                if (currentPage > 1) {
                                    currentPage--;
                                    renderPage(currentPage);
                                }

                            });

                            $("#right #nextPage").on('click', function () {

                                if (currentPage < totalPages) {
                                    currentPage++;
                                    renderPage(currentPage);
                                }

                            });

                            renderPage(currentPage);

                        },
                    })

                }
                //---------------------------------------
                document.addEventListener('DOMContentLoaded', function() {
                 // 검색어를 서버로 전송하는 함수
                function searchPostsList(searchValue) {
                console.log("검색어:", searchValue); // 검색어 확인

                $.ajax({
                    url: "/Mingles/postsearch.mi",
                    method: "GET", // GET 요청으로 변경
                    data: {
                        search: searchValue,
                    },
                    success: function(result) {
                        console.log("검색 결과:", result);

                        const itemsPerPage = 12;
                        let currentPage = 1;
                        const totalItems = result.length;
                        const totalPages = Math.ceil(totalItems / itemsPerPage);

                        function renderPage(page) {
                            const start = (page - 1) * itemsPerPage;
                            const end = start + itemsPerPage;
                            const pageItems = result.slice(start, end);

                            let value = "";

                            if (pageItems.length === 0) {
                                $("#right .post-container").html("아직 아무것도 없어요");
                            } else {
                                for (let item of pageItems) {
                                    item.postTitle = item.postTitle ?? "";
                                    item.postTag = item.postTag ?? "";

                                    const tArr = item.postTag.split(",");
                                    let tagsHtml = "";

                                    for (let tag of tArr) {
                                        if (tag != "") {
                                            tagsHtml += '<div class="post-cover-tag-boxes">🏷️' + tag.trim() + '</div>';
                                        }
                                    }

                                    value += `
                                                 <div class="posts" data-pNum="\${item.postNum}">
                                                    <img src="\${item.postThumbnail}" alt="Post Thumbnail">
                                                    <div class="post-titles" style="font-size: \${item.postTitleSize}px; color:\${item.postTitleColor}">\${item.postTitle}</div>
                                                    <div class="post-cover">
                                                        <div class="post-regdate">\${item.postRegdate}</div>
                                                        <div class="post-count">⭐️\${item.postCount}</div>
                                                        \${tagsHtml}
                                                    </div>
                                                 </div>
                                                 `;
                                }
                                $("#right .post-container").html(value);
                            }

                            updatePaginationControls();
                        }

                        function updatePaginationControls() {
                            const pageNumbers = $("#right #pageNumbers");
                            pageNumbers.empty();

                            if (totalPages === 0) {
                                $("#right #prevPage").prop('disabled', true);
                                $("#right #nextPage").prop('disabled', true);
                                return;
                            }

                            for (let i = 1; i <= totalPages; i++) {
                                const button = $("<button>")
                                    .text(i)
                                    .addClass('page-btn')
                                    .data('page', i)
                                    .on('click', function () {
                                        currentPage = $(this).data('page');
                                        renderPage(currentPage);
                                    });

                                if (button.text() == currentPage) {
                                    button.css("font-weight", "bold");
                                }

                                pageNumbers.append(button);
                            }

                            $("#right #prevPage").prop('disabled', currentPage === 1);
                            $("#right #nextPage").prop('disabled', currentPage === totalPages || totalPages === 0);
                        }

                        $("#right #prevPage").on('click', function () {
                            if (currentPage > 1) {
                                currentPage--;
                                renderPage(currentPage);
                            }
                        });

                        $("#right #nextPage").on('click', function () {
                            if (currentPage < totalPages) {
                                currentPage++;
                                renderPage(currentPage);
                            }
                        });

                        renderPage(currentPage);
                    },
                    error: function(xhr, status, error) {
                        console.log("AJAX 요청 실패:", error);
                    }
                });
            }

            // 버튼 클릭 이벤트 핸들러
            document.getElementById('cateSearch').addEventListener('click', function() {
                var searchInput = document.querySelector('#searchForm input[name="search"]');
                var searchValue = searchInput.value.trim(); // 검색어 앞뒤 공백 제거
                    if (searchValue) {
                        searchPostsList(searchValue);
                    } else {
                        console.log("검색어가 비어있습니다.");
                    }
                 });
             });
            </script>
            <% } %>
    </body>

</html>


