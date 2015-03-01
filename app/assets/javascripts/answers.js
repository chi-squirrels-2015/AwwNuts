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

});
