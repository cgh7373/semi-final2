$(function() {


    $('#homeKey').click(function() {
        $('#menuBar').animate({width:'toggle'})
    })

    $('#menuBack').click(function() {
        $('#menuBar').animate({width:'toggle'})
    })

});

$(document).ready(function(){
    $('[data-toggle="popover"]').popover();
  });

  $(document).ready(function() {
    $('#my_info__1').tooltip({
      template: '<div class="tooltip custom-tooltip"><div class="arrow"></div><div class="tooltip-inner"></div></div>'
    });

    $('#my_info__2, #my_info__3, #my_info__4').tooltip();
  });

  $(document).ready(function(){
    $('[data-toggle="popover"]').popover();

  });
