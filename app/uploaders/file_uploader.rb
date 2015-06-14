class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:

  # Choose what kind of storage to use for this uploader:
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  
  process :overlay

  def overlay
    manipulate! format: "jpg" do |source|
      overlay_path = Rails.root.join("app/assets/images/homer_overlay.gif")
      overlay = Magick::Image.read(overlay_path).first
      source = source.resize_to_fill(320, 320)
      source.composite!(overlay, 0, 0, Magick::OverCompositeOp)
    end
  end
end