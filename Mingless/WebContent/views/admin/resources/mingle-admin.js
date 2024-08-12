const ctx = document.querySelector("#myChart");
console.log(ctx);
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
                    3,
                    5,
                    8,
                    4,
                    5,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
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
console.log(ctx2);
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
                    3,
                    5,
                    8,
                    4,
                    5,
                    6,
                    12,
                    9,
                    8,
                    10,
                    11,
                    20
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

$(function () {
    $('#homeKey').click(function () {
        console.log("homeKey clicked");
        $('#menuBar').animate({width: 'toggle'});
    });

    $('#menuBack').click(function () {
        console.log("menuBack clicked");
        $('#menuBar').animate({width: 'toggle'});
    });
    // 메뉴바 외의 부분 눌렀을때 메뉴바 사라지기
    $(document).click(function (event) {
        if (!$(event.target).closest('#menuBar, #homeKey').length) {
            if ($('#menuBar').is(":visible")) {
                $('#menuBar').animate({width: 'toggle'});
            }
        }
    });
});
