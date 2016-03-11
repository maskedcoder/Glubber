class GlubberTitle
  include DataMapper::Resource

  property :id,           Serial
  property :title,        String, :length => 6..200

  def render_form(name, description)
    id = name.gsub(' ', '-')
    html = "<label for=\"#{id}\">#{name}</label>" \
           "<input type=\"text\" name=\"#{id}\" id=\"#{id}\" maxlength=\"200\">"

    if description
      html += "<p>#{description}</p>"
    end
  end
end

# Always register the model
$MODEL_REGISTRY.push GlubberTitle
