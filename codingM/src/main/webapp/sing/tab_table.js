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


function addTable (tableId, search) {
	this.body = document.getElementById(tableId)
	wrapWindowByMask()
	this.body.innerHTML = "<div role='main' class='viewport'><div class='demo'><div class='GITheWall'><div class='container'>" +
	"<table id='" + tableId + "' class='table table-hover'>" +
	"<h3><span id=title>\""+document.querySelector(search).value+"\"</span>에 대한 검색 결과</h3>" +
	"<tbody></tbody></table></div></div></div></div>"	 
	$.getJSON("http://localhost:3000/parsing", "search=" + escape($("#search").val()), function(result) {
		this.body = document.getElementById(tableId)
		var templateData = $('#temp1').html()
		var template = Handlebars.compile(templateData)
		var html = template(result)
		$("#" + tableId + " tbody").append(html)
		i()	
		closeWindowByMask()
	});
}

function onclickDetail(event, url) {
  var wall = $('.GITheWall').GITheWall({
	nextButtonClass: 'fa fa-arrow-right',
	prevButtonClass: 'fa fa-arrow-left',
	closeButtonClass: 'fa fa-times'
  });
}

function wrapWindowByMask() {
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = window.document.body.clientWidth;
    var loadingImg = '';
     
    loadingImg += "<div id='loadingImg' style='position:absolute; left:50%; top:90%; display:none; z-index:10000;'>";
    loadingImg += "<img src='../picture/loading.gif'/>"; 
    loadingImg += "</div>";   
 
    //화면에 레이어 추가 
    $('body')
        .append(loadingImg)

    //로딩중 이미지 표시
    $('#loadingImg').show();
}

function closeWindowByMask() {
    $('#loadingImg').hide();
    $('#loadingImg').remove();   
}