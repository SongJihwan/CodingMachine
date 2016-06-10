/**
 * 
 */


<tr>
<td rowspan="1" colspan="1"">
<a href="#" onclick="onclickDetail(event)">{{제목}}</a></td>
<td rowspan="1" colspan="1">{{가수}} </td>
</tr>

function runScript(tabId, tableId, data, event) {
	if (event.keyCode == 13) {
		addTable(tableId, data)
	}
};

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

