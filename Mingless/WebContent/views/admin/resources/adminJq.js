$(function(){
    // 파일 미리보기
    $("#input-file").change(function (event) {
        var reader = new FileReader();

        reader.onload = function (event) {
            var img = $("#productImage img");

            if(img.length === 0){
                var img = $("<img>");
                $("#productImage").append(img);
            }
            img.attr("src", event.target.result);
        };
        reader.readAsDataURL(event.target.files[0]);
        console.log(event);
    });


    // 태그
    var input = document.querySelector('input[name=basic]')
    var tagify = new Tagify(input);
    // 태그가 추가되면 이벤트 발생
    tagify.on('add', function() {
        console.log(tagify.value); // 입력된 태그 정보 객체
    });

    $(".openTag").click(function(){
        $(".detailCategory").css("display", "block");
        $(this).css("display", "none")
    });

});

var x,
    i,
    j,
    l,
    ll,
    selElmnt,
    a,
    b,
    c;
/* Look for any elements with the class "custom-select": */
x = document.getElementsByClassName("custom-select");
l = x.length;
for (i = 0; i < l; i++) {
    selElmnt = x[i].getElementsByTagName("select")[0];
    ll = selElmnt.length;
    /* For each element, create a new div that will act as the selected item: */
    a = document.createElement("div");
    a.setAttribute("class", "select-selected");
    a.innerHTML = selElmnt
        .options[selElmnt.selectedIndex]
        .innerHTML;
    x[i].appendChild(a);
    /* For each element, create a new div that will contain the option list: */
    b = document.createElement("div");
    b.setAttribute("class", "select-items select-hide");
    for (j = 1; j < ll; j++) {
        /* For each option in the original select element,
    create a new div that will act as an option item: */
        c = document.createElement("div");
        c.innerHTML = selElmnt
            .options[j]
            .innerHTML;
        c.addEventListener("click", function (e) {
            /* When an item is clicked, update the original select box,
        and the selected item: */
            var y,
                i,
                k,
                s,
                h,
                sl,
                yl;
            s = this
                .parentNode
                .parentNode
                .getElementsByTagName("select")[0];
            sl = s.length;
            h = this.parentNode.previousSibling;
            for (i = 0; i < sl; i++) {
                if (s.options[i].innerHTML == this.innerHTML) {
                    s.selectedIndex = i;
                    h.innerHTML = this.innerHTML;
                    y = this
                        .parentNode
                        .getElementsByClassName("same-as-selected");
                    yl = y.length;
                    for (k = 0; k < yl; k++) {
                        y[k].removeAttribute("class");
                    }
                    this.setAttribute("class", "same-as-selected");
                    break;
                }
            }
            h.click();
        });
        b.appendChild(c);
    }
    x[i].appendChild(b);
    a.addEventListener("click", function (e) {
        /* When the select box is clicked, close any other select boxes,
    and open/close the current select box: */
        e.stopPropagation();
        closeAllSelect(this);
        this
            .nextSibling
            .classList
            .toggle("select-hide");
        this
            .classList
            .toggle("select-arrow-active");
    });
}

// custom select
function closeAllSelect(elmnt) {
    /* A function that will close all select boxes in the document,
  except the current select box: */
    var x,
        y,
        i,
        xl,
        yl,
        arrNo = [];
    x = document.getElementsByClassName("select-items");
    y = document.getElementsByClassName("select-selected");
    xl = x.length;
    yl = y.length;
    for (i = 0; i < yl; i++) {
        if (elmnt == y[i]) {
            arrNo.push(i)
        } else {
            y[i]
                .classList
                .remove("select-arrow-active");
        }
    }
    for (i = 0; i < xl; i++) {
        if (arrNo.indexOf(i)) {
            x[i]
                .classList
                .add("select-hide");
        }
    }
}

/*  If the user clicks anywhere outside the select box,
then close all select bo
 * xes: 
 */
document.addEventListener("click", closeAllSelect);