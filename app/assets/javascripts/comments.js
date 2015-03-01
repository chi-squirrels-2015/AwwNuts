$(document).ready(function() {

  $(".new_comment").on("submit", function(e){
    e.preventDefault();

    var questionId = $(".new-comment-form-div").data("question-id");
    var answerId = $(".new-comment-form-div").data("answer-id");

    var request = $.ajax({
      url: "/questions/" + questionId + "/answers/" + answerId + "/comments",
      type: "POST",
      data: $(this).serialize()
    });

    request.done(function(response){
      $(".comments").append(response)
    });
  });

  $(".show-add-comment").on("click", function(e){
    e.preventDefault();

    console.log($(e.target).closest("div"))

    $(e.target).closest("div").prev().toggle();
  });


});
