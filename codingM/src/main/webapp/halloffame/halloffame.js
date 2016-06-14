window.onload = function loadDate() {
  $.getJSON("data.json", function(result) {
    var templateData = $('#temp1').html()
    var template = Handlebars.compile(templateData)
    var html = template(result)
    $(".page").append(html)
  });
}
