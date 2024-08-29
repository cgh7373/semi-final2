<%@page import="com.kh.member.model.vo.Member" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <% Member m=(Member)session.getAttribute("loginUser"); String contextPath=request.getContextPath(); String
            alertMsg=(String)session.getAttribute("alertMsg"); String errorMsg=(String)session.getAttribute("errorMsg");
            %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Insert title here</title>
                <!-- 외부파일 -->
                <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
                <script defer src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
                <script defer
                    src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
                <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
                <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                <script defer src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"
                    integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg=="
                    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
                <script defer src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <link rel="stylesheet" href="../../resources/css/mingle-posts.css">
                <script defer src="../../resources/js/mingle-posts.js"></script>
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
                            <!-- Left Screen -->
                            <div class="post-list" id="left">
                                <div class="left__content" id="con1">
                                    <img src="<%=m.getProfilePic() %>" alt="">
                                </div>
                                <div class="left__content" id="con2">
                                    <div id="con2__nickname">
                                        <%= m.getNickname() %>
                                    </div>
                                    <button id="mailIcon" class="material-icons">mail_outline</button>
                                    <button id="writeIcon" data-toggle="modal" data-target="#writePostModal"
                                        class="material-icons">edit_square</button>
                                    <div id="con2__my_text">
                                        <%=m.getStatusMsg() %>
                                    </div>
                                    <div id="con2__my_info">
                                        <div id="my_info__1" data-toggle="tooltip" title="<%= m.getEmail() %>">이메일</div>
                                        <div id="my_info__2" data-toggle="tooltip" title="<%= m.getMBTI() %>">MBTI</div>
                                        <div id="my_info__3" data-toggle="tooltip" title="<%= m.getZodiac() %>">별자리
                                        </div>
                                        <span id="zodiac" data-zodiac="<%= m.getZodiac() %>"></span>
                                        <div id="my_info__4" data-toggle="tooltip" title="<%= m.getABO() %>">혈액형</div>
                                    </div>

                                </div>
                                <!-- Popular and Recent Posts -->
                                <div class="left__content" id="con3">
                                    <div class="post-box" id="popular">
                                        <div class="sub-title">인기글</div>
                                        <ul>
                                            <li>뽀ㄷH 퀸ㅋr만 눌러</li>
                                            <li>학생○lㄹΓ는 죄로..</li>
                                            <li>친구ㄱг무엇을뜻ㅎг는줄○гㄴı¿ </li>
                                        </ul>
                                    </div>
                                    <div class="post-box" id="recent">
                                        <div class="sub-title">최신글</div>
                                        <ul>
                                            <li>ㅂıㄹr는 ㄱł..참 ㅅĿブıㅎŀスl?</li>
                                            <li>Øl젠 ⊂よ신을 ズı켜주고 싶습LI⊂ト</li>
                                            <li>해피바이러스가 성공적으로 배달되었습니다*^^*</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <!-- Right Screen with Post Frame -->
                            <div id="right">

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
                            <!-- 글쓰기용 Modal -->
                            <div class="modal fade" id="writePostModal">
                                <div class="modal-dialog modal-dialog-centered modal-xl">
                                    <div class="modal-content">

                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">게시글 작성</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>

                                        <!-- Modal body -->
                                        <div class="modal-body" align="center">

                                            <div class="modal-left">

                                                <div class="modal-post">
                                                    <img src="../../resources/images/2024082616142217358.jfif">
                                                    <div class="post-titles" style="font-size: 30px;"></div>
                                                    <div class="post-cover">
                                                        <div class="post-cover-tag-boxes">🏷️태그1</div>
                                                        <div class="post-cover-tag-boxes">🏷️태그2</div>
                                                        <div class="post-cover-tag-boxes">🏷️태그3</div>
                                                        <div class="post-cover-tag-boxes">🏷️태그4</div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="modal-right">

                                                <table>
                                                    <tr>
                                                        <td>
                                                            <div>제목 : <input type="text" id="post-title"></div>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            색상 : <input type="color" id="post-title-color">
                                                        </td>
                                                        <td>
                                                            크기 : <select id="post-title-size">
                                                                <option>30</option>
                                                                <option>32</option>
                                                                <option>34</option>
                                                                <option>36</option>
                                                                <option>38</option>
                                                                <option>40</option>
                                                                <option>42</option>
                                                                <option>44</option>
                                                                <option>46</option>
                                                                <option>48</option>
                                                                <option>50</option>
                                                                <option>52</option>
                                                                <option>54</option>
                                                                <option>56</option>
                                                                <option>58</option>
                                                                <option>60</option>
                                                                <option>70</option>
                                                            </select>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <div>사진 : <input type="file" id="post-thumbnail"
                                                                    name="thumbnailPic"></div>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <div>태그 : <input type="text" placeholder="','로 구분"
                                                                    id="post-tag"></div>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="vertical-align: middle;">
                                                            내용 : <textarea id="post-content"
                                                                style="width: 80%; height: 90%; resize: none; vertical-align: middle;"></textarea>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            공개범위 : <select id="post-scope">
                                                                <option value="p">전체</option>
                                                                <option value="f">친구만</option>
                                                                <option value="m">비공개</option>
                                                            </select>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td><button onclick="makePreview();">미리보기</button></td>
                                                        <td><button onclick="insertPost();">작성하기</button></td>
                                                    </tr>
                                                </table>

                                            </div>

                                        </div>
                                    </div>
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
                                url: "/Mingles/selectPostsList.mi",
                                data: {
                                    writer: <%= m.getMemNo() %>,
                                },
                                success: (result) => {

                                    const itemsPerPage = 6;
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

                    </script>

                    <% } %>

            </body>

            </html>