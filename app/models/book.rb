class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  has_many :shelves, dependent: :destroy
end
