Rails.application.routes.draw do

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get '/weather/current', to: 'weather_samaras#current'
  get '/weather/historical', to: 'weather_samaras#historical'
  get '/weather/historical/max', to: 'weather_samaras#historical_max'
  get '/weather/historical/min', to: 'weather_samaras#historical_min'
  get '/weather/historical/avg', to: 'weather_samaras#historical_avg'
  get '/weather/by_time(/:timestamp)', to: 'weather_samaras#by_time'
  get '/health', to: 'weather_samaras#health'
end
