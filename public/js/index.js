$.ajax({
  method: 'GET',
  url: 'http://localhost:5432/api/people/1/',
  dataType: 'json'
}).done(function(person) {
  console.log(person);
});
