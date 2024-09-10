
$(document).ready(function () {
    $('[data-toggle="popover"]').popover();
  });
 
  $(document).ready(function () {
    $('#my_info__1').tooltip({
      template: '<div class="tooltip custom-tooltip"><div class="arrow"></div><div class="tooltip-inner"></div></div>'
    });
 
    $('#my_info__2, #my_info__3, #my_info__4').tooltip();
  });
 
  $(document).ready(function () {
    $('[data-toggle="popover"]').popover();
 
  });
 
  $("#my_info__3").on("click", function () {
 
    const zodiac = document.getElementById("zodiac").getAttribute("data-zodiac");
 
    const encodedZodiac = encodeURIComponent(zodiac);
 
    const searchUrl = `https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&qvt=0&query=${encodedZodiac}%20%EC%9A%B4%EC%84%B8`;
 
    window.open(searchUrl, '_blank');
 
  })
 
  $("#right .post-container").on('click', '.posts', function () {
 
    toThePost($(this).attr("data-pNum"));
 
  });
 
  function toThePost(value) {
    let postNum = value ?? 0;
 
    if (postNum == 0) {
      return;
    }
     
    $(".reply-insert .pNumBox").val(postNum);
 
    $('#detailPostModal').modal('show');
 
    $.ajax({
      url: "/Mingles/postCount.mi",
      data: {
        pNum: postNum,
      },
      success: () => {
        getWriterInfo(postNum);
      }
    })
   
  }
 
  function getWriterInfo(pNum) {
 
    $.ajax({
      url: "/Mingles/getWriterInfo.mi",
      data: {
        pNum: pNum,
      },
      success: (result) => {
        $(".post-profile-pic img").attr("src", result.profilePic);
        $(".post-writer-info .post-writer-nickname").text(result.nickname);
        $(".post-writer-info .post-writer-statusMsg").text(result.statusMsg);
        getPostContent(pNum);
      },
    })
 
  };
 
  function getPostContent(pNum) {
 
    $.ajax({
      url: "/Mingles/getPostContent.mi",
      data: {
        pNum: pNum,
      },
      success: (result) => {
        result.postTitle = result.postTitle ?? "";
        result.postTag = result.postTag ?? "";
        result.postContent = result.postContent ?? "";
 
        $(".modal-left img").attr("src", result.postThumbnail);
        $(".content-section").text(result.postContent);
 
        let innerTag = "<div class='post-titles' style='font-size: 30px;'>제목 칸입니다.</div>";
        let tags = result.postTag.split(",");
 
        for (let tag of tags) {
          if (tag !== "") {
            innerTag += "<div class='post-cover-tag-boxes'>🏷️" + tag.trim() + "</div>"
          }
        }
 
        $("#detailPostModal .post-cover").html(innerTag);
 
        $(".modal-left .post-cover .post-titles").css("font-size", result.postTitleSize);
        $(".modal-left .post-cover .post-titles").css("color", result.postTitleColor);
        $(".modal-left .post-cover .post-titles").text(result.postTitle);
 
        selectReplyList(pNum);
 
      }
    })
 
  }
 
  function parseCustomDate(dateStr) {
 
    const [datePart, timePart] = dateStr.split(' ');
    const [year, month, day] = datePart.split('/').map(num => parseInt(num, 10));
    const [hours, minutes, seconds] = timePart.split(':').map(num => parseInt(num, 10));
 
    const fullYear = year + 2000;
 
    return new Date(fullYear, month - 1, day, hours, minutes, seconds);
  }
 
  function selectReplyList(pNum) {
 
    $.ajax({
      url: "/Mingles/selectReplyList.mi",
      data: {
        pNum: pNum,
      },
      success: function (result) {
 
        const itemsPerPage = 6;
        let currentPage = 1;
        const totalItems = result.length;
        const totalPages = Math.ceil(totalItems / itemsPerPage);
 
        function renderPage(page) {
 
          const start = (page - 1) * itemsPerPage;
          const end = start + itemsPerPage;
          const pageItems = result.slice(start, end);
 
          let value = "";
 
          const now = new Date();
 
          if (pageItems.length === 0) {
 
            $("#detailPostModal .reply-section table").html("<tr><td class='center-text'>아직 아무것도 없어요</td></tr>");
 
          } else {
 
            for (let i in pageItems) {
 
              const memoStatusStr = pageItems[i].replyDate;
              const memoStatus = parseCustomDate(memoStatusStr);
              const timeDiff = now - memoStatus;
 
              let timeAgo = "";
 
              const seconds = Math.floor(timeDiff / 1000);
              const minutes = Math.floor(seconds / 60);
              const hours = Math.floor(minutes / 60);
              const days = Math.floor(hours / 24);
              const months = Math.floor(days / 30);
              const years = Math.floor(days / 365);
 
              if (years > 0) {
                timeAgo = years + "년 전";
              } else if (months > 0) {
                timeAgo = months + "달 전";
              } else if (days > 0) {
                timeAgo = days + "일 전";
              } else if (hours > 0) {
                timeAgo = hours + "시간 전";
              } else if (minutes > 0) {
                timeAgo = minutes + "분 전";
              } else if (seconds > 0) {
                timeAgo = seconds + "초 전";
              } else {
                timeAgo = "방금 전";
              }
 
              value += "<tr>"
                + "<td rowspan='2' class='memo-img'><img src='" + pageItems[i].replyScope + "'></td>"
                + "<td rowspan='2' class='memo-content'>" + pageItems[i].replyContent + "</td>"
                + "<td class='memo-nickname memo-else'>" + pageItems[i].replyStatus + "</td>"
                + "</tr>"
                + "<tr class='memo-dist'>"
                + "<td class='memo-statusMsg memo-else'>" + timeAgo + "</td>"
                + "</tr>";
 
            }
 
            $("#detailPostModal .reply-section table").html(value);
 
          }
 
          updatePaginationControls();
 
        }
 
        function updatePaginationControls() {
 
          const pageNumbers = $("#detailPostModal #pageNumbers");
          pageNumbers.empty();
 
          if (totalPages === 0) {
            $("#detailPostModal #prevPage").prop('disabled', true);
            $("#detailPostModal #nextPage").prop('disabled', true);
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
            pageNumbers.append(button);
          }
 
          $("#detailPostModal #prevPage").prop('disabled', currentPage === 1);
          $("#detailPostModal #nextPage").prop('disabled', currentPage === totalPages || totalPages === 0);
 
        }
 
        $("#detailPostModal #prevPage").on('click', function () {
 
          if (currentPage > 1) {
            currentPage--;
            renderPage(currentPage);
          }
 
        });
 
        $("#detailPostModal #nextPage").on('click', function () {
 
          if (currentPage < totalPages) {
            currentPage++;
            renderPage(currentPage);
          }
 
        });
 
        renderPage(currentPage);
 
      }
 
    })
 
  }
 
  function insertReply() {
 
    const pNum = $(".reply-insert .pNumBox").val();
    const writer = $(".writerBox").val();
 
    if (!$("#replyContent").val().trim()) {
      swal({
        icon: 'error',
        title: '아무것도 적지 않았어요',
      });
      return;
    }
 
    $.ajax({
      url: "/Mingles/insertReply.mi",
      data: {
        pNum: pNum,
        writer: writer,
        content: $("#writeMemo #replyContent").val(),
        scope: $("#writeMemo #memeScopeSelect").val(),
      },
      success: (result) => {
        if (result > 0) {
          swal({
            icon: 'success',
            title: '댓글이 작성되었어요',
          });
          selectReplyList(pNum);
          $("#replyContent").val("");
        }
      }
    })
 
  }
 
     
  $("#con3 ul").on('click', 'li', function() {
     
      let dataPno = $(this).find('span').data('pno');
     
      toThePost(dataPno);
     
  })