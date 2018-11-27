class Comment {
  constructor(data) {
    this.content = data.attributes.content
    this.id = parseInt(data.id)
    this.username = data.attributes.user
  }

  appendToDom(contentLine, usernameLine, block) {
    debugger
    $(contentLine).text(this.content);
    $(usernameLine).text(this.username);
    debugger
    $(block).attr("data-id", this.id)
    $(block).addClass("comment")
    $(block).append(contentLine)
    $(block).append(usernameLine)
    $('.js-comment').append(block)
  }
}
