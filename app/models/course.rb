class Course < ActiveRecord::Base

  has_attached_file :icon

  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/

end
