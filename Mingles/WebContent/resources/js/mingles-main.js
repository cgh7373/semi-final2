
$(function() {

    $('#homeKey').click(function() {
        $('#menuBar').css('display','block');
        gsap.to('#menuBar',{
            duration: 1,
            right : 0,
            ease : 'power1.out',
        });
    });

    $('#menuBack').click(function() {
        gsap.to('#menuBar',{
            duration: 1,
            right:'-20%',
            ease : 'power1.in',
            onComplete: function(){
            setTimeout(function(){
                $('#menuBar').css('display','none');
            },200)
            }
        })
    })

})

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

