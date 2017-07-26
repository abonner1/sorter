function Comment(attributes) {
  this.id = attributes.id
  this.content = attributes.content
  this.user_id = attributes.user_id
  this.resource_id = attributes.resource_id
}

Comment.prototype.renderLI = function () {
  return Comment.template(this)
};

Comment.success = function (json) {
  var comment = new Comment(json)
  var commentLI = comment.renderLI()

  $("ul.comments-list").append(commentLI)
}

Comment.error = function (response) {
  console.log("You broke it!", response)
}

Comment.formSubmit = function (e) {
  e.preventDefault()
  var $form = $(this)
  var action = $form.attr("action")
  var params = $form.serialize()

  $.post(action, params, Comment.success, "json")
  .error(Comment.error)
}

Comment.newCommentListener = function () {
  $("form#new_comment").on("submit", Comment.formSubmit)
}

Comment.destroy = function (json) {
  var comment = new Comment(json)
  comment.destroy()
}

Comment.prototype.$li = function () {
  return $(`li#comment-${this.id}`)
}

Comment.prototype.destroy = function () {
  this.$li().remove()
}

Comment.destroyCommentListener = function () {
  $("input.destroy").on("click", function (e) {
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
    .success(Comment.destroy)
  })
}

Comment.assignListeners = function functionName() {
  Comment.newCommentListener()
  Comment.destroyCommentListener()
}

Comment.ready = function () {
  Comment.templateSource = $("#comment-template").html()
  Comment.template = Handlebars.compile(Comment.templateSource)
  Comment.assignListeners()
}

document.addEventListener("turbolinks:load", function(event) {
  Comment.ready()
});
