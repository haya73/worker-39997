class Worker < ApplicationRecord
  belongs_to :user
  #has_many :comments, dependent: :destroy

  validates :title,       presence: true
  validates :catch_copy,  presence: true
  validates :pt_name,     presence: true
  #validates :image,       presence: true
end
