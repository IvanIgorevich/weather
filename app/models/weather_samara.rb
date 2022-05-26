class WeatherSamara < ApplicationRecord
  include HTTParty

  #Samara
  base_uri "http://dataservice.accuweather.com/currentconditions/v1/290396/historical/24?apikey=JE3RW8gV34wyeX7VWT9DZlv9YerZdtql&language=ru"
  format :json

  #call the api with HTTParty and parse the JSON response
  def self.call
    response = HTTParty.get(base_uri)
    body = JSON.parse(response.body)
    @historical =
      body.map do |element|
        Hash[time: element["LocalObservationDateTime"],
             temp: element["Temperature"]]
      end
  end

  def self.by_time(timestamp)

    # @historical.each do |hash|
    #
    # end
  end

  def self.historical
    @historical
  end

  def self.historical_max
    @historical.map { |el| el[:temp]["Metric"]["Value"] }.max
  end

  def self.historical_min
    @historical.map { |el| el[:temp]["Metric"]["Value"] }.min
  end

  def self.current
    @historical[0]
  end

  def self.historical_avg
    (@historical.map { |el| el[:temp]["Metric"]["Value"] }.reduce(:+).to_f / @historical.size).round(1)
  end


end
