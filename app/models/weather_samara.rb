class WeatherSamara < ApplicationRecord
  include HTTParty

  validates :body, presence: true

  #Samara
  base_uri "http://dataservice.accuweather.com/currentconditions/v1/290396/historical/24?apikey=%09q6bv0nfQ69WOVYJ6ZEyBW4sP4c4oy586"
  format :json

  #call the api with HTTParty and parse the JSON response
  def self.call
    # file = File.new("#{Rails.root}/app/models/hardcode.json", "r:UTF-8")
    # content = file.read
    # body = JSON.parse(content)

    response = HTTParty.get(base_uri)
    body = JSON.parse(response.body)

    body.map do |element|
        Hash[time: element["LocalObservationDateTime"],
             timestamp: element["EpochTime"],
             temp: element["Temperature"]]
      end
  end

  def by_time(body, timestamp)
    body.map do |hash|
      return hash if ((hash["timestamp"] - 3599)..hash["timestamp"]).include?(timestamp)
    end
  end

  def historical_max(body)
    body.map { |el| el["temp"]["Metric"]["Value"] }.max
  end

  def historical_min(body)
    body.map { |el| el["temp"]["Metric"]["Value"] }.min
  end

  def historical_avg(body)
    (body.map { |el| el["temp"]["Metric"]["Value"] }.reduce(:+).to_f / body.size).round(1)
  end
end
