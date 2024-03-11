import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

// // Import your controllers
// import ChangeClassController from "./change_class_controller"
// import PageRefreshController from "./page_refresh_controller"

// // Register your controllers
// application.register("change-class", ChangeClassController)
// application.register("page-refresh", PageRefreshController)

export { application }
