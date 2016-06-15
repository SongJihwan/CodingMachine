/**
 *
 */
function i(){
   $('html, body').stop().animate({
       scrollTop : '+=500%'
   });
}


var a = 0;
function runScript(tabId, tableId, event, value) {
	if (event.keyCode == 13) {
		addTab(tabId, tableId, value)
		addTable(tableId)
		i()
	}
};

function addTab(tabId, tableId, search) {
	this.body = document.getElementById(tabId)
	this.body.innerHTML =
		"<div id='tabs' class='dynT'>" +
		"<ul><li><a href='#tabs-1'>제목별</a></li><li><a href='#tabs-2'>가수별</a></li></ul>" +
		"<div id=class='#tabs-1'><div id='resultList'></div><div class='container'>" +
		"<table id='" + tableId + "' class='table table-hover'>" +
		"<h3><span id=title>\""+document.querySelector(search).value+"\"</span>에 대한 제목별 검색 결과</h3>" +
		"<tbody></tbody></table></div></div>" +
		"<div class='#tabs-2'></div></div>"
	$("#tabs").tabs();
}

function addTable (tableId) {
	$.getJSON("data.json", function(result) {
		this.body = document.getElementById(tableId)
		var templateData = $('#temp1').html()
		var template = Handlebars.compile(templateData)
		var html = template(result)
		$("#" + tableId + " tbody").append(html)
	});
}

function onclickDetail(event) {
	location.href = "sing-2.html"
}
