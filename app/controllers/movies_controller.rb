require 'uri'
require 'net/http'
require 'json'

class MoviesController < ApplicationController
  def popular
    uri = URI('https://tv-api.com/en/API/MostPopularMovies/' + ENV["apiKey"])
    res = Net::HTTP::get_response(uri)
    @movies = JSON.parse(res.body)['items'].first(10) if res.is_a?(Net::HTTPSuccess)
  end

  def detail
    uri = URI('https://tv-api.com/en/API/Title/' + ENV['apiKey'] + '/' + params[:id])
    res = Net::HTTP::get_response(uri)
    @movie = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
  end
end
