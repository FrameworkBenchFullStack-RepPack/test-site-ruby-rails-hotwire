import { Controller } from "@hotwired/stimulus";

const CHANGE_DELAY = 300;
const INPUT_DELAY = 1000;

// Connects to data-controller="form"
export default class extends Controller {
  #submitTimeout;

  #submit(delay) {
    clearTimeout(this.#submitTimeout);
    this.#submitTimeout = setTimeout(() => {
      this.element.requestSubmit();
    }, delay);
  }

  change() {
    this.#submit(CHANGE_DELAY);
  }
  input() {
    this.#submit(INPUT_DELAY);
  }
}
