# frozen_string_literal: true

SimpleForm.setup do |config|
  config.button_class = "inline-flex items-center px-4 py-2 bg-indigo-600 text-white text-sm font-medium rounded-lg hover:bg-indigo-700 transition"

  config.boolean_label_class = "ml-2 text-sm text-slate-700"

  config.label_text = lambda { |label, required, explicit_label| "#{label} #{required}" }

  config.boolean_style = :inline

  config.item_wrapper_tag = :div

  config.include_default_input_wrapper_class = false

  config.error_notification_class = "mb-4 rounded-lg bg-red-50 border border-red-200 p-3 text-sm text-red-700"

  config.error_method = :to_sentence

  config.input_field_error_class = "border-red-400 focus:ring-red-500"
  config.input_field_valid_class = "border-green-400"

  # default wrapper
  config.wrappers :tailwind, class: "mb-4" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "block text-sm font-medium text-slate-700 mb-1"
    b.use :input,
          class: "block w-full rounded-lg border border-slate-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500",
          error_class: "border-red-400 focus:ring-red-500",
          valid_class: "border-green-400"
    b.use :full_error, wrap_with: { class: "text-red-600 text-xs mt-1" }
    b.use :hint, wrap_with: { class: "text-slate-500 text-xs mt-1" }
  end

  # boolean (checkbox)
  config.wrappers :tailwind_boolean, tag: "div", class: "mb-4 flex items-center" do |b|
    b.use :html5
    b.optional :readonly
    b.use :input,
          class: "h-4 w-4 rounded border-slate-300 text-indigo-600 focus:ring-indigo-500",
          error_class: "border-red-400",
          valid_class: "border-green-400"
    b.use :label, class: "ml-2 text-sm text-slate-700"
    b.use :full_error, wrap_with: { class: "text-red-600 text-xs mt-1" }
    b.use :hint, wrap_with: { class: "text-slate-500 text-xs mt-1" }
  end

  # select input
  config.wrappers :tailwind_select, class: "mb-4" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: "block text-sm font-medium text-slate-700 mb-1"
    b.use :input,
          class: "block w-full rounded-lg border border-slate-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 bg-white",
          error_class: "border-red-400 focus:ring-red-500",
          valid_class: "border-green-400"
    b.use :full_error, wrap_with: { class: "text-red-600 text-xs mt-1" }
    b.use :hint, wrap_with: { class: "text-slate-500 text-xs mt-1" }
  end

  # file input
  config.wrappers :tailwind_file, class: "mb-4" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: "block text-sm font-medium text-slate-700 mb-1"
    b.use :input,
          class: "block w-full text-sm text-slate-700 file:mr-3 file:py-2 file:px-3 file:rounded-lg file:border-0 file:text-sm file:font-medium file:bg-indigo-50 file:text-indigo-700 hover:file:bg-indigo-100",
          error_class: "border-red-400",
          valid_class: "border-green-400"
    b.use :full_error, wrap_with: { class: "text-red-600 text-xs mt-1" }
    b.use :hint, wrap_with: { class: "text-slate-500 text-xs mt-1" }
  end

  config.default_wrapper = :tailwind

  config.wrapper_mappings = {
    boolean:       :tailwind_boolean,
    check_boxes:   :tailwind,
    date:          :tailwind,
    datetime:      :tailwind,
    file:          :tailwind_file,
    radio_buttons: :tailwind,
    select:        :tailwind_select,
    time:          :tailwind
  }
end
