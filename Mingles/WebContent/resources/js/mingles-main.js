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
  

