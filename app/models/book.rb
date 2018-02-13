class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  has_many :shelves, dependent: :destroy
  has_many :users, through: :shelves
  scope :by_user, ->(user) { where(user_id: user.id)}
end
