$('#loginBtn').click(function() {
	var wall = $('.GITheWall').GITheWall({
		nextButtonClass: 'fa fa-arrow-right',
		prevButtonClass: 'fa fa-arrow-left',
		closeButtonClass: 'fa fa-times'
	})
})


// Toggle Function
$('.toggle').click(function(){
  // Switches the Icon
  $(this).children('i').toggleClass('fa-pencil');
  // Switches the forms  
  $('.form').animate({
    height: "toggle",
    'padding-top': 'toggle',
    'padding-bottom': 'toggle',
    opacity: "toggle"
  }, "slow");
});

