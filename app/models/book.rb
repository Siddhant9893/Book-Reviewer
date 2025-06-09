class Book < ApplicationRecord
    validates :title, :author, :description, presence: true
    has_many :reviews, dependent: :destroy
    belongs_to :user
    has_many :permissions, dependent: :destroy
    has_one_attached :pdf
    has_one_attached :image
    validates :pdf, presence: true
    validates :image, presence: true
end
