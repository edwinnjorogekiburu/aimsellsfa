$(document).ready(function(){
  $('.maxlength')
    .after("<div class='indicator'></div>")
    .next()
    .hide()
    .end()
    .keydown(function(e) {
      var current = $(this).val().length;
      if(current >= 255) {
        if(e.which != 0 && e.which != 8) {
          e.preventDefault();
        }
      }
      $(this).next().show().text(255 - current +' characters left ');
    });
 });
