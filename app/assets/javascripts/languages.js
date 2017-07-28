function Language(attributes) {
  this.name = attributes.name
  this.description = attributes.description
}

Language.renderLink = function (language) {
  return `<a class="lang lang-links" href="/languages/${language.id}">${language.name}</a>`
}

$(function () {
  $("li").on("click", ".js-next", function (e) {
    e.preventDefault()
    var nextId = parseInt(e.currentTarget.dataset.id, 10)
    console.log(nextId)
    $.get(`/languages/${nextId}`, function (json) {
      history.pushState(json, `${json.name}`, `/languages/${json.id}`)
      $(".language-name").text(json.name)
      $(".language-description").text(json.description)
      var resources = json.resources.map(function (resource) {
        return new Resource(resource)
      })
      $("#resource_list").empty()
      resources.forEach(Resource.renderLI)
      var newButton = `<form class="button_to" method="post" action="/languages/${json.id}">
      <input type="hidden" name="_method" value="delete">
      <input class="btn btn-default btn-space" type="submit" value="Delete ${json.name}">`
      $(".col-md-2").html(newButton)

    }, "json").error(function (response) {
      console.log("Something went wrong...")
    })
  })
})







// $(".js-next").on("click", function (e) {
//   e.preventDefault()
//   var nextID = parseInt($(".js-next").data("id"))
//   $.get(`/languages/${nextID}`, function (json) {
//     history.pushState(json, `${json.name}`, `/languages/${json.id}`)
//     $(".language-name").text(json["name"])
//     $(".language-description").text(json["description"])
//     $(".js-next").data("id", parseInt(window.location.href.charAt(window.location.href.length - 1), 10) + 1)
//   }, "json").error(function (response) {
//     console.log("You broke it...", response)
//   })
// })
