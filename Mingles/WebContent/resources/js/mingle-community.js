
$(function() {
    $('#homeKey').click(function() {
        console.log("homeKey clicked");
        $('#menuBar').animate({width: 'toggle'});
    });

    $('#menuBack').click(function() {
        console.log("menuBack clicked");
        $('#menuBar').animate({width: 'toggle'});
    });
    // 메뉴바 외의 부분 눌렀을때 메뉴바 사라지기
    $(document).click(function(event) {
        if (!$(event.target).closest('#menuBar, #homeKey').length) {
            if ($('#menuBar').is(":visible")) {
                $('#menuBar').animate({width: 'toggle'});
            }
        };
    }); 

    const swiper = new Swiper('header .swiper', {
      // Optional parameters
      slidesPerView: 7,
      loop: true,
      spaceBetween: 20,
    });

    const swiperHp = new Swiper('.homepage .swiper', {
      // Optional parameters
      slidesPerView: 4,
      loop: true,
      spaceBetween: 30,
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });

    const swiperPp = new Swiper('.popularPost .swiper', {
      // Optional parameters
      slidesPerView: 4,
      loop: true,
      spaceBetween: 30,
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
});


