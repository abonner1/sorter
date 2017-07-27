function Language(language) {
  this.name = language.name
  this.description = language.description
}

Language.renderLink = function (language) {
  return `<a class="lang lang-links" href="/languages/${language.id}">${language.name}</a>`
}
