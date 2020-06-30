class Book < ApplicationRecord
    has_many :users
    has_many :reviews
    has_many :users, through: :reviews
end
