/**
 * 
 */
function runScript(tabId, tableId, event) {
	if (event.keyCode == 13) {
		addTab(tabId, tableId)
		addTable(tableId)
	}
};

function addTab(tabId, tableId) {
	this.body = document.getElementById(tabId)
	this.body.innerHTML = 
		"<div id='tabs' class='dynT'>" +
		"<ul><li><a href='#tabs-1'>제목별</a></li><li><a href='#tabs-2'>가수별</a></li></ul>" +
		"<div id=class='#tabs-1'><div id='resultList'></div><div class='container'>" +
		"<table id='" + tableId + "' class='table table-hover'><tbody></tbody></table></div></div>" +
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

