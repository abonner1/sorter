function Comment(attributes) {
  this.id = attributes.id
  this.content = attributes.content
  this.user_id = attributes.user_id
  this.resource_id = attributes.resource_id
}

document.addEventListener("turbolinks:load", function(event) {
  Comment.templateSource = $("#comment-template").html()
  Comment.template = Handlebars.compile(Comment.templateSource)
});

Comment.prototype.renderLI = function () {
  return Comment.template(this)
};

$(document).on("submit", "form#new_comment", function (e) {

  var $form = $(this)
  var action = $form.attr("action")
  var params = $form.serialize()

  $.post(action, params, function (json) {
    var comment = new Comment(json)
    var commentLI = comment.renderLI()

    $("ul.comments-list").append(commentLI)
  }, "json")
  .error(function (response) {
    console.log("You broke it!", response)
  })
  e.preventDefault()
})
