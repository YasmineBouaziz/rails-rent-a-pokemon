import {
  Controller
} from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["searchInput", "card_populate", "submitInput"];

  connect() {
    const search_value = this.card_populateTarget
  }

  search() {
    const search_value_text = this.searchInputTarget
    const submit = this.submitInputTarget
    submit.submit()
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
