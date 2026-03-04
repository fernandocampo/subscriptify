# Subscriptify

**Subscriptify** is a subscription tracking application that sends renewal notifications.
https://subscriptify.me

## Features

- **User Authentication**: Devise for secure, extensible authentication.
- **UI Design**: Tailwind CSS with a Zinc/Dark Mode design system and Heroicons for iconography.
- **Reactivity**: Hotwire (Turbo 8 + Stimulus) for seamless, page-reload-free interactions. Smart subscription forms with zero-friction UX driven by Stimulus controllers.
- **Form Management**: Simple Form for clean and efficient form handling.
- **Data Visualization**: Chartkick and Groupdate for dynamic charts and data grouping.
- **Email**: Resend gem for transactional email delivery.
- **Report Generation**: Caxlsx/Caxlsx_rails for Excel exports, Wicked PDF for PDF generation.
- **Background Processing**: Solid Queue, the native Rails 8 background job backend.

## Getting Started

### Prerequisites

- Ruby 3.3+
- PostgreSQL

### Installation

1. **Clone the repository**
   ```
   git clone https://github.com/fernandocampo/subscriptify.git
   cd subscriptify
   ```

2. **Install dependencies**
   ```
   bundle install
   ```

3. **Set up the database**
   ```
   rails db:prepare
   ```

4. **Start the development server**
   ```
   bin/dev
   ```

### Usage

Navigate to http://localhost:3000. `bin/dev` starts the Rails server and all background processes in a single command.

## Authors

- [@Antonioedwardsd](https://github.com/Antonioedwardsd)
- [@dacardoso10](https://www.github.com/dacardoso10)
- [@fernandocampo](https://www.github.com/fernandocampo)
