class WeatherSamara < ApplicationRecord
  include HTTParty

  #Samara
  base_uri "http://dataservice.accuweather.com/currentconditions/v1/290396/historical/24?apikey=JE3RW8gV34wyeX7VWT9DZlv9YerZdtql&language=ru"
  format :json

  #call the api with HTTParty and parse the JSON response
  def self.call
    response = HTTParty.get(base_uri)
    @body = JSON.parse(response.body)
  end

  def self.historical
    @historical =
      @body.map do |element|
        Hash[time: element["LocalObservationDateTime"],
             temp: element["Temperature"]]
      end
  end




end
