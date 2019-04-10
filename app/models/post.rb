class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 10, maximum: 30 }
  validates :description, presence: true, length: { minimum: 20, maximum: 200 }
  validates :user_id, presence: true
end
