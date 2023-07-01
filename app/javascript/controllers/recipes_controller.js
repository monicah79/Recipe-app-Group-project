import { Controller } from '@hotwired/stimulus';
export default class extends Controller {
  toggleRecipePublic(event) {
    const elem = event.target;
    const formElem = elem.closest('form');

    if (formElem) {
      alert('okay');
      formElem.submit();
    }
  }
}
