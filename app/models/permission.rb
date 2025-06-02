class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :status, inclusion: {in: ['pending','approved','rejected']}
end
