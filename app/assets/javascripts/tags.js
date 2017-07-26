function Tag(attributes) {
  this.id = attributes.id
  this.name = attributes.name
}

Tag.renderLI = function (tag) {
  return `<li><a href="/tags/${tag.id}">${tag.name}</a></li>`
}
