class Shelf < ApplicationRecord
  enum type: [:wishlist, :bought, :reading, :done]
  belongs_to :user
  belongs_to :book
  
  scope :by_user, -> { where(user_id: @current_user)}
end
