function Comment(attributes) {
  this.id = attributes.id
  this.content = attributes.content
  this.resource_id = attributes.resource_id
  this.user = new User(attributes.user)
}

Comment.ready = function () {
  Comment.assignListeners()
}

Comment.assignListeners = function () {
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
  return `
  <li id="comment-${this.id}"><a href="/users/${this.user.id}/resources">@${this.user.username}</a>: ${this.content}
  - <a href="/comments/${this.id}/edit">Edit</a>
    <form class="button_to" method="post" action="/comments/${this.id}">
      <input type="hidden" name="_method" value="delete">
      <input class="destroy" type="submit" value="x">
    </form>
  </li>
  `
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

$(function () {
  Comment.ready()
})
