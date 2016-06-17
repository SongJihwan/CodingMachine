function imageWall() {
  var wall = $('.GITheWall').GITheWall({
    nextButtonClass: 'fa fa-arrow-right',
    prevButtonClass: 'fa fa-arrow-left',
    closeButtonClass: 'fa fa-times'

  });

}

window.onload = function loadDate() {
  $.getJSON("data.json", function(result) {
    var templateData = $('#temp1').html()
    var template = Handlebars.compile(templateData)
    var html = template(result)
    $(".page").append(html)
    imageWall();
  });
}

function loadDate2() {
  $.getJSON("data2.json", function(result2) {
    var templateData2 = $('#temp2').html()
    var template2 = Handlebars.compile(templateData2)
    var html2 = template2(result2)
    $(".table table-hover").append(html2)
    imageWall();
  });
  alert("실행")
}

function getImage() {
  var newdiv = document.createElement("div");
  var add = $(".demo").clone();
  $(newdiv).html(add);
  jQuery(".viewport").append(newdiv);

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

function test() {
  alert("테스트");
}
