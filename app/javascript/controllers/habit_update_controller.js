import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="habit-update"
export default class extends Controller {
  static targets = ["form"]


  connect() {
  }

  update(e) {
    console.log(e.target.id)
    fetch(`/habits/${e.target.id}`,
    {
      method: "PATCH",
      headers: {"Accept": "text/plain"},
      body: new FormData(this.formTarget)
    }).then(response => response.text())
    }
  }
