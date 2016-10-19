ready = function () {
  var el = $('#nav_list_first li a');
  $('#nav_list_first li:has("ul")').append('<div></div>');    
  el.click(function() {
    var checkElement = $(this).next();    
    checkElement.stop().animate({'height':'toggle'}, 500).parent().toggleClass('active');
    if(checkElement.is('ul')) {
      return false;
    }   
  });
};
$(document).ready(ready);
$(document).on('page:load', ready);

