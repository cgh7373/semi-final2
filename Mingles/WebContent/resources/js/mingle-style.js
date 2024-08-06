
$(function() {

    $('#homeKey').click(function() {
        $('#menuBar').animate({width:'toggle'})
    })

    $('#menuBack').click(function() {
        $('#menuBar').animate({width:'toggle'})
    })

    // $('[data-toggle="popover"]').popover();

    $('.bal>div').click(function() {
        $('.bal>div').css('color','black');
        $(this).css('color','#07BEB8')
    })

})

function floatingObject(selector) {
    gsap.to(selector, 1.2, {
        y : 7,
        repeat : -1,
        yoyo : true,
        ease : Power1.easeInOut,
        delay: 0,
    })
}
floatingObject('.float');

const data = [

    {
        itemImg : 'tb1.PNG',
    },

    {
        itemImg : 'tb2.PNG',
    },

    {
        itemImg : 'Mingles로고-움직임-짤.gif',
    },

    {
        itemImg : 'greenpointer.png',
    },

    {
        itemImg : 'mg1.jpg',
    },

    {
        itemImg : 'mg2.jpg',
    },

    {
        itemImg : 'Mingles아이콘.png',
    },

    {
        itemImg : 'Mingles-움직임.gif',
    },

    {
        itemImg : 'tb1.PNG',
    },

    {
        itemImg : 'tb2.PNG',
    },

    {
        itemImg : 'Mingles로고-움직임-짤.gif',
    },

    {
        itemImg : 'greenpointer.png',
    },

    {
        itemImg : 'mg1.jpg',
    },

    {
        itemImg : 'mg2.jpg',
    },

    {
        itemImg : 'Mingles아이콘.png',
    },

    {
        itemImg : 'Mingles-움직임.gif',
    },

    {
        itemImg : 'tb1.PNG',
    },

    {
        itemImg : 'tb2.PNG',
    },

    {
        itemImg : 'Mingles로고-움직임-짤.gif',
    },

    {
        itemImg : 'greenpointer.png',
    },

    {
        itemImg : 'mg1.jpg',
    },

    {
        itemImg : 'mg2.jpg',
    },

    {
        itemImg : 'Mingles아이콘.png',
    },

    {
        itemImg : 'Mingles-움직임.gif',
    },



    {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},
]

// pagination 생성
const count_per_page = 12;

const getTotalPage = function () {

    return Math.ceil(data.length / count_per_page);

};

const pagiNum = document.querySelector('.btn-wrapper');

// pagination 생성함수
const setPagi = function () {

    pagiNum.innerHTML = '';

    for (let i = 1; i <= getTotalPage(); i++) {
        const btn = document.createElement('span');
        btn.className = 'number-btn';
        btn.textContent = i;

        pagiNum.appendChild(btn);
    }

}

setPagi();

// 페이지 생성
const ul = document.querySelector('.main-left>ul');
let currentPage = 1;

const pageNumberBtn = document.querySelectorAll('.number-btn');
const setPage = function (pageNum) {

    ul.innerHTML = '';

    for (
        let i = count_per_page * (pageNum - 1) + 1;
        i <= count_per_page * (pageNum - 1) + 12 && i <= data.length;
        i++
    ) {
        const li = document.createElement('li');
        li.className = 'items';

        const itemImg = document.createElement('img');
        itemImg.src = '../../resources/images/'


        itemImg.src += data[i - 1].itemImg;

        li.append(itemImg);
        ul.append(li);
    }
    pageNumberBtn[0].classList.add('selected');
    
}

setPage(1);

const moveSelectedPageHighlight = function () {

    pageNumberBtn.forEach(function (numberButton) {
        if (numberButton.classList.contains('selected')) {
            numberButton.classList.remove('selected');
        }
    });

    pageNumberBtn[currentPage - 1].classList.add('selected');

};

pageNumberBtn.forEach(function (numberBtn) {

    numberBtn.addEventListener('click', function (e) {
        setPage(e.target.innerHTML);
        currentPage = +e.target.innerHTML;
        moveSelectedPageHighlight();
    });

});

const prevButton = document.querySelector('.prev-button');
const nextButton = document.querySelector('.next-button');

prevButton.addEventListener('click', function () {
    
    if (currentPage > 1) {
        currentPage -= 1;
        setPage(currentPage);
        moveSelectedPageHighlight();
        delay();
    }
    
});

nextButton.addEventListener('click', function () {

    if (currentPage < getTotalPage()) {
        currentPage += 1;
        setPage(currentPage);
        moveSelectedPageHighlight();
        delay();
    }
    
});

const bal1 = document.querySelector('.bal.bal1').classList;
const bal2 = document.querySelector('.bal.bal2').classList;
const bal3 = document.querySelector('.bal.bal3').classList;

document.querySelector('.homepage').addEventListener('click',function() {

    bal1.toggle('onoffTo')
    bal2.remove('onoffTo')
    bal3.remove('onoffTo')

})

document.querySelector('.roomDeco').addEventListener('click',function() {

    bal1.remove('onoffTo')
    bal2.toggle('onoffTo')
    bal3.remove('onoffTo')

})

document.querySelector('.avatar').addEventListener('click',function() {

    bal1.remove('onoffTo')
    bal2.remove('onoffTo')
    bal3.toggle('onoffTo')

})

document.querySelector('.bal-skin').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '스킨'
})
document.querySelector('.bal-font').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '폰트'
})
document.querySelector('.bal-music').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '음악'
})
document.querySelector('.bal-wall').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '벽지'
})
document.querySelector('.bal-floor').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '바닥'
})
document.querySelector('.bal-item').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '아이템'
})
document.querySelector('.bal-hair').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '헤어'
})
document.querySelector('.bal-face').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '표정'
})
document.querySelector('.bal-outer').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '상의'
})
document.querySelector('.bal-pants').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '하의'
})
document.querySelector('.bal-shoes').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '신발'
})
document.querySelector('.bal-accessary').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '악세사리'
})





