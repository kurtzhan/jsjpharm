$(function(){
 var shrinkHeader = 300;
  $(window).scroll(function() {
    var scroll = getCurrentScroll();
      if ( scroll >= shrinkHeader ) {
           $('#docHead').addClass('docHeadFixed');
           $(".categorysBox").children().insertAfter($(".navCategorys h2"));
        }
        else {
            $('#docHead').removeClass('docHeadFixed');
        }
  });
function getCurrentScroll() {
    return window.pageYOffset || document.documentElement.scrollTop;
    }
});