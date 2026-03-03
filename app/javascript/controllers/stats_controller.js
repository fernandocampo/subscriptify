import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    if (!window.Chartkick) return

    // Re-register Chart.js adapter (needed after Turbo navigation)
    if (window.Chart) {
      window.Chartkick.addAdapter(window.Chart)
    }

    // Re-render any charts already registered (handles Turbo cache restoration)
    window.Chartkick.eachChart(chart => {
      chart.setData(chart.dataSource, chart.opts)
    })
  }
}
