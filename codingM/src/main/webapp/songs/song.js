function imageWall() {
  var wall = $('.GITheWall').GITheWall({
    nextButtonClass: 'fa fa-arrow-right',
    prevButtonClass: 'fa fa-arrow-left',
    closeButtonClass: 'fa fa-times'
  });
}

window.onload = function loadDate() {
  $.getJSON("http://localhost:8080/codingM/songs/list.do", function(result) {
    var templateData = $('#temp1').html()
    var template = Handlebars.compile(templateData)
    var html = template(result)
    $(".page").append(html)
    imageWall();
  });
}

/*function getSong() {
  var newdiv = document.createElement("div");
  var add = $(".demo").clone();
  $(newdiv).html(add);
  jQuery(".viewport").append(newdiv);
}

jQuery(document).ready(function() {

  //scroll : 스크롤 사용시 발생되는 이벤트
  jQuery(window).scroll(function(){
    var docH=$(document).height();
    var scrollH = jQuery(window).height() + jQuery(window).scrollTop();
    if(scrollH>=docH) {
      getSong();
    }
  });
});*/
