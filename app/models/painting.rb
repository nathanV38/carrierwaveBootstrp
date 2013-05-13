class Painting < ActiveRecord::Base
  attr_accessible :gallery_id, :name, :image, :remote_image_url, :crop_x, :crop_y,:crop_w, :crop_h
  belongs_to :gallery
  mount_uploader :image, ImageUploader
  
  attr_accessor :crop_x, :crop_y,:crop_w, :crop_h
  after_update :crop_painting
  
  def crop_painting
	image.recreate_versions! if crop_x.present?
  end
end
