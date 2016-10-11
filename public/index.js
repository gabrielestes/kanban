var $bulletinTitle = $('#bulletin-title')
var $bulletins = $('#bulletins')
var $taskTitle = $('#title')
var $tasks = $('#all-tasks')

$('#new-task').click(function() {
  var user = $('#user-id').val()
  var title = $('#task-title').val()
  var status = $('#status').val()
  var priority = $('#priority').val()

  return $.ajax({
    method: 'POST',
    url: '/api/tasks',
    dataType: 'json',
    data: {
      user_id: user,
      title: title,
      status: status,
      priority: priority
    }
  }).done(function($tasks) {
    console.log("it works");
  });
})
//
$.ajax({
        method: 'GET',
        url: '/api/tasks',
        data: {
          // title: title
        },
        dataType: 'json'
      }).done(function($tasks) {
        console.log($tasks);

        $tasks.forEach(function($task) {
          console.log($task);

          $('#all-tasks').append("<li>" + $task.title + " " + $task.status + $task.priority + "</li>");
        });
      }).fail(function(xhr, text, error) {
        console.error('failed to get tasks: ' + text + ', ' + error);
      });
