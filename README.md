# Subscriptify

**Subscriptify** is a website designed to track and send notifications for subscription renewals 

## Features

- **User Authentication**: Seamlessly integrated with Devise for secure and adaptable user authentication mechanisms.
- **Responsive Design**: Utilizing Bootstrap ~5.2 for a modern and responsive user interface.
- **Form Management**: Enhanced with Simple Form for streamlined and efficient form handling.
- **Iconography & Typography**: Leveraging Font Awesome for comprehensive iconography and typography options.
- **Data Visualization**: Employs Chartkick and Groupdate for real-time, dynamic charts and efficient data grouping.
- **Email Operations**: With the Resend gem for streamlined email processing.
- **Report Generation**: Utilizing Caxlsx and Caxlsx_rails for Excel reports, and Wicked PDF for PDF generation.
- **Background Job Processing**: Powered by Sidekiq for efficient background job management.

## Getting Started

### Prerequisites

Before you begin, ensure you have installed:

- Ruby on Rails
- PostgreSQL
- Node.js and Yarn (for Webpacker dependencies)
- Redis (required for Sidekiq)

### Installation Steps

1. **Clone the Repository**
git clone https://github.com/fernandocampo/subscriptify.git

2. **Navigate to the Project Directory**
cd subscriptify

3. **Install Dependencies**
First, install the Ruby gems specified in the Gemfile:
bundle install

4. **Setup the Database**
Create and migrate the database:
rails db:create db:migrate

5. **Start the Rails Server**
Start the Rails application:
rails server

6. **Launch Sidekiq in a New Terminal**
For background processing, start Sidekiq in a new terminal window:
sidekiq


### Usage

Navigate to http://localhost:3000 to view the application. Use the provided routes for user authentication, data visualization, report generation, and more.

## Authors

- [@Antonioedwardsd](https://github.com/Antonioedwardsd)
- [@dacardoso10](https://www.github.com/dacardoso10)
- [@fernandocampo](https://www.github.com/fernandocampo)
