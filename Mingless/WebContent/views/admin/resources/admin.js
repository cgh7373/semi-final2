/*!
 * Start Bootstrap - SB Admin 2 v4.1.3 (https://startbootstrap.com/theme/sb-admin-2)
 * Copyright 2013-2021 Start Bootstrap
 * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin-2/blob/master/LICENSE)
 */

// 사이드바 토글
!function(l){
    "use strict";

    l("#sidebarToggle, #sidebarToggleTop").on("click",function(e){
        l("body").toggleClass("sidebar-toggled"),l(".sidebar").toggleClass("toggled"),
        l(".sidebar").hasClass("toggled")&&l(".sidebar .collapse").collapse("hide")
    }),
        l(window).resize(function(){
            l(window).width()<768&&l(".sidebar .collapse").collapse("hide"),
            l(window).width()<480&&!l(".sidebar").hasClass("toggled")&&(l("body").addClass("sidebar-toggled"),
            l(".sidebar").addClass("toggled"),l(".sidebar .collapse").collapse("hide")
        )}),
            l("body.fixed-nav .sidebar").on("mousewheel DOMMouseScroll wheel",
                function(e){
                    var o;
                    768<l(window).width()&&(o=(o=e.originalEvent).wheelDelta||-o.detail,this.scrollTop+=30*(o<0?1:-1),
                    e.preventDefault()
                )}),
                    l(document).on("scroll",function(){
                        100<l(this).scrollTop()?l(".scroll-to-top").fadeIn():l(".scroll-to-top").fadeOut()}),
                        l(document).on("click","a.scroll-to-top",function(e){
                            var o=l(this);
                            l("html, body").stop().animate({scrollTop:l(o.attr("href")).offset().top},1e3,"easeInOutExpo"),e.preventDefault()
                        })}(jQuery);

// 차트 
const ctx = document.querySelector("#myChart");

new Chart(ctx, {
    type: 'line',
    data: {
        labels: [
            '1월',
            '2월',
            '3월',
            '4월',
            '5월',
            '6월',
            '7월',
            '8월',
            '9월',
            '10월',
            '11월',
            '12월'
        ],
        datasets: [
            {
                label: '회원수',
                data: [
                    memberCount[0],
                    memberCount[1],
                    memberCount[2],
                    memberCount[3],
                    memberCount[4],
                    memberCount[5],
                    memberCount[6],
                    memberCount[7],
                    memberCount[8],
                    memberCount[9],
                    memberCount[10],
                    memberCount[11]
                ],
                borderWidth: 1
            }
        ]
    },
    options: {
        responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

const ctx2 = document.querySelector("#myChart2");

new Chart(ctx2, {
    type: 'line',
    data: {
        labels: [
            '1월',
            '2월',
            '3월',
            '4월',
            '5월',
            '6월',
            '7월',
            '8월',
            '9월',
            '10월',
            '11월',
            '12월'
        ],
        datasets: [
            {
                label: '게시글수',
                data: [
                    postCount[0],
                    postCount[1],
                    postCount[2],
                    postCount[3],
                    postCount[4],
                    postCount[5],
                    postCount[6],
                    postCount[7],
                    postCount[8],
                    postCount[9],
                    postCount[10],
                    postCount[11],
                ],
                borderWidth: 1
            }
        ]
    },
    options: {
        responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});


