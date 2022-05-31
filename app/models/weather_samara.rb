class WeatherSamara < ApplicationRecord
  include HTTParty

  API_KEY_ACCUWEATHER = "2XvxImTBWyeWhBW9UvikFPQ40TfQ3I9m"

  # City area code
  LOCATION_KEY = "290396"

  # weather in a given location for the last 24 hours
  BASE_URI = "http://dataservice.accuweather.com/currentconditions/v1/#{LOCATION_KEY}/historical/24?apikey=#{API_KEY_ACCUWEATHER}"

  validates :body, presence: true

  format :json

  def self.call
    # call the api with HTTParty and parse the JSON response
    response = HTTParty.get(BASE_URI)
    body = JSON.parse(response.body)

    # leave only time and temperature
    body.map do |element|
        Hash[time: element["LocalObservationDateTime"],
             timestamp: element["EpochTime"],
             temp: element["Temperature"]]
      end
  end

  # returns the temperature if specified  timestamp is between the hash timestamp and minus the hour
  def by_time(body, timestamp)
    body.map do |hash|
      return hash if ((hash["timestamp"] - 3599)..hash["timestamp"]).include?(timestamp)
    end
  end

  # returns the maximum from the temperature array for the last 24 hours
  def historical_max(body)
    body.map { |el| el["temp"]["Metric"]["Value"] }.max
  end

  # returns the minimum from the temperature array for the last 24 hours
  def historical_min(body)
    body.map { |el| el["temp"]["Metric"]["Value"] }.min
  end

  # returns the average from the temperature array for the last 24 hours, rounding to one decimal place
  def historical_avg(body)
    (body.map { |el| el["temp"]["Metric"]["Value"] }.reduce(:+).to_f / body.size).round(1)
  end

  def health
    response = HTTParty.get(BASE_URI)
    body = JSON.parse(response.body)

    if body[0].include?("Temperature")
      { status: 'OK' }
    else
      { status: 'Change apikey, look README' }
    end
  end
end
