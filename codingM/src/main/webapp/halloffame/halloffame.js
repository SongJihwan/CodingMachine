window.onload = function loadDate() {
  $.getJSON("realtime.json", function(result) {
    var templateData = $('#temp1').html()
    var template = Handlebars.compile(templateData)
    var html = template(result)
    $(".halloffame").append(html)
  });
}