import CommentControllerBase from './comment_controller_base'

export default class extends CommentControllerBase {

  static targets = ['errors']

  onCommentSuccess(event) {
    const [,, xhr] = event.detail
    const $newComment = stringToHtml(xhr.response)
    this.element.parentNode.insertBefore($newComment, this.element.nextSibling)
    this.$form().reset()
    if (this.hasErrorsTarget) {
      this.errorsTarget.remove()
    }
  }

  $form() {
    return this.element.querySelector('form')
  }
}
