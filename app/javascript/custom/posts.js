$(document).on('turbolinks:load', function() {
$(function() {
  $("#post-comment").on("click", function(){
    $("#myTextarea").focus();

  });
  $(".post-like").on("click", function(){
    console.log("hej!");
    var post_id = $(this).data("id");
    $.ajax({
      url: "/post/like/"+post_id,
      method: "GET",})
      .done(function(response) {
        console.log(response);
      });
    })
  });
  })
