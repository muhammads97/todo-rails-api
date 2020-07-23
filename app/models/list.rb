class List < ApplicationRecord
  belongs_to :user
  has_many :Todo
  validates :name, presence: true
end
