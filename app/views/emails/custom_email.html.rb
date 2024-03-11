<%= form_for :email, url: send_email_path do |f| %>
  <div class="form-group">
    <%= f.label :to, "Para" %>
    <%= f.text_field :to, class: "form-control" %>
  </div>
  <div class="form-group">
    <%= f.label :subject, "Asunto" %>
    <%= f.text_field :subject, class: "form-control" %>
  </div>
  <div class="form-group">
    <%= f.label :body, "Cuerpo del email" %>
    <%= f.text_area :body, class: "form-control" %>
  </div>
  <button type="submit" class="btn btn-primary">Enviar email</button>
<% end %>
