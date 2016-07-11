var dropdown = new TINY.dropdown.init("dropdown", {
    id : 'menu',
    active : 'menuhover'
  });

function imageWall() {
  var wall = $('.GITheWall').GITheWall({
  });
}

$(document).ready(function() {
	sessionStorage.setItem("scrollCount", 0)
    $.getJSON("http://localhost:8080/codingM/songs/list.do", function(result) {
	    var templateData = $('#temp1').html()
	    var template = Handlebars.compile(templateData)
	    var html = template(result)
	    $(".page").append(html)
	    
	    imageWall()
	    $('.lili').css("display", "none")
	    
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

function addListen() {
	$.getJSON("http://localhost:8080/codingM/songs/listen.do?sno=" + sessionStorage.getItem("sno"))
}

Handlebars.registerHelper('statusBool', function(options) {
    if (this.status % 2 == 0) {
    	return options.fn(this);    	
    } else {
    	return options.inverse(this);
    }
});

function changeHeart() {
	var self = $('[data-sno=' + sessionStorage.getItem("sno") + '] div .disc div')
	
	if (self.attr("data-status") == 0) {
		self.attr("data-status", 1)
		$.getJSON("http://localhost:8080/codingM/like/add.do?sno=" + sessionStorage.getItem("sno"), function(result) {
			self.attr('class', 'glyphicon glyphicon-heart')
			self.nextAll('span').html(result.status)
		});
	} else {
		$.getJSON("http://localhost:8080/codingM/like/update.do?sno=" + sessionStorage.getItem("sno"), function(result) {
			if (result.statusCount % 2 == 0) {
				self.attr('class', 'glyphicon glyphicon-heart-empty')
				self.nextAll('span').html(result.status)
			} else {
				self.attr('class', 'glyphicon glyphicon-heart')
				self.nextAll('span').html(result.status)
			}
		});
	}
}