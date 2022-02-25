import {
  Controller
} from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"


export default class extends Controller {
  static targets = ["searchInput", "card_populate", "form"];

  connect() {
    const search_value = this.card_populateTarget
  }

  search(event) {
    // const search_value_text = this.searchInputTarget
    event.preventDefault()
    const submit = this.formTarget
    // submit.submit()
    console.log(this.formTarget.action)



    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }

  populate() {
    const search_value_length = this.searchInputTarget.value.length
    const card = this.searchcard_populate
    if (search_value_length > 0) {
      search_value.insertAdjacentHTML("afterend",
        `<h1>This is the text which has been inserted by JS</h1>`)
    } else {

    }
  }

}
