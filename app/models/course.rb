class Course < ActiveRecord::Base

  has_attached_file :icon

  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/

  has_attached_file :pdf

  validates_attachment_content_type :pdf, content_type: ['application/pdf']

end
