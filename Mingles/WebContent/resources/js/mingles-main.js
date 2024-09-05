const calendarDates = document.getElementById("calendarDates");
const currentMonthElement = document.getElementById("currentMonth");
const prevBtn = document.getElementById("prevBtn");
const nextBtn = document.getElementById("nextBtn");

const today = new Date();
let currentMonth = today.getMonth();
let currentYear = today.getFullYear();

const m = document.getElementById("member").getAttribute("data-member");
const owner = document.getElementById("owner").getAttribute("data-owner");

$(function () {
  let bounce;
  // stop: 애니메이션이 현재 실행중인지 일시중지 되었는지 추적하는데 사용됨.
  // 이미지를 클릭할 때 마다 stop의 값이 전환되어 일시정지 - 재생을 반복함
  let stop = true;
  weather();
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
});

$(document).ready(function () {
  $('[data-toggle="popover"]').popover();
});

$(document).ready(function () {
  $('[data-toggle="popover"]').popover();
  $("#my_info__1").tooltip({
    template:
      '<div class="tooltip custom-tooltip"><div class="arrow"></div><div class="tooltip-inner"></div></div>',
  });
  $("#my_info__2, #my_info__3, #my_info__4").tooltip();
});

// MP3 화면 설정
let music = document.getElementById("music--element");

function togglePlayPause() {
  let playPausebtn = document.getElementById("play-pause-button");

  if (music.paused) {
    music.play();
    playPausebtn.textContent = "Pause";
  } else {
    music.pause();
    playPausebtn.textContent = "Play!";
  }
}
document
  .getElementById("play-pause-button")
  .addEventListener("click", togglePlayPause);

let currentTime = document.querySelector(".current-time");
let duration = document.querySelector(".duration");
let musicBar = document.querySelector("#music-bar");

music.addEventListener("loadedmetadata", function () {
  if (!isNaN(music.duration)) {
    musicBar.max = music.duration;
    var ds = parseInt(music.duration % 60);
    var dm = parseInt((music.duration / 60) % 60);
    duration.innerHTML = dm + ":" + ds;
  }
});

music.ontimeupdate = function () {
  musicBar.value = music.currentTime;
};

musicBar.addEventListener("input", function () {
  music.currentTime = musicBar.value;
});

music.addEventListener(
  "timeupdate",
  function () {
    const progress = (music.currentTime / music.duration) * 100;
    musicBar.value = music.currentTime;
    musicBar.style.background = `linear-gradient(to right, #8cbcfe ${progress}%, #b9d7ff ${progress}%, #ececec ${progress}%, #ececec 100%)`;
    let cs = parseInt(music.currentTime % 60);
    let cm = parseInt((music.currentTime / 60) % 60);
    currentTime.innerHTML = cm + ":" + cs;
  },
  false
);

// MP3 설정 화면
$(document).ready(function () {
  //(음악 있으면 만약에) list 보여주기 위한 함수
  selectAllMusic();

  // MP3 FILE INSERT -> COLOR CHANGE
  $("#file").change(function () {
    if (this.files && this.files[0].type === "audio/mpeg") {
      $("#music--icon").css("color", "#68D8D6");
    }
  });

  // THUMBNAIL FILE INSERT -> COLOR CHANGE
  $("#thumbnail").change(function () {
    if (this.files && this.files[0]) {
      let fileExt = this.files[0].name.split(".").pop().toLowerCase();
      let allowedExt = ["jpg", "jpeg", "png"];

      if (allowedExt.includes(fileExt)) {
        $("#music--thumbnail").css("color", "#68D8D6");
      }
    }
  });

  // MUSIC PLAYLIST ADD
  $("#music--add").click(function () {
    let memNo = $('input[name="memNo"]').val();
    let title = $("#musicTitle").val().trim();
    let singer = $("#singer").val().trim();
    let musicFile = $("#file")[0].files[0];
    let musicThumbnail = $("#thumbnail")[0].files[0];

    // 추가는 최대 10개
    if ($(".music--list li").length >= 10) {
      Swal.fire({
        title: "최대 10개까지만 가능합니다.",
        icon: "warning",
        confirmButtonColor: "#72DDF7",
        confirmButtonText: "확인했어요",
      });
      return;
    }

    if (title === "" || singer === "") {
      Swal.fire({
        title: "제목과 가수 모두 적어주세요.",
        icon: "warning",
        confirmButtonColor: "#72DDF7",
        confirmButtonText: "확인했어요",
      });
      return;
    } else if (title !== "" && singer !== "") {
      // 값을 모두 올바르게 넣어서 삽입됐다면

      if (musicFile && musicThumbnail) {
        let formData = new FormData();
        formData.append("memNo", memNo);
        formData.append("title", title);
        formData.append("singer", singer);
        formData.append("musicFile", musicFile);
        formData.append("musicThumbnail", musicThumbnail);

        $.ajax({
          url: "/Mingles/insertMusic.msc",
          method: "post",
          data: formData,
          contentType: false,
          processData: false,
          success: function (result) {
            if (result === 1) {
              Swal.fire({
                title: "성공적으로 추가하였습니다!",
                icon: "success",
                confirmButtonColor: "#72DDF7",
              });
              $("#music--icon").css("color", "black");
              $("#music--thumbnail").css("color", "black");
              selectAllMusic();
            }
          },
          error: function () {},
        });
      } // 제목과 가수 입력, 파일 업로드가 다 정상적으로 작동됬을 때 작용하는 if문
      $("#musicTitle").val("");
      $("#singer").val("");
    }
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

  // 화면 켜졌을 때 음악파일 전체 select하는 함수
  function selectAllMusic() {
    $.ajax({
      url: "/Mingles/selectMusic.msc",
      data: { memNo: memNo },
      method: "post",
      success: function (result) {
        setMusicList(result);
      },
      error: function () {},
    }); //ajax
  } // selectAllMusic()

  function setMusicList(result) {
    // 선택된 음악파일들 리스트 정리

    let musicListContainer = document.querySelector(".music--list"); // 선택을 li가 아니라 그 위 상위 요소 ul에 두어서 반복문으로 내리찍어야 한다.
    musicListContainer.innerHTML = ""; // 선택된 지점을 한번 공백으로 정리해줘야 한다.
    let musicListHtml = "";

    for (let i = 0; i < result.length; i++) {
      let list = result[i];
      musicListHtml += `
            <li class="song">
                <div class="material-icons selectMusic" style="color:#07BEB8; font-size:18px; cursor:pointer;">play_arrow</div>
                ${list.musicTitle} - ${list.musicSinger}
                <div class="material-icons trashcan" style="color:#dc3545; font-size:16px; visibility:hidden; cursor:pointer;"data-music-no="${list.musicNo}">delete_outline</div>
            </li>
        `;
    }
    musicListContainer.innerHTML = musicListHtml;

    // 음악 선택 시 동적으로 표시
    $(".music--list").on("click", ".selectMusic", function () {
      let index = $(this).parent().index();

      if (result && index >= 0 && index < result.length) {
        let selectedMusic = result[index];
        $("#musicImg").attr("src", "../.." + selectedMusic.musicThumbnail);
        $("#music--element").attr("src", "../.." + selectedMusic.musicFilepath);
        $(".music--title").text(selectedMusic.musicTitle);
        $(".music--singer").text(selectedMusic.musicSinger);
        $("#play-pause-button").text("Play!");
      }
    });
  } // setMusicList

  // deleteMusic
  $(".music--list").on("click", ".trashcan", function () {
    let musicNo = $(this).data("musicNo");
    let deleteSign = $(this).parent();
    deleteMusic(musicNo, deleteSign);
  });

  function deleteMusic(musicNo, deleteSign) {
    Swal.fire({
      title: "정말로 삭제하시겠습니까?",
      text: "삭제하면 다시 복구할 수 없어요",
      icon: "warning",
      confirmButtonColor: "#FCC5D9",
      confirmButtonText: "삭제할게요",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: "/Mingles/deleteMusic.msc",
          method: "POST",
          data: { memNo: memNo, musicNo: musicNo },
          success: function (result) {
            console.log(result);
            if (deleteSign) {
              deleteSign.remove();
              Swal.fire({
                title: "성공적으로 삭제하였습니다.",
                icon: "success",
                confirmButtonColor: "#72DDF7",
                confirmButtonText: "확인했어요",
              });
              selectAllMusic();
            }
          },
          error: function () {},
        });
      } else {
        Swal.fire({
          title: "삭제에 실패하였습니다.",
          text: "무언가 잘못된 것 같아요",
          icon: "error",
          confirmButtonColor: "#72DDF7",
        });
      }
    });
  } //deleteMusic
}); // document.ready

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
