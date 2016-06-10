/**
 * 
 */
document.write("<script type='text/javascript' src='../bower_components/jquery-ui/jquery-ui.js' ><" + "/script>");
document.write("<script type='text/javascript' src='../bower_components/jquery/dist/jquery.js'<" + "/script>");
document.write("<script type='text/javascript' src='../bower_components/bootstrap/dist/js/bootstrap.min.js' ><" + "/script>");

var jsonData = {
	tr : [
		{
			제목:'너만을 원했다(드라마"세상 어디에도 없는 착한남자")', 가수:'손호영'
		}, 
		{
			제목:'사랑은 눈꽃처럼(드라마"세상 어디에도 없는 착한남자")', 가수:'시아준수'
		},
		{
			제목:'어디에도', 가수:'M.C. THE MAX'
		},
		{
			제목:'정말(드라마"세상 어디에도 없는 착한남자")', 가수:'송중기'
		}] 
};

function runScript(tabId, tableId, data, event) {
	if (event.keyCode == 13) {
		addTab(tabId)
		addTable(tableId, data)
	}
};

function addTab (tabId) {
	this.body = document.getElementById(tabId)
	this.body.innerHTML = "<div id='tabs'><ul><li><a href='#tabs-1'>제목별</a></li><li><a href='#tabs-2'>가수별</a></li> </ul>" +
			"<div id='tabs-1'><div id='resultList'></div></div><div id='tabs-2'><p></p></div></div>"
}


function addTable (tableId, data) {
	this.body = document.getElementById(tableId)
	this.trData = data.tr
	
	this.clearBody = function() {
		while(this.body.rows.length > 0){
			this.body.deleteRow(this.body.rows.length - 1);
		}
	}
	
	this.body.innerHTML = "<h3>\"<span id='title'>어디에도</span>\" 검색 결과</h3>"
		
	this.createTr = function() {
		var i = 0;
		while(i < this.trData.length){
			var tdData = this.trData[i++]
			if(tdData == null) continue
	
			var option = {align:'center', colspan:1, rowspan:1}
	
			var newTr = this.body.insertRow()
			for(key in tdData){
				this.addTdTitle(key, newTr, tdData[key] ? tdData[key] : 'NULL', option)
			}
		}
	}
	
	this.addTdTitle = function(key, row, data, option) {
		var node = row.insertCell();
	
		node.style.textAlign = option.align
		node.style.cursor = 'pointer'
		
		if (key == "제목") {
			node.innerHTML = '<a href="#" onclick="onclickDetail(event)"> ' + data + '</button>'
		} else {
			node.innerHTML = data + ' '
		}
		node.rowSpan = option.rowspan
		node.colSpan = option.colspan
	}
	
	this.clearBody()
	this.createTr()
}

function onclickDetail(event) {
	location.href = "sing-2.html"
}

