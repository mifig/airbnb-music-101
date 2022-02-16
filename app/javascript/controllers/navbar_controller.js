import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "linklogo" ]

  updateNavbar() {
    if (window.scrollY >= 400) {
      this.element.classList.add("filtered-background")

      this.linklogoTargets.forEach((linklogo) => {
        linklogo.classList.add("scrolled-links")
      })
    } else {
      this.element.classList.remove("filtered-background")

      this.linklogoTargets.forEach((linklogo) => {
        linklogo.classList.remove("scrolled-links")
      })
    }
  }
}