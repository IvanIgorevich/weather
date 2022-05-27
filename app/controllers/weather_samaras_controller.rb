class WeatherSamarasController < ApplicationController
  before_action :set_weather_samara
  # GET /weather/historical
  def index

    render json: @weather_samara.body #WeatherSamara.historical
  end

  def by_time
    if WeatherSamara.by_time(params[:timestamp].to_i).include?(nil)
      render json: { :text => 'Not Found', :status => '404' }
    else
      render json: WeatherSamara.by_time(params[:timestamp].to_i)
    end
  end

  def historical_max
    render json: @weather_samara.historical_max
  end

  def historical_min
    render json: WeatherSamara.historical_min
  end

  # GET /weather_samaras/1
  def current
    render json: WeatherSamara.current
  end

  def historical_avg
    render json: WeatherSamara.historical_avg
  end

  def health
    render json: { status: 'OK' }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_weather_samara
    if WeatherSamara.count > 0 && WeatherSamara.last.updated_at > (Time.now - 3600)
      @weather_samara = WeatherSamara.last
    else
      WeatherSamara.destroy_all
      @weather_samara = WeatherSamara.create(body: parsing)
    end

    #@weather_samara = WeatherSamara.call #create(body: parsing)
  end

  def parsing
    WeatherSamara.call
  end

  # Only allow a list of trusted parameters through.
  def weather_samara_params
    params.fetch(:weather_samara, {}).permit(:body)
  end
end
