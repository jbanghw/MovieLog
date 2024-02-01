require 'uri'
require 'erb'
require 'net/http'
require 'json'

class MoviesController < ApplicationController
  def popular
    uri = URI(ENV['apiAddr'] + 'MostPopularMovies/' + ENV['apiKey'])
    res = Net::HTTP::get_response(uri)
    @movies = JSON.parse(res.body)['items'].first(10) if res.is_a?(Net::HTTPSuccess)
  end

  def detail
    uri = URI(ENV['apiAddr'] + 'Title/' + ENV['apiKey'] + '/' + params[:id])
    res = Net::HTTP::get_response(uri)
    @movie = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
    if not @movie['title']
      render_404
    end
    @added = false
    if Current.user
      @added = MovieRecord.exists?(:user => Current.user, :movie_id => @movie['id'])
    end
  end

  def search
    uri = URI(ENV['apiAddr'] + 'SearchMovie/' + ENV["apiKey"] + '/' + ERB::Util.url_encode(params[:search]))
    res = Net::HTTP::get_response(uri)
    @movies = JSON.parse(res.body)['results'].select{ |movie| movie['image'] != '' }.first(10) if res.is_a?(Net::HTTPSuccess)
  end
end
