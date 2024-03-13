import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["name", "company", "payment", "category", "firstBtn" ]

  connect() { }

  nameEmpty() {
    if (this.nameTarget.value !== "") {
      this.firstBtnTarget.classList.remove("disabled")
    }
  }

  stepOne() {
    this.companyTarget.classList.add("d-none")
    this.paymentTarget.classList.remove("d-none")
  }

  stepTwo() {
    this.paymentTarget.classList.add("d-none")
    this.categoryTarget.classList.remove("d-none")
  }

  stepBack() { // Función dentro de la clase Controller
    if (this.paymentTarget.classList.contains("d-none")) {
      this.paymentTarget.classList.remove("d-none"); // Quitamos "add"
      this.companyTarget.classList.remove("d-none");
    } else if (this.categoryTarget.classList.contains("d-none")) {
      this.categoryTarget.classList.remove("d-none"); // Quitamos "add"
      this.paymentTarget.classList.remove("d-none");
    }
  }
}
