
$(function() {


    $('#homeKey').click(function() {
        $('#menuBar').animate({width:'toggle'})
    })

    $('#menuBack').click(function() {
        $('#menuBar').animate({width:'toggle'})
    })
})

//체크박스 전체 선택 js
function selectAll(selectAll)  {
    const checkboxes = document.getElementsByName('choice')
        
    checkboxes.forEach((checkbox)=> 
    {
        checkbox.checked = selectAll.checked;
    })
}
