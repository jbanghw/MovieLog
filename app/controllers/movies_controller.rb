require 'uri'
require 'net/http'
require 'json'

class MoviesController < ApplicationController
  def popular
    uri = URI('https://tv-api.com/en/API/MostPopularMovies/' + ENV["apiKey"])
    res = Net::HTTP::get_response(uri)
    @movies = JSON.parse(res.body)['items'].first(10) if res.is_a?(Net::HTTPSuccess)
  end
end
