$(function(){

    let bounce;
    // stop: 애니메이션이 현재 실행중인지 일시중지 되었는지 추적하는데 사용됨.
    // 이미지를 클릭할 때 마다 stop의 값이 전환되어 일시정지 - 재생을 반복함
    let stop = true;

    $(".music>img").ready(function(){

        bounce = gsap.to(".music>img",{
            y : -10,
            duration: 0.5,
            ease: "bounce.in",
            yoyo: true,
            repeat: -1,
        }) 

    })

    $(".music>img").click(function(){

        if(stop){
            bounce.pause();
            gsap.to(".music>img",{
                y : 0,
                duration: 0.5,
                ease: "power1.out",
            })
        }else{
            bounce.play();
        }
        stop = !stop;
    })
})

$(document).ready(function(){
    $('[data-toggle="popover"]').popover();
  });

  $(document).ready(function() {
    $('#my_info__1').tooltip({
      template: '<div class="tooltip custom-tooltip"><div class="arrow"></div><div class="tooltip-inner"></div></div>'
    });

    $('#my_info__2, #my_info__3, #my_info__4').tooltip();
  });

  $(document).ready(function(){
    $('[data-toggle="popover"]').popover();

  });

  $(document).ready(function() {
    // MP3 FILE INSERT -> COLOR CHANGE
    $('#file').change(function() {
      if (this.files && this.files[0].type === 'audio/mpeg') {
        $('#music--icon').css('color', '#68D8D6');
      } else {
        $('#music--icon').css('color', 'black');
      }
    });
  
    // THUMBNAIL FILE INSERT -> COLOR CHANGE
    $('#thumbnail').change(function() {
      if (this.files && this.files[0]) {
        let fileExt = this.files[0].name.split('.').pop().toLowerCase();
        let allowedExt = ['jpg', 'jpeg', 'png'];
  
        if (allowedExt.includes(fileExt)) {
          $('#music--thumbnail').css('color', '#68D8D6');
        } else {
          $('#music--thumbnail').css('color', 'black');
        }
      }
    });
  
    // MUSIC PLAYLIST ADD
    $('#music--add').click(function() {
      let title = $('#musicTitle').val().trim();
      let singer = $('#singer').val().trim();
  
      // Check for maximum limit of 10 songs
      if ($('.music--list li').length >= 10) {
        alert('최대 10개까지 추가 가능합니다.');
        return;
      }
  
      $('.music--list').append(`
        <li class = "song">
        <div class="material-icons" style ="color:#07BEB8; font-size:18px; cursor:pointer;">play_arrow</div>
             ${title} - ${singer} 
                <div class="material-icons trashcan" style ="color:#dc3545; font-size:16px; visibility:hidden; cursor:pointer;">delete_outline</div>
            </button>
        </li>
    `);

      // Clear input fields
      $('#musicTitle').val('');
      $('#singer').val('');

    });
  
    let flag = false;
    // MUSIC PLAYLIST DELETE
    $('#music--delete').click(function(){
      if(flag){
      $('.trashcan').css('visibility','hidden');
      }else{
        $('.trashcan').css('visibility','visible');
      }
      flag = !flag;
    })

    $('.music--list').on('click', '.trashcan', function(){
      $(this).parent().remove();
    })

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

function renderCalendar() {
	
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

        const dateElement = document.createElement("div");
        dateElement.classList.add("date");
        dateElement.textContent = i;
        dateElement.setAttribute("data-date", dateStr);

        if (isToday) {
          dateElement.classList.add("today")
        }       
        
        calendarDates.appendChild(dateElement);

    }

    updateMemoCounts();

}


function updateMemoCounts() {
  
  const dateEls = document.querySelectorAll("#calendarDates .date");

  dateEls.forEach(dateEl => {

    const date = dateEl.getAttribute("data-date");
    const countElement = document.createElement("span");
    countElement.classList.add("memoCount");
    
    $.ajax({
      url : "/Mingles/memoCount.mi",
      data : {
        owner : owner,
        date : date,
      },
      success : function(result) {

        if (result > 0) {
          countElement.textContent = `📝 ${result}`
          dateEl.appendChild(countElement);
        }

      },
    })

  })


}

renderCalendar()

prevBtn.addEventListener("click", () => {
    currentMonth--;
    if (currentMonth < 0) {
        currentMonth = 11;
        currentYear--;
    }
    renderCalendar()
});

nextBtn.addEventListener("click", () => {
    currentMonth++;
    if (currentMonth > 11) {
        currentMonth = 0;
        currentYear++;
    }
    renderCalendar()
});

$("#my_info__3").on("click", function() {

  const zodiac = document.getElementById("zodiac").getAttribute("data-zodiac");
  
  const encodedZodiac = encodeURIComponent(zodiac);
    
  const searchUrl = `https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&qvt=0&query=${encodedZodiac}%20%EC%9A%B4%EC%84%B8`;

  window.open(searchUrl, '_blank');

})



  


