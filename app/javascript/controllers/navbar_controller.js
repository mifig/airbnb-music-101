import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["linklogo", "navlinks", "avatarmenu"]

  connect() {
    if (window.innerWidth < 900) {
      this.navlinksTargets.forEach((navlink) => {
        navlink.classList.add("d-none")
      })
    }
  }

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

  avatarMenu() {
    console.log(this.avatarmenuTarget)
    if (this.avatarmenuTarget.classList.contains("hide")) {
      this.avatarmenuTarget.classList.remove("hide")
    } else {
      this.avatarmenuTarget.classList.add("hide")
    }
  }

  closeMenu() {
    this.avatarmenuTarget.classList.add("hide")
  }
}