import { Controller } from "@hotwired/stimulus";

const CHANGE_DELAY = 300;
const INPUT_DELAY = 1000;

// Connects to data-controller="form"
export default class extends Controller {
  #submitTimeout;

  #submit(delay) {
    clearTimeout(this.#submitTimeout);
    this.#submitTimeout = setTimeout(() => {
      if (this.element.checkValidity()) {
        this.element.requestSubmit();

        const url = new URL(window.location.href);
        const params = new URLSearchParams(new FormData(this.element));
        url.search = params.toString();
        history.replaceState({}, "", url);
      }
    }, delay);
  }

  change() {
    this.#submit(CHANGE_DELAY);
  }
  input() {
    this.#submit(INPUT_DELAY);
  }
}
