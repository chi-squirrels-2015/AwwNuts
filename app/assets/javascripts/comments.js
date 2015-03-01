$(document).ready(function() {

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


});
