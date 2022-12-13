import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="habit-update"
export default class extends Controller {
  static targets = ["form", "box"]


  connect() {
  }

  submitForm(e) {
    e.preventDefault()

    fetch(`/habits/${e.target.action}`,
    {
      body: new FormData(e.target),
      method: "PATCH",
      headers: {"Accept": "text/plain"}
    }).then(response => response.text())
  }

  update(e) {
    e.preventDefault()
    e.target.form.submit()
  }

}
