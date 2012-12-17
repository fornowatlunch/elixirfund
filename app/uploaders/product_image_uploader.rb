class ProductImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  
  storage :file
  process :resize_to_limit => [150, 150]
 
  version :thumb do
    process :resize_to_limit => [50, 50]
  end
 
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end

