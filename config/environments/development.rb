require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Define la URL base para los enlaces dentro de los correos electrónicos.
  # Esto es crucial para los correos de confirmación de Devise y otros correos del sistema.
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # Configura el método de entrega a :smtp para utilizar un servidor SMTP.

  # config.action_mailer.delivery_method = :smtp

  # Configura los detalles específicos para conectarse al servidor SMTP de MailCatcher.
  config.action_mailer.smtp_settings = {
    address: 'localhost',
    port: 1025
  }

  # Establece true para ver errores de entrega de correo electrónico en el entorno de desarrollo.
  # config.action_mailer.raise_delivery_errors = true

  # A continuación, se presentan configuraciones generales para el entorno de desarrollo:

  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :resend

  # Configura la recarga de código en cada solicitud. Esto ralentiza la respuesta pero es perfecto para desarrollo.
  config.enable_reloading = true

  # No precargar código al iniciar.
  config.eager_load = false

  # Muestra informes completos de error.
  config.consider_all_requests_local = true

  # Habilita el cronometraje del servidor.
  config.server_timing = true

  # Habilitar/deshabilitar la caché. Por defecto, la caché está deshabilitada.
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      "Cache-Control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # Guardar archivos subidos en el sistema de archivos local (configura opciones en config/storage.yml).
  config.active_storage.service = :cloudinary

  # No preocuparse si el mailer no puede enviar.
  config.action_mailer.perform_caching = false

  # Imprimir avisos de deprecación al logger de Rails.
  config.active_support.deprecation = :log

  # Elevar excepciones para deprecaciones no permitidas.
  config.active_support.disallowed_deprecation = :raise

  # Informar a Active Support qué mensajes de deprecación no permitir.
  config.active_support.disallowed_deprecation_warnings = []

  # Elevar un error en la carga de página si hay migraciones pendientes.
  config.active_record.migration_error = :page_load

  # Resaltar código que desencadenó consultas a la base de datos en los logs.
  config.active_record.verbose_query_logs = true

  # Resaltar en los logs el código que encoló trabajos en segundo plano.
  config.active_job.verbose_enqueue_logs = true

  # Suprimir salida del logger para solicitudes de activos.
  config.assets.quiet = true

  # Elevar un error cuando una before_action's only/except options hace referencia a acciones faltantes.
  config.action_controller.raise_on_missing_callback_actions = true

  # Configuraciones adicionales pueden ir aquí.

  # Por ejemplo, para deshabilitar la protección de falsificación de solicitud en Action Cable:
  # config.action_cable.disable_request_forgery_protection = true
end
