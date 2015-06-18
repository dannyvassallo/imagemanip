class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  include ::CarrierWave::Backgrounder::Delay

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
      source = source.resize_to_fill(640, 539)
      text = Magick::Draw.new
      text.font_family = 'helvetica'
      text.pointsize = 52
      text.gravity = Magick::CenterGravity
      text.annotate(source, 0,0,2,2, "#{model.text}") {
        self.fill = 'black'
      }
      text.annotate(source, 0,0,-1.5,-1.5, "#{model.text}") {
        self.fill = 'black'
      }
      text.annotate(source, 0,0,0,0, "#{model.text}") {
        self.fill = 'white'
      }
      source
    end
  end
end
