Rails.application.routes.draw do

  get '/weather/current', to: 'weather_samaras#current'
  get '/weather/historical', to: 'weather_samaras#index'
  get '/weather/historical/max', to: 'weather_samaras#historical_max'
  get '/weather/historical/min', to: 'weather_samaras#historical_min'
  get '/weather/historical/avg', to: 'weather_samaras#historical_avg'
  get '/health', to: 'weather_samaras#health'

  resources :weather_samaras
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
