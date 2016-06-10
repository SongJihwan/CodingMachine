/**
 * 
 */

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

function runScript(tableId, data, event) {
	if (event.keyCode == 13) {
		addTable(tableId, data)
	}
};


function addTable (id, data) {
	this.body = document.getElementById(id)
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


