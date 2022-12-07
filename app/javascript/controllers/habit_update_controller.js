import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="habit-update"
export default class extends Controller {
  static values = {
    habitId: "Number"
  }
  connect() {
  }

  update(e) {
    console.log(e.target)
    fetch(`/habits/${this.habitIdValue}`,
    {
      method: "patch"
    })
  }
}
