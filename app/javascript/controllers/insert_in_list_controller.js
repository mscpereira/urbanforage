import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ['items', 'form', 'modal', 'closeModal'];
  static values = {
    position: String
  }

  connect() {
  }

  send(event) {
    event.preventDefault();

    fetch(this.formTarget.action,
      {
        method: 'POST',
        headers: {
          'Accept': "application/json",
          'X-CSRF-Token': csrfToken()
        },
        body: new FormData(this.formTarget)
      })
      .then(response =>
        response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.closeModalTarget.click();
          this.itemsTarget.insertAdjacentHTML(
            this.positionValue,
            data.inserted_item
          );
          this.modalTarget.outerHTML = data.modal;
        } else {
          this.formTarget.outerHTML = data.form;
        }
      });
  }
}