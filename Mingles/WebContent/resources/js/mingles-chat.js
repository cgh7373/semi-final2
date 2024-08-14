// 채팅창 자스
// 캔버스 함수
const canvas = document.getElementById('jsCanvas')
const ctx = canvas.getContext('2d');

// 캔버스 사이즈 여기서조정
canvas.width = 3000;
canvas.height = 1100;

let painting = false;

function startPainting(e) {
    const x = e.offsetX;
    const y = e.offsetY;
    ctx.beginPath();
    ctx.moveTo(x, y);
    painting=true;
}

function stopPainting() {
    ctx.closePath();
    painting=false;
}

function onMouseMove(e) {
    const x = e.offsetX;
    const y = e.offsetY;
    if(!painting) {
        return;
    }
    ctx.lineTo(x, y);
    ctx.stroke();
}

if (canvas) {
    canvas.addEventListener("mousemove", onMouseMove);
    canvas.addEventListener("mousedown", startPainting);
    canvas.addEventListener("mouseup", stopPainting);
    canvas.addEventListener("mouseleave", stopPainting);
}

// 그림 선 스타일 추후 함수넣어서 동적으로
ctx.strokeStyle = "orange";
ctx.lineWidth = 2.5;
ctx.lineCap = 'round';


// 첨부파일 사진넣기
function setThumbnail(event) {
    let reader = new FileReader();

    reader.onload = function(event) {
      let img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      document.querySelector(".chatting.ch2").appendChild(img);
    };
    reader.readAsDataURL(event.target.files[0]);
}


// 친구 리스트 클릭 이벤트
document.addEventListener('DOMContentLoaded', function() {
    const friendLists = document.querySelectorAll('.friendList');

    friendLists.forEach(friendList => {
        friendList.addEventListener('click', function() {
            // 기존에 선택된 항목이 있다면 원상복귀
            document.querySelectorAll('.friendList.selected').forEach(selected => {
                selected.classList.remove('selected');
            });

            // 현재 클릭된 항목에만 'selected' 클래스 추가
            this.classList.add('selected');
        });
    });
});



// canvas click 뜨고 안뜨고
const newLocal = $(document).ready(function () {
    $(".draw").click(function () {
        $("canvas").toggle();
    });
});

// canvas draw span color change
const draw = document.querySelector(".draw");
const CLICKED_CLASS = "clicked";
function handClick(){
    draw.classList.toggle(CLICKED_CLASS);
} 
function init(){
    draw.addEventListener("click", handClick)
}
init();

