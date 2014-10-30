$(document).ready(function() {
  $('.form-show').click(function() {
    $('.hidden-form').show();
    return false;
  });
  $('.form-hide').click(function() {
    $('.hidden-form').hide();
    return false;
  });

  $('#new_rent').on('ajax:success', function(event, data, status, xhr) {
    $('#table-wrapper').html(data);
  });

  $('#new_rent').on('submit', function(event) {
    var $this = $(this);

    $('#table-wrapper').append('<h3>wysyłanie ... </h3>');

    $.ajax({
      url: $this.attr('action'),
      type: 'POST',
      data: $this.serialize(),
      success: function(data, status, xhr) {
        $('#table-wrapper').html(data);
      }
      // error: function(xhr, status, errormessage) {
      //   $('#table-wrapper').html(errormessage);
      // }
    });

    event.preventDefault();
  });

// event delegation: #table-wrapper remains
  $('#table-wrapper').on('ajax:success', 'a[data-method="delete"]', function(event, data, status, xhr) {
    $('#table-wrapper').html(data);
  });

});


