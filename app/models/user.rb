class User < ApplicationRecord
  has_secure_password
  has_many :movie_records

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
end
