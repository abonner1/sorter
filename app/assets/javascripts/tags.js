function Tag(attributes) {
  this.id = attributes.id
  this.name = attributes.name
}

Tag.renderLink = function (tag) {
  return `<a href="/tags/${tag.id}">${tag.name}</a>`
}
