class WeatherSamarasController < ApplicationController
  before_action :set_weather_samara

  # GET /weather/historical
  def historical
    render json: @weather_samara
  end

  def by_time
    if @weather_samara.by_time(@weather_samara.body, params[:timestamp].to_i).include?(nil)
      render json: { :text => 'Not Found', :status => '404' }
    else
      render json: @weather_samara.by_time(@weather_samara.body, params[:timestamp].to_i)
    end
  end

  def historical_max
    render json: @weather_samara.historical_max(@weather_samara.body)
  end

  def historical_min
    render json: @weather_samara.historical_min(@weather_samara.body)
  end

  # GET /weather_samaras/1
  def current
    render json: @weather_samara.current(@weather_samara.body)
  end

  def historical_avg
    render json: @weather_samara.historical_avg(@weather_samara.body)
  end

  def health
    render json: { status: 'OK' }
  end

  private

  def set_weather_samara
    if WeatherSamara.count > 0
      @weather_samara = WeatherSamara.last
      if WeatherSamara.last.updated_at < (Time.zone.now - 3600)
        @weather_samara.body = parsing
        @weather_samara.save!
      end
    else
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
