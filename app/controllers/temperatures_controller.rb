class TemperaturesController < ApplicationController
  before_action :set_weather_samara

  # GET /weather/historical
  def historical
    render json: @temperature.body
  end

  # GET /weather/by_time(/:timestamp)
  def by_time
    # if the model method by_time does not find a suitable timestamp and writes to the array nil, render 404
    if @temperature.by_time(@temperature.body, params[:timestamp].to_i).include?(nil)
      render file: "#{Rails.root}/public/404", status: :not_found, message: 'Not found'
    else
      # pass to the model method timestamp from url
      render json: @temperature.by_time(@temperature.body, params[:timestamp].to_i)
    end
  end

  # GET /weather/historical/max
  def historical_max
    render json: @temperature.historical_max(@temperature.body)
  end

  # GET /weather/historical/min
  def historical_min
    render json: @temperature.historical_min(@temperature.body)
  end

  # GET /weather/current
  def current
    render json: @temperature.body[0]
  end

  # GET /weather/historical/avg
  def historical_avg
    render json: @temperature.historical_avg(@temperature.body)
  end

  # GET /weather/health
  def health
    render json: @temperature.health
  end

  private

  def set_weather_samara
    # if the database already has an instance of the model Temperature, use this instance
    if Temperature.count > 0
      @temperature = Temperature.last

      # if the model instance was updated more than an hour ago, overwrite
      if Temperature.last.updated_at < (Time.zone.now - 3600)
        @temperature.body = parsing
        @temperature.save!
      end
    else
      # if the database is empty create an instance of the model Temperature
      @temperature = Temperature.create(body: parsing)
    end
  end

  def parsing
    Temperature.call
  end

  def weather_samara_params
    params.fetch(:temperature, {}).permit(:body)
  end
end
