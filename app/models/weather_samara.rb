class WeatherSamara < ApplicationRecord
  include HTTParty

  #Samara
  base_uri #"http://dataservice.accuweather.com/currentconditions/v1/290396/historical/24?apikey=%09q6bv0nfQ69WOVYJ6ZEyBW4sP4c4oy586"
  format :json

  #call the api with HTTParty and parse the JSON response
  def self.call
    file = File.new("#{Rails.root}/app/models/hardcode.json", "r:UTF-8")
    content = file.read
    body = JSON.parse(content)
    #@historical =
      body.map do |element|
        Hash[time: element["LocalObservationDateTime"],
             timestamp: element["EpochTime"],
             temp: element["Temperature"]]
      end


    # response = HTTParty.get(base_uri)
    # body = JSON.parse(response.body)
    # @historical =
    #   body.map do |element|
    #     Hash[time: element["LocalObservationDateTime"],
    #          timestamp: element["EpochTime"],
    #          temp: element["Temperature"]]
    #   end
  end

  def self.by_time(timestamp)
    @historical.map do |hash|
      return hash if ((hash[:timestamp] - 3599)..hash[:timestamp]).include?(timestamp)
    end
  end

  # def self.historical
  #   @historical
  # end

  def self.historical_max
    @weather_samara.body.map { |el| el[:temp]["Metric"]["Value"] }.max
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
