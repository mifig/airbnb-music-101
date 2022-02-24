import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ["reviews", "reviewform"];
  static values = { position: String };

  send(event) {
    event.preventDefault();
  
    const url = this.reviewformTarget.action;

    fetch(url, {
      method: "POST",
      headers: { "Accept": 'application/json', "X-CSRF-Token": csrfToken() },
      body: new FormData(this.reviewformTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.review) {
          this.reviewsTarget.insertAdjacentHTML(this.positionValue, data.review);
        }

        this.reviewformTarget.outerHTML = data.reviewform;
      });

    console.log("Review ajaxed!");
  }
}