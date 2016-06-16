window.onload = function loadDate() {
  $.getJSON("data.json", function(result) {
    var templateData = $('#temp1').html()
    var template = Handlebars.compile(templateData)
    var html = template(result)
    $(".halloffame").append(html)
    imageWall();
  });
}
function imageWall() {
	  var wall = $('.content').GITheWall({
	    nextButtonClass: 'fa fa-arrow-right',
	    prevButtonClass: 'fa fa-arrow-left',
	    closeButtonClass: 'fa fa-times'
	  });
	}
