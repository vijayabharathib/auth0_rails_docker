class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  has_many :shelves, dependent: :destroy
  scope :by_user, ->(user) { where(user_id: user.id)}
end
