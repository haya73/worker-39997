class Comment < ApplicationRecord
  belongs_to :worker
  belongs_to :user 

  validates :content,       presence: true
  validates :content_title, presence: true
end
