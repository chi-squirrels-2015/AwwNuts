$(document).ready(function() {
  $(".upvote").bind("ajax:success", function(e, data, status, xhr) {
    $(this).closest(".stat").find(".vote_count").html(data.vote_count);
    console.log(data.vote_count);
  });

  $(".upvote").bind("ajax:error", function(e, xhr, status, error) {
    alert("Sorry, unable to save your vote.");
  });

  $(".downvote").bind("ajax:success", function(e, data, status, xhr) {
    $(this).closest(".stat").find(".vote_count").html(data.vote_count);
    console.log(data.vote_count);
  });

  $(".downvote").bind("ajax:error", function(e, xhr, status, error) {
    alert("Sorry, unable to save your vote.");
  });
});