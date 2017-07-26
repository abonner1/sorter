function Comment(attributes) {
  this.id = attributes.id
  this.content = attributes.content
  this.user_id = attributes.user_id
  this.resource_id = attributes.resource_id
}

Comment.ready = function () {
  Comment.templateSource = $("#comment-template").html()
  Comment.template = Handlebars.compile(Comment.templateSource)
  Comment.assignListeners()
}

Comment.assignListeners = function functionName() {
  Comment.newCommentListener()
  Comment.destroyCommentListener()
}

Comment.newCommentListener = function () {
  $("form#new_comment").on("submit", Comment.newFormSubmit)
}

Comment.destroyCommentListener = function () {
  $("ul.comments-list").on("click", "input.destroy", Comment.deleteFormSubmit)
}

Comment.newFormSubmit = function (e) {
  e.preventDefault()
  var $form = $(this)
  var action = $form.attr("action")
  var params = $form.serialize()

  $.post(action, params, Comment.success, "json")
  .error(Comment.error)
}

Comment.success = function (json) {
  var comment = new Comment(json)
  var commentLI = comment.renderLI()

  $("ul.comments-list").append(commentLI)
  $("form#new_comment")[0].reset()
}

Comment.prototype.renderLI = function () {
  return Comment.template(this)
};

Comment.error = function (response) {
  console.log("You broke it!", response)
}

Comment.deleteFormSubmit = function (e) {
  e.preventDefault()
  var $form = $(this).parent("form")
  var action = $form.attr("action")
  var params = $form.serialize()

  $.ajax({
    url: action,
    data: params,
    dataType: "json",
    method: "DELETE"
  })
  .success(Comment.destroyComment)
}

Comment.destroyComment = function (json) {
  var comment = new Comment(json)
  comment.destroy()
}

Comment.prototype.destroy = function () {
  this.$li().remove()
}

Comment.prototype.$li = function () {
  return $(`li#comment-${this.id}`)
}

document.addEventListener("turbolinks:load", function(event) {
  Comment.ready()
});
