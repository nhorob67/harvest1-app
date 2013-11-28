class Recommend < ActiveRecord::Base
  attr_accessible :title_of_news_piece,:date,:content,:document,:recommended_id

  has_attached_file :document
  validates_attachment_content_type :document, :content_type => [ 'application/pdf','text/plain','audio/mp3','audio/mpeg','image/png','image/jpeg']
  belongs_to :user
end