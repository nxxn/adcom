class Testimonial < ActiveRecord::Base

  has_attached_file :client_image,
                    :styles => { :medium => "400x400#" }

  validates_attachment_content_type :client_image, :content_type => /\Aimage\/.*\Z/

end
