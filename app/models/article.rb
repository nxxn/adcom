class Article < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title, use: :slugged

  has_attached_file :document
  
  validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  def to_param
    "#{slug}"
  end

end
