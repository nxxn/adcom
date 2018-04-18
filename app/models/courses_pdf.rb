class CoursesPdf < ActiveRecord::Base

  has_attached_file :main_pdf

  validates_attachment_content_type :main_pdf, content_type: ['application/pdf']

end
