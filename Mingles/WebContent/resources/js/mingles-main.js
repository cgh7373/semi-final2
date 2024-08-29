const show = document.getElementById("show");
const mp3button = document.getElementById("mp3Button");
let isShow = false;



$(function () {
  let bounce;
  // stop: 애니메이션이 현재 실행중인지 일시중지 되었는지 추적하는데 사용됨.
  // 이미지를 클릭할 때 마다 stop의 값이 전환되어 일시정지 - 재생을 반복함
  let stop = true;

  $(".music>img").ready(function () {
    bounce = gsap.to(".music>img", {
      y: -10,
      duration: 0.5,
      ease: "bounce.in",
      yoyo: true,
      repeat: -1,
    });
  });

  $(".music>img").click(function () {
    if (stop) {
      bounce.pause();
      gsap.to(".music>img", {
        y: 0,
        duration: 0.5,
        ease: "power1.out",
      });
    } else {
      bounce.play();
    }
    stop = !stop;
  });

  weather();
});

$(document).ready(function () {
  $('[data-toggle="popover"]').popover();
});

$(document).ready(function () {
  $("#my_info__1").tooltip({
    template:
      '<div class="tooltip custom-tooltip"><div class="arrow"></div><div class="tooltip-inner"></div></div>',
  });

  $("#my_info__2, #my_info__3, #my_info__4").tooltip();
});

$(document).ready(function () {
  $('[data-toggle="popover"]').popover();
});

$(document).ready(function () {
  // MP3 FILE INSERT -> COLOR CHANGE
  $("#file").change(function () {
    if (this.files && this.files[0].type === "audio/mpeg") {
      $("#music--icon").css("color", "#68D8D6");
    } else {
      $("#music--icon").css("color", "black");
    }
  });

  // THUMBNAIL FILE INSERT -> COLOR CHANGE
  $("#thumbnail").change(function () {
    if (this.files && this.files[0]) {
      let fileExt = this.files[0].name.split(".").pop().toLowerCase();
      let allowedExt = ["jpg", "jpeg", "png"];

      if (allowedExt.includes(fileExt)) {
        $("#music--thumbnail").css("color", "#68D8D6");
      } else {
        $("#music--thumbnail").css("color", "black");
      }
    }
  });

  // MUSIC PLAYLIST ADD
  $("#music--add").click(function () {
    let title = $("#musicTitle").val().trim();
    let singer = $("#singer").val().trim();

    // Check for maximum limit of 10 songs
    if ($(".music--list li").length >= 10) {
      alert("최대 10개까지 추가 가능합니다.");
      return;
    }

    $(".music--list").append(`
        <li class = "song">
        <div class="material-icons" style ="color:#07BEB8; font-size:18px; cursor:pointer;">play_arrow</div>
             ${title} - ${singer} 
                <div class="material-icons trashcan" style ="color:#dc3545; font-size:16px; visibility:hidden; cursor:pointer;">delete_outline</div>
            </button>
        </li>
    `);

    // Clear input fields
    $("#musicTitle").val("");
    $("#singer").val("");
  });

  let flag = false;
  // MUSIC PLAYLIST DELETE
  $("#music--delete").click(function () {
    if (flag) {
      $(".trashcan").css("visibility", "hidden");
    } else {
      $(".trashcan").css("visibility", "visible");
    }
    flag = !flag;
  });

  $(".music--list").on("click", ".trashcan", function () {
    $(this).parent().remove();
  });

  // <div class="material-icons" style ="color:#07BEB8; font-size:18px; cursor:pointer;">play_arrow</div> 클릭하면 음악 재생하게 하기
});

const calendarDates = document.getElementById("calendarDates");
const currentMonthElement = document.getElementById("currentMonth");
const prevBtn = document.getElementById("prevBtn");
const nextBtn = document.getElementById("nextBtn");

const today = new Date();
let currentMonth = today.getMonth();
let currentYear = today.getFullYear();

const owner = document.getElementById("owner").getAttribute("data-owner");

function readStatus() {
  $.ajax({
    url: "/Mingles/readStatus.mi",
    data: {
      owner: owner,
      year: currentYear,
      month: currentMonth + 1,
    },
    success: function (result) {
      const readStatuses = result.reduce((acc, item) => {
        acc[item.readDate] = item.readStatus === "T";

        return acc;
      }, {});

      renderCalendar(readStatuses);
    },
  });
}

function renderCalendar(readStatuses) {
  const firstDayOfMonth = new Date(currentYear, currentMonth, 1);
  const daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate();
  const startDayOfWeek = firstDayOfMonth.getDay();
  currentMonthElement.textContent = `${currentYear}년 ${currentMonth + 1}월`;

  calendarDates.innerHTML = "";

  // 빈 날짜(이전 달)
  for (let i = 0; i < startDayOfWeek; i++) {
    const emptyDate = document.createElement("div");
    emptyDate.classList.add("date", "empty");
    calendarDates.appendChild(emptyDate);
  }

  // 현재 달의 날짜
  for (let i = 1; i <= daysInMonth; i++) {
    const dateStr = currentYear + "-" + (currentMonth + 1) + "-" + i;
    const isToday = today.getDate() === i && today.getMonth() === currentMonth;
    const isUnread = readStatuses[dateStr] === false;

    const dateElement = document.createElement("div");
    dateElement.classList.add("date");
    dateElement.textContent = i;
    dateElement.setAttribute("data-date", dateStr);

    if (isToday) {
      dateElement.classList.add("today");
    }

    dateElement.classList.toggle("unread", isUnread);

    calendarDates.appendChild(dateElement);
  }

  updateMemoCounts();
}

function updateMemoCounts() {
  const dateEls = document.querySelectorAll("#calendarDates .date:not(.empty)");

  dateEls.forEach((dateEl) => {
    const date = dateEl.getAttribute("data-date");
    const countElement = document.createElement("span");
    countElement.classList.add("memoCount");

    $.ajax({
      url: "/Mingles/memoCount.mi",
      data: {
        owner: owner,
        date: date,
      },
      success: function (result) {
        if (result > 0) {
          countElement.textContent = `📝 ${result}`;
          dateEl.appendChild(countElement);
        }
      },
    });
  });
}

readStatus();

prevBtn.addEventListener("click", () => {
  currentMonth--;
  if (currentMonth < 0) {
    currentMonth = 11;
    currentYear--;
  }
  readStatus();
});

nextBtn.addEventListener("click", () => {
  currentMonth++;
  if (currentMonth > 11) {
    currentMonth = 0;
    currentYear++;
  }
  readStatus();
});

$("#my_info__3").on("click", function () {
  const zodiac = document.getElementById("zodiac").getAttribute("data-zodiac");

  const encodedZodiac = encodeURIComponent(zodiac);

  const searchUrl = `https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&qvt=0&query=${encodedZodiac}%20%EC%9A%B4%EC%84%B8`;

  window.open(searchUrl, "_blank");
});

function parseCustomDate(dateStr) {
  const [datePart, timePart] = dateStr.split(" ");
  const [year, month, day] = datePart
    .split("/")
    .map((num) => parseInt(num, 10));
  const [hours, minutes, seconds] = timePart
    .split(":")
    .map((num) => parseInt(num, 10));

  const fullYear = year + 2000;

  return new Date(fullYear, month - 1, day, hours, minutes, seconds);
}

function selectMemoList(date) {
  $.ajax({
    url: "/Mingles/calendarMemo.mi",
    data: {
      date: date,
      memNo: owner,
    },
    success: function (result) {
      const itemsPerPage = 10;
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
          $("#bulletinModal .modal-body table").html(
            "<tr><td class='center-text'>아직 아무것도 없어요</td></tr>"
          );
        } else {
          for (let i in pageItems) {
            const memoStatusStr = pageItems[i].memoStatus;
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

            value +=
              "<tr>" +
              "<td rowspan='2' class='memo-img'><img src='" +
              pageItems[i].profilePic +
              "'></td>" +
              "<td rowspan='2' class='memo-content'>" +
              pageItems[i].memoContent +
              "</td>" +
              "<td class='memo-nickname memo-else'>" +
              pageItems[i].nickname +
              "</td>" +
              "</tr>" +
              "<tr class='memo-dist'>" +
              "<td class='memo-statusMsg memo-else'>" +
              timeAgo +
              "</td>" +
              "</tr>";
          }

          $("#bulletinModal .modal-body table").html(value);
        }

        updatePaginationControls();
      }

      function updatePaginationControls() {
        const pageNumbers = $("#bulletinModal #pageNumbers");
        pageNumbers.empty();

        if (totalPages === 0) {
          $("#bulletinModal #prevPage").prop("disabled", true);
          $("#bulletinModal #nextPage").prop("disabled", true);
          return;
        }

        for (let i = 1; i <= totalPages; i++) {
          const button = $("<button>")
            .text(i)
            .addClass("page-btn")
            .data("page", i)
            .on("click", function () {
              currentPage = $(this).data("page");
              renderPage(currentPage);
            });
          pageNumbers.append(button);
        }

        $("#bulletinModal #prevPage").prop("disabled", currentPage === 1);
        $("#bulletinModal #nextPage").prop(
          "disabled",
          currentPage === totalPages || totalPages === 0
        );
      }

      $("#bulletinModal #prevPage").on("click", function () {
        if (currentPage > 1) {
          currentPage--;
          renderPage(currentPage);
        }
      });

      $("#bulletinModal #nextPage").on("click", function () {
        if (currentPage < totalPages) {
          currentPage++;
          renderPage(currentPage);
        }
      });

      renderPage(currentPage);
    },
  });
}

$(function () {
  $("#calendarDates").on("click", ".date:not(.empty)", function () {
    const date = $(this).data("date");
    $("#bulletinModalLabel").text(date);

    selectMemoList(date);

    $("#bulletinModal").modal("show");

    $.ajax({
      url: "/Mingles/readStatusUpdate.mi",
      data: {
        owner: owner,
        date: date,
      },
      success: function () {
        readStatus();
      },
    });
  });
});

function insertReply() {
  const replyContent = $("#replyContent").val().trim();
  const memoScope = $("#memoScopeSelect").val();
  const selectedDate = $("#bulletinModalLabel").text();

  if (!replyContent) {
    swal({
      icon: "error",
      title: "아무것도 적지 않았어요",
    });
    return;
  }

  $.ajax({
    url: "/Mingles/memoInsert.mi",
    data: {
      content: replyContent,
      date: selectedDate,
      owner: owner,
      writer: owner,
      scope: memoScope,
    },
    type: "post",
    success: function (result) {
      if (result > 0) {
        selectMemoList($("#bulletinModalLabel").text());
        $("#replyContent").val("");
        readStatus();
      }
    },
    error: function () {
      console.log("댓글작성용 ajax 통신실패");
    },
  });
}

function weather() {
  var to_day = getToday();
  var time = getTime();
  getLocation();
  console.log(to_day, time);
  function getToday() {
    var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);

    $("#wYear").text(year);
    $("#wMonth").text(month);
    $("#wDay").text(day);

    return year + month + day;
  }

  function getTime() {
    var date2 = new Date();
    var hours = ("0" + date2.getHours()).slice(-2);
    var time = hours + "00";

    return time;
  }

  function getLocation() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(showPosition);
    } else {
      x.innerHTML = "Geolocation is not supported by this browser.";
    }
  }

  function showPosition(position) {
    var coor = dfs_xy_conv(
      "toXY",
      position.coords.latitude,
      position.coords.longitude
    );
    $(".location").text(coor.x + ", " + coor.y);
    var X = coor.x;
    var Y = coor.y;
    final(X, Y);
  }

  var RE = 6371.00877; // 지구 반경(km)
  var GRID = 5.0; // 격자 간격(km)
  var SLAT1 = 30.0; // 투영 위도1(degree)
  var SLAT2 = 60.0; // 투영 위도2(degree)
  var OLON = 126.0; // 기준점 경도(degree)
  var OLAT = 38.0; // 기준점 위도(degree)
  var XO = 43; // 기준점 X좌표(GRID)
  var YO = 136; // 기1준점 Y좌표(GRID)
  //
  // LCC DFS 좌표변환 ( code : "toXY"(위경도->좌표, v1:위도, v2:경도), "toLL"(좌표->위경도,v1:x, v2:y) )
  //

  function dfs_xy_conv(code, v1, v2) {
    var DEGRAD = Math.PI / 180.0;
    var RADDEG = 180.0 / Math.PI;

    var re = RE / GRID;
    var slat1 = SLAT1 * DEGRAD;
    var slat2 = SLAT2 * DEGRAD;
    var olon = OLON * DEGRAD;
    var olat = OLAT * DEGRAD;

    var sn =
      Math.tan(Math.PI * 0.25 + slat2 * 0.5) /
      Math.tan(Math.PI * 0.25 + slat1 * 0.5);
    sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
    var sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
    sf = (Math.pow(sf, sn) * Math.cos(slat1)) / sn;
    var ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
    ro = (re * sf) / Math.pow(ro, sn);

    var rs = {};

    if (code == "toXY") {
      rs["lat"] = v1;
      rs["lng"] = v2;
      var ra = Math.tan(Math.PI * 0.25 + v1 * DEGRAD * 0.5);
      ra = (re * sf) / Math.pow(ra, sn);
      var theta = v2 * DEGRAD - olon;
      if (theta > Math.PI) theta -= 2.0 * Math.PI;
      if (theta < -Math.PI) theta += 2.0 * Math.PI;
      theta *= sn;
      rs["x"] = Math.floor(ra * Math.sin(theta) + XO + 0.5);
      rs["y"] = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
    } else {
      rs["x"] = v1;
      rs["y"] = v2;
      var xn = v1 - XO;
      var yn = ro - v2 + YO;
      ra = Math.sqrt(xn * xn + yn * yn);
      if (sn < 0.0) -ra;
      var alat = Math.pow((re * sf) / ra, 1.0 / sn);
      alat = 2.0 * Math.atan(alat) - Math.PI * 0.5;

      if (Math.abs(xn) <= 0.0) {
        theta = 0.0;
      } else {
        if (Math.abs(yn) <= 0.0) {
          theta = Math.PI * 0.5;
          if (xn < 0.0) -theta;
        } else theta = Math.atan2(xn, yn);
      }
      var alon = theta / sn + olon;
      rs["lat"] = alat * RADDEG;
      rs["lng"] = alon * RADDEG;
    }
    return rs;
  }

  function final(X, Y) {
    $.ajax({
      url:
        "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=OsDLpgiCRYWKxckXiRL7XliTmtSFiXeKqvYQJC3FoCWJq3O4Sj%2FnSrQcEWSrVnKjkCUxfBXZxRnbDF8NPgeVJw%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date=" +
        to_day +
        "&base_time=0500&nx=" +
        X +
        "&ny=" +
        Y,
      success: function (res) {
        console.log("갑자기");
        console.log(res);
        let item = res.response.body.items.item;

        for (let i = 0; i < item.length - 500; i++) {
          if (
            item[i].fcstTime === time &&
            item[i].category === "PTY" &&
            item[i].fcstDate === to_day
          ) {
            if (item[i].fcstValue === "1") {
              $("#weatherImg").attr({
                src: "../../resources/images/animated/rainy-5.svg",
              });
              $("#skyStatus").text("비");
            } else if (item[i].fcstValue === "2") {
              $("#weatherImg").attr({
                src: "../../resources/images/animated/rainy-4.svg",
              });
              $("#skyStatus").text("비/눈");
            } else if (item[i].fcstValue === "3") {
              $("#weatherImg").attr({
                src: "../../resources/images/animated/snowy-5.svg",
              });
              $("#skyStatus").text("눈");
            } else if (item[i].fcstValue === "4") {
              $("#weatherImg").attr({
                src: "../../resources/images/animated/rainy-7.svg",
              });
              $("#skyStatus").text("소나기");
            } else {
              for (let j = 0; j < item.length; j++) {
                if (
                  item[j].fcstTime === time &&
                  item[j].category === "SKY" &&
                  item[j].fcstDate === to_day
                ) {
                  if (item[j].fcstValue === "1") {
                    $("#weatherImg").attr({
                      src: "../../resources/images/animated/day.svg",
                    });
                    $("#skyStatus").text("맑음");
                  } else if (item[j].fcstValue === "3") {
                    $("#weatherImg").attr({
                      src: "../../resources/images/animated/cloudy-day-2.svg",
                    });
                    $("#skyStatus").text("흐림");
                  } else if (item[j].fcstValue === "4") {
                    $("#weatherImg").attr({
                      src: "../../resources/images/animated/cloudy.svg",
                    });
                    $("#skyStatus").text("흐림");
                  }
                }
              }
            }
          }

          if (
            item[i].fcstTime === time &&
            item[i].category === "TMP" &&
            item[i].fcstDate === to_day
          ) {
            var tmp = item[i].fcstValue;
            $("#temperate").text(tmp);
          }
        }
        weatherListUpdate(item);
      },
      error: function (res) {
        console.log(res, "연결안됨");
      },
    });
  }
  function weatherListUpdate(item) {
    var num = 0;
    var sTime = Number(time);
    var pTime = Number(time.substring(0, 2));
    wListSetTime(pTime);
    wListSetImg(item);
    for (let i = 0; i < item.length - 500; i++) {
      if (
        item[i].fcstTime == sTime &&
        item[i].category === "TMP" &&
        item[i].fcstDate === to_day &&
        num < 10
      ) {
        var tmp = item[i].fcstValue;
        $("#weatherListBottom #no" + num).text(tmp);
        num++;
        sTime += 100;
      }
    }
    if (num < 10) {
      var subTime = 0;
      for (let i = 0; i < item.length - 500; i++) {
        if (
          item[i].fcstTime == subTime &&
          item[i].category === "TMP" &&
          item[i].fcstDate == Number(to_day) + 1 &&
          num < 10
        ) {
          var tmp = item[i].fcstValue;
          $("#weatherListBottom #no" + num).text(tmp);
          num++;
          subTime += 100;
        }
      }
    }
  }
  function wListSetTime(pTime) {
    var num = 0;
    for (let i = 0; i < 10; i++) {
      if (pTime < 24) {
        $("#weatherListTop #no" + i).text(pTime);
        pTime++;
      } else {
        $("#weatherListTop #no" + i).text(num);
        num++;
      }
    }
  }
  function wListSetImg(item) {
    var num = 0;
    var iTime = Number(time);
    for (let i = 0; i < item.length - 500; i++) {
      if (
        item[i].fcstTime == iTime &&
        item[i].category === "PTY" &&
        item[i].fcstDate === to_day &&
        num < 10
      ) {
        if (iTime > 2000 || iTime < 600) {
          $("#weatherListCenter #no" + num).attr({
            src: "../../resources/images/animated/night.svg",
          });
          num++;
          iTime += 100;
        } else {
          if (item[i].fcstValue === "1") {
            $("#weatherListCenter #no" + num).attr({
              src: "../../resources/images/animated/rainy-5.svg",
            });
          } else if (item[i].fcstValue === "2") {
            $("#weatherListCenter #no" + num).attr({
              src: "../../resources/images/animated/rainy-4.svg",
            });
          } else if (item[i].fcstValue === "3") {
            $("#weatherListCenter #no" + num).attr({
              src: "../../resources/images/animated/snowy-5.svg",
            });
          } else if (item[i].fcstValue === "4") {
            $("#weatherListCenter #no" + num).attr({
              src: "../../resources/images/animated/rainy-7.svg",
            });
          } else {
            for (let j = 0; j < item.length; j++) {
              if (
                item[j].fcstTime == iTime &&
                item[j].category === "SKY" &&
                item[j].fcstDate === to_day
              ) {
                if (item[j].fcstValue === "1") {
                  $("#weatherListCenter #no" + num).attr({
                    src: "../../resources/images/animated/day.svg",
                  });
                } else if (item[j].fcstValue === "3") {
                  $("#weatherListCenter #no" + num).attr({
                    src: "../../resources/images/animated/cloudy-day-2.svg",
                  });
                } else if (item[j].fcstValue === "4") {
                  $("#weatherListCenter #no" + num).attr({
                    src: "../../resources/images/animated/cloudy.svg",
                  });
                }
              }
            }
          }
          num++;
          iTime += 100;
        }
      }
    }
    if (num < 10) {
      var subTime = 0;
      for (let i = 0; i < item.length - 500; i++) {
        if (
          item[i].fcstTime == subTime &&
          item[i].category === "PTY" &&
          item[i].fcstDate == Number(to_day) + 1 &&
          num < 10
        ) {
          if (iTime > 2000 || iTime < 600) {
            $("#weatherListCenter #no" + num).attr({
              src: "../../resources/images/animated/night.svg",
            });
            num++;
            subTime += 100;
          } else {
            if (item[i].fcstValue === "1") {
              $("#weatherListCenter #no" + num).attr({
                src: "../../resources/images/animated/rainy-5.svg",
              });
            } else if (item[i].fcstValue === "2") {
              $("#weatherListCenter #no" + num).attr({
                src: "../../resources/images/animated/rainy-4.svg",
              });
            } else if (item[i].fcstValue === "3") {
              $("#weatherListCenter #no" + num).attr({
                src: "../../resources/images/animated/snowy-5.svg",
              });
            } else if (item[i].fcstValue === "4") {
              $("#weatherListCenter #no" + num).attr({
                src: "../../resources/images/animated/rainy-7.svg",
              });
            } else {
              for (let j = 0; j < item.length; j++) {
                if (
                  item[j].fcstTime == iTime &&
                  item[j].category === "SKY" &&
                  item[j].fcstDate === to_day
                ) {
                  if (item[j].fcstValue === "1") {
                    $("#weatherListCenter #no" + num).attr({
                      src: "../../resources/images/animated/day.svg",
                    });
                  } else if (item[j].fcstValue === "3") {
                    $("#weatherListCenter #no" + num).attr({
                      src: "../../resources/images/animated/cloudy-day-2.svg",
                    });
                  } else if (item[j].fcstValue === "4") {
                    $("#weatherListCenter #no" + num).attr({
                      src: "../../resources/images/animated/cloudy.svg",
                    });
                  }
                }
              }
            }
            num++;
            subTime += 100;
          }
        }
      }
    }
  }
}

mp3button.addEventListener("click", function () {
  isShow = !isShow;
  if (isShow) {
    show.classList.add('youShow');
  } else {
    show.classList.remove('youShow');
  }

});
