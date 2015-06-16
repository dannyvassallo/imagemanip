class Image < ActiveRecord::Base
  mount_uploader :file, FileUploader
  process_in_background :file
end
