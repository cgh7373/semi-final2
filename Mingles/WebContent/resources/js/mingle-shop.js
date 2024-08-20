
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

document.getElementById('2-1').addEventListener('click', function() {
    tag.innerHTML = '';
    tag.innerHTML = '내방 꾸미기 - 벽지';
})
document.getElementById('2-2').addEventListener('click', function() {
    tag.innerHTML = '';
    tag.innerHTML = '내방 꾸미기 - 바닥';
})
document.getElementById('2-3').addEventListener('click', function() {
    tag.innerHTML = '';
    tag.innerHTML = '내방 꾸미기 - 아이템';
})

document.getElementById('3-1').addEventListener('click', function() {
    tag.innerHTML = '';
    tag.innerHTML = '아바타 꾸미기 - 헤어';
})
document.getElementById('3-2').addEventListener('click', function() {
    tag.innerHTML = '';
    tag.innerHTML = '아바타 꾸미기 - 표정';
})
document.getElementById('3-3').addEventListener('click', function() {
    tag.innerHTML = '';
    tag.innerHTML = '아바타 꾸미기 - 상의';
})
document.getElementById('3-4').addEventListener('click', function() {
    tag.innerHTML = '';
    tag.innerHTML = '아바타 꾸미기 - 하의';
})
document.getElementById('3-5').addEventListener('click', function() {
    tag.innerHTML = '';
    tag.innerHTML = '아바타 꾸미기 - 신발';
})



const data = [
    {
        itemName: '백설공주의 유혹',
        itemDesc: '후후... 너도 나처럼 아름다워지고 싶니?하지만 포기하는게 좋을거야 무엇이든 원하는것에는 댓가가 따르는 법이거든.',
        itemMaker: '김응애(kimbaby)',
        itemDate: '2024/06/04'
    },
    {
        itemName: '공주의 물약',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


    {
        itemName: '공주의 물약',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


    {
        itemName: '공주의 물약3',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


    {
        itemName: '공주의 물약',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


    {
        itemName: '공주의 물약',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


    {
        itemName: '공주의 물약5',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


    {
        itemName: '공주의 물약',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


    {
        itemName: '공주의 물약',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


    {
        itemName: '공주의 물약',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


    {
        itemName: '공주의 물약3',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


    {
        itemName: '공주의 물약',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


    {
        itemName: '공주의 물약',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


    {
        itemName: '공주의 물약',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


    {
        itemName: '공주의 물약1',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


    {
        itemName: '공주의 물약',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


    {
        itemName: '공주의 물약',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


    {
        itemName: '공주의 물약',
        itemDesc: '공주는 아름다움을 위해 무엇이든 희생합니다..',
        itemMaker: '김상민',
        itemDate: '2024/05/14'
    },


]

const count_per_page = 5;

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

// 페이지 생성함수
const ul = document.querySelector('.content-main>ul');
let currentPage = 1;

const pageNumberBtn = document.querySelectorAll('.number-btn');
const setPage = function (pageNum) {

    ul.innerHTML = '';

    for (
        let i = count_per_page * (pageNum - 1) + 1;
        i <= count_per_page * (pageNum - 1) + 5 && i <= data.length;
        i++
    ) {
        const li = document.createElement('li');

        const itemImage = document.createElement('div');

        if (i%5 === 0) {
            itemImage.className = `img-box floating${5}`
        } else {
            itemImage.className = `img-box floating${i%5}`
        }
        
        // 이미지파트.. 이거 나중에 수정해야됨
        const innerImage = document.createElement('img');
        innerImage.src = '../../resources/images/Mingles-움직임.gif';

        const itemContainer = document.createElement('div');
        itemContainer.className = 'item-container';

        const itemName = document.createElement('p');
        itemName.className = 'item-name'

        const itemDesc = document.createElement('p');
        itemDesc.className = 'item-desc'

        const itemMaker = document.createElement('p');
        itemMaker.className = 'item-maker'

        const itemDate = document.createElement('p');
        itemDate.className = 'item-date'

        itemName.textContent = data[i - 1].itemName;
        itemDesc.textContent = data[i - 1].itemDesc;
        itemMaker.textContent = data[i - 1].itemMaker;
        itemDate.textContent = data[i - 1].itemDate;

        itemImage.append(innerImage);

        itemContainer.append(itemImage, itemName, itemDesc, itemMaker, itemDate);

        li.append(itemContainer);
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
        delay();
    });

});

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



