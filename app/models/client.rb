class Client < ActiveRecord::Base

  has_attached_file :work_image

  validates_attachment_content_type :work_image, :content_type => /\Aimage\/.*\Z/

end
