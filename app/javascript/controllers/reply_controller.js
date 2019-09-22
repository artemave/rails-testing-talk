import CommentControllerBase from './comment_controller_base'

export default class extends CommentControllerBase {

  static targets = ['replies', 'actions']

  onNewFormSuccess(event) {
    if (this.$form()) {
      return
    }
    const [,, xhr] = event.detail
    const $newForm = stringToHtml(xhr.response)
    this.actionsTarget.appendChild($newForm)
  }

  onCommentSuccess(event) {
    const [,, xhr] = event.detail
    const $newComment = stringToHtml(xhr.response)
    this.repliesTarget.insertBefore($newComment, this.repliesTarget.children[0])
    this.removeForm()
  }

  removeForm(e) {
    if (e) {
      e.preventDefault()
    }
    this.$form().remove()
  }

  $form() {
    return this.actionsTarget.querySelector('form')
  }
}
