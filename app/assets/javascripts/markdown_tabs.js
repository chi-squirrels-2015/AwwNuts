$(document).ready(function() {

  $('.nav-tabs').on('click', 'li', function(e){
    e.preventDefault;
    $('.nav-tabs li').removeClass();
    $(e.target).closest('li').addClass("active");
    $('h1.preview').empty().show();
    $('h1.preview').append($('#question_title').val())

    request = $.ajax({
      url: '/questions/temp',
      type: 'POST',
      data: {content: $('#question_content').val()},
    })
    .done(function(response) {
      console.log("success");
      console.log(response)
      $('p.preview').empty().show();
      $('p.preview').append(response);
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });

    var whichOne = e.target.text.toLowerCase();
    $('.question').hide();
    $('.' + whichOne).show();
  });
});
