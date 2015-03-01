$(document).ready(function() {

  // new answer form
  $(".new_answer").on("submit", function(e){
    e.preventDefault();

    var questionId = $(".answer-form").data("question-id");

    var request = $.ajax({
      url:  "/questions/" + questionId + "/answers",
      type: "POST",
      data: $(this).serialize()
    })

    request.done(function(response) {
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

    $(e.target).closest("div").next().show();
    $(e.target).closest(".show-answer-comments").hide();
    $(e.target).closest("div").find(".hide-answer-comments").show();
  })

  $(".hide-answer-comments").on("click", function(e){
    e.preventDefault();

    $(e.target).closest("div").next().hide();
    $(e.target).closest("div").find(".show-answer-comments").show();
    $(e.target).closest(".hide-answer-comments").hide();
  })

});
