import { Controller } from "stimulus"

export default class extends Controller {

  onCommentError(event) {
    const [,, xhr] = event.detail
    const $formWithErrors = stringToHtml(xhr.response)
    this.$form().replaceWith($formWithErrors)
  }
}
