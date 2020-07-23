class Todo < ApplicationRecord
  belongs_to :list
  validates :todo, presence: true
end
