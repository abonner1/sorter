function Resource(resource) {
  this.id = resource.id
  this.title = resource.title
  this.url = resource.url
  this.description = resource.description
  this.user_id = resource.user_id
}

Resource.getResourcesAPI = function (e) {
  var $id = $(this).data("id")
  e.preventDefault()
  $.get(`/users/${$id}/resources`, Resource.success, "json").error(Resource.error)
}

Resource.success = function (json) {
  var $ul = $("#resource_list").empty()

  var resources = json.map(function (resource) {
    return new Resource(resource)
  })

  resources.forEach(function (resource) {
    var li = resource.formatListItems()
    $ul.append(li)
  })
}

Resource.error = function (response) {
  console.log("You broke it!")
}

Resource.prototype.formatListItems = function () {
  return `<li><a href="/resources/${this.id}">${this.title}</a> - <a href="${this.url}">Link</a></li>`
};

$(document).on("click", "#js_resources", Resource.getResourcesAPI)
