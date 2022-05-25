class WeatherSamarasController < ApplicationController
  before_action :set_weather_samara
  # GET /weather/historical
  def index

    render json: WeatherSamara.historical
  end

  def historical_max
    render json: WeatherSamara.historical_max
  end

  def historical_min
    render json: WeatherSamara.historical_min
  end

  # GET /weather_samaras/1
  def show
    render json: @weather_samara
  end

  # POST /weather_samaras
  def create
    @weather_samara = WeatherSamara.new(weather_samara_params)

    if @weather_samara.save
      render json: @weather_samara, status: :created, location: @weather_samara
    else
      render json: @weather_samara.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /weather_samaras/1
  def update
    if @weather_samara.update(weather_samara_params)
      render json: @weather_samara
    else
      render json: @weather_samara.errors, status: :unprocessable_entity
    end
  end

  # DELETE /weather_samaras/1
  def destroy
    @weather_samara.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weather_samara
      @weather_samara = WeatherSamara.call
    end

    # Only allow a list of trusted parameters through.
    def weather_samara_params
      params.fetch(:weather_samara, {})
    end
end
