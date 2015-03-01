$(document).ready(function() {

  // new answer form
  $(".new_answer").on("submit", function(e){
    e.preventDefault();

    var questionId = $(".answer-form").data("question-id")

    var request = $.ajax({
      url:  "/questions/" + questionId + "/answers",
      type: "POST",
      data: $(this).serialize()
    })

    request.done(function(response) {
      console.log(response)
      $("#single-answer").append(response)
      $(".answer-form").hide();
    });
  });


  // hide/show question comments
  $(".show-question-comments").on("click", function(e){
    e.preventDefault();

    $(".question-comments").show();
    $(".show-question-comments").hide();
    $(".hide-question-comments").show();
  })

  $(".hide-question-comments").on("click", function(e){
    e.preventDefault();

    $(".question-comments").hide();
    $(".show-question-comments").show();
    $(".hide-question-comments").hide();
  })


  // hide/show answer comments
  $(".show-answer-comments").on("click", function(e){
    e.preventDefault();

    $(".answer-comments").show();
    $(".show-answer-comments").hide();
    $(".hide-answer-comments").show();
  })

  $(".hide-answer-comments").on("click", function(e){
    e.preventDefault();

    $(".answer-comments").hide();
    $(".show-answer-comments").show();
    $(".hide-answer-comments").hide();
  })

});
