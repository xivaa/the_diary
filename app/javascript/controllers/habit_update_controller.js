import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="habit-update"
export default class extends Controller {
  static targets = ["form"]


  connect() {
  }

  submitForm(e) {
    e.preventDefault()

    fetch(`/habits/${e.target.action}`,
    {
      method: "PATCH",
      headers: {"Accept": "text/plain"},
      body: new FormData(e.target)
    }).then(response => response.text())
    .then(data => console.log(data))
  }

  update(e) {
    e.preventDefault()
    e.target.form.submit()
  }

}
