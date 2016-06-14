window.onload = function loadDate() {
  $.getJSON("data.json", function(result) {
    var templateData = $('#temp1').html()
    var template = Handlebars.compile(templateData)
    var html = template(result)
    $(".page").append(html)
  });
}

function getImage() {
  var newdiv = document.createElement("div");
  var add = $(".sect1").clone();
  $(newdiv).html(add);
  jQuery(".page").append(newdiv);
}
jQuery(document).ready(function() {

  getImage();

  //scroll : 스크롤 사용시 발생되는 이벤트
  jQuery(window).scroll(function(){
    var docH=$(document).height();
    var scrollH = jQuery(window).height() + jQuery(window).scrollTop();
    if(scrollH>=docH) {
      getImage();
    }
  });
});
