$(document).ready( function () {
	if (sessionStorage.getItem("loginValid") != "1") {
		location.href = "http://localhost:8080/codingM/mainpage/main.html"
	}
})