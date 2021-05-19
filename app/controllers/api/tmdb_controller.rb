class Api::TmdbController < ApplicationController
  require 'httpclient'

  def index
    url = "https://api.themoviedb.org/3/movie/popular"
    client = HTTPClient.new
    query = {
      'api_key' => Settings.tmdb.key,
      'page' => 1,
      'language' => 'ja-JA'
    }
    response = client.get(url,query)
    @movie = JSON.parse(response.body)
  end
end
