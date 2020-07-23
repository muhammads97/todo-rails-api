class User < ApplicationRecord
    has_secure_password
    has_many :List
    validates :name, presence: true
end
