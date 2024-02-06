class MovieRecord < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :movie_id, presence: true
  validates :title, presence: true
  validates_uniqueness_of :user, scope: :movie_id

  # Pagination
  paginates_per 10

  def self.my_movies(filter, order, title)
    movies = MovieRecord.where('user_id = ?', Current.user)

    if title
      movies = movies.where('title LIKE ?', '%' + title + '%')
    end

    if filter == 'watched'
      movies = movies.where('watched = ?', true)
    elsif filter == 'unwatched'
      movies = movies.where('watched = ?', false)
    end

    if order == 'asc'
      movies = movies.order('created_at ASC')
    elsif order == 'desc'
      movies = movies.order('created_at DESC')
    end

    return movies
  end
end
