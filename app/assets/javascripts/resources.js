function Resource(attributes) {
  this.id = attributes.id
  this.title = attributes.title
  this.url = attributes.url
  this.description = attributes.description
  this.user_id = attributes.user_id
  this.tags = attributes.tags
  this.languages = attributes.languages
}

Resource.ready = function () {
  Resource.assignListeners()
}

Resource.assignListeners = function () {
  Resource.yourResourcesListener()
}

Resource.yourResourcesListener = function () {
  $("a#js_resources").one("click", Resource.getResourcesAPI)
}

Resource.getResourcesAPI = function (e) {
  var $id = $(this).data("id")
  e.preventDefault()
  $.get(`/users/${$id}/resources`, Resource.success, "json").error(Resource.error)
}

Resource.success = function (json) {
  var resources = json.map(function (resource) {
    return new Resource(resource)
  })
  var $ul = $("#resource_list").empty()

  resources.forEach(Resource.renderLI)
}

Resource.renderLI = function (resource) {
  var li = resource.formatListItems()
  $("#resource_list").append(li)
}

Resource.prototype.formatListItems = function () {
  return `
  <li>
    <a class="resource resource-links" href="/resources/${this.id}" >${this.title}</a>
    <a class="glyphicon glyphicon-link" href="${this.url}"></a>
    (${this.languages.map(Language.renderLink).join(", ")}) -
    ${this.tags.map(Tag.renderLink).join(" / ")}
    <hr>
  </li>`
};

Resource.error = function (response) {
  console.log("You broke it!", response)
}

$(function () {
  Resource.ready()
})
