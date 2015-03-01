$(document).ready(function() {


  // add new comment to question/answer
  $(".new_comment").on("submit", function(e){
    e.preventDefault();


    var path = $(".new_comment").attr("action")

    var request = $.ajax({
      url: path,
      type: "POST",
      data: $(this).serialize()
    });

    request.done(function(response){
      console.log($(e.target).parent().prev())
      $(e.target).parent("div").prev().append(response)
      $(".new_comment").each(function(){
        this.reset();
      })
    });
  });

  $(".show-add-comment").on("click", function(e){
    e.preventDefault();
    $(e.target).closest("div").prev().toggle();
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
