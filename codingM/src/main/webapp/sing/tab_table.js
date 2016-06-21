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
	this.body = document.getElementsByClassName("viewprot")
	loadingstart()
	$.getJSON("http://localhost:3000/parsing", "search=" + escape($("#search").val()), function(result) {
		if (result.tr == "") {
			alert("검색결과가 없습니다.")
		} else {
			this.body = document.getElementsByClassName("viewprot")
			var templateData = $('#temp1').html()
			var template = Handlebars.compile(templateData)
			var html = template(result)
			$(".page").append(html)
		}
		loadingend()
		i()
		imageWall()
    });
}

function imageWall() {
    var wall = $('.GITheWall').GITheWall({
        nextButtonClass: 'fa fa-arrow-right',
        prevButtonClass: 'fa fa-arrow-left',
        closeButtonClass: 'fa fa-times',
    });
}

function onclickDetail(event, url) {
    var inkey = "key";
    var invalue = url;
    sessionStorage.setItem(inkey, url);
};

function loadingstart() {
  var loadingImg = '';
 
  loadingImg += "<div id='loadingImg'>";
  loadingImg += "<img src='../picture/loading.gif'/>"; 
  loadingImg += "</div>";   
 
  //화면에 레이어 추가 
  $('body #loadinglocation')
    .append(loadingImg)

  //로딩중 이미지 표시
  $('#loadingImg').show();
}

function loadingend() {
  $('#loadingImg').hide();
  $('#loadingImg').remove();   
}


