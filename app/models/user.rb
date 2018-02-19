class User < ApplicationRecord
    attr_accessor :info
    has_many :shelves, dependent: :destroy
    has_many :books, through: :shelves
end
