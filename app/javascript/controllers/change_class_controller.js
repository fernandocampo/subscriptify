import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["name", "company", "payment", "category", "firstBtn" ]
  connect() {
  }

  nameEmpty() {
    if (this.nameTarget.value !== "") {
      this.firstBtnTarget.classList.remove("disabled")
    }
  }

  // Hacer la validacion de 1 y 2
  stepOne() {
    this.companyTarget.classList.add("d-none")
    this.paymentTarget.classList.remove("d-none")
  }
  stepTwo() {
    this.paymentTarget.classList.add("d-none")
    this.categoryTarget.classList.remove("d-none")
  }
}
