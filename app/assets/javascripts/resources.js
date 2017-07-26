function Resource(attributes) {
  this.id = attributes.id
  this.title = attributes.title
  this.url = attributes.url
  this.description = attributes.description
  this.user_id = attributes.user_id
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
