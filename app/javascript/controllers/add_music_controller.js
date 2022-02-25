import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["addbtn", "musicform"]

  showForm() {
    this.musicformTarget.classList.remove("d-none")
    this.addbtnTarget.classList.add("d-none")
  }
}