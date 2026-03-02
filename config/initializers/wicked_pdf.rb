# WickedPDF Global Configuration
#
# Use this to set up shared configuration options for your entire application.
# Any of the configuration options shown here can also be applied to single
# models by passing arguments to the `render :pdf` call.
#
# To learn more, check out the README:
#
# https://github.com/mileszs/wicked_pdf/blob/master/README.md

WickedPdf.configure do |config|
  # Path to the wkhtmltopdf executable
  # - En Render: se instala via apt-get en /usr/bin/wkhtmltopdf
  # - En Heroku: usa wkhtmltopdf-heroku gem
  # - En local: usa la gema wkhtmltopdf-binary o instalación del sistema
  if ENV['WKHTMLTOPDF_PATH'].present?
    config.exe_path = ENV['WKHTMLTOPDF_PATH']
  elsif Rails.env.production?
    # Render instala wkhtmltopdf en /usr/bin/
    config.exe_path = '/usr/bin/wkhtmltopdf'
  end

  # Necesario para wkhtmltopdf 0.12.6+ para usar asset helpers de wicked_pdf
  config.enable_local_file_access = true
end
