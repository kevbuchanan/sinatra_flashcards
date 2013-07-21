$(document).ready(function() {
  $('#add-card').on('submit', function(event){
    event.preventDefault();
    event.stopPropagation();
    var url = $(this).attr('action');
    $(this).hide();
    $.get(url, function(data){
      $('#create-deck').append(data);
    });
  });

  $('#create-deck').on('submit', 'form', function(event){
    event.preventDefault();
    event.stopPropagation();
    var url = $(this).attr('action');
    var data = $(this).serialize();
    $.post(url, data, function(response){
      $('#new_cards').prepend(response);
    });
    $(this).remove();
    $('#add-card').show();
  });
});
