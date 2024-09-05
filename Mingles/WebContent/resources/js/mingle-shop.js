$(function () {

    $(function () {
        $('.menu-content').css('display', 'none');
    })

    $('#homeKey').click(function () {
        $('#menuBar').animate({ width: 'toggle' })
    })

    $('#menuBack').click(function () {
        $('#menuBar').animate({ width: 'toggle' })
    })

    $('.hd-menus').hover(function () {
        $('.hd-menus .menu-content').animate({ height: 'toggle' })
    })

})



function delay() {

    for (let i = 1; i <= ul.children.length; i++) {
        ul.querySelector(`.floating${i}`).classList.add(`delay${i}`)
    }

    function floatingObject1(selector) {
        gsap.to(selector, 1.2, {
            y : 7,
            repeat : -1,
            yoyo : true,
            ease : Power1.easeInOut,
            delay: .3,
        })
    }
    floatingObject1('.delay1');

    function floatingObject2(selector) {
        gsap.to(selector, 1.2, {
            y : 7,
            repeat : -1,
            yoyo : true,
            ease : Power1.easeInOut,
            delay: .6,
        })
    }
    floatingObject2('.delay2');

    function floatingObject3(selector) {
        gsap.to(selector, 1.2, {
            y : 7,
            repeat : -1,
            yoyo : true,
            ease : Power1.easeInOut,
            delay: .9,
        })
    }
    floatingObject3('.delay3');

    function floatingObject4(selector) {
        gsap.to(selector, 1.2, {
            y : 7,
            repeat : -1,
            yoyo : true,
            ease : Power1.easeInOut,
            delay: 1.2,
        })
    }
    floatingObject4('.delay4');

    function floatingObject5(selector) {
        gsap.to(selector, 1.2, {
            y : 7,
            repeat : -1,
            yoyo : true,
            ease : Power1.easeInOut,
            delay: 1.5,
        })
    }
    floatingObject5('.delay5');

}

delay();

