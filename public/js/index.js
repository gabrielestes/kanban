var $bulletinTitle = $('#title')
var $bulletins = $('#bulletins')
var $taskTitle = $('#title')
var $tasks = $('#bulletins')

$.ajax({
  method: 'GET',
  url: '/api/tasks',
  dataType: 'json'
}).done(function(tasks) {
  console.log(tasks);
});

$('input#get').click(function() {
  $.ajax({
    type: 'GET',
    url: 'http://localhost:5432/api/tasks',
    dataType: 'json',
    success: function(data) {
      $.each(data, function(index, item) {
        $.each(item, function(key, value) {
          container.append(key + ': ' + value + '</br');
        });
        container.append('</br>')
      });
    }
  });
})
