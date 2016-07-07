function imageWall() {
  var wall = $('.GITheWall').GITheWall({
    nextButtonClass: 'fa fa-arrow-right',
    prevButtonClass: 'fa fa-arrow-left',
    closeButtonClass: 'fa fa-times'
  });
}

$(document).ready(function() {
	sessionStorage.setItem("scrollCount", 0)
  $.getJSON("http://localhost:8080/codingM/songs/list.do", function(result) {
    var templateData = $('#temp1').html()
    var template = Handlebars.compile(templateData)
    var html = template(result)
    $(".page").append(html)
    
    imageWall();
    $('.lili').css("display", "none");
    
    var count = parseInt(sessionStorage.getItem("scrollCount")) + 18;
    for (var i = sessionStorage.getItem("scrollCount"); i < count; i++) {
    	$($('.lili')[i]).toggle()
    }
    sessionStorage.setItem("scrollCount", count)
  });
});

jQuery(window).scroll(function(){
    var docH=$(document).height();
    var scrollH = jQuery(window).height() + jQuery(window).scrollTop();
    
    if(scrollH>=docH) {
    	var count = parseInt(sessionStorage.getItem("scrollCount")) + 18;
        for (var i = sessionStorage.getItem("scrollCount"); i < count; i++) {
        	$($('.lili')[i]).toggle()
        }
        sessionStorage.setItem("scrollCount", count)
    }
});

