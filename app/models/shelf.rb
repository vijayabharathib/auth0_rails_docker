class Shelf < ApplicationRecord
  enum place: [:wishlist, :bought, :reading, :done]
  belongs_to :user
  belongs_to :book
  
  scope :by_user, ->(user) { where(user_id: user)}
  
end
