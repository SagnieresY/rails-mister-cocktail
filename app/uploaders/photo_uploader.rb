class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end
end
