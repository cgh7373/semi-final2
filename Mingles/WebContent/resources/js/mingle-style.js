
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

// 클릭시 카테고리 바뀌기

document.querySelector('.bal-wall').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '벽지'
    updateCategory();
})
document.querySelector('.bal-floor').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '바닥'
    updateCategory();
})
document.querySelector('.bal-theme').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '테마'
    updateCategory();
})
document.querySelector('.bal-hair').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '헤어'
    updateCategory();
})
document.querySelector('.bal-face').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '표정'
    updateCategory();
})
document.querySelector('.bal-outer').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '상의'
    updateCategory();
})
document.querySelector('.bal-pants').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '하의'
    updateCategory();
})
document.querySelector('.bal-shoes').addEventListener('click',function() {
    document.querySelector('.style-tag').innerHTML = '신발'
    updateCategory();
})

// AVATAR DATA PAGINATION

const hairdata = [

    {itemImg : 'hair1.png',},
    {itemImg : 'hair2.png',},
    {itemImg : 'hair3.png',},
    {itemImg : 'hair4.png',},
    {itemImg : 'hair5.png',},
    {itemImg : 'hair6.png',},
    {itemImg : 'hair7.png',},
    {itemImg : 'hair8.png',},
    {itemImg : 'hair9.png',},
    {itemImg : 'hair10.png',},
    {itemImg : 'hair11.png',},
    {itemImg : 'hair12.png',},
    {itemImg : 'hair13.png',},
    {itemImg : 'hair14.png',},
    {itemImg : 'hair15.png',},
]

const facedata = [
    {itemImg : 'eyes1.png',},
    {itemImg : 'eyes2.png',},
    {itemImg : 'eyes3.png',},
    {itemImg : 'eyes4.png',},
    {itemImg : 'eyes5.png',},
]

const topdata = [
    {itemImg : 'top1.png',},
    {itemImg : 'top2.png',},
    {itemImg : 'top3.png',},
    {itemImg : 'top4.png',},
    {itemImg : 'top5.png',},
    {itemImg : 'top6.png',},
    {itemImg : 'top7.png',},
    {itemImg : 'top8.png',},
    {itemImg : 'top9.png',},
    {itemImg : 'top10.png',},
]

const bottomdata = [
    {itemImg : 'bottom1.png',},
    {itemImg : 'bottom2.png',},
    {itemImg : 'bottom3.png',},
    {itemImg : 'bottom4.png',},
    {itemImg : 'bottom5.png',},
    {itemImg : 'bottom6.png',},
    {itemImg : 'bottom7.png',},
    {itemImg : 'bottom8.png',},
    {itemImg : 'bottom9.png',},
    {itemImg : 'bottom10.png',},
    {itemImg : 'bottom11.png',},
]

const shoesdata = [
    {itemImg : 'shoes1.png',},
    {itemImg : 'shoes2.png',},
    {itemImg : 'shoes3.png',},
    {itemImg : 'shoes4.png',},
    {itemImg : 'shoes5.png',},
    {itemImg : 'shoes6.png',},
    {itemImg : 'shoes7.png',},
    {itemImg : 'shoes8.png',},
    {itemImg : 'shoes9.png',},
    {itemImg : 'shoes10.png',},
    {itemImg : 'shoes11.png',},
    {itemImg : 'shoes12.png',},
    {itemImg : 'shoes13.png',},
    {itemImg : 'shoes14.png',},
]

// FLOOR DATA PAGINATION
const floordata = [
    {itemImg : 'floor1.png',},
    {itemImg : 'floor2.png',},
    {itemImg : 'floor3.png',},
    {itemImg : 'floor4.png',},
    {itemImg : 'floor5.png',},
    {itemImg : 'floor6.png',},
    {itemImg : 'floor7.png',},
    {itemImg : 'floor8.png',},
    {itemImg : 'floor9.png',},
    {itemImg : 'floor10.png',},
]

// WALL DATA PAGINATION
const walldata = [
    {itemImg : 'wall1.png',},
    {itemImg : 'wall2.png',},
    {itemImg : 'wall3.png',},
    {itemImg : 'wall4.png',},
    {itemImg : 'wall5.png',},
    {itemImg : 'wall6.png',},
    {itemImg : 'wall7.png',},
    {itemImg : 'wall8.png',},
    {itemImg : 'wall9.png',},
    {itemImg : 'wall10.png',},
]

// THEME DATA PAGINATON
const themedata = [
    {itemImg : 'theme1.png',},
    {itemImg : 'theme2.png',},
    {itemImg : 'theme3.png',},
    {itemImg : 'theme4.png',},
    {itemImg : 'theme5.png',},
]



// count_per_page = boardLimit = 한 페이지에 보여질 개수
const count_per_page = 6;

let currentData = "";

function updateCategory(){
    const category = document.querySelector('.style-tag').innerHTML;

    switch(category){
        case '헤어' : currentData = hairdata; break;
        case '표정' : currentData = facedata; break;
        case '상의' : currentData = topdata; break;
        case '하의' : currentData = bottomdata; break;
        case '신발' : currentData = shoesdata; break;
        case '벽지' : currentData = walldata; break;
        case '바닥' : currentData = floordata; break;
        case '테마' : currentData = themedata; break;
    }

    updatePagination();
    setPage(1);

}

// GET TOTAL PAGE = MAXPAGE
// data.length = listCount = 현재 총 게시글 수
const getTotalPage = function () {
    let total = Math.ceil(currentData.length / count_per_page);
    return total;
};

// pageLimit: 하단에 보여질 페이징 바의 페이지 최대 개수 
const pagiNum = document.querySelector('.btn-wrapper');

// pagination 생성함수 - pageLimit에 추가
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

// 페이지 생성 - 한페이지 - 
const ul = document.querySelector('.main-left>ul');
let currentPage = 1;

const pageNumberBtn = document.querySelectorAll('.number-btn');
const setPage = function (pageNum) {

    ul.innerHTML = '';

    for (
        let i = count_per_page * (pageNum - 1);
        i < Math.min(count_per_page * pageNum, currentData.length);
        i++
    ) {
        const li = document.createElement('li');
        li.className = 'items';

        const itemImg = document.createElement('img');
        itemImg.src += '../../resources/stylesources/' + currentData[i].itemImg;
       
        li.append(itemImg);
        ul.append(li);
    }
   
};

const updatePagination = function () {
    pagiNum.innerHTML = '';
    for (let i = 1; i <= getTotalPage(); i++) {
        const btn = document.createElement('span');
        btn.className = 'number-btn';
        btn.textContent = i;
        
        btn.addEventListener('click', function(){
            setPage(i);
            currentPage = i;
            moveSelectedPageHighlight();
        });

        pagiNum.appendChild(btn);
    }
    moveSelectedPageHighlight();
};

// PAGE INCREASE
const moveSelectedPageHighlight = function () {

    pageNumberBtn.forEach(function (numberButton) {
        numberButton.classList.remove('.selected');
    });

    const selectedButton = Array.from(pageNumberBtn).find(btn => btn.textContent == currentPage);
    if (selectedButton) {
        selectedButton.classList.add('selected');
    }
};

function initializePagination(){
    updatePagination();
    setPage(currentPage);
}

currentPage = 1;
initializePagination();

// BUTTON ARROW
const prevButton = document.querySelector('.prev-button');
const nextButton = document.querySelector('.next-button');

prevButton.addEventListener('click', function () {
    
    if (currentPage > 1) {
        currentPage -= 1;
        setPage(currentPage);
        moveSelectedPageHighlight();
    }
    
});

nextButton.addEventListener('click', function () {

    if (currentPage < getTotalPage()) {
        currentPage += 1;
        setPage(currentPage);
        moveSelectedPageHighlight();
    }
    
});


// CATEGORY

const bal2 = document.querySelector('.bal.bal2').classList;
const bal3 = document.querySelector('.bal.bal3').classList;

document.querySelector('.roomDeco').addEventListener('click',function() {

    bal2.toggle('onoffTo')
    bal3.remove('onoffTo')

})

document.querySelector('.avatar').addEventListener('click',function() {

    bal2.remove('onoffTo')
    bal3.toggle('onoffTo')

})


// SELECT ITEMS WITH CLICK

// document.addEventListener("DOMContentLoaded", function(){
//     // Function to handle image selection

//     // HAIR SELECT
//     function handleImageClick(event) {
//         const target = event.target;
//         if (target.tagName === 'IMG') {
//             const characterHair = document.getElementById('hair');
//             characterHair.src = target.src;
//         }
//     };

//     // HAIR CHANGE
//     document.querySelector(".bal-hair").addEventListener("click", function() {
//         const hairOptions = document.querySelector(".item-container");
//         if (hairOptions) {
//             hairOptions.addEventListener('click', handleImageClick);
//         }
//         initializePagination();
//     });

// });

// document.addEventListener("DOMContentLoaded", function(){
//     // FACE SELECT
//     function handleImageClick(event) {
//     const target = event.target;
//     if (target.tagName === 'IMG') {
//     const characterFace = document.getElementById('face');
//     characterFace.src = target.src;
//     }
//     };

//     // FACE CHANGE
//     document.querySelector(".bal-face").addEventListener("click", function() {
//     const eyeOptions = document.querySelector(".item-container");
//     if (eyeOptions) {
//     eyeOptions.addEventListener('click', handleImageClick);
//     }
//     initializePagination();
//     });

// });


// document.addEventListener("DOMContentLoaded", function(){
//     // BOTTOM SELECT
//     function handleImageClick(event) {
//     const target = event.target;
//     if (target.tagName === 'IMG') {
//     const characterBottom = document.getElementById('bottom');
//     characterBottom.src = target.src;
//     }
//     };

//     // BOTTOM CHANGE
//     document.querySelector(".bal-pants").addEventListener("click", function() {
//     const bottomOption = document.querySelector(".item-container");
//     if (bottomOption) {
//     bottomOption.addEventListener('click', handleImageClick);
//     }
//     initializePagination();
//     });

// });

// document.addEventListener("DOMContentLoaded", function(){
//     // TOP SELECT
//     function handleImageClick(event) {
//     const target = event.target;
//     if (target.tagName === 'IMG') {
//     const characterTop = document.getElementById('top');
//     characterTop.src = target.src;
//     }
//     };

//     // TOP CHANGE
//     document.querySelector(".bal-outer").addEventListener("click", function() {
//     const topOption = document.querySelector(".item-container");
//     if (topOption) {
//         topOption.addEventListener('click', handleImageClick);
//     }
//     initializePagination();
//     });

// });


// document.addEventListener("DOMContentLoaded", function(){
//     // SHOES SELECT
//     function handleImageClick(event) {
//     const target = event.target;
//     if (target.tagName === 'IMG') {
//     const characterShoes = document.getElementById('shoes');
//     characterShoes.src = target.src;
//     }
//     };

//     // SHOES CHANGE
//     document.querySelector(".bal-shoes").addEventListener("click", function() {
//     const shoesOption = document.querySelector(".item-container");
//     if (shoesOption) {
//         shoesOption.addEventListener('click', handleImageClick);
//     }
//     initializePagination();
//     });

// });

document.addEventListener("DOMContentLoaded", function() {

    function handleImageClick(event) {
      const target = event.target;
      if (target.tagName === 'IMG') {
        const selectedElementId = getSelectedElementId(); 
        const elementToUpdate = document.getElementById(selectedElementId);
        if (elementToUpdate) {
          elementToUpdate.src = target.src;
        }
      }
    }
  
    function getSelectedElementId() {
      return localStorage.getItem('selectedElementId');
    }
  
    function setSelectedElementId(elementId) {
      localStorage.setItem('selectedElementId', elementId);
    }
  
    function setupCategory(category, elementId) {
      document.querySelector(`.bal-${category}`).addEventListener("click", function() {
        const optionsContainer = document.querySelector(".item-container");
        if (optionsContainer) {
          optionsContainer.removeEventListener('click', handleImageClick); 
          optionsContainer.addEventListener('click', handleImageClick); 
        }
  
        setSelectedElementId(elementId); 
        initializePagination();
      });
    }
  
    setupCategory('hair', 'hair');
    setupCategory('face', 'face');
    setupCategory('pants', 'bottom');
    setupCategory('outer', 'top');
    setupCategory('shoes', 'shoes');
    setupCategory('wall', 'wall');
    setupCategory('floor', 'floor');
    setupCategory('theme', 'theme');
  

    initializePagination();
  
    const previouslySelectedId = getSelectedElementId();
    if (previouslySelectedId) {
      const elementToUpdate = document.getElementById(previouslySelectedId);
      if (elementToUpdate) {
        handleImageClick({ target: elementToUpdate }); 
      }
    }
  });
  

// shop에서 구매 후 값을 받아온 경우이다.
function sendItem(result){
    console.log('ajax에서 값 받아오는거 성공함');
    console.log(result)
};