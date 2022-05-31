class WeatherSamarasController < ApplicationController
  before_action :set_weather_samara

  # GET /weather/historical
  def historical
    render json: @weather_samara.body
  end

  # GET /weather/by_time(/:timestamp)
  def by_time
    # if the model method by_time does not find a suitable timestamp and writes to the array nil, render 404
    if @weather_samara.by_time(@weather_samara.body, params[:timestamp].to_i).include?(nil)
      render file: "#{Rails.root}/public/404", status: :not_found, message: 'Not found'
    else
      # pass to the model method timestamp from url
      render json: @weather_samara.by_time(@weather_samara.body, params[:timestamp].to_i)
    end
  end

  # GET /weather/historical/max
  def historical_max
    render json: @weather_samara.historical_max(@weather_samara.body)
  end

  # GET /weather/historical/min
  def historical_min
    render json: @weather_samara.historical_min(@weather_samara.body)
  end

  # GET /weather/current
  def current
    render json: @weather_samara.body[0]
  end

  # GET /weather/historical/avg
  def historical_avg
    render json: @weather_samara.historical_avg(@weather_samara.body)
  end

  # GET /weather/health
  def health
    render json: @weather_samara.health
  end

  private

  def set_weather_samara
    # if the database already has an instance of the model WeatherSamara, use this instance
    if WeatherSamara.count > 0
      @weather_samara = WeatherSamara.last

      # if the model instance was updated more than an hour ago, overwrite
      if WeatherSamara.last.updated_at < (Time.zone.now - 3600)
        @weather_samara.body = parsing
        @weather_samara.save!
      end
    else
      # if the database is empty create an instance of the model WeatherSamara
      @weather_samara = WeatherSamara.create(body: parsing)
    end
  end

  def parsing
    WeatherSamara.call
  end

  def weather_samara_params
    params.fetch(:weather_samara, {}).permit(:body)
  end
end
