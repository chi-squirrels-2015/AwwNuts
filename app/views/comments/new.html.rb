<%= form_for @comment do |f| %>
  <div class="form-group">
    <%= f.label :content %>
    <%= f.text_area :content %>
  </div>
<% end %>
