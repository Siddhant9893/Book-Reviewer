class Book < ApplicationRecord
    validates :title, :author, :description, presence: true
    has_many :reviews, dependent: :destroy
    belongs_to :user
end
