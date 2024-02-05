class MovieRecord < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :movie_id, presence: true
  validates :title, presence: true
  validates_uniqueness_of :user, scope: :movie_id

  def self.my_movies
    return MovieRecord.where('user_id =?', Current.user)
  end
end
