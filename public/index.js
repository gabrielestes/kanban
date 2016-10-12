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
  }).done(function(task) {
    console.log("it works", task);
    addTask(task);
    $('.field').val('');
  });


})

function addTask($task) {
  $('#all-tasks').append(
    "<li class='list-group-item'>" + "<label class='checkbox-inline'><input type='checkbox' value='" + $task.id + "'></label>" + $task.title + " | " + $task.status + " | " + $task.priority + "</li>"
  );
}



$.ajax({
        method: 'GET',
        url: '/api/tasks',
        data: {},
        dataType: 'json'
      }).done(function(tasks) {
        console.log(tasks);

        tasks.forEach(function(task) {
          console.log(task);

          addTask(task)
        });
      }).fail(function(xhr, text, error) {
        console.error('failed to get tasks: ' + text + ', ' + error);
      });

$('#delete-task').on("click",function(){
  var checked = $(".checkbox-inline input[type=checkbox]:checked")

  checked.each(function(i, elem) {
    var id = $(elem).val();

    $.ajax({
              method: 'DELETE',
              url: '/api/tasks/' + id
            }).done(function(){
              console.log("Deleted task")
            }).fail(function(xhr, text, status) {
              console.error('An error occurred while deleting a task', text, status)
            })
  })
});
