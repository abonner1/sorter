function Comments(comment) {
  this.content = comment.content
  this.user_id = comment.user_id
  this.resource_id = comment.resource_id
}

$(document).on("submit", "form#new_comment", function (e) {
  e.preventDefault()
  var $form = $(this)
  var action = $form.attr("action")
  var params = $form.serialize()

  $.post(action, params, function (json) {
    console.log(json)
  }, "json")
  .error(function (response) {
    console.log("You broke it!", response)
  })
})
