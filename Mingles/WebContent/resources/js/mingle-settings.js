$(function () {

    $('#homeKey').click(function () {
        $('#menuBar').animate({ width: 'toggle' })
    })

    $('#menuBack').click(function () {
        $('#menuBar').animate({ width: 'toggle' })
    })

    $('.top__left label').click(function () {
        $('.top__left .profilePhoto img').attr('src', $('top__left input').val());
    })

    $(document).click(function (event) {
        if (!$(event.target).closest('#menuBar, #homeKey').length) {
            if ($('#menuBar').is(":visible")) {
                $('#menuBar').animate({ width: 'toggle' });
            }
        }
    });

    $(".top__left input").change(function (event) {
        var reader = new FileReader();
        reader.onload = function (event) {
            var img = $(".top__left .profilePhoto img");
            img.attr("src", event.target.result);
            $(".top__left .profilePhoto").append(img);
        };
        reader.readAsDataURL(event.target.files[0]);
    });


    // document.querySelector('.top__left input').addEventListener('change', function(e) {
    //     let fileName = e.target.value.split('\\').pop();

    //     // 무조건 밍글 안에 리소스 안에 이미지에 넣어야됨.. 이거 나중에 수정
    //     document.querySelector('.top__left .profilePhoto img').setAttribute('src','../resources/images/'+fileName)
    // })

    new Swiper('.mid .promotion .swiper-container', {
        slidesPerView: 3,
        spaceBetween: 20,
        centeredSlides: true, // 1번 슬라이드를 가운데 두기
        loop: true,
        speed: 1300,
        autoplay: {
            delay: 2500,
            disableOnInteraction: false,
        },
        navigation: {
            prevEl: '.mid .promotion .swiper-prev',
            nextEl: '.mid .promotion .swiper-next',
        }
    })

    new Swiper('.bot .promotion .swiper-container', {
        slidesPerView: 3,
        spaceBetween: 20,
        centeredSlides: true, // 1번 슬라이드를 가운데 두기
        loop: true,
        speed: 1300,
        autoplay: {
            delay: 2500,
            disableOnInteraction: false,
        },
        navigation: {
            prevEl: '.bot .promotion .swiper-prev',
            nextEl: '.bot .promotion .swiper-next',
        }
    })


})
