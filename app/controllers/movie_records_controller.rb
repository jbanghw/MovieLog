class MovieRecordsController < ApplicationController
  def create
    @movie_record = MovieRecord.new
    @movie_record.user = Current.user
    @movie_record.movie_id = params[:movie_id]
    @movie_record.title = params[:title]
    @movie_record.watched = false
    if @movie_record.save
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @movie_record = MovieRecord.find_by(:user => Current.user, :movie_id => params[:movie_id])

    if @movie_record.destroy
      redirect_back(fallback_location: root_path)
    end
  end
end
