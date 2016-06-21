/**
 *
 */
 function i(){
     $('html, body').stop().animate({
         scrollTop : '+=500%'
     });
 }

 function runScript(tableId, event, value) {
   if (event.keyCode == 13) {
      addTable(tableId, value)
  }
};

/* <div role='main' class='viewport'><div class='demo'><div class='GITheWall'><tr class='page'>*/

function addTable (tableId, search) {
	this.body = document.getElementsByClassName("viewprot")
    // this.body.innerHTML =

    $.getJSON("http://localhost:3000/parsing", "search=" + escape($("#search").val()), function(result) {
        this.body = document.getElementsByClassName("viewprot")
        var templateData = $('#temp1').html()
        var template = Handlebars.compile(templateData)
        var html = template(result)
        $(".page").append(html)
        i()
        imageWall()
    });



}
function onclickDetail(event, url) {

}

function imageWall() {
    var wall = $('.GITheWall').GITheWall({
        nextButtonClass: 'fa fa-arrow-right',
        prevButtonClass: 'fa fa-arrow-left',
        closeButtonClass: 'fa fa-times'
    });
}
