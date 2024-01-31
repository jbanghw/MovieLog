class MovieRecord < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :movie_id, presence: true
  validates :title, presence: true
  validates_uniqueness_of :user, scope: :movie_id
end
