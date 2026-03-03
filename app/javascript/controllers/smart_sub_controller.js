import { Controller } from "@hotwired/stimulus"

const KNOWN = {
  "netflix":        { category: "Streaming",     price: "15.99" },
  "spotify":        { category: "Entertainment", price: "9.99"  },
  "disney+":        { category: "Streaming",     price: "10.99" },
  "disney":         { category: "Streaming",     price: "10.99" },
  "icloud":         { category: "Services",      price: "0.99"  },
  "apple tv+":      { category: "Streaming",     price: "9.99"  },
  "apple tv":       { category: "Streaming",     price: "9.99"  },
  "youtube premium":{ category: "Streaming",     price: "13.99" },
  "youtube":        { category: "Streaming",     price: "13.99" },
  "hbo max":        { category: "Streaming",     price: "15.99" },
  "hbo":            { category: "Streaming",     price: "15.99" },
  "amazon prime":   { category: "Streaming",     price: "8.99"  },
  "prime video":    { category: "Streaming",     price: "8.99"  },
  "notion":         { category: "Education",     price: "8.00"  },
  "figma":          { category: "Services",      price: "12.00" },
  "github":         { category: "Services",      price: "4.00"  },
  "chatgpt":        { category: "Services",      price: "20.00" },
  "adobe cc":       { category: "Services",      price: "54.99" },
  "adobe":          { category: "Services",      price: "54.99" },
  "dropbox":        { category: "Services",      price: "11.99" },
  "slack":          { category: "Services",      price: "7.25"  },
  "zoom":           { category: "Services",      price: "14.99" },
  "duolingo":       { category: "Education",     price: "6.99"  },
  "linkedin":       { category: "Education",     price: "29.99" },
  "canva":          { category: "Services",      price: "12.99" },
  "1password":      { category: "Services",      price: "2.99"  },
  "nordvpn":        { category: "Services",      price: "3.99"  },
  "microsoft 365":  { category: "Services",      price: "9.99"  },
  "office 365":     { category: "Services",      price: "9.99"  },
  "google one":     { category: "Services",      price: "1.99"  },
}

export default class extends Controller {
  static targets = ["name", "category", "price", "hint"]

  lookup() {
    const val = this.nameTarget.value.trim().toLowerCase()
    const match = KNOWN[val]

    if (match) {
      if (this.categoryTarget.value === "") this.categoryTarget.value = match.category
      if (this.priceTarget.value === "") this.priceTarget.value = match.price
      this.hintTarget.textContent = `Suggested: ${match.category} · $${match.price}`
      this.hintTarget.classList.remove("hidden")
    } else {
      this.hintTarget.classList.add("hidden")
    }
  }
}
