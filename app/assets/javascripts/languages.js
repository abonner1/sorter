function Language(attributes) {
  this.id = attributes.id
  this.name = attributes.name
  this.description = attributes.description
  this.resources = []
}

Language.renderLink = function (language) {
  return `<a class="lang lang-links js-next" data-id="${language.id}" href="/languages/${language.id}">${language.name}</a>`
}

Language.attachListener = function () {
  $(document).on("click", ".js-next", Language.dynamicNav)
}

Language.dynamicNav = function (e) {
  var nextId = parseInt(e.currentTarget.dataset.id, 10)

  e.preventDefault()

  $.get(`/languages/${nextId}`, Language.parseJSON, "json").error(function (response) {
    console.log("Something went wrong...")
  })
}

Language.parseJSON = function (json) {
  var language = new Language(json)

  Language.updateURL(json)

  language.resources = json.resources.map(function (resource) {
    return new Resource(resource)
  })

  json.resources.forEach(function (resource, i) {
    var tags = resource.tags.map(function (tag) {
      return new Tag(tag)
    })
    var languages = resource.languages.map(function (language) {
      return new Language(language)
    })

    language.resources[i].tags = tags
    language.resources[i].languages = languages
  })

  language.updateContent()
}

Language.updateURL = function (object) {
  history.pushState(object, `${object.name}`, `/languages/${object.id}`)
}

Language.prototype.updateContent = function () {
  this.populateName()
  this.populateDescription()

  $("#resource_list").empty()

  this.resources.forEach(Resource.renderLI)

  this.changeButton()
}

Language.prototype.populateName = function () {
  $(".language-name").text(this.name)
}

Language.prototype.populateDescription = function () {
  $(".language-description").text(this.description)
}

Language.prototype.changeButton = function () {
  var newButton = this.button()

  $(".col-md-2").html(newButton)
}

Language.prototype.button = function () {
  return `<form class="button_to" method="post" action="/languages/${this.id}">
  <input type="hidden" name="_method" value="delete">
  <input class="btn btn-default btn-space" type="submit" value="Delete ${this.name}">`
}

// $(() => Language.attachListener())
