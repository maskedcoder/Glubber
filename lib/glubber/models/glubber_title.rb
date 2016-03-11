class GlubberTitle
  include DataMapper::Resource

  property :id,         Serial
  property :title,      String
end

# Always register the model
$modelRegistry.push GlubberTitle
