import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="habit-update"
export default class extends Controller {
  static targets = ["form"]


  connect() {
  }

  submitForm(e) {
    e.preventDefault()
    console.log("hola")
    fetch(`/habits/${e.target.action}`,
    {
      method: "PATCH",
      headers: {"Accept": "text/plain"},
      body: new FormData(e.target)
    }).then(response => response.text())
    .then(data => console.log(data))
  
  }

  update(e) {
    e.target.form.submit()
  }

}
